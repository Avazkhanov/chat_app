import 'package:chat_app/data/models/contact_models.dart';
import 'package:chat_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MessageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MessageAppBar({super.key, required this.contactModel});
  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      centerTitle: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 25.sp,
        ),
      ),
      title: Text(
        "${contactModel.contactName} ${contactModel.contactLasName}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 25.sp,
            color: AppColors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 25.sp,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
