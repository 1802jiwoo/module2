import 'package:flutter/material.dart';

class EmptyProfileWidget extends StatelessWidget {
  const EmptyProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width,
      height: 160,
      decoration: BoxDecoration(
        color: Color(0xFF232935),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text('등록된 프로필이 없습니다.\n프로필 추가 후 이용가능 합니다.', style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ), textAlign: TextAlign.center,),
    );
  }
}
