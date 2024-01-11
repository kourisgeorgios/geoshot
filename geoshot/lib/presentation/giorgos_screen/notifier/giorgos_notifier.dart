import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:geoshot/presentation/giorgos_screen/models/giorgos_model.dart';
part 'giorgos_state.dart';

final giorgosNotifier = StateNotifierProvider<GiorgosNotifier, GiorgosState>(
  (ref) => GiorgosNotifier(GiorgosState(
    usernameController: TextEditingController(),
    bioController: TextEditingController(),
    giorgosModelObj: GiorgosModel(),
  )),
);

/// A notifier that manages the state of a Giorgos according to the event that is dispatched to it.
class GiorgosNotifier extends StateNotifier<GiorgosState> {
  GiorgosNotifier(GiorgosState state) : super(state) {}
}
