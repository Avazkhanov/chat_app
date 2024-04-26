import 'package:chat_app/data/local/local_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryItems extends StatelessWidget {
  const HistoryItems({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            width: 56.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(
                      width: 2.w,
                      color: const Color(0xFFADB5BD),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.r),
                    child: Container(
                      width: 48.w,
                      height: 48.h,
                      color: const Color(0xFFF7F7FC),
                      child: Icon(
                        Icons.add,
                        size: 25.sp,
                        color: const Color(0xFFADB5BD),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  textAlign: TextAlign.center,
                  "Your Story",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF0F1828),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          ...List.generate(
            allContacts.length,
                (index) => Container(
                  margin: EdgeInsets.only(right: 16.w),
                  width: 56.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(
                            width: 2.w,
                            color: const Color(0xFFD84D4D),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.r),
                          child: Image.asset(
                            allContacts[index].imageUrl,
                            width: 48.w,
                            height: 48.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        textAlign: TextAlign.center,
                        allContacts[index].contactName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xFF0F1828),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                )
          ),
        ],
      ),
    );
  }
}
