import 'package:bloc_ecommerce_app/features/blocs/bottom_nav/bottom_nav_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/bottom_nav/bottom_nav_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/bottom_nav/bottom_nav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarScreen extends StatelessWidget {
   const BottomNavBarScreen({super.key});

  final List<Widget> screens = const [
    Center(child: Text("Home")),
    Center(child: Text("Cart")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.currentIndex,
            children: screens,
          );
        },
      ),

      bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              context.read<BottomNavBloc>().add(ChangeTabEvent(index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          );
        },
      ),
    );
  }
}