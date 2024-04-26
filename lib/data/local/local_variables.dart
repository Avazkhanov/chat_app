

import 'package:chat_app/data/models/contact_models.dart';
import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/utils/app_images.dart';

List<ContactModel> allContacts = [
  ContactModel(
    contactId: 1,
    contactLasName: "Abduraimov",
    contactName: "Obidxon",
    isOnline: false,
    imageUrl: AppImages.obidxon,
    lastOnlineTime: DateTime.now(),
  ),
  ContactModel(
    contactId: 2,
    contactLasName: "Oqilov",
    contactName: "Abubakr",
    isOnline: false,
    imageUrl: AppImages.abubakr,
    lastOnlineTime: DateTime.now(),
  ),
];

List<MessageModel> allMessages = [
  MessageModel(
    createdTime: DateTime.now().toString(),
    messageText: 'Assalomu alaykum uy ishini qildingizmi',
    messageId: 2,
    isFile: false,
    contactId: 2,
    status: false,
  ),
  MessageModel(
    createdTime: DateTime.now().toString(),
    messageText: 'Vaalaykum salom qaysi birini ?',
    messageId: 2,
    isFile: false,
    contactId: 111,
    status: false,
  ),
  MessageModel(
    createdTime: DateTime.now().toString(),
    messageText:
        "Assalomu aleykum project nima bo'ldi",
    messageId: 1,
    isFile: false,
    contactId: 1,
    status: false,
  ),
  MessageModel(
    createdTime: DateTime.now().toString(),
    messageText: "Sekin bo'layabdi",
    messageId: 1,
    isFile: false,
    contactId: 111,
    status: false,
  ),
];
