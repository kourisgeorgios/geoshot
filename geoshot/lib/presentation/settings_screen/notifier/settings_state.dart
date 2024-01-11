// ignore_for_file: must_be_immutable

part of 'settings_notifier.dart';

/// Represents the state of Settings in the application.
class SettingsState extends Equatable {
  SettingsState({
    this.supportingTextEditText1Controller,
    this.supportingTextEditText2Controller,
    this.passwordEditTextController,
    this.emailEditTextController,
    this.settingsModelObj,
  });

  TextEditingController? supportingTextEditText1Controller;

  TextEditingController? supportingTextEditText2Controller;

  TextEditingController? passwordEditTextController;

  TextEditingController? emailEditTextController;

  SettingsModel? settingsModelObj;

  @override
  List<Object?> get props => [
        supportingTextEditText1Controller,
        supportingTextEditText2Controller,
        passwordEditTextController,
        emailEditTextController,
        settingsModelObj,
      ];

  SettingsState copyWith({
    TextEditingController? supportingTextEditText1Controller,
    TextEditingController? supportingTextEditText2Controller,
    TextEditingController? passwordEditTextController,
    TextEditingController? emailEditTextController,
    SettingsModel? settingsModelObj,
  }) {
    return SettingsState(
      supportingTextEditText1Controller: supportingTextEditText1Controller ??
          this.supportingTextEditText1Controller,
      supportingTextEditText2Controller: supportingTextEditText2Controller ??
          this.supportingTextEditText2Controller,
      passwordEditTextController:
          passwordEditTextController ?? this.passwordEditTextController,
      emailEditTextController:
          emailEditTextController ?? this.emailEditTextController,
      settingsModelObj: settingsModelObj ?? this.settingsModelObj,
    );
  }
}
