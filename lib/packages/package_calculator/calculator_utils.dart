import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:villstay/packages/package_calculator/package_calculator_bloc/pacakage_calculator_bloc.dart';
import 'package:villstay/packages/package_calculator/package_form.dart';

class CalculatorUtils {
  static Widget buildPlaceTypeCard(
    BuildContext context,
    ChangedPacakageCalculatorState state,
    Map<String, Object> placedetail,
  ) {
    List<String> attractions = placedetail['attractions'];
    return Flexible(
      child: Card(
        child: RadioListTile<String>(
          title: Text(placedetail['placename']),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Attractions"),
              ...attractions.map(
                (attraction) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle)),
                      SizedBox(width: 5),
                      Expanded(child: Text(attraction)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          value: placedetail['placename'],
          groupValue: state.packageForm.placeName,
          onChanged: (value) {
            BlocProvider.of<PacakageCalculatorBloc>(context).add(
              ChangePacakageCalculatorEvent(
                packageForm: PackageForm(
                  // only change
                  placeName: value,
                  placeDetails: state.packageForm.placeDetails,
                  boatType: state.packageForm.boatType,
                  boatDetails: state.packageForm.boatDetails,
                  isVehicle: state.packageForm.isVehicle,
                  vehicleType: state.packageForm.vehicleType,
                  vehicleDetails: state.packageForm.vehicleDetails,
                  isHotel: state.packageForm.isHotel,
                  hotelType: state.packageForm.hotelType,
                  hotelDetails: state.packageForm.hotelDetails,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static Widget buildVehicleTypeCard(
    BuildContext context,
    ChangedPacakageCalculatorState state,
    Map<String, Object> vehicledetail,
  ) {
    List<String> _features = vehicledetail['features'];
    return Flexible(
      child: Card(
        child: RadioListTile<String>(
          title: Text(vehicledetail['vehicletype']),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Features"),
              ..._features.map(
                (feature) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle)),
                      SizedBox(width: 5),
                      Expanded(child: Text(feature)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          value: vehicledetail['vehicletype'],
          groupValue: state.packageForm.vehicleType,
          onChanged: (value) {
            BlocProvider.of<PacakageCalculatorBloc>(context).add(
              ChangePacakageCalculatorEvent(
                packageForm: PackageForm(
                  placeName: state.packageForm.placeName,
                  placeDetails: state.packageForm.placeDetails,
                  boatType: state.packageForm.boatType,
                  boatDetails: state.packageForm.boatDetails,
                  isVehicle: state.packageForm.isVehicle,
                  // only change
                  vehicleType: value,
                  vehicleDetails: state.packageForm.vehicleDetails,
                  isHotel: state.packageForm.isHotel,
                  hotelType: state.packageForm.hotelType,
                  hotelDetails: state.packageForm.hotelDetails,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static Widget buildBoatTypeCard(
    BuildContext context,
    ChangedPacakageCalculatorState state,
    Map<String, Object> boatdetail,
  ) {
    List<String> _features = boatdetail['features'];
    return Flexible(
      child: Card(
        child: RadioListTile<String>(
          title: Text(boatdetail['boattype']),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Features"),
              ..._features.map(
                (feature) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle)),
                      SizedBox(width: 5),
                      Expanded(child: Text(feature)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          value: boatdetail['boattype'],
          groupValue: state.packageForm.boatType,
          onChanged: (value) {
            BlocProvider.of<PacakageCalculatorBloc>(context).add(
              ChangePacakageCalculatorEvent(
                packageForm: PackageForm(
                  placeName: state.packageForm.placeName,
                  placeDetails: state.packageForm.placeDetails,
                  // only change
                  boatType: value,
                  boatDetails: state.packageForm.boatDetails,
                  isVehicle: state.packageForm.isVehicle,
                  vehicleType: state.packageForm.vehicleType,
                  vehicleDetails: state.packageForm.vehicleDetails,
                  isHotel: state.packageForm.isHotel,
                  hotelType: state.packageForm.hotelType,
                  hotelDetails: state.packageForm.hotelDetails,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static Widget buildHotelTypeCard(
    BuildContext context,
    ChangedPacakageCalculatorState state,
    Map<String, Object> hoteldetail,
  ) {
    List<String> _features = hoteldetail['features'];
    return Flexible(
      child: Card(
        child: RadioListTile<String>(
          title: Text(hoteldetail['hotelname']),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Features"),
              ..._features.map(
                (feature) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle)),
                      SizedBox(width: 5),
                      Expanded(child: Text(feature)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          value: hoteldetail['hoteltype'],
          groupValue: state.packageForm.hotelType,
          onChanged: (value) {
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
                  isHotel: state.packageForm.isHotel,
                  // only change
                  hotelType: value,
                  hotelDetails: state.packageForm.hotelDetails,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
