import 'package:save_pass/src/model/profile_model.dart';

abstract class IProfileRepository {
  Future<ProfileModel?> getProfile();

  Future<void> saveProfile(ProfileModel profile);
}
