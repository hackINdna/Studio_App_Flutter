import 'package:studio_app_flutter/bottomNavigation/bottomNavigationBar.dart';
import 'package:studio_app_flutter/common/data.dart';
import 'package:studio_app_flutter/constants.dart';
import 'package:studio_app_flutter/customize/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studio_app_flutter/pages/inboxPages/inboxPage.dart';
import 'package:studio_app_flutter/pages/myApplicationPages/allJobs/allJobs.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  static const String routeName = "/inbox-page";

  @override
  State<InboxPage> createState() => _InboxState();
}

class _InboxState extends State<InboxPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _searchEdit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchEdit = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _searchEdit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //we have not used basicAppBar() because this inbox has only 2 Tabs and basicAppBar() have 5 by default
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.10,
        backgroundColor: Colors.white,
        actions: [
          SizedBox(
            width: screenWidth,
            height: screenHeight * 0.10,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(MyFlutterApp.bi_arrow_down,
                      color: Colors.black),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, BottomNavigationPage.routeName);
                  },
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    width: screenWidth * 0.75,
                    height: screenHeight * 0.045,
                    padding: const EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: _searchEdit,
                      decoration: InputDecoration(
                        hintText: "Search here....",
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontFamily: fontFamily,
                          color: placeholderTextColor,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                              "asset/images/illustration/bytesize_search.svg"),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _searchEdit.text = "";
                            },
                            icon: const Icon(
                              MyFlutterApp.gridicons_cross,
                              size: 20,
                              color: placeholderTextColor,
                            )),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            title: Container(
                              width: screenWidth * 0.30,
                              height: screenHeight * 0.20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: const Text(
                                "Filter area is under construction",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        });
                  },
                  icon: const Icon(MyFlutterApp.filter),
                  color: Colors.black,
                  iconSize: 33,
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.01),
          child: Container(
            alignment: Alignment.centerLeft,
            height: screenHeight * 0.035,
            child: TabBar(
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
              tabs: [
                Tab(
                  text: inboxData[0],
                ),
                Tab(
                  text: inboxData[1],
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          InboxMessagePage(),
          InboxMessagePage(),
        ],
      ),
    );
  }
}
