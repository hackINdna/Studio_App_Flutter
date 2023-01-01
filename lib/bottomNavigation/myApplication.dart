import 'package:studio_app_flutter/common/common.dart';
import 'package:studio_app_flutter/common/data.dart';
import 'package:flutter/material.dart';
import 'package:studio_app_flutter/pages/myApplicationPages/allJobs/allJobs.dart';

class MyApplicationPage extends StatefulWidget {
  const MyApplicationPage({Key? key}) : super(key: key);

  static const String routeName = "/myApplication-page";

  @override
  State<MyApplicationPage> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplicationPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _searchEdit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
      appBar: basicAppBar(screenHeight, screenWidth, context, _searchEdit,
          _tabController, myApplicationData),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AllJobsPage(),
          AllJobsPage(),
          AllJobsPage(),
        ],
      ),
    );
  }
}
