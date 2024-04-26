import 'package:chat_app/cubit/message_cubit.dart';
import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/screens/messages/widgets/pop_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FileItem extends StatelessWidget {
  const FileItem({super.key, required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            DeleteButton(
              onTabDelete: () {
                context
                    .read<MessageCubit>()
                    .removeMessages(messageModel: messageModel);
              },
              onTabCopy: () {},
            ),
            SizedBox(width: 10.w),
            Stack(
              children: [
                Container(
                    width: 250.w,
                    height: 100.h,
                    padding: EdgeInsets.symmetric(
                        vertical: 20.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(.3),
                      borderRadius: BorderRadius.circular(12.w),
                    ),
                    child: Text(
                      "Description.docx",
                      style: TextStyle(
                        fontSize: 15.w,
                        color: Colors.black,
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 250.w,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.w),
                          bottomRight: Radius.circular(12.w),
                        ),
                      ),
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Download",
                            style: TextStyle(
                              fontSize: 15.w,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.download,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 20.w),
          ],
        ),
        SizedBox(height: 10.h)
      ],
    );
  }
}
