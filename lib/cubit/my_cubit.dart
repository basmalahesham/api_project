/*import 'package:api_project/models/user.dart';
import 'package:api_project/repos/my_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'result_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(MyInitial());
  void emitGetAllUsers() {
    myRepo.getAllUsers().then((usersList) {
      emit(GetAllUsers(usersList));
    });
  }

  void emitGetUserDetails(int userId) {
    myRepo.getUserById(userId).then((userDetails) {
      emit(GetUserDetails(userDetails));
    });
  }

  void emitCreateNewUser(User newUser) {
    myRepo.createNewUser(newUser).then((newUser) {
      emit(CreateNewUser(newUser));
    });
  }

  void emitDeleteUser(int userId) {
    myRepo.deleteUser(userId).then((data) {
      emit(DeleteUser(data));
    });
  }
}*/
import 'package:api_project/cubit/result_state.dart';
import 'package:api_project/models/user.dart';
import 'package:api_project/network/network_exceptions.dart';
import 'package:api_project/repos/my_repo.dart';
import 'package:bloc/bloc.dart';

class MyCubit extends Cubit<ResultState<User>> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(const Idle());

  // void emitGetAllUsers() async {
  //   var data = await myRepo.getAllUsers();

  //   data.when(success: (List<User> allUsers) {
  //     emit(ResultState.success(allUsers));
  //   }, failure: (NetworkExceptions networkExceptions) {
  //     emit(ResultState.error(networkExceptions));
  //   });
  // }

  // void emitGetUserDetails(String userId) {
  //   myRepo.getUserById(userId).then((userDetails) {
  //     emit(GetUserDetails(userDetails));
  //   });
  // }

  void emitCreateNewUser(User newUser) async {
    var result = await myRepo.createNewUser(newUser);

    result.when(success: (User userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

// void emitDeleteUser(String id) {
//   myRepo.deleteUser(id).then((data) {
//     emit(DeleteUser(data));
//   });
// }
}