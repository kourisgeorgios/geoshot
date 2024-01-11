// ignore_for_file: must_be_immutable

part of 'main_container_notifier.dart';

/// Represents the state of MainContainer in the application.
class MainContainerState extends Equatable {
  MainContainerState({this.mainContainerModelObj});

  MainContainerModel? mainContainerModelObj;

  @override
  List<Object?> get props => [
        mainContainerModelObj,
      ];

  MainContainerState copyWith({MainContainerModel? mainContainerModelObj}) {
    return MainContainerState(
      mainContainerModelObj:
          mainContainerModelObj ?? this.mainContainerModelObj,
    );
  }
}
