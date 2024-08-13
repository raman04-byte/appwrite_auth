import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:appwriteauth/models/realtime_model.dart';
import 'package:flutter/foundation.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('6683c5940013e4df2251')
    .setSelfSigned(status: true);

Account account = Account(client);
Databases database = Databases(client);
Storage storage = Storage(client);
Realtime realtime = Realtime(client);

Stream<RealtimeModel> subscribeToRealtime() {
  return realtime
      .subscribe(['databases.USERID.collections.realtime.documents'])
      .stream
      .map((event) {
        final payload = event.payload;
        print(payload);
        return RealtimeModel.fromJson(payload);
      });
}
Future<RealtimeModel> initialFunction() async {
  try {
    // Replace 'DATABASE_ID' and 'COLLECTION_ID' with your actual database and collection IDs
    Document document = await database.getDocument(
      databaseId: 'USERID',
      collectionId: 'realtime',
      documentId: '66bafa910003d92abab9', // Replace with the specific document ID you want to fetch
    );

    return RealtimeModel.fromJson(document.data);
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching initial data: $e');
    }
    // Return a default or empty model if there's an error
    return RealtimeModel(text1: 'Error', text2: 'Error');
  }
}
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

Future<bool> insertData(String userAddress, String userNumber) async {
  try {
    database.createDocument(
        databaseId: 'USERID',
        collectionId: '668f82b60037bb241a34',
        documentId: ID.unique(),
        data: {
          'userAddress': userAddress,
          'userNumber': userNumber,
        });
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> updateData(String userAddress, String userNumber) async {
  try {
    database.updateDocument(
        databaseId: 'USERID',
        collectionId: '668f82b60037bb241a34',
        documentId: '668f86f2713f4fd08818',
        data: {
          'userAddress': userAddress,
          'userNumber': userNumber,
        });
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> uploadFile(String filePath) async {
  try {
    await storage.createFile(
      bucketId: "IMAGE",
      fileId: ID.unique(),
      file: InputFile.fromPath(
          path: filePath, filename: "Raman.${filePath.split('.').last}"),
    );

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

Future<bool> updateFile() async {
  try {
    await storage.updateFile(
      bucketId: "bucketId",
      fileId: "fileId",
    );
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

Future<bool> deleteFile() async {
  try {
    await storage.deleteFile(
      fileId: "fileId",
      bucketId: "bucketId",
    );
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}
