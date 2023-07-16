import 'package:my_places/src/domain/models/place.dart';

abstract class IDataBaseRepository {
  Future<void> init();
  Future<dynamic> login(String login, String password);
  Future<dynamic> createAccount(String name, String email, String password);
  Future<dynamic> createPlace(
      String name,
      String cep,
      String street,
      String complement,
      String neighbornhood,
      String state,
      String city,
      String number,
      int userId);
  Future<List<Place>> getPlaces(int userId);
}
