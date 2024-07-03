import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:flutter/foundation.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('6683c5940013e4df2251')
    .setSelfSigned(status: true);

Account account = Account(client);

Future<bool> createUser(String email, String password, String name) async {
  try {
    final uniqueID = ID.unique();
    await account.create(
      userId: uniqueID,
      email: email,
      password: password,
      name: name,
    );
    await loginUser(email, password);
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> loginUser(String email, String password) async {
  try {
    await account.createEmailPasswordSession(email: email, password: password);
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> checkSession() async {
  try {
    await account.getSession(sessionId: 'current');
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> signInWithGithub() async {
  try {
    await account.createOAuth2Session(
      provider: OAuthProvider.github,
      scopes: ['repo', 'user'],
    );
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> logout() async {
  try {
    await account.deleteSession(sessionId: 'current');
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> deleteAccount() async {
  try {
    await account.updateStatus();
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> updateEmail(String email, String password) async {
  try {
    await account.updateEmail(email: email, password: password);
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> updatePassword(String newPassword, String oldPassword) async {
  try {
    await account.updatePassword(
        password: newPassword, oldPassword: oldPassword);
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

// TODO: For you guys to implement this function in to screen and than create a PR
Future<bool> updatePhoneNumber(String phoneNumber, String password) async {
  try {
    await account.updatePhone(phone: phoneNumber, password: password);
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> updateName(String newName) async {
  try {
    await account.updateName(name: newName);
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}
