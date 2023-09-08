import 'package:flutter/material.dart';
import 'package:flutter_task_app_release/screens/home_page/widgets/go_premium.dart';
import 'package:flutter_task_app_release/screens/home_page/widgets/tasks.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoPremium(),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              'Tasks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Tasks()),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/avatar.jpg'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Hi Amanda ! ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black),
          )
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 25,
          ),
        )
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10)
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            items: const [
              BottomNavigationBarItem(
                  label: 'Home', icon: Icon(Icons.home_rounded, size: 30)),
              BottomNavigationBarItem(
                  label: 'Person', icon: Icon(Icons.person_rounded, size: 30))
            ],
          ),
        ));
  }
}
