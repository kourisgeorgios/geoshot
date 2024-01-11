// ignore_for_file: must_be_immutable

part of 'profile_notifier.dart';

/// Represents the state of Profile in the application.
class ProfileState extends Equatable {
  ProfileState({
    this.userNameController,
    this.userBioController,
    this.profileModelObj,
  });

  TextEditingController? userNameController;

  TextEditingController? userBioController;

  ProfileModel? profileModelObj;

  @override
  List<Object?> get props => [
        userNameController,
        userBioController,
        profileModelObj,
      ];

  ProfileState copyWith({
    TextEditingController? userNameController,
    TextEditingController? userBioController,
    ProfileModel? profileModelObj,
  }) {
    return ProfileState(
      userNameController: userNameController ?? this.userNameController,
      userBioController: userBioController ?? this.userBioController,
      profileModelObj: profileModelObj ?? this.profileModelObj,
    );
  }
}
