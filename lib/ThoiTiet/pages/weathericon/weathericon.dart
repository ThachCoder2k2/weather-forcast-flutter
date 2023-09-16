import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '/ThoiTiet/controllers/weather_controller.dart';

class WeatherIcon extends StatelessWidget {
  WeatherIcon({Key? key}) : super(key: key);
  final c = Get.put(WeatherController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        height: 150,
        child: SimpleShadow(
          opacity: 0.20,
          color: Colors.black,
          offset: const Offset(3, 10),
          sigma: 30,
          child: c.isLoading.value
              ? const Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : (c.weatherIcon.value != ''
                  ? Image.network(
                      //c.weatherIcon.value,
                      'http://openweathermap.org/img/wn/${c.weathers!.value.weather?.first.icon}@2x.png',
                      fit: BoxFit.cover,
                      width: 200,
                    )
                  : const SizedBox()),
        ),
      ),
    );
  }
}
