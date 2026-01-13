import 'package:flutter/material.dart';
import '../constant/my_constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: isDarkMode ? const Color(0xFF1a1a2e) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // --- ส่วนที่ 1: เส้นโค้งพื้นหลัง ---
                ClipPath(
                  clipper: ProfileHeaderClipper(),
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isDarkMode
                            ? [const Color(0xFF16213e), const Color(0xFF0f3460)]
                            : [lightBackgroundColor, const Color.fromARGB(255, 64, 154, 251)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
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
                            color: isDarkMode ? const Color(0xFF0f3460) : Colors.blue,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
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
            GestureDetector(
              onTap: () {
                // ใส่ฟังก์ชันที่ต้องการเมื่อกด User Name
                print("User Name clicked");
              },
              child: Text(
                "User Name",
                style: headingStyle.copyWith(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? const Color(0xFF0f3460) : darkBlue,
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
              child: Text(
                "Edit Profile",
                style: bodyTextStyle.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 50),
            _buildListTile(
              icon: Icons.person_2_rounded,
              title: " My Profile ",
              isDarkMode: isDarkMode,
              onTap: () {
                print("My Profile clicked");
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
              },
            ),
            const SizedBox(height: 15),
            _buildListTile(
              icon: Icons.mail_rounded,
              title: " Messages ",
              isDarkMode: isDarkMode,
              onTap: () {
                print("Messages clicked");
              },
            ),
            const SizedBox(height: 15),
            _buildListTile(
              icon: Icons.favorite_rounded,
              title: " Favourites ",
              isDarkMode: isDarkMode,
              onTap: () {
                print("Favourites clicked");
              },
            ),
            const SizedBox(height: 15),
            _buildListTile(
              icon: Icons.location_on_rounded,
              title: " Location ",
              isDarkMode: isDarkMode,
              onTap: () {
                print("Location clicked");
              },
            ),
            const SizedBox(height: 15),
            _buildListTile(
              icon: Icons.settings_rounded,
              title: " Settings ",
              isDarkMode: isDarkMode,
              onTap: () {
                print("Settings clicked");
              },
            ),
            const SizedBox(height: 30),
            Divider(color: isDarkMode ? Colors.grey[800] : Colors.grey[300]),
            InkWell(
              onTap: () {
                print("Log out clicked");
                // ใส่ฟังก์ชัน logout ที่นี่
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 177, 177),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Icon(Icons.logout_rounded, color: Colors.white, size: 20.0),
                ),
                title: Text(
                  " Log out ",
                  style: logoutTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required bool isDarkMode,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color(0xFF0f3460)
                : const Color.fromARGB(255, 177, 215, 255),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Icon(icon, color: Colors.white, size: 20.0),
        ),
        title: Text(
          title,
          style: optionTextStyle.copyWith(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color(0xFF16213e)
                : const Color.fromARGB(255, 232, 232, 232),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.arrow_forward_ios,
            color: isDarkMode
                ? Colors.grey[600]
                : const Color.fromARGB(255, 194, 194, 194),
            size: 15.0,
          ),
        ),
      ),
    );
  }
}