import 'package:flutter/material.dart';
import 'package:guzo/components/BottomSheetCabin.dart';
import 'package:guzo/components/DateRange.dart';
import 'package:guzo/components/NumberOfPassengers.dart';
import 'package:guzo/components/custom_bottom_bar.dart';
import 'package:guzo/global/variables.dart';
import 'package:guzo/screens/searchAirport.dart';
import 'package:guzo/screens/searchAirportTo.dart';

class SearchNav extends StatefulWidget {
  const SearchNav({super.key});

  @override
  State<SearchNav> createState() => _SearchNavState();
}

class _SearchNavState extends State<SearchNav> {
  String exchangeAbbrevation = "";
  String exchangeCity = "";
  String exchangeAitport = "";

  bool round = true;
  bool oneway = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/airline.jpg"), fit: BoxFit.cover),
            ),
            child: Stack(children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Color.fromRGBO(19, 17, 64, 0.94),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/homeguzo.png",
                              width: 200,
                              height: 80,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 3, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 27,
                              ),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    round = !round;
                                    oneway = !oneway;
                                  }),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: round
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Return",
                                            style: TextStyle(
                                                color: round
                                                    ? Color.fromRGBO(
                                                        31, 27, 104, 7)
                                                    : Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    round = !round;
                                    oneway = !oneway;
                                  }),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: oneway
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "One-Way",
                                            style: TextStyle(
                                                color: oneway
                                                    ? Color.fromRGBO(
                                                        31, 27, 104, 7)
                                                    : Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchPage()))
                                          .then((_) => {setState(() {})});
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          abbreviation,
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          city,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          airportname,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    exchangeAbbrevation = abbreviation;
                                    exchangeAitport = airportname;
                                    exchangeCity = city;
                                    abbreviation = abbreviationTo;
                                    airportname = airportnameTo;
                                    city = cityTo;
                                    abbreviationTo = exchangeAbbrevation;
                                    cityTo = exchangeCity;
                                    airportnameTo = exchangeAitport;
                                    exchangeAbbrevation = "";
                                    exchangeAitport = "";
                                    exchangeCity = "";
                                  });
                                },
                                icon: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.compare_arrows_outlined,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchPageTo()))
                                          .then((_) => {setState(() {})});
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          abbreviationTo,
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          cityTo,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          airportnameTo,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Departure Date",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => DateRange()))
                                        .then((_) => {
                                              setState(
                                                () {},
                                              )
                                            });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        startDay,
                                        style: TextStyle(
                                          fontSize: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  startMonth,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  startDayOfWeek,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        width: 1.0,
                        thickness: 1.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Return Date",
                                style: TextStyle(color: Colors.grey),
                              ),
                              !oneway
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DateRange()));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            endDay,
                                            style: TextStyle(
                                              fontSize: 40,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      endMonth,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      endDayOfWeek,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Text(" "),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1.0,
                  thickness: 1.0,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Cabin();
                                }).then((_) {
                              setState(() {
                                switch (selected) {
                                  case 1:
                                    cabin = "Economy";
                                    break;
                                  case 2:
                                    cabin = "Bussiness";
                                    break;
                                  case 3:
                                    cabin = "First";
                                    break;
                                }
                              });
                            })
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cabin Class",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        cabin,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        width: 1.0,
                        thickness: 1.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Passengers();
                                }).then((_) {
                              setState(() {
                                Adults;
                                Children;
                                Infants;
                              });
                            })
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Passengers",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.boy_rounded,
                                                size: 30,
                                              ),
                                              Text(
                                                "${Adults}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.boy_rounded,
                                                size: 20,
                                              ),
                                              Text(
                                                "${Children}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.boy_rounded,
                                                size: 14,
                                              ),
                                              Text(
                                                "${Infants}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1.0,
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
                color: Colors.white,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(children: [
                            Expanded(
                                child: SizedBox(
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 5),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "Search Flights",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromRGBO(31, 27, 104, 7),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 236, 184, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                              ),
                            ))
                          ])),
                    ],
                  ),
                ])))
      ]),
    );
  }
}
