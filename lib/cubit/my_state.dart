part of 'my_cubit.dart';

@immutable
sealed class MyState {}

final class MyInitial extends MyState {}
final class GetAllUsers extends MyState {
  final List<User> allUsersList;

  GetAllUsers(this.allUsersList);
}
