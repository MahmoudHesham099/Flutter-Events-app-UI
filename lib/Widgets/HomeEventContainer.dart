import 'package:eventsapp/Modules/Event.dart';
import 'package:eventsapp/Screens/EventScreen.dart';
import 'package:flutter/material.dart';

class HomeEventContainer extends StatelessWidget {
  final Event event;

  const HomeEventContainer({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventScreen(
              event: event,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Stack(
              children: [
                Container(
                  height: 210,
                  width: 320,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(event.image),
                    ),
                  ),
                ),
                Positioned(
                    right: 10,
                    left: 10,
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          event.cost,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          event.category['icon'],
                          color: Colors.white,
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            event.name,
            style: TextStyle(
              fontSize: 23,
              wordSpacing: 1,
            ),
          ),
          SizedBox(height: 2),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 15,
              ),
              Text(
                event.location,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 11,
                ),
              ),
              SizedBox(width: 20),
              Text(
                '112 available',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
