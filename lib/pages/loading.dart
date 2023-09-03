import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/services.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';
  void setWorldTime() async {
    Worltime instance = Worltime(
      location: 'Nairobi',
      flag: 'germany.png',
      url: 'Africa/Nairobi',
    );
    await instance.getData();
    // Timer.periodic(const Duration(seconds: 1), (Timer t) => setWorldTime());
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'url': instance.url,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    print('Hey There');
    setWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitHourGlass(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
