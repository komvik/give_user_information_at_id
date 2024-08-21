import 'dart:io';

void main() {
  //Gegebene daten
  List<Map<String, dynamic>> userInfoDatabase = [
    {
      'id': 1,
      'name': 'Max Mustermann',
      'email': 'max@example.com',
      'age': 30,
    },
    {
      'id': 2,
      'name': 'Erika Musterfrau',
      'email': 'erika@example.com',
      'age': 25,
    },
    {
      'id': 3,
      'name': 'Hans Meier',
      'email': 'hans@example.com',
      'age': 40,
    },
  ];

  //                                                         1: ID Abfrage
  print('Bitte geben Sie die User-ID ein:');
  int? userId = int.tryParse(stdin.readLineSync()!);

  //                                                          2: Überprüfung ID
  if (userId != null) {
    Map<String, dynamic>? user = getUserInfoById(userId, userInfoDatabase);

    //                                                         3: Anzeige block
    if (user != null) {
      print('Benutzerinformationen:');
      print('ID: ${user['id']}');
      print('Name: ${user['name']}');
      print('E-Mail: ${user['email']}');
      print('Alter: ${user['age']}');
    } else {
      print('Kein Benutzer mit der ID $userId gefunden.');
    }
  } else {
    print('Ungültige ID eingegeben.');
  }
}

Map<String, dynamic>? getUserInfoById(
    int id, List<Map<String, dynamic>> database) {
  for (var user in database) {
    if (user['id'] == id) {
      return user;
    }
  }
  return null;
}
