import 'package:eventsapp/Modules/Data.dart';
import 'package:eventsapp/Modules/Event.dart';
import 'package:eventsapp/Widgets/ProfileEventContainer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                padding: EdgeInsets.all(30),
                color: Colors.black,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        'assets/pp.jpg',
                      ),
                    ),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Marwan Pablo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              'Alexandria, Egypt',
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 20,
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Text(
                      'Upcoming',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _selected == 0 ? Colors.black : Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _selected = 0;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Text(
                      'Visited',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _selected == 1 ? Colors.black : Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _selected = 1;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Text(
                      'Saved',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _selected == 2 ? Colors.black : Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _selected = 2;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: profileEvents.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              Event event = profileEvents[index];
              return ProfileEventContainer(
                event: event,
              );
            },
          ),
        ],
      ),
    ));
  }
}
