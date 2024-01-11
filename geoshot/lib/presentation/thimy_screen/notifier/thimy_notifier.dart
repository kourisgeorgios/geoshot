import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:geoshot/presentation/thimy_screen/models/thimy_model.dart';
part 'thimy_state.dart';

final thimyNotifier = StateNotifierProvider<ThimyNotifier, ThimyState>(
  (ref) => ThimyNotifier(ThimyState(
    messageController: TextEditingController(),
    thimyModelObj: ThimyModel(),
  )),
);

/// A notifier that manages the state of a Thimy according to the event that is dispatched to it.
class ThimyNotifier extends StateNotifier<ThimyState> {
  ThimyNotifier(ThimyState state) : super(state) {}
}
