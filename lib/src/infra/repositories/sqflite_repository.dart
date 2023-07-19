import 'package:my_places/src/domain/models/place.dart';
import 'package:my_places/src/domain/models/user.dart';
import 'package:my_places/src/domain/repositories/i_data_base_repository.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteRepository implements IDataBaseRepository {
  late Database database;

  @override
  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/places.db';
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE User (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)');
      await db.execute(
          'CREATE TABLE Place (id INTEGER PRIMARY KEY, name TEXT, cep TEXT, street TEXT, complement TEXT, neighbornhood TEXT, state TEXT, city TEXT, userId INTEGER, number TEXT, FOREIGN KEY(userId) REFERENCES User(id))');
    });
  }

  @override
  Future<User> createAccount(String name, String email, String password) async {
    int id = await database
        .insert('User', {'name': name, 'email': email, 'password': password});
    return User(id: id, name: name, email: email, password: password);
  }

  @override
  Future<dynamic> login(String login, String password) async {
    List<Map<String, Object?>> user =
        await database.query('User', where: 'email = ?', whereArgs: [login]);
    if (user.isEmpty) {
      return 'Usuário não encontrado';
    }
    User userObj = User.fromJson(user.first);
    if (userObj.password == password) {
      return userObj;
    } else {
      return 'Senha incorreta';
    }
  }

  @override
  Future createPlace(
      String name,
      String cep,
      String street,
      String complement,
      String neighbornhood,
      String state,
      String city,
      String number,
      int userId) async {
    int id = await database.insert('Place', {
      'name': name,
      'cep': cep,
      'street': street,
      'complement': complement,
      'neighbornhood': neighbornhood,
      'state': state,
      'city': city,
      'number': number,
      'userId': userId
    });
    return id;
  }

  @override
  Future<List<Place>> getPlaces(int userId) async {
    List places =
        await database.query('Place', where: 'userId = ?', whereArgs: [userId]);
    List<Place> placesObj = [];
    for (Map<String, dynamic> place in places) {
      placesObj.add(Place.fromJson(place));
    }
    return placesObj;
  }

  @override
  Future<bool> deletePlace(int id) async {
    int deletRows =
        await database.delete('Place', where: 'id = ?', whereArgs: [id]);
    if (deletRows > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future editPlace(
      int id,
      String name,
      String cep,
      String street,
      String complement,
      String neighbornhood,
      String state,
      String city,
      String number,
      int userId) async {
    int editedRows = await database.update(
        'Place',
        {
          'name': name,
          'cep': cep,
          'street': street,
          'complement': complement,
          'neighbornhood': neighbornhood,
          'state': state,
          'city': city,
          'number': number,
          'userId': userId
        },
        where: 'id = ?',
        whereArgs: [id]);
    if (editedRows > 0) {
      return true;
    } else {
      return false;
    }
  }
}
