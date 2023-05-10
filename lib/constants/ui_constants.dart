import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grinler/constants/constants.dart';
import 'package:grinler/features/explore/view/explore_view.dart';
import 'package:grinler/features/home/widgets/side_drawer.dart';
import 'package:grinler/features/notifications/views/notification_view.dart';
import 'package:grinler/features/post/view/create_post_view.dart';
import 'package:grinler/features/post/widgets/post_list.dart';
import 'package:grinler/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.appLogo,
        color: Pallete.blueColor,
        height: 40,
      ),
      centerTitle: true,
    );
  }

  static const List<Widget> bottomTabBarPages = [
    PostList(),
    ExploreView(),
    CreatePostScreen(),
    NotificationView(),
    SideDrawer(),
  ];
}
