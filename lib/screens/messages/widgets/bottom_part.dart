import 'package:chat_app/cubit/message_cubit.dart';
import 'package:chat_app/data/models/contact_models.dart';
import 'package:chat_app/data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BottomPart extends StatelessWidget {
  const BottomPart(
      {super.key,
      required this.callback,
      required this.controller,
      required this.contactModel});

  final VoidCallback callback;
  final TextEditingController controller;
  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              MessageModel messageModel = MessageModel(
                createdTime: DateTime.now().toString(),
                messageText:
                    "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
                messageId: contactModel.contactId,
                isFile: true,
                contactId: 111,
                status: true,
              );
              context
                  .read<MessageCubit>()
                  .insertMessages(messageModel: messageModel);
            },
            icon: Icon(
              Icons.add,
              size: 25.sp,
              color: const Color(0xFFADB5BD),
            ),
          ),
          Expanded(
            child: TextField(
              maxLines: null,
              maxLength: null,
              controller: controller,
              style: TextStyle(
                color: const Color(0xFF0F1828),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: "Type waiting ...",
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
          IconButton(
            onPressed: () {
              if (controller.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Please enter message",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              } else {
                MessageModel messageModel = MessageModel(
                  createdTime: DateTime.now().toString(),
                  messageText: controller.text,
                  messageId: contactModel.contactId,
                  isFile: false,
                  contactId: 111,
                  status: true,
                );
                context
                    .read<MessageCubit>()
                    .insertMessages(messageModel: messageModel);
                controller.clear();
                callback.call();
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            icon: Icon(
              Icons.send,
              size: 25.sp,
              color: const Color(0xFFD84D4D),
            ),
          ),
        ],
      ),
    );
  }
}
