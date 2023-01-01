import 'package:studio_app_flutter/common/common.dart';
import 'package:studio_app_flutter/constants.dart';
import 'package:studio_app_flutter/customize/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studio_app_flutter/pages/profilePages/inviteFriends.dart';
import 'package:studio_app_flutter/pages/profilePages/projectPage/projectPage.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  static const String routeName = "/myProfile-page";

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                top: screenHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, InviteFriendsPage.routeName);
                  },
                  child: Container(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.03,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: secondoryColor,
                    ),
                    child: const Text(
                      "INVITE FRIENDS",
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
                PopupMenuButton(
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    "asset/icons/v3.svg",
                    color: Colors.black,
                  ),
                  offset: Offset(0, screenHeight * 0.042),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        height: screenHeight * 0.03,
                        child: const Text(
                          "Report",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            newDialogBox(context, screenWidth, screenHeight,
                                "Account Reported!", "GO BACK", false, "");
                          });
                        },
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.06,
              left: screenWidth * 0.0636,
              right: screenWidth * 0.0636,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.20,
                    padding: EdgeInsets.only(top: screenHeight * 0.03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: placeholderColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Lorem ipsum studio",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: fontFamily,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            const Icon(
                              Icons.check_circle,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const Text(
                          "Location of Company",
                          style: TextStyle(
                            color: placeholderTextColor,
                            fontFamily: fontFamily,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.12,
                              vertical: screenHeight * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Followers",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  const Text(
                                    "5M",
                                    style: TextStyle(
                                      color: placeholderTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Views",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  const Text(
                                    "63K",
                                    style: TextStyle(
                                      color: placeholderTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(
                      MyFlutterApp.edit_black,
                      size: 18,
                    ),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: -screenHeight * 0.08,
                  left: (screenWidth / 2) - (screenHeight * 0.05) - 25,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: screenHeight * 0.05,
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(100),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                                "asset/images/uiImages/girlFace.jpg",
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: screenWidth * 0.065,
                          height: screenWidth * 0.065,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            MyFlutterApp.camera_black,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: thirdColor,
                labelColor: thirdColor,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                ),
                labelStyle: const TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 16,
                ),
                tabs: const [
                  Tab(
                    text: "Projects",
                  ),
                  Tab(
                    text: "About",
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          SizedBox(
            width: screenWidth,
            height: screenHeight * 0.419,
            child: TabBarView(
              controller: _tabController,
              children: const [
                ProjectPage(),
                ProjectPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
