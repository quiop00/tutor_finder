import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BottomNavigation{
  static Widget bottomNavigationBar(){
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,size: 30,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded,size: 30,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications,size: 30,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat,size: 30,),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu,size: 30,),
          label: 'Setting',
        ),
      ],
    );
  }
}
