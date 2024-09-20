import 'package:api_project/helper/api_result.dart';
import 'package:api_project/models/user.dart';
import 'package:api_project/network/network_exceptions.dart';
import 'package:api_project/services/web_services.dart';
import 'package:retrofit/dio.dart';

// class MyRepo {
//   final WebServices webServices;
//
//   MyRepo(this.webServices);
//
//   Future<List<User>> getAllUsers() async {
//     //var response = await webServices.getAllUsers();
//     /*// singleUserDataFromJson = one object from list
//     return response.map((user) => User.fromJson(user.toJson())).toList(); // هنا عشان ال returnType نوعه list of object فلازم اللى راجع احوله لليست
//     */
//     //return response;
//     return await webServices.getAllUsers();
//   }
//
//   Future<User> getUserById(int userId) async {
//     /*var response = await webServices.getUserById(userId);
//     return User.fromJson(response.toJson()); //  هنا عشان ال returnType نوعه  object فلازم اللى راجع يبقا اوبجيكت*/
//     return await webServices.getUserById(userId);
//   }
//
//   Future<User> createNewUser(User newUser)async{
//     return await webServices.createNewUser(newUser, 'Bearer 05e9bb5f38505c0dd8116f54db9308a5d4e290eab2d350d30689c29810479a6f');
//   }
//
//   Future<HttpResponse> deleteUser(int userId)async{
//     return await webServices.deleteUser(userId, 'Bearer 05e9bb5f38505c0dd8116f54db9308a5d4e290eab2d350d30689c29810479a6f');
//   }
// }
class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<ApiResult<List<User>>> getAllUsers() async {
    try {
      var response = await webServices.getAllUsers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<User> getUserById(int userId) async {
    return await webServices.getUserById(userId);
  }

  Future<ApiResult<User>> createNewUser(User newUser) async {
    try {
      var response = await webServices.createNewUser(newUser,
          'Bearer 266011b7625eba47bb22d916cc895be80d09523c732855d150f2852347bda0ad');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<HttpResponse> deleteUser(int id) async {
    return await webServices.deleteUser(id,
        'Bearer 266011b7625eba47bb22d916cc895be80d09523c732855d150f2852347bda0ad');
  }
}
