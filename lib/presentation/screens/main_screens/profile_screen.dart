import 'package:flutter/material.dart';
import 'package:ott102/presentation/providers/profile_provider.dart';
import 'package:ott102/presentation/widgets/empty_profile_widget.dart';
import 'package:ott102/presentation/widgets/main_widget.dart';

import '../create_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  final int selectProfileIndex;
  const ProfileScreen({super.key, required this.selectProfileIndex});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileProvider.addListener(updateScreen);
      profileProvider.loadProfileList();
    },);
  }

  @override
  void dispose() {
    profileProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> commonSettingList = [
      '프로필 수정', '언어 변경',
      '새 기기 연결하기', '앱 권한 설정', '로그아웃'
    ];
    List<String> appInfoSettingList = [
      '개인정보 수집 및 이용', '이용약관 동의',
      '개인정보처리방침', '오픈소스 활용 안내', '기타 문의'
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF080E1D),
          title: Text('프로필', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 40,),

                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: profileProvider.profileList.length,
                    itemBuilder: (context, index) {
                      final profile = profileProvider.profileList[index];
                      return GestureDetector(
                        onTap: () {Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)
                            => MainWidget(profileColor: profile.profileColor, profileName: profile.profileName, selectProfileIndex: index,)));
                          },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: widget.selectProfileIndex == index
                                  ? Border.all(color: Colors.white, width: 1.5)
                                  : null,
                              color: profile.profileColor
                          ),
                          child: Text(profile.profileName[0], style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: widget.selectProfileIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 40,),
                GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateProfileScreen()));
                    profileProvider.loadProfileList();
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
                SizedBox(height: 40,),

                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: Text('일반 설정', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF76E04),
                  ),),
                ),
                for(int i = 0; i < commonSettingList.length; i++)
                  _settingBox(context, commonSettingList[i]),

                for(int i = 0; i < appInfoSettingList.length; i++)
                  _settingBox(context, appInfoSettingList[i]),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _settingBox(BuildContext context, String text) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),),
          Icon(Icons.arrow_forward_ios_sharp, size: 20, color: Colors.white,),
        ],
      ),
    );
  }
}
