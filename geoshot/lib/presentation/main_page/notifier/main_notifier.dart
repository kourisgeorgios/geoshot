import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:geoshot/presentation/main_page/models/main_model.dart';
part 'main_state.dart';

final mainNotifier = StateNotifierProvider<MainNotifier, MainState>(
  (ref) => MainNotifier(MainState(
    mainModelObj: MainModel(),
  )),
);

/// A notifier that manages the state of a Main according to the event that is dispatched to it.
class MainNotifier extends StateNotifier<MainState> {
  MainNotifier(MainState state) : super(state) {}
}
