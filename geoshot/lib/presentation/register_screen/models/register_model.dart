// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [register_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RegisterModel extends Equatable {
  RegisterModel() {}

  RegisterModel copyWith() {
    return RegisterModel();
  }

  @override
  List<Object?> get props => [];
}
