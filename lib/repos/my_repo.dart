
import 'package:api_project/models/user.dart';
import 'package:api_project/services/web_services.dart';
import 'package:retrofit/dio.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    //var response = await webServices.getAllUsers();
    /*// singleUserDataFromJson = one object from list
    return response.map((user) => User.fromJson(user.toJson())).toList(); // هنا عشان ال returnType نوعه list of object فلازم اللى راجع احوله لليست
    */
    //return response;
    return await webServices.getAllUsers();
  }

  Future<User> getUserById(int userId) async {
    /*var response = await webServices.getUserById(userId);
    return User.fromJson(response.toJson()); //  هنا عشان ال returnType نوعه  object فلازم اللى راجع يبقا اوبجيكت*/
    return await webServices.getUserById(userId);
  }

  Future<User> createNewUser(User newUser)async{
    return await webServices.createNewUser(newUser, 'Bearer 05e9bb5f38505c0dd8116f54db9308a5d4e290eab2d350d30689c29810479a6f');
  }

  Future<HttpResponse> deleteUser(int userId)async{
    return await webServices.deleteUser(userId, 'Bearer 05e9bb5f38505c0dd8116f54db9308a5d4e290eab2d350d30689c29810479a6f');
  }
}
