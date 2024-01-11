// ignore_for_file: must_be_immutable

part of 'main_notifier.dart';

/// Represents the state of Main in the application.
class MainState extends Equatable {
  MainState({this.mainModelObj});

  MainModel? mainModelObj;

  @override
  List<Object?> get props => [
        mainModelObj,
      ];

  MainState copyWith({MainModel? mainModelObj}) {
    return MainState(
      mainModelObj: mainModelObj ?? this.mainModelObj,
    );
  }
}
