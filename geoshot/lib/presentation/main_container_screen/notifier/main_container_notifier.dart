import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:geoshot/presentation/main_container_screen/models/main_container_model.dart';
part 'main_container_state.dart';

final mainContainerNotifier =
    StateNotifierProvider<MainContainerNotifier, MainContainerState>((ref) =>
        MainContainerNotifier(
            MainContainerState(mainContainerModelObj: MainContainerModel())));

/// A notifier that manages the state of a MainContainer according to the event that is dispatched to it.
class MainContainerNotifier extends StateNotifier<MainContainerState> {
  MainContainerNotifier(MainContainerState state) : super(state);
}
