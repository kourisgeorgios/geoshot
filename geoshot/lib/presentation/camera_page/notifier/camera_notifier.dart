import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:geoshot/presentation/camera_page/models/camera_model.dart';
part 'camera_state.dart';

final cameraNotifier = StateNotifierProvider<CameraNotifier, CameraState>(
  (ref) => CameraNotifier(CameraState(
    cameraModelObj: CameraModel(),
  )),
);

/// A notifier that manages the state of a Camera according to the event that is dispatched to it.
class CameraNotifier extends StateNotifier<CameraState> {
  CameraNotifier(CameraState state) : super(state) {}
}
