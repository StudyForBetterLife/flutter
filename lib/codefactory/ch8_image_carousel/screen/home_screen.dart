import 'dart:async'; // Timer를 사용하기 위한 패키지

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // initState 함수를 오버라이드하여 StatefulWidget의 생명주기에서 initState 함수를 사용한다.
  // initState 함수 내에서 작성한 코드는 hot reload시 반영되지 않는다.
  // 왜냐하면, initState 함수는 State가 생성될 때 오직 한번만 실행되기 때문이다.
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 3), (timer) {
      int? nextPage = pageController.page?.toInt(); // 현재 페이지 가져오기
      if (nextPage == null) {
        return;
      }

      if (nextPage == 4) {
        nextPage = 0;
      } else {
        nextPage++;
      }

      pageController.animateToPage(nextPage,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    /*
    SystemChrome 클래스 : 시스템 ui의 그래픽 설정을 변경하는 기능을 제공한다.
    스마트폰 상태바의 아이콘 및 글자 색상을 변경 (light: 흰색, dark: 검은색)
     */
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: getImagesFromNetwork(),
      ),
    );
  }
}

getImagesFromNetwork() {
  return [
    "https://img.freepik.com/free-photo/peak-bamboo-lijiang-rural-mist_1417-410.jpg",
    "https://img.freepik.com/free-photo/city-park-blue-sky-with-downtown-skyline-background_1127-2298.jpg?t=st=1681649772~exp=1681650372~hmac=3f027ab6595423cc7ca773af2914bde69490e9ab20884cbfb9dd0fdd07103a15",
    "https://img.freepik.com/free-photo/aerial-view-green-forest_144627-45271.jpg?t=st=1681649772~exp=1681650372~hmac=8189768e0c2ef57f0a6eb28c94bda83c5a2ac20a43bb6f1befe1b5095457cc12",
    "https://img.freepik.com/premium-photo/business-service-transportation-international-by-container-cargo-freight-ship-open-deep-sea-aerial-view_44353-2076.jpg",
    "https://img.freepik.com/free-photo/beautiful-aerial-view-forest-with-trees-covered-snow-during-winter_181624-14573.jpg"
  ]
      .map((e) => Image.network(
            e,
            fit: BoxFit.cover,
          ))
      .toList();
}

getImagesFromAssets() {
  return [1, 2, 3, 4, 5]
      .map((e) => Image.asset(
            "assets/img/image_$e.jpeg",
            fit: BoxFit.cover, // 이미지가 전체 화면을 모두 차지하도록 설정한다.
          ))
      .toList();
}
