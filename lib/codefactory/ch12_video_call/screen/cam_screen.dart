import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/codefactory/ch12_video_call/const/agora.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({Key? key}) : super(key: key);

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine; // agora 엔진 변수
  int? uid; // 내 id
  int? otherUid; // 상대방 id

  Future<bool> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();
    final camera = resp[Permission.camera];
    final microphone = resp[Permission.microphone];

    if (camera != PermissionStatus.granted ||
        microphone != PermissionStatus.granted) {
      throw "카메라 또는 마이크 권한이 없습니다";
    }

    if (engine == null) {
      engine = createAgoraRtcEngine();
      await engine!.initialize(
        const RtcEngineContext(
          appId: APP_ID,
          channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
        ),
      );
    }

    engine!.registerEventHandler(RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
      setState(() {
        this.uid = connection.localUid;
      });
    }, onLeaveChannel: (RtcConnection connection, RtcStats stats) {
      setState(() {
        uid = null;
      });
    }, onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
      setState(() {
        otherUid = remoteUid;
      });
    }, onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
      setState(() {
        otherUid = null;
      });
    }));

    await engine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine!.enableVideo();
    await engine!.startPreview();
    await engine!.joinChannel(
      token: TEMP_TOKEN,
      channelId: CHANNEL_NAME,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LIVE"),
      ),

      /*
      * FutureBuilder: 반환하는 함수 결과에 따라 렌더링할 위젯을 다르게 반환한다.
      * */
      body: FutureBuilder(
        future: init(), // Future 타입을 반환하는 함수
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // AysncSnapshot 에서 제공하는 값이 변경될 때마다 builder() 함수가 재실행된다.

          if (snapshot.hasError) {
            // 비동기 함수에서 에러가 있을 경우 true
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          /*
          * ConnetctionState.waiting으로 로딩 처리하지 않은 이유: 플러터의 캐싱
          *
          * 플러터에서는 무수히 많이 builder() 메소드를 실행한다.
          * 이때 CircularProgressIndiactor가 재랜더링되면서 화면이 깜빡인다.
          *
          * build 함수가 두번 실행될 때,
          * ConnetctionState.waiting 상태여도 캐싱된 데이터가 있으므로(snapshot.hadData == true)
          * CircularProgressIndiactor에 의한 화면 깜빡임을 막을 수 있다.
          * */
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    renderMainView(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.grey,
                        height: 160,
                        width: 120,
                        child: renderSubView(),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (engine != null) {
                      await engine!.leaveChannel();
                    }

                    Navigator.of(context).pop();
                  },
                  child: const Text("채널 나가기"),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget renderSubView() {
    if (uid == null) {
      return const CircularProgressIndicator();
    }

    return AgoraVideoView(
        controller: VideoViewController(
      rtcEngine: engine!,
      canvas: const VideoCanvas(uid: 0),
    ));
  }

  Widget renderMainView() {
    if (otherUid == null) {
      return const Center(
        child: Text(
          "다른 사용자가 입장할 때까지 대기해주세요",
          textAlign: TextAlign.center,
        ),
      );
    }

    return AgoraVideoView(
        controller: VideoViewController.remote(
      rtcEngine: engine!,
      canvas: VideoCanvas(uid: otherUid),
      connection: const RtcConnection(channelId: CHANNEL_NAME),
    ));
  }
}
