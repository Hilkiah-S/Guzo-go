import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:guzo/global/variables.dart';

class DateRange extends StatefulWidget {
  const DateRange({super.key});

  @override
  State<DateRange> createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(31, 27, 104, 7),
          ),
        ),
        title: Text(
          "Please select departure",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(31, 27, 104, 7),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SfDateRangePicker(
          showActionButtons: true,
          confirmText: "Continue",
          onSubmit: (Object? newRange) {
            if (newRange is PickerDateRange) {
              Navigator.pop(context);
            }
          },
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            if (args.value is PickerDateRange) {
              setState(() {
                startDate = (args.value as PickerDateRange).startDate;
                endDate = (args.value as PickerDateRange).endDate;

                if (startDate != null) {
                  startDay = DateFormat('d').format(startDate!);
                  startMonth = DateFormat('MMM').format(startDate!);
                  startDayOfWeek = DateFormat('EEEE').format(startDate!);
                }

                if (endDate != null) {
                  endDay = DateFormat('d').format(endDate!);
                  endMonth = DateFormat('MMM').format(endDate!);
                  endDayOfWeek = DateFormat('EEEE').format(endDate!);
                }
              });
            }
          },
          startRangeSelectionColor: Colors.orangeAccent,
          endRangeSelectionColor: Colors.orangeAccent,
          rangeSelectionColor: Color.fromARGB(255, 245, 189, 112),
          selectionMode: DateRangePickerSelectionMode.range,
          view: DateRangePickerView.month,
          todayHighlightColor: Colors.orangeAccent,
          navigationDirection: DateRangePickerNavigationDirection.vertical,
          minDate: DateTime.now(),
          maxDate: DateTime.now().add(Duration(days: 90)),
          monthViewSettings: DateRangePickerMonthViewSettings(
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          monthCellStyle: DateRangePickerMonthCellStyle(
            textStyle: TextStyle(fontSize: 16, color: Colors.black),
            leadingDatesTextStyle: TextStyle(color: Colors.deepPurple),
            disabledDatesTextStyle: TextStyle(
              color: Colors.deepPurple.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
