// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [main_container_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MainContainerModel extends Equatable {
  MainContainerModel() {}

  MainContainerModel copyWith() {
    return MainContainerModel();
  }

  @override
  List<Object?> get props => [];
}
