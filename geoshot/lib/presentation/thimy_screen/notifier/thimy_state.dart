// ignore_for_file: must_be_immutable

part of 'thimy_notifier.dart';

/// Represents the state of Thimy in the application.
class ThimyState extends Equatable {
  ThimyState({
    this.messageController,
    this.thimyModelObj,
  });

  TextEditingController? messageController;

  ThimyModel? thimyModelObj;

  @override
  List<Object?> get props => [
        messageController,
        thimyModelObj,
      ];

  ThimyState copyWith({
    TextEditingController? messageController,
    ThimyModel? thimyModelObj,
  }) {
    return ThimyState(
      messageController: messageController ?? this.messageController,
      thimyModelObj: thimyModelObj ?? this.thimyModelObj,
    );
  }
}
