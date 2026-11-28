import 'package:flutter/foundation.dart';
import 'package:save_pass/src/model/password_model.dart';
import 'package:save_pass/src/model/repository/sqlite_password_respository.dart';
import 'package:save_pass/src/model/profile_model.dart';
import 'package:save_pass/src/model/repository/sqlite_profile_repository.dart';

class SQlitePasswordController extends ChangeNotifier {
  late final SQlitePasswordRepository _passwordRepository;
  late final SQLiteProfileRepository _profileRepository;

  final List<PasswordModel> _passwords = [];
  List<PasswordModel> filteredPasswords = [];
  ProfileModel? profile;
  bool isInitialized = false;

  SQlitePasswordController() {
    SQlitePasswordRepository.open().then((database) async {
      _passwordRepository = SQlitePasswordRepository(database);
      _profileRepository = SQLiteProfileRepository(database);

      final passwords = await _passwordRepository.getAllPasswords();
      _passwords.addAll(passwords);

      profile = await _profileRepository.getProfile();
      isInitialized = true;

      notifyListeners();
    });
  }

  @override
  void dispose() {
    SQlitePasswordRepository.close(_passwordRepository.database);
    _passwords.clear();
    super.dispose();
  }

  List<PasswordModel> get passwords => _passwords;

  Future<void> addPassword(PasswordModel password) async {
    await _passwordRepository.savePassword(password);
    _passwords.add(password);
    notifyListeners();
  }

  Future<void> deletePassword(PasswordModel password) async {
    await _passwordRepository.deletePassword(password.serviceName);
    _passwords.remove(password);
    notifyListeners();
  }

  Future<void> updatePassword(PasswordModel password) async {
    await _passwordRepository.updatePassword(password);
    _passwords.removeWhere((p) => p.serviceName == password.serviceName);
    _passwords.add(password);
    notifyListeners();
  }

  PasswordModel? getPassword(String serviceName) {
    final result = _passwords.firstWhere(
      (password) => password.serviceName == serviceName,
      orElse: () => PasswordModel(serviceName: '', username: '', password: ''),
    );
    if (result.serviceName.isNotEmpty) {
      return result;
    } else {
      return null;
    }
  }

  void search(String serviceName) {
    filteredPasswords = _passwords
        .where((password) => password.serviceName
            .toLowerCase()
            .contains(serviceName.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<void> saveProfile(ProfileModel newProfile) async {
    await _profileRepository.saveProfile(newProfile);

    profile = newProfile;

    notifyListeners();
  }
}
