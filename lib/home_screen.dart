import 'package:api_project/cubit/my_cubit.dart';
import 'package:api_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MyCubit>(context).emitGetAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Column(
        children: [
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
        ],
      ),
    );
  }
}
