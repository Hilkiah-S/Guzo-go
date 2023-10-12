import 'package:flutter/material.dart';
import 'package:guzo/global/variables.dart';

class Passengers extends StatefulWidget {
  const Passengers({
    super.key,
  });

  @override
  State<Passengers> createState() => _PassangersState();
}

class _PassangersState extends State<Passengers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Passengers",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Adults",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (Adults > 1) {
                                  Adults--;
                                }
                              });
                            },
                          ),

                          // Spacing and text in the middle
                          SizedBox(width: 10),
                          Text("${Adults}",
                              style: TextStyle(
                                  fontSize: 16)), // Initial value set to 0
                          SizedBox(width: 10),

                          // Plus button
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (Children + Adults < 9) {
                                  Adults++;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Children",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (Children > 0) {
                                  Children--;
                                }
                              });
                            },
                          ),

                          // Spacing and text in the middle
                          SizedBox(width: 10),
                          Text("${Children}",
                              style: TextStyle(
                                  fontSize: 16)), // Initial value set to 0
                          SizedBox(width: 10),

                          // Plus button
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (Children + Adults < 9) {
                                  Children++;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Infants",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (Infants > 0) {
                                  Infants--;
                                }
                              });
                            },
                          ),

                          // Spacing and text in the middle
                          SizedBox(width: 10),
                          Text("${Infants}",
                              style: TextStyle(
                                  fontSize: 16)), // Initial value set to 0
                          SizedBox(width: 10),

                          // Plus button
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (Infants < Adults && Infants < 3) {
                                  Infants++;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
