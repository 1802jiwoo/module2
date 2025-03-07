import 'package:flutter/material.dart';
import 'package:ott102/presentation/widgets/empty_profile_widget.dart';

import '../create_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> commonSettingList = [
      '프로필 수정',
      '언어 변경',
      '새 기기 연결하기',
      '앱 권한 설정',
      '로그아웃'
    ];
    List<String> appInfoSettingList = [
      '개인정보 수집 및 이용',
      '이용약관 동의',
      '개인정보처리방침',
      '오픈소스 활용 안내',
      '기타 문의'
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
          padding: EdgeInsets.all(20),
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(height: 40,),
                EmptyProfileWidget(),
                SizedBox(height: 40,),
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
                SizedBox(height: 40,),
          
                SizedBox(
                  width: double.infinity,
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
            // child: SingleChildScrollView(
            //   padding: EdgeInsets.all(10),
            //   child:
            // ),
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
