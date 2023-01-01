import 'package:flutter/material.dart';
import 'package:studio_app_flutter/bottomNavigation/bottomNavigationBar.dart';
import 'package:studio_app_flutter/bottomNavigation/homePage.dart';
import 'package:studio_app_flutter/bottomNavigation/inbox.dart';
import 'package:studio_app_flutter/bottomNavigation/myApplication.dart';
import 'package:studio_app_flutter/bottomNavigation/myProfile.dart';
import 'package:studio_app_flutter/constants.dart';
import 'package:studio_app_flutter/login/forgotPassword.dart';
import 'package:studio_app_flutter/login/loginPage.dart';
import 'package:studio_app_flutter/login/mainPage.dart';
import 'package:studio_app_flutter/login/signUpPage.dart';
import 'package:studio_app_flutter/login/verifiedPage.dart';
import 'package:studio_app_flutter/login/verifyMobile.dart';
import 'package:studio_app_flutter/pages/inboxPages/inboxPage.dart';
import 'package:studio_app_flutter/pages/inboxPages/messagePage.dart';
import 'package:studio_app_flutter/pages/myApplicationPages/allJobs/actorProfilePage.dart';
import 'package:studio_app_flutter/pages/myApplicationPages/allJobs/allJobs.dart';
import 'package:studio_app_flutter/pages/myApplicationPages/allJobs/dancerProfilePage.dart';
import 'package:studio_app_flutter/pages/myApplicationPages/allJobs/designationPage.dart';
import 'package:studio_app_flutter/pages/myApplicationPages/allJobs/writerProfilePage.dart';
import 'package:studio_app_flutter/pages/profilePages/inviteFriends.dart';
import 'package:studio_app_flutter/pages/profilePages/myProfilePage.dart';
import 'package:studio_app_flutter/pages/profilePages/projectPage/projectPage.dart';
import 'package:studio_app_flutter/pages/profilePages/projectPage/subscriptionPages/addCard.dart';
import 'package:studio_app_flutter/pages/profilePages/projectPage/subscriptionPages/paymentPage.dart';
import 'package:studio_app_flutter/pages/profilePages/settingsPage.dart';
import 'package:studio_app_flutter/pages/profilePages/projectPage/subscriptionPages/subscriptionPage.dart';
import 'package:studio_app_flutter/pages/splashScreen/firstScreen.dart';
import 'package:studio_app_flutter/pages/splashScreen/secondScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: fontFamily,
          primaryColor: primaryColor,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const FirstSplashScreen(),

          // Second Screen
          SecondSplashScreen.routeName: (context) => const SecondSplashScreen(),

          // Main Page
          MainPage.routeName: (context) => const MainPage(),

          LoginPage.routeName: (context) => const LoginPage(),
          SignupPage.routeName: (context) => const SignupPage(),
          VerifiedPage.routeName: (context) => const VerifiedPage(),
          VerifyMobile.routeName: (context) => const VerifyMobile(),
          ForgotPassword.routeName: (context) => ForgotPassword(),
          BottomNavigationPage.routeName: (context) =>
              const BottomNavigationPage(),

          // Home Page
          HomePage.routeName: (context) => const HomePage(),

          // My Application
          MyApplicationPage.routeName: (context) => const MyApplicationPage(),
          // My Application - All Jobs section
          AllJobsPage.routeName: (context) => const AllJobsPage(),
          // My Application - All Jobs section - Actor Profile
          ActorProfilePage.routeName: (context) => const ActorProfilePage(),
          // My Application - All Jobs section - Dancer Profile
          DancerProfilePage.routeName: (context) => const DancerProfilePage(),
          // My Application - All Jobs section - Writer Profile
          WriterProfilePage.routeName: (context) => const WriterProfilePage(),
          // My Application - All Jobs - Actor Profile - Designation Page
          DesignationPage.routeName: (context) => const DesignationPage(),

          // Inbox
          InboxPage.routeName: (context) => const InboxPage(),
          // Inbox - Message Page
          InboxMessagePage.routeName: (context) => const InboxMessagePage(),
          // Inbox - Message Page - Chat
          MessagePage.routeName: (context) => const MessagePage(),

          // My Profile
          MyProfile.routeName: (context) => const MyProfile(),
          // My Profile - main Page
          MyProfilePage.routeName: (context) => const MyProfilePage(),
          // My Profile - Project Section
          ProjectPage.routeName: (context) => const ProjectPage(),
          // My Profile - Invite Friends
          InviteFriendsPage.routeName: (context) => const InviteFriendsPage(),
          // My Profile - Setting page
          SettingsPage.routeName: (context) => const SettingsPage(),
          // My Profile - Subscription Page
          SubscriptionPage.routeName: (context) => const SubscriptionPage(),

          // Subscription - Payment Page
          PaymentPage.routeName: (context) => const PaymentPage(),
          // Subscription - Add Card
          AddCardPage.routeName: (context) => const AddCardPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
