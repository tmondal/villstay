import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:villstay/packages/package_calculator/package_form.dart';

part 'pacakage_calculator_event.dart';
part 'pacakage_calculator_state.dart';

class PacakageCalculatorBloc
    extends Bloc<PacakageCalculatorEvent, PacakageCalculatorState> {
  @override
  PacakageCalculatorState get initialState => Loading();

  @override
  Stream<PacakageCalculatorState> mapEventToState(
    PacakageCalculatorEvent event,
  ) async* {
    if (event is InitialPacakageCalculatorEvent) {
      yield ChangedPacakageCalculatorState(
        packageForm: PackageForm(
          placeName: 'Sundarban',
          placeDetails: [
            {
              'placename': 'Sundarban',
              'attractions': [
                'Jharkhali National Park',
                'Sajnekhali Watch Tower'
              ],
              'imageurl': 'image',
            },
            {
              'placename': 'Kumirmari',
              'attractions': ['Pakhiraloy'],
              'imageurl': 'image',
            }
          ],
          boatType: 'Medium',
          boatDetails: [
            {
              'boattype': 'Luxury',
              'price': 500,
              'imageurl': 'image',
              'features': [
                'Capacity 30 persons',
                'Aprox. 500 per head per day',
                'Night stay available on boat',
              ],
            },
            {
              'boattype': 'Medium',
              'price': 300,
              'imageurl': 'image',
              'features': [
                'Capacity 20 persons',
                'Aprox. 300 per head per day',
                'Night stay available on boat',
              ],
            }
          ],
          isHotel: true,
          hotelType: 'Luxury',
          hotelDetails: [
            {
              'hoteltype': 'Luxury',
              'hotelname': 'Luxury xyz hotel',
              'price': 300,
              'features': [
                'Double sharing room',
                '300 per room per day',
                'Delicious food served',
              ],
            },
            {
              'hoteltype': 'Medium',
              'hotelname': 'Medium xyz hotel',
              'price': 200,
              'features': [
                'Double sharing room',
                '200 per room per day',
                'Delicious food served',
              ],
            }
          ],
          isVehicle: true,
          vehicleType: 'Sumo',
          vehicleDetails: [
            {
              'vehicletype': 'Sumo',
              'price': 300,
              'features': ['Less expensive']
            },
            {
              'vehicletype': 'suv',
              'price': 500,
              'features': ['High Comfort']
            }
          ],
        ),
      );
    } else if (event is ChangePacakageCalculatorEvent) {
      yield ChangedPacakageCalculatorState(
        packageForm: event.packageForm,
      );
    }
  }
}
