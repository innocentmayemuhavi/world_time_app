import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hyper_effects/hyper_effects.dart';
import 'package:world_time_app/services/services.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Worltime> locations = [
    Worltime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    Worltime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    Worltime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    Worltime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    Worltime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    Worltime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    Worltime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    Worltime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    Worltime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    Worltime(
        url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    Worltime(
        url: 'America/Mexico_City',
        location: 'Mexico City',
        flag: 'mexico.png'),
    Worltime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
    Worltime(
        url: 'Africa/Johannesburg',
        location: 'Johannesburg',
        flag: 'south_africa.png'),
    Worltime(
        url: 'America/Sao_Paulo', location: 'Sao Paulo', flag: 'brazil.png'),
    Worltime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
    Worltime(
        url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hong_kong.png'),
    Worltime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
    Worltime(
        url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
    Worltime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
    Worltime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.png'),
    Worltime(url: 'Asia/Istanbul', location: 'Istanbul', flag: 'turkey.png'),
    Worltime(url: 'America/Toronto', location: 'Toronto', flag: 'canada.png'),
    Worltime(url: 'Asia/Mumbai', location: 'Mumbai', flag: 'india.png'),
    Worltime(
        url: 'Europe/Stockholm', location: 'Stockholm', flag: 'sweden.png'),
    Worltime(
        url: 'America/Buenos_Aires',
        location: 'Buenos Aires',
        flag: 'argentina.png'),
    Worltime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'saudi_arabia.png'),
    Worltime(
        url: 'Africa/Casablanca', location: 'Casablanca', flag: 'morocco.png'),
    Worltime(
        url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    Worltime(url: 'Asia/Beijing', location: 'Beijing', flag: 'china.png'),
    Worltime(url: 'Africa/Luanda', location: 'Luanda', flag: 'angola.png'),
    Worltime(
        url: 'Europe/Amsterdam',
        location: 'Amsterdam',
        flag: 'netherlands.png'),
    Worltime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    Worltime(url: 'America/Phoenix', location: 'Phoenix', flag: 'usa.png'),
    Worltime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    Worltime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'thailand.png'),
    Worltime(
        url: 'Africa/Nouakchott',
        location: 'Nouakchott',
        flag: 'mauritania.png'),
    Worltime(url: 'America/Manaus', location: 'Manaus', flag: 'brazil.png'),
    Worltime(url: 'Asia/Colombo', location: 'Colombo', flag: 'sri_lanka.png'),
    Worltime(url: 'Africa/Windhoek', location: 'Windhoek', flag: 'namibia.png'),
    Worltime(url: 'America/Lima', location: 'Lima', flag: 'peru.png'),
    Worltime(
        url: 'Asia/Kuala_Lumpur',
        location: 'Kuala Lumpur',
        flag: 'malaysia.png'),
    Worltime(url: 'Europe/Brussels', location: 'Brussels', flag: 'belgium.png'),
    Worltime(url: 'Africa/Khartoum', location: 'Khartoum', flag: 'sudan.png'),
    Worltime(url: 'America/Denver', location: 'Denver', flag: 'usa.png'),
    Worltime(url: 'Asia/Baghdad', location: 'Baghdad', flag: 'iraq.png')
  ];

  void updateTime(index) async {
    Worltime instance = locations[index];

    await instance.getData();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'url': instance.url,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.blue[900],
        title: const Text('Choose location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () {
                updateTime(index);
              },
              leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}')),
              title: Text(locations[index].location),
            )).scrollTransition((context, widget, event) => widget
                .blur(
                  switch (event.phase) {
                    ScrollPhase.identity => 0,
                    ScrollPhase.topLeading => 5,
                    ScrollPhase.bottomTrailing => 5,
                  },
                )
                .scale(
                  switch (event.phase) {
                    ScrollPhase.identity => 1,
                    ScrollPhase.topLeading => 0.9,
                    ScrollPhase.bottomTrailing => 0.9,
                  },
                ));
          }),
    );
  }
}
