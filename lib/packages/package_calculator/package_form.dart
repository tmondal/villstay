import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PackageForm extends Equatable {
  final String placeName;
  final List<Map<String, Object>> placeDetails;
  final String boatType;
  final List<Map<String, Object>> boatDetails;
  final bool isVehicle;
  final String vehicleType;
  final List<Map<String, Object>> vehicleDetails;
  final bool isHotel;
  final String hotelType;
  final List<Map<String, Object>> hotelDetails;

  PackageForm(
      {@required this.placeName,
      this.placeDetails,
      @required this.boatType,
      this.boatDetails,
      this.isVehicle,
      this.vehicleType,
      this.vehicleDetails,
      this.isHotel,
      this.hotelType,
      this.hotelDetails});
  @override
  List<Object> get props => [
        placeName,
        placeDetails,
        boatType,
        boatDetails,
        isVehicle,
        vehicleType,
        vehicleDetails,
        isHotel,
        hotelType,
        hotelDetails,
      ];
}
