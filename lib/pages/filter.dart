// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/services/services.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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

  List<Worltime> filtered = [];
  String message = 'Search Locations ';

  void updateData(value) {
    setState(() {
      filtered = locations
          .where((location) =>
              location.location.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void updateTime(index) async {
    Worltime instance = filtered[index];

    await instance.getData();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'url': instance.url,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        centerTitle: true,
        title: TextField(
          onChanged: (value) {
            updateData(value);
            message = 'No location found!';
          },
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            contentPadding: EdgeInsets.all(3),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            hintText: 'Search',
            prefixIcon: Icon(Icons.search_rounded),
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: filtered.isNotEmpty
          ? ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${filtered[index].flag}')),
                  title: Text(filtered[index].location),
                ));
              })
          : Center(
              child: Text(message),
            ),
    );
  }
}
