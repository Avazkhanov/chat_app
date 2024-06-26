import 'package:chat_app/data/local/local_variables.dart';
import 'package:chat_app/screens/contacts/widgets/contact_items.dart';
import 'package:chat_app/screens/contacts/widgets/history_items.dart';
import 'package:chat_app/screens/messages/message_screen.dart';
import 'package:chat_app/utils/app_colors.dart';
import 'package:chat_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Text(
          "Conversations",
          style: TextStyle(
            color: const Color(0xFF0F1828),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:  Icon(
              size: 24.sp,
              Icons.add_comment_outlined,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [
              SizedBox(width: 24.w),
              const HistoryItems(),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            height: 1.h,
            color: const Color(0xFFEDEDED),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFFADB5BD),
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: const Color(0xFFADB5BD),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                filled: true,
                fillColor: const Color(0xFFF7F7FC),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide: BorderSide(
                    width: 0.w,
                    color: const Color(0xFFF7F7FC),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide: BorderSide(
                    width: 0.w,
                    color: const Color(0xFFF7F7FC),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                ...List.generate(
                  allContacts.length,
                  (index) => ContactItems(
                    contactModel: allContacts[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessageScreen(
                            contactModel: allContacts[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
