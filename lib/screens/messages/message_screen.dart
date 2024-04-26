import 'package:chat_app/cubit/message_cubit.dart';
import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/screens/messages/widgets/bottom_part.dart';
import 'package:chat_app/screens/messages/widgets/file_item.dart';
import 'package:chat_app/screens/messages/widgets/message_appbar.dart';
import 'package:chat_app/screens/messages/widgets/pop_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../data/models/contact_models.dart';
import '../../utils/size_utils.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key, required this.contactModel});

  final ContactModel contactModel;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<MessageModel> messages = context
        .watch<MessageCubit>()
        .sortMessage(contactId: widget.contactModel.contactId);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FC),
      appBar: MessageAppBar(contactModel: widget.contactModel),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                MessageModel messageModel = messages[index];
                if (messageModel.contactId != 111) {
                  if (!messageModel.isFile) {
                    return Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          padding: const EdgeInsets.all(20),
                          width: width - 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: const Color(0xFFD84D4D),
                          ),
                          child: Text(
                            messageModel.messageText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        DeleteButton(
                          onTabDelete: () {
                            context
                                .read<MessageCubit>()
                                .removeMessages(messageModel: messageModel);
                            Navigator.pop(context);
                          },
                          onTabCopy: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  } else {
                    return FileItem(messageModel: messageModel);
                  }
                }
                if (messageModel.isFile) {
                  return FileItem(messageModel: messageModel);
                }
                return Row(
                  children: [
                    SizedBox(width: 30.w),
                    DeleteButton(
                      onTabDelete: () {
                        context
                            .read<MessageCubit>()
                            .removeMessages(messageModel: messageModel);
                        Navigator.pop(context);
                      },
                      onTabCopy: () {
                        Navigator.pop(context);
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      padding: const EdgeInsets.all(20),
                      width: width - 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: Text(
                        messageModel.messageText,
                        style: TextStyle(
                          color: const Color(0xFF595F69),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          BottomPart(
              callback: () {
                setState(() {});
              },
              controller: controller,
              contactModel: widget.contactModel)
        ],
      ),
    );
  }
}
