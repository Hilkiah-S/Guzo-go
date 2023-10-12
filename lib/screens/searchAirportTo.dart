import 'package:flutter/material.dart';
import 'package:guzo/global/variables.dart';

class SearchPageTo extends StatefulWidget {
  const SearchPageTo({super.key});

  @override
  State<SearchPageTo> createState() => _SearchPageToState();
}

class _SearchPageToState extends State<SearchPageTo> {
  late List<Airport> airports;

  @override
  void initState() {
    super.initState();
    airports = [
      Airport('ABJ', 'AbridJan', 'Port Bouet Airport'),
      Airport('ADD', 'Addis Ababa', 'Bole International Airport'),
      Airport('TNR', 'Antananarivo', 'Ivato Airport'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Select Airport",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            prefixIcon:
                                Icon(Icons.search, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: airports.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            abbreviationTo = airports[index].abbreviationTo;
                            cityTo = airports[index].cityTo;
                            airportnameTo = airports[index].airportNameTo;

                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.airplanemode_active_sharp, size: 30),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  '${airports[index].cityTo},${airports[index].airportNameTo}(${airports[index].abbreviationTo})',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Airport {
  final String abbreviationTo;
  final String cityTo;
  final String airportNameTo;

  Airport(this.abbreviationTo, this.cityTo, this.airportNameTo);
}
