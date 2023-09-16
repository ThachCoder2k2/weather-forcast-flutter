import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../DangKyDangNhap/auth/auth_page.dart';
import '/ThoiTiet/common/bar.dart';
import '/ThoiTiet/common/label.dart';
import '/ThoiTiet/controllers/weather_controller.dart';
import '/ThoiTiet/pages/guess/guess.dart';
import '/ThoiTiet/pages/search/search.dart';
import '/ThoiTiet/pages/weathericon/weathericon.dart';
import '/ThoiTiet/common/stringex.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({Key? key}) : super(key: key);
  final c = Get.put(WeatherController());
  @override
  // void initState() {
  //   _getConnect();
  //   super.initState();
  // }
  //
  // _getConnect() async {
  //   bool result = await InternetConnectionChecker().hasConnection;
  //   if(!result){
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('No internet')
  //     ));
  //   }
  // }
  //
  // @override
  Widget build(BuildContext context) {
    //print(c.weathers.value.id);
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromRGBO(0, 29, 177, 1.0),
                    Color.fromRGBO(133, 216, 236, 1.0),
                  ],
                ),
              ),
              child: ListView(
                children: [
                  const SizedBox(height: 60),
                  ////////////////////////
                  WeatherIcon(),
                  const SizedBox(height: 50),
                  ////////////////////////
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xffB2C9DD),
                        width: 2,
                      ),
                      color: const Color(0xffFFFFFF).withOpacity(0.30),
                    ),
                    child: c.isLoading.value
                        ? const Center(
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              Text(
                                'Today: ${c.day} ${c.month}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${((c.weathers.value.main?.temp ?? 0) - 273.15).toStringAsFixed(0)}\u00B0',
                                style: const TextStyle(
                                  fontSize: 90,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${c.weathers.value.weather?.first.description?.toCapitalized() ?? 0}',
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Label(
                                          icon: Icons.flag_outlined,
                                          title: 'Country'),
                                      SizedBox(height: 15),
                                      Label(
                                          icon: Icons.location_on_outlined,
                                          title: 'City'),
                                      SizedBox(height: 15),
                                      Label(icon: Icons.air, title: 'Wind'),
                                      SizedBox(height: 15),
                                      Label(
                                          icon: Icons.water_damage_outlined,
                                          title: 'Humidity'),
                                      SizedBox(height: 15),
                                      Label(
                                          icon: Icons.arrow_upward_rounded,
                                          title: 'Pressure'),
                                      SizedBox(height: 15),
                                      Label(
                                          icon: Icons.waves,
                                          title: 'Sea level'),
                                      SizedBox(height: 15),
                                      Label(
                                          icon: Icons.foggy,
                                          title: 'Ground level'),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    children: const [
                                      Bar(),
                                      SizedBox(height: 13),
                                      Bar(),
                                      SizedBox(height: 13),
                                      Bar(),
                                      SizedBox(height: 13),
                                      Bar(),
                                      SizedBox(height: 13),
                                      Bar(),
                                      SizedBox(height: 13),
                                      Bar(),
                                      SizedBox(height: 13),
                                      Bar(),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${c.weathers.value.sys?.country}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 17),
                                      Text(
                                        '${c.weathers.value.name}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 17),
                                      Text(
                                        '${c.weathers.value.wind?.speed} m/s',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 17),
                                      Text(
                                        '${c.weathers.value.main?.humidity} %',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 17),
                                      Text(
                                        '${c.weathers.value.main?.pressure ?? 00} PA',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 17),
                                      Text(
                                        '${c.weathers.value.main?.seaLevel ?? 0} m',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 17),
                                      Text(
                                        '${c.weathers.value.main?.grndLevel ?? 0} m',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 20),
                  ////////////////////////
                  GuessPage(),
                ],
              ),
            ),
            ////////////////////////
            // SafeArea(child: SearchPage()),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SearchPage(),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 15, 0),
                  // padding: EdgeInsets.all(30),
                  child: GestureDetector(
                    onTap: () {
                      //  Đăng xuất và quay trở lại trang đăng nhập
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => AuthPage(),
                        ),
                      );
                    },
                    child: Icon(Icons.logout, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
