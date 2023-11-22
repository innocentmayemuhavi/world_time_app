import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    setState(() {
      data = data.isNotEmpty
          ? data
          : ModalRoute.of(context)!.settings.arguments as Map;
    });
    Color bgColor = data['isDaytime'] == 'true' ? Colors.blue : Colors.black;
    // String bgimg =
    //     data['isDaytime'] == 'true' ? 'assets/day.png' : 'assets/night.jpg';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'World Time Clock',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.accessibility_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
            tooltip: 'Accessibility',
          ),
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            onPressed: () async {
              dynamic result = await Navigator.pushNamed(
                context,
                '/filter',
              );

              setState(() {
                data = {
                  'time': result['time'],
                  'location': result['location'],
                  'url': result['url'],
                  'flag': result['flag'],
                };
              });
            },
            tooltip: 'Search',
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
            tooltip: 'App settings',
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/night.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              // height: 150,
              padding: const EdgeInsets.fromLTRB(1, 30, 1, 1),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(17)),
              child: Column(children: [
                Text(data['location'],
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
              ]),
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(
                    context,
                    '/location',
                  );

                
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'url': result['url'],
                        'flag': result['flag'],
                      };
                    });
                  
                },
                icon: const Icon(Icons.edit_location),
                label: const Text('Edit Location')),
          ],
        ),
      ),
    );
  }
}
