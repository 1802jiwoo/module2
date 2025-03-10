import 'package:flutter/material.dart';
import 'package:ott102/data/repositories/shared_pref_repository.dart';
import 'package:ott102/domain/use_cases/profile_use_case.dart';
import 'package:ott102/main.dart';
import 'package:ott102/presentation/providers/create_profile_provider.dart';
import 'package:ott102/presentation/screens/select_profile_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();

  CreateProfileProvider provider = CreateProfileProvider(ProfileUseCase(sharedPrefRepository));
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.provider.addListener(updateScreen);
    },);
  }

  @override
  void dispose() {
    widget.provider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text('프로필 추가', style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),),
                  Spacer(flex: 1,),
                  Text('취소', style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ],
              ),
              Spacer(flex: 2,),
              Container(
                alignment: Alignment.center,
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                  color: widget.provider.profileColor
                ),
                child: Text(widget.provider.getFirstProfileName, style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Spacer(flex: 1,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xFF2D323F),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: widget.provider.changeProfileName,
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () async {
                  await widget.provider.saveProfileList();
                  Navigator.of(context).pop(true);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Color(0xFFF7AD04),
                      Color(0xFFF77A04),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Text('저장하기', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),)
                ),
              ),
              Spacer(flex: 4,),
            ],
          ),
        ),
      ),
    );
  }
}
