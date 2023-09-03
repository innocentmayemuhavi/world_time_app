import 'package:flutter/material.dart';
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
            ));
          }),
    );
  }
}
