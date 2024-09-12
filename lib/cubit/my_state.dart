part of 'my_cubit.dart';

@immutable
sealed class MyState {}

final class MyInitial extends MyState {}

final class GetAllUsers extends MyState {
  final List<User> allUsersList;

  GetAllUsers(this.allUsersList);
}

final class GetUserDetails extends MyState {
  final User userDetails;

  GetUserDetails(this.userDetails);
}

final class CreateNewUser extends MyState {
  final User newUser;

  CreateNewUser(this.newUser);
}

final class DeleteUser extends MyState {
  final dynamic data;

  DeleteUser(this.data);
}
