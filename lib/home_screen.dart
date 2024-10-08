import 'package:api_project/cubit/my_cubit.dart';
import 'package:api_project/cubit/result_state.dart';
import 'package:api_project/models/user.dart';
import 'package:api_project/network/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User user = User();

  @override
  void initState() {
    super.initState();
    //BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    //BlocProvider.of<MyCubit>(context).emitGetUserDetails(6940750);
    BlocProvider.of<MyCubit>(context).emitCreateNewUser(User(
      name: "Basmala hesham",
      gender: "female",
      email: "basmala3111.hesham20@gmail.com",
      status: "active",
    ));
    // BlocProvider.of<MyCubit>(context).emitDeleteUser(7400964);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Column(
        children: [
/*
          BlocBuilder<MyCubit, MyState>(
            builder: (BuildContext context, state) {
              if (state is GetAllUsers) {
                usersList = state.allUsersList;
                return ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: usersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          usersList[index].email.toString(),
                        ),
                      ),
                    );
                  },
                );
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
*/
/*
          BlocBuilder<MyCubit, MyState>(
            builder: (BuildContext context, state) {
              if (state is GetUserDetails) {
                user = state.userDetails;
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      user.email.toString(),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
*/
/*
          BlocBuilder<MyCubit, MyState>(
            builder: (BuildContext context, state) {
              if (state is CreateNewUser) {
                user = state.newUser;
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      user.name.toString(),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
*/
/*
          BlocBuilder<MyCubit, MyState>(
            builder: (BuildContext context, state) {
              if (state is DeleteUser) {
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      state.data.toString(),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
*/

          BlocBuilder<MyCubit, ResultState<User>>(
            builder: (context, ResultState<User> state) {
              return state.when(
                idle: () {
                  return const Center(child: CircularProgressIndicator());
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                success: (User userData) {
                  return Container(
                    height: 50,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        userData.email.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                error: (NetworkExceptions error) {
                  return Center(
                      child: Text(NetworkExceptions.getErrorMessage(error)));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
