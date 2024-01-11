// ignore_for_file: must_be_immutable

part of 'giorgos_notifier.dart';

/// Represents the state of Giorgos in the application.
class GiorgosState extends Equatable {
  GiorgosState({
    this.usernameController,
    this.bioController,
    this.giorgosModelObj,
  });

  TextEditingController? usernameController;

  TextEditingController? bioController;

  GiorgosModel? giorgosModelObj;

  @override
  List<Object?> get props => [
        usernameController,
        bioController,
        giorgosModelObj,
      ];

  GiorgosState copyWith({
    TextEditingController? usernameController,
    TextEditingController? bioController,
    GiorgosModel? giorgosModelObj,
  }) {
    return GiorgosState(
      usernameController: usernameController ?? this.usernameController,
      bioController: bioController ?? this.bioController,
      giorgosModelObj: giorgosModelObj ?? this.giorgosModelObj,
    );
  }
}
