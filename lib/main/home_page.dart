import 'package:flutter/material.dart';
import 'package:guzo/NavigatePages/searchNav.dart';
import 'package:guzo/components/BottomSheetCabin.dart';
import 'package:guzo/components/DateRange.dart';
import 'package:guzo/components/NumberOfPassengers.dart';
import 'package:guzo/components/custom_bottom_bar.dart';
import 'package:guzo/global/variables.dart';
import 'package:guzo/screens/searchAirport.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  late TabController bottomTabController;

  bool round = true;
  bool oneway = false;
  @override
  void initState() {
    bottomTabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
        body: TabBarView(
            controller: bottomTabController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              SearchNav(),
              Container(
                width: width,
                height: height,
                color: Colors.lightBlue,
              ),
              Container(
                width: width,
                height: height,
                color: Colors.deepOrange,
              ),
              Container(
                width: width,
                height: height,
                color: Colors.lightGreen,
              ),
            ]),
      ),
    );
  }
}
