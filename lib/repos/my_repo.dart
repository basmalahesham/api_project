import 'package:api_project/models/user.dart';
import 'package:api_project/services/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    var response = await webServices.getAllUsers();
    // singleUserDataFromJson = one object from list
    return response.map((user) => User.fromJson(user.toJson())).toList();
  }
}
