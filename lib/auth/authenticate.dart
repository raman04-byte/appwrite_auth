import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:flutter/foundation.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('665d7307003940db4af8')
    .setSelfSigned(status: true);

Account account = Account(client);

createUser(String email, String password, String name) async {
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

loginUser(String email, String password) async {
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

checkSession() async {
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

signInWithGithub() async {
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

logout() async {
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

deleteAccount(String identityId) async {
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
