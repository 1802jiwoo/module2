import 'package:flutter/material.dart';
import 'package:ott102/data/models/profile_model.dart';
import 'package:ott102/presentation/providers/select_profile_provider.dart';
import 'package:ott102/presentation/screens/create_profile_screen.dart';
import 'package:ott102/presentation/widgets/empty_profile_widget.dart';
import 'package:ott102/presentation/widgets/main_widget.dart';

class SelectProfileScreen extends StatefulWidget {
  const SelectProfileScreen({super.key});

  @override
  State<SelectProfileScreen> createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      selectProfileProvider.addListener(updateScreen);
      selectProfileProvider.loadProfileList();
    },);
  }

  @override
  void dispose() {
    selectProfileProvider.removeListener(updateScreen);
    super.dispose();
  }

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

              selectProfileProvider.profileList.isEmpty
                  ? EmptyProfileWidget()
                  : SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 100,
                child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectProfileProvider.profileList.length,
                        itemBuilder: (context, index) {
                          ProfileModel profile = selectProfileProvider.profileList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => MainWidget(
                                  profileColor: profile.profileColor,
                                  profileName: profile.profileName,
                                  selectProfileIndex: index,
                                ),
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 1.5),
                                  color: profile.profileColor),
                              child: Text(
                                profile.profileName[0],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

              Spacer(flex: 2,),
              GestureDetector(
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateProfileScreen()));
                  selectProfileProvider.loadProfileList();
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
