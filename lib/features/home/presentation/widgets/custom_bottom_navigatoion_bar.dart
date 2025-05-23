import 'package:flutter/material.dart';

import '../../../../core/services/buttomnavigationbar_entity.dart';
import 'naviagtion_bar_Item.dart';

class CustomBotttomNavigatoionBar extends StatefulWidget {
  const CustomBotttomNavigatoionBar({super.key, required this.onChanged});
  final ValueChanged<int> onChanged;
  @override
  State<CustomBotttomNavigatoionBar> createState() =>
      _CustomBotttomNavigatoionBarState();
}

class _CustomBotttomNavigatoionBarState
    extends State<CustomBotttomNavigatoionBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1900000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            getbuttomnavigationbarList.asMap().entries.map((e) {
              int index = e.key;
              var entity = e.value;
              return GestureDetector(
                onTap: () {
                  widget.onChanged(index);
                  selectedIndex = index;
                  setState(() {});
                },
                child: NaviagtionBarItem(
                  isSelected: selectedIndex == index,
                  buttomnavigationbarEntity: entity,
                ),
              );
            }).toList(),
      ),
    );
  }
}
