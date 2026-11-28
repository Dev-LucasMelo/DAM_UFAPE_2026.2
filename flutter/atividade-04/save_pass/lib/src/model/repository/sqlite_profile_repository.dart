import 'package:save_pass/src/model/profile_model.dart';
import 'package:save_pass/src/model/repository/interface/i_profile_repository.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteProfileRepository implements IProfileRepository {
  final Database database;

  SQLiteProfileRepository(this.database);

  @override
  Future<ProfileModel?> getProfile() async {
    final result = await database.query('profile');

    if (result.isNotEmpty) {
      return ProfileModel.fromJson(result.first);
    }

    return null;
  }

  @override
  Future<void> saveProfile(ProfileModel profile) async {
    await database.insert(
      'profile',
      profile.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
