import 'package:flutter/material.dart';
import '../constant/my_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
    appBar: AppBar(
      backgroundColor: Colors.transparent, // เปลี่ยนเป็นโปร่งใส
      elevation: 0,
      leading: const Icon(Icons.arrow_back, color: Colors.white),
      title: const Text("Profile", style: TextStyle(color: Colors.white)),
      centerTitle: true,
    ),
      body: SingleChildScrollView( // ป้องกันหน้าจอล้น
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // --- ส่วนที่ 1: เส้นโค้งพื้นหลัง ---
              ClipPath(
                clipper: ProfileHeaderClipper(), // เรียกใช้จาก my_constant.dart
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [lightBackgroundColor, const Color.fromARGB(255, 64, 154, 251)], // ปรับสีตามต้องการ
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
                // ปุ่มแก้ไขพร้อมเงา 3 ชั้น
                Positioned(
                  bottom: 0, 
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white, // ขอบขาวรอบรูป
                        child: CircleAvatar(
                          radius: 47.0,
                          backgroundImage: NetworkImage(
                            'https://pbs.twimg.com/media/G-NAI3qaYAA2UEK?format=jpg&name=900x900',
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2), // ขอบขาวปุ่ม Edit
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.edit, color: Colors.white, size: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text("User Name", style: headingStyle),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: darkBlue,
                shape: StadiumBorder(),
              ),
              onPressed: () {},
              child: Text("Edit Profile", style: bodyTextStyle.copyWith(color: Colors.white)),
            ),
            const SizedBox(height: 50),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 177, 215, 255),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Icon(Icons.person_2_rounded, color: Colors.white, size: 20.0),
              ),
              title: Text(" My Profile ", style: optionTextStyle),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 194, 194, 194), size: 15.0),
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 177, 215, 255),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Icon(Icons.mail_rounded, color: Colors.white, size: 20.0),
              ),
              title: Text(" Messages ", style: optionTextStyle),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 194, 194, 194), size: 15.0),
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 177, 215, 255),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: 
                const Icon(Icons.favorite_rounded, color: Colors.white, size: 20.0),
              ),
              title: Text(" Favourites ", style: optionTextStyle),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 194, 194, 194), size: 15.0),
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 177, 215, 255),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Icon(Icons.location_on_rounded, color: Colors.white, size: 20.0),
              ),
              title: Text(" Location ", style: optionTextStyle),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 194, 194, 194), size: 15.0),
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 177, 215, 255),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Icon(Icons.settings_rounded, color: Colors.white, size: 20.0),
              ),
              title: Text(" Settings ", style: optionTextStyle),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 194, 194, 194), size: 15.0),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 177, 177),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Icon(Icons.logout_rounded, color: Colors.white, size: 20.0),
              ),
              title: Text(" Log out ", style: logoutTextStyle),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
