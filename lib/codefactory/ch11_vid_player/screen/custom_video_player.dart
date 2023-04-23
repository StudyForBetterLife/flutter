import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_flutter_app/codefactory/ch11_vid_player/screen/custom_icon_button.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final GestureTapCallback onNewVideoPressed;

  const CustomVideoPlayer({
    Key? key,
    required this.video /* 상위 페이지에서 선택한 동영상 주입*/,
    required this.onNewVideoPressed /* 새로운 동영상을 선택하면 실행되는 함수*/,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;
  bool showControls = false;
  static const threeSeconds = Duration(seconds: 3);

  /*
  * covariant 키워드 : CustomVideoPlayer 클래스의 상속된 값에 접근할 수 있도록 해준다.
  * oldWidget : 폐기되는 위젯
  * */
  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 새로 선택한 동영상이 다른 동영상일 경우에만 videoController를 초기화해준다.
    if (oldWidget.video.path != widget.video.path) {
      initializeController();
    }
  }

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  void initializeController() async {
    // 선택한 동영상으로 컨트롤러 초기화
    final videoController = VideoPlayerController.file(
      File(widget.video.path),
    );

    // video 선택할 때까지 await
    await videoController.initialize();
    // 컨트롤러의 속성이 변경될 때마다 실행할 리스너 함수를 등록한다.
    videoController.addListener(videoControllerListener);

    setState(() {
      this.videoController = videoController;
    });
  }

  void videoControllerListener() {
    // 동영상의 재생 상태가 변경될 때마다, setState() 함수를 실행시켜서 build()를 트리거한다.
    setState(() {});
  }

  @override
  void dispose() {
    videoController?.removeListener(videoControllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          showControls = !showControls;
        });
      },
      child: AspectRatio(
        // aspectRatio 속성으로 비율을 지정할 수 있는 위젯이다.
        aspectRatio: videoController!.value.aspectRatio,
        child: Stack(children: [
          VideoPlayer(
            // VideoPlayer는 VideoPlayerController로 조작할 수 있는 위젯.
            videoController!,
          ),

          if (showControls)
            Container(
              // stack에 어두운 컨테이너를 쌓아 화면을 어둡게 변경한다.
              color: Colors.black.withOpacity(0.5),
            ),

          // Stack 위젯은 기본적으로 자식 위젯들을 정중앙에 위치시킨다.
          // Positioned 위젯을 통해 자식들의 위치를 특정 위치에 위치시킬 수 있다.
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    renderTimeTextFromDuration(
                      videoController!.value.position, // 동영상의 현재 위치
                    ),
                    Expanded(
                      // slider가 남는 공간을 모두 차지하도록 Expanded 위젯 활용
                      child: Slider(
                        onChanged: (double val) {
                          // 슬라이더가 이동할 때마다 실행되는 함수
                          videoController!
                              .seekTo(Duration(seconds: val.toInt()));
                        },
                        value: videoController!.value.position.inSeconds
                            .toDouble(),
                        min: 0, // 동영상의 시작은 항상 0초이므로
                        max: videoController!.value.duration.inSeconds
                            .toDouble(),
                      ),
                    ),
                    renderTimeTextFromDuration(
                      videoController!.value.duration, // 동영상의 총 길이
                    )
                  ],
                ),
              )),

          if (showControls)
            Align(
              // 새 동양상 아이콘을 오른쪽 상단에 위치시킴.
              alignment: Alignment.topRight,
              child: CustomIconButton(
                onPressed: widget.onNewVideoPressed,
                iconData: Icons.photo_camera_back,
              ),
            ),

          if (showControls)
            Align(
              // 동영상 재생 관련 아이콘은 중앙에 위치.
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // 아이콘 사이의 간격을 일정하게
                children: [
                  CustomIconButton(
                      onPressed: onReversePressed, iconData: Icons.rotate_left),
                  CustomIconButton(
                      onPressed: onPlayPressed,
                      iconData: videoController!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow),
                  CustomIconButton(
                      onPressed: onForwardPressed,
                      iconData: Icons.rotate_right),
                ],
              ),
            )
        ]),
      ),
    );
  }

  void onReversePressed() {
    // 되감기
    final currentPosition = videoController!.value.position;
    var position = const Duration();

    if (currentPosition.inSeconds > 3) {
      position = currentPosition - threeSeconds;
    }

    videoController!.seekTo(position);
  }

  void onPlayPressed() {
    // 재생 버튼
    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
  }

  void onForwardPressed() {
    // 앞으로 감기 버튼
    var maxPos = videoController!.value.duration;
    var currentPos = videoController!.value.position;

    var position = maxPos;

    if ((maxPos - threeSeconds).inSeconds > currentPos.inSeconds) {
      position = currentPos + threeSeconds;
    }
    videoController!.seekTo(position);
  }

  renderTimeTextFromDuration(Duration duration) {
    return Text(
      "${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
