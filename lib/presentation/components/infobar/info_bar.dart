import 'package:flutter/material.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';

class InfoBar extends StatelessWidget {
  InfoBar({
    super.key,
  });

  final List<String> messages = ["Message1", "Message2", "Message3"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          color: Colors.deepOrange,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Infos',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'Roboto'),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InfiniteMarquee(
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: List<Widget>.generate(
                        messages.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            messages[index],
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ),
        ),
      ],
    );
  }
}
