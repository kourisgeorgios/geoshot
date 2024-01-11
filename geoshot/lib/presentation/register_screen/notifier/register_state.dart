// ignore_for_file: must_be_immutable

part of 'register_notifier.dart';

/// Represents the state of Register in the application.
class RegisterState extends Equatable {
  RegisterState({
    this.emailController,
    this.userNameController,
    this.passwordController,
    this.passwordController1,
    this.registerModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? userNameController;

  TextEditingController? passwordController;

  TextEditingController? passwordController1;

  RegisterModel? registerModelObj;

  @override
  List<Object?> get props => [
        emailController,
        userNameController,
        passwordController,
        passwordController1,
        registerModelObj,
      ];

  RegisterState copyWith({
    TextEditingController? emailController,
    TextEditingController? userNameController,
    TextEditingController? passwordController,
    TextEditingController? passwordController1,
    RegisterModel? registerModelObj,
  }) {
    return RegisterState(
      emailController: emailController ?? this.emailController,
      userNameController: userNameController ?? this.userNameController,
      passwordController: passwordController ?? this.passwordController,
      passwordController1: passwordController1 ?? this.passwordController1,
      registerModelObj: registerModelObj ?? this.registerModelObj,
    );
  }
}
