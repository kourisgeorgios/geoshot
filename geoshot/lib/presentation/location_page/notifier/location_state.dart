// ignore_for_file: must_be_immutable

part of 'location_notifier.dart';

/// Represents the state of Location in the application.
class LocationState extends Equatable {
  LocationState({
    this.photosInAreaController,
    this.locationController,
    this.locationModelObj,
  });

  TextEditingController? photosInAreaController;

  TextEditingController? locationController;

  LocationModel? locationModelObj;

  @override
  List<Object?> get props => [
        photosInAreaController,
        locationController,
        locationModelObj,
      ];

  LocationState copyWith({
    TextEditingController? photosInAreaController,
    TextEditingController? locationController,
    LocationModel? locationModelObj,
  }) {
    return LocationState(
      photosInAreaController:
          photosInAreaController ?? this.photosInAreaController,
      locationController: locationController ?? this.locationController,
      locationModelObj: locationModelObj ?? this.locationModelObj,
    );
  }
}
