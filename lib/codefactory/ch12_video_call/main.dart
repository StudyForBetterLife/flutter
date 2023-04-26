import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 앱이 실행될 준비가 되었는지 확인

  _cameras = await availableCameras(); // 폰에 있는 카메라들 가져오기
  runApp(const CameraApp());
}

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller; // 카메라 제어 컨트롤러

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeCamera();
  }

  void initializeCamera() async {
    try {
      // 가장 첫번째 카메라로 카메라 설정
      controller = CameraController(_cameras[0], ResolutionPreset.max);

      await controller.initialize();

      setState(() {});
    } catch (e) {
      if (e is CameraException) {
        switch (e.code) {
          case "CameraAccessDenied":
            print("User denied camera access");
            break;
          default:
            print("Handle other errors");
            break;
        }
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      // 카메라 보여주기
      home: CameraPreview(controller),
    );
  }
}
