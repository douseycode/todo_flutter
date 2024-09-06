import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, required this.onChange});

  final Function(String) onChange;
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration:  BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 12,
          ),
        ],
      ),
      
      child: TextFormField(
        onChanged: (String value){
          onChange(value);
        },
        decoration:  const InputDecoration(
          border: InputBorder.none,
          hintText: "Recherche",
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Color(0xff949494)
          )
        ),
      ),
    );
  }
}