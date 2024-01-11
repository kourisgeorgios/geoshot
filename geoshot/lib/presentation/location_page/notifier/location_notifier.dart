import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:geoshot/presentation/location_page/models/location_model.dart';
part 'location_state.dart';

final locationNotifier = StateNotifierProvider<LocationNotifier, LocationState>(
    (ref) => LocationNotifier(LocationState(
        photosInAreaController: TextEditingController(),
        locationController: TextEditingController(),
        locationModelObj: LocationModel())));

/// A notifier that manages the state of a Location according to the event that is dispatched to it.
class LocationNotifier extends StateNotifier<LocationState> {
  LocationNotifier(LocationState state) : super(state);
}
