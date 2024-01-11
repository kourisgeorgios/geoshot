// ignore_for_file: must_be_immutable

part of 'camera_notifier.dart';

/// Represents the state of Camera in the application.
class CameraState extends Equatable {
  CameraState({this.cameraModelObj});

  CameraModel? cameraModelObj;

  @override
  List<Object?> get props => [
        cameraModelObj,
      ];

  CameraState copyWith({CameraModel? cameraModelObj}) {
    return CameraState(
      cameraModelObj: cameraModelObj ?? this.cameraModelObj,
    );
  }
}
