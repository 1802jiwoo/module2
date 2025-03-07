import 'package:flutter/material.dart';
import 'package:ott102/presentation/screens/create_profile_screen.dart';
import 'package:ott102/presentation/widgets/empty_profile_widget.dart';

class SelectProfileScreen extends StatelessWidget {
  const SelectProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF080E1D),
          title: Text('시청할 프로필을 선택하세요.', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),),
        ),
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 1,),

              EmptyProfileWidget(),

              Spacer(flex: 2,),
              GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateProfileScreen())),
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_outline, color: Colors.white, size: 50,),
                    SizedBox(height: 5,),
                    Text('프로필 추가', style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),),
                  ],
                ),
              ),
              Spacer(flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
