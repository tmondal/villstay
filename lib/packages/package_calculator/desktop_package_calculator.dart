import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:villstay/package_calculator_injection_container.dart';
import 'package:villstay/packages/package_calculator/calculator_utils.dart';
import 'package:villstay/packages/package_calculator/package_calculator_bloc/pacakage_calculator_bloc.dart';
import 'package:villstay/packages/package_calculator/package_form.dart';

class DesktopPackageCalculator extends StatefulWidget {
  @override
  _DesktopPackageCalculatorState createState() =>
      _DesktopPackageCalculatorState();
}

/*
Problem : input field not working with controller. Wasted a day to fix. 
Sol: Convert stateless to statefull
From StackOverFlow:
You cannot and should not use Stateless widget for storing long-term variable
The problem is, it's exactly what you are trying to. 
TextEditingController is a class instance that should be kept between renders.
But by storing it into a StatelessWidget you basically recreate it after every update.
*/

class _DesktopPackageCalculatorState extends State<DesktopPackageCalculator> {
  final GlobalKey formKey = GlobalKey();
  final TextEditingController _adultNoController = TextEditingController();
  final TextEditingController _childNoController = TextEditingController();
  final TextEditingController _daysNoController = TextEditingController();

  final TextStyle headingStyle = TextStyle(
    color: Colors.green[900],
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
  );

  final TextStyle subHeadingStyle = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.w400,
    fontSize: 15.0,
  );

  @override
  void dispose() {
    _adultNoController.dispose();
    _childNoController.dispose();
    _daysNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // simple listview is not scrollable
    return BlocProvider(
      create: (_) =>
          sl<PacakageCalculatorBloc>()..add(InitialPacakageCalculatorEvent()),
      child: BlocBuilder<PacakageCalculatorBloc, PacakageCalculatorState>(
          builder: (context, state) {
        if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ChangedPacakageCalculatorState) {
          if (_adultNoController.text.isEmpty) _adultNoController.text = "2";
          if (_childNoController.text.isEmpty) _childNoController.text = "2";
          if (_daysNoController.text.isEmpty) _daysNoController.text = "2";
          return buildPackageForm(state, context);
        } else {
          return Container();
        }
      }),
    );
  }

  String computePrice(ChangedPacakageCalculatorState state, int adultCount,
      int childCount, int days) {
    // boat price
    int boatPrice = 0;
    int hotelPrice = 0;
    int transportPrice = 0;
    state.packageForm.boatDetails.forEach((boatdetail) {
      // print(boatdetail['boattype']);
      // print(state.packageForm.boatType);
      if (boatdetail['boattype'] == state.packageForm.boatType) {
        boatPrice = boatdetail['price'];
      }
    });

    // hotel price
    if (!state.packageForm.isHotel) {
      state.packageForm.hotelDetails.forEach((hoteldetail) {
        if (hoteldetail['hoteltype'] == state.packageForm.hotelType)
          hotelPrice = hoteldetail['price'];
      });
    }
    // transport price
    if (state.packageForm.isVehicle) {
      state.packageForm.vehicleDetails.forEach((vehicledetail) {
        if (vehicledetail['vehicletype'] == state.packageForm.vehicleType)
          transportPrice = vehicledetail['price'];
      });
    }

    // no of adult and child
    if (adultCount == 0 && childCount == 0) {
      adultCount = int.parse(_adultNoController.text);
      childCount = int.parse(_childNoController.text);
    }

    // transportPrice per vehicle up and down
    transportPrice =
        ((adultCount + childCount) / 8).ceil() * transportPrice * 2;
    // print("transport: " + transportPrice.toString());
    // hotel price
    hotelPrice = ((adultCount + childCount) / 2).ceil() * hotelPrice;
    // print("hotel: " + hotelPrice.toString());
    // boat price
    int boatRentPrice = 0;
    if (boatPrice == 500)
      boatRentPrice = 10000;
    else if (boatPrice == 300)
      boatRentPrice = 6000;
    else
      boatRentPrice = 3000;
    boatPrice = min(
        (adultCount * boatPrice + (childCount * boatPrice / 2).floor()),
        boatRentPrice);
    // print("boat: " + boatPrice.toString());
    // sum
    int sum = transportPrice +
        hotelPrice +
        boatPrice +
        (days - 1) * (hotelPrice + boatPrice);
    return sum.toString();
  }

  Widget buildPackageForm(
      ChangedPacakageCalculatorState state, BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 100),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Flexible(child: Text("Package calculator", style: headingStyle))
          ]),
          SizedBox(height: 10),
          // get no of adult
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("No. of Adult person", style: subHeadingStyle),
              SizedBox(width: 10),
              Container(
                width: 150,
                child: TextFormField(
                  autovalidate: true,
                  controller: _adultNoController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.green,
                  cursorWidth: 1.0,
                  textAlign: TextAlign.center,

                  // formatter needed for flutter web where number keyboard is not possible
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(1.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0),
                    ),
                    prefixIcon: IconButton(
                      splashColor: Colors.green,
                      icon: Icon(Icons.remove_circle_outline,
                          color: Colors.green),
                      onPressed: () {
                        if (_adultNoController.text.isNotEmpty &&
                            int.parse(_adultNoController.text) > 1) {
                          _adultNoController.text =
                              (int.parse(_adultNoController.text) - 1)
                                  .toString();
                        } else if (_adultNoController.text.isEmpty) {
                          _adultNoController.text = "0";
                        }
                      },
                    ),
                    suffixIcon: IconButton(
                      splashColor: Colors.green,
                      icon: Icon(Icons.add_circle_outline, color: Colors.green),
                      onPressed: () {
                        if (_adultNoController.text.isNotEmpty &&
                            int.parse(_adultNoController.text) < 30) {
                          _adultNoController.text =
                              (int.parse(_adultNoController.text) + 1)
                                  .toString();
                        } else if (_adultNoController.text.isEmpty) {
                          _adultNoController.text = "0";
                        }
                      },
                    ),
                  ),

                  validator: (value) {
                    if (int.parse(_adultNoController.text) > 30)
                      return 'Maximum 30 people we provide service';
                    else
                      return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // get no of child
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("No. of Child", style: subHeadingStyle),
              SizedBox(width: 68),
              Container(
                width: 150,
                child: TextFormField(
                  autovalidate: true,
                  controller: _childNoController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.green,
                  cursorWidth: 1.0,
                  textAlign: TextAlign.center,
                  // formatter needed for flutter web where number keyboard is not possible
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                  decoration: InputDecoration(
                    helperText: "Max. age 10 years",
                    contentPadding: EdgeInsets.all(1.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0),
                    ),
                    prefixIcon: IconButton(
                      splashColor: Colors.green,
                      icon: Icon(Icons.remove_circle_outline,
                          color: Colors.green),
                      onPressed: () {
                        if (_childNoController.text.isNotEmpty &&
                            int.parse(_childNoController.text) > 0) {
                          _childNoController.text =
                              (int.parse(_childNoController.text) - 1)
                                  .toString();
                        } else if (_childNoController.text.isEmpty) {
                          _childNoController.text = "0";
                        }
                      },
                    ),
                    suffixIcon: IconButton(
                      splashColor: Colors.green,
                      icon: Icon(Icons.add_circle_outline, color: Colors.green),
                      onPressed: () {
                        if (_childNoController.text.isNotEmpty &&
                            int.parse(_childNoController.text) < 30) {
                          _childNoController.text =
                              (int.parse(_childNoController.text) + 1)
                                  .toString();
                        } else if (_childNoController.text.isEmpty) {
                          _childNoController.text = "0";
                        }
                      },
                    ),
                  ),
                  validator: (value) {
                    if (int.parse(_childNoController.text) > 30)
                      return 'Maximum 29 children we allow';
                    else
                      return null;
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          // get no of days
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("No. of days", style: subHeadingStyle),
              SizedBox(width: 72),
              Container(
                width: 150,
                child: TextFormField(
                  autovalidate: true,
                  controller: _daysNoController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.green,
                  cursorWidth: 1.0,
                  textAlign: TextAlign.center,
                  // formatter needed for flutter web where number keyboard is not possible
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  decoration: InputDecoration(
                    helperText: "Maximum 3 days we provide service",
                    contentPadding: EdgeInsets.all(1.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0),
                    ),
                    prefixIcon: IconButton(
                      splashColor: Colors.green,
                      icon: Icon(Icons.remove_circle_outline,
                          color: Colors.green),
                      onPressed: () {
                        if (_daysNoController.text.isNotEmpty &&
                            int.parse(_daysNoController.text) > 1) {
                          _daysNoController.text =
                              (int.parse(_daysNoController.text) - 1)
                                  .toString();
                        } else if (_daysNoController.text.isEmpty) {
                          _daysNoController.text = "1";
                        }
                      },
                    ),
                    suffixIcon: IconButton(
                      splashColor: Colors.green,
                      icon: Icon(Icons.add_circle_outline, color: Colors.green),
                      onPressed: () {
                        if (_daysNoController.text.isNotEmpty &&
                            int.parse(_daysNoController.text) < 30) {
                          _daysNoController.text =
                              (int.parse(_daysNoController.text) + 1)
                                  .toString();
                        } else if (_daysNoController.text.isEmpty) {
                          _daysNoController.text = "1";
                        }
                      },
                    ),
                  ),
                  validator: (value) {
                    if (int.parse(_daysNoController.text) > 3)
                      return 'Maximum 3 days we provide service';
                    else
                      return null;
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          // select place
          Row(children: <Widget>[
            Flexible(
                child: Text("Please choose a place", style: subHeadingStyle))
          ]),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              ...state.packageForm.placeDetails.map((placedetail) {
                return CalculatorUtils.buildPlaceTypeCard(
                    context, state, placedetail);
              }).toList(),
            ],
          ),
          // transport needed
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  child: CheckboxListTile(
                    title: Text('Transport needed from Canning Rail Station'),
                    value: state.packageForm.isVehicle,
                    onChanged: (bool value) {
                      BlocProvider.of<PacakageCalculatorBloc>(context).add(
                        ChangePacakageCalculatorEvent(
                          packageForm: PackageForm(
                            placeName: state.packageForm.placeName,
                            placeDetails: state.packageForm.placeDetails,
                            boatType: state.packageForm.boatType,
                            boatDetails: state.packageForm.boatDetails,
                            // only change
                            isVehicle: value,
                            vehicleType: state.packageForm.vehicleType,
                            vehicleDetails: state.packageForm.vehicleDetails,
                            isHotel: state.packageForm.isHotel,
                            hotelType: state.packageForm.hotelType,
                            hotelDetails: state.packageForm.hotelDetails,
                          ),
                        ),
                      );
                    },
                    secondary: Icon(Icons.directions_car, color: Colors.green),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          // select vehicle type
          state.packageForm.isVehicle
              ? Row(children: <Widget>[
                  Text("Please choose a Vehicle type", style: subHeadingStyle)
                ])
              : Container(),
          SizedBox(height: 10),
          state.packageForm.isVehicle
              ? Row(
                  children: <Widget>[
                    ...state.packageForm.vehicleDetails.map((vehicledetail) {
                      return CalculatorUtils.buildVehicleTypeCard(
                          context, state, vehicledetail);
                    }).toList(),
                  ],
                )
              : Container(),
          SizedBox(height: 20),
          // select boat type
          Row(children: <Widget>[
            Text("Please choose a Boat type", style: subHeadingStyle)
          ]),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              ...state.packageForm.boatDetails.map((boatdetail) {
                return CalculatorUtils.buildBoatTypeCard(
                    context, state, boatdetail);
              }).toList(),
            ],
          ),

          // spend night on boat
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  child: CheckboxListTile(
                    title: Text('Want to spend night on Boat'),
                    value: state.packageForm.isHotel,
                    onChanged: (bool value) {
                      BlocProvider.of<PacakageCalculatorBloc>(context).add(
                        ChangePacakageCalculatorEvent(
                          packageForm: PackageForm(
                            placeName: state.packageForm.placeName,
                            placeDetails: state.packageForm.placeDetails,
                            boatType: state.packageForm.boatType,
                            boatDetails: state.packageForm.boatDetails,
                            isVehicle: state.packageForm.isVehicle,
                            vehicleType: state.packageForm.vehicleType,
                            vehicleDetails: state.packageForm.vehicleDetails,
                            // only change
                            isHotel: value,
                            hotelType: state.packageForm.hotelType,
                            hotelDetails: state.packageForm.hotelDetails,
                          ),
                        ),
                      );
                    },
                    secondary: Icon(Icons.directions_boat, color: Colors.green),
                  ),
                ),
              )
            ],
          ),
          // Note about food
          state.packageForm.isHotel
              ? Row(children: <Widget>[
                  Text(
                      "Note: For Food we will talk and decide what will be better")
                ])
              : Container(),
          SizedBox(height: 20),
          // select hotel type
          !state.packageForm.isHotel
              ? Row(children: <Widget>[
                  Text("Please choose a Hotel type", style: subHeadingStyle)
                ])
              : Container(),
          SizedBox(height: 10),
          !state.packageForm.isHotel
              ? Row(
                  children: <Widget>[
                    ...state.packageForm.hotelDetails.map((hoteldetail) {
                      return CalculatorUtils.buildHotelTypeCard(
                          context, state, hoteldetail);
                    }).toList(),
                  ],
                )
              : Container(),

          SizedBox(height: 50),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Your Package", style: subHeadingStyle)]),
          // your package card
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        // placename
                        Row(children: <Widget>[
                          Text("Place Name: "),
                          Text(state.packageForm.placeName)
                        ]),
                        // boat type
                        Row(children: <Widget>[
                          Text("Boat Type: "),
                          Text(state.packageForm.boatType)
                        ]),
                        // vehicle type
                        state.packageForm.isVehicle
                            ? Row(children: <Widget>[
                                Text("Vehicle Type: "),
                                Text(state.packageForm.vehicleType)
                              ])
                            : Container(),
                        // hotel type
                        !state.packageForm.isHotel
                            ? Row(children: <Widget>[
                                Text("Hotel Type: "),
                                Text(state.packageForm.hotelType)
                              ])
                            : Container(),
                        SizedBox(height: 20),
                        Row(children: <Widget>[
                          Text("Price : "),
                          Text(computePrice(state, 0, 0, 1))
                        ])
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(children: <Widget>[
            Text("You might like", style: headingStyle),
          ]),
          SizedBox(height: 10),
          // package on people count for 1 day
          Row(children: <Widget>[
            Text("Packages depending on People count for 1 day")
          ]),
          Row(children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text("For 1 adult person "),
                      Text("Price : " + computePrice(state, 1, 0, 1)),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          // package on people count for 2 days
          Row(children: <Widget>[
            Text("Packages depending on People count for 2 days 1 night")
          ]),
          Row(children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text("For 1 adult person 2 days"),
                      Text("Price : " + computePrice(state, 1, 0, 2)),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          // package on people count for 3 days
          Row(children: <Widget>[
            Text("Packages depending on People count for 3 days 2 nights")
          ]),
          Row(children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text("For 1 adult person 3 days"),
                      Text("Price : " + computePrice(state, 1, 0, 3)),
                    ],
                  ),
                ),
              ),
            ),
          ]),

          Row(children: <Widget>[
            Flexible(
                child: Text("Note: hotel and boat price are half for a child"))
          ]),
        ],
      ),
    );
  }
}
