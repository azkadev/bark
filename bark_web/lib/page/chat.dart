// // ignore_for_file: unused_import, duplicate_import
// library app_flutter_page;

// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:bark_web/flutter/image_flutter.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:galaxeus_lib_flutter/galaxeus_lib_flutter.dart';
// import 'package:iconsax/iconsax.dart';

// import "package:cool_alert/cool_alert.dart";
// import 'package:flutter/material.dart';
// import 'package:galaxeus_lib/galaxeus_lib.dart';

// class CustomSearchHintDelegate extends SearchDelegate<String> {
//   CustomSearchHintDelegate({

//     super.searchFieldLabel,
//     super.keyboardType,
//     super.textInputAction,
//   });

//   @override
//   Widget buildLeading(BuildContext context) => const Text('leading');

//   @override
//   PreferredSizeWidget buildBottom(BuildContext context) {
//     return const PreferredSize(preferredSize: Size.fromHeight(56.0), child: Text('bottom'));
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) => const Text('suggestions');

//   @override
//   Widget buildResults(BuildContext context) => const Text('results');

//   @override
//   List<Widget> buildActions(BuildContext context) => <Widget>[
//     Text("action")
//   ];
// }

// class ChatPage extends StatefulWidget {
//   const ChatPage({
//     super.key,
//   });

//   @override
//   State<ChatPage> createState() => ChatPageState();
// }

// class ChatPageState extends State<ChatPage> {
//   ScrollController scrollController = ScrollController();
//   TextEditingController textEditingController = TextEditingController();
//   List<MessageData> messageDatas = [];
//   late bool isEmoji = false;
//   @override
//   void initState() {
//     super.initState();
//     // task();
//     WidgetsBinding.instance.addPostFrameCallback((Duration duration) async {
//       task();
//     });
//   }

//   task() async {
//     await Future.delayed(const Duration(seconds: 2));
//     String text = "/start";

//     for (var i = 0; i < text.length; i++) {
//       await Future.delayed(const Duration(milliseconds: 100));
//       setState(() {
//         textEditingController.text += text[i];
//       });
//     }
//     await Future.delayed(const Duration(milliseconds: 500));
//     setState(() {
//       messageDatas.insert(
//         0,
//         MessageData(
//           is_outgoing: true,
//           chat: Chat(
//             id: 0,
//             first_name: "Hasa",
//             last_name: "sas",
//             title: "sasas",
//             type: "group",
//           ),
//           content: MessageContent(
//             type: MessageContentType.messageText,
//             text: MessageText(
//               text: "/start",
//             ),
//           ),
//           reply_markup: ReplyMarkupData(
//             inline_keyboard: [],
//           ),
//         ),
//       );
//       textEditingController.clear();
//     });
//     await Future.delayed(const Duration(milliseconds: 500));
//     setState(() {
//       messageDatas.insert(
//         0,
//         MessageData(
//           is_outgoing: false,
//           chat: Chat(
//             id: 0,
//             first_name: "Hasa",
//             last_name: "sas",
//             title: "sasas",
//             type: "group",
//           ),
//           content: MessageContent(
//             type: MessageContentType.messageText,
//             text: MessageText(
//               text: "Hallo Perkenalkan saya adalah robot apakah anda butuh bantuan?",
//             ),
//           ),
//           reply_markup: ReplyMarkupData(
//             inline_keyboard: [
//               [
//                 InLinKeyboardData(title: "Main Menu"),
//               ],
//               [
//                 InLinKeyboardData(title: "Github"),
//                 InLinKeyboardData(title: "Telegram"),
//                 InLinKeyboardData(title: "Youtube"),
//               ]
//             ],
//           ),
//         ),
//       );
//     });
//     await Future.delayed(const Duration(milliseconds: 500));
//     text = "/ping";
//     for (var i = 0; i < text.length; i++) {
//       await Future.delayed(const Duration(milliseconds: 100));
//       setState(() {
//         textEditingController.text += text[i];
//       });
//     }
//     await Future.delayed(const Duration(milliseconds: 500));
//     setState(() {
//       messageDatas.insert(
//         0,
//         MessageData(
//           is_outgoing: true,
//           chat: Chat(
//             id: 0,
//             first_name: "Hasa",
//             last_name: "sas",
//             title: "sasas",
//             type: "group",
//           ),
//           content: MessageContent(
//             type: MessageContentType.messageText,
//             text: MessageText(
//               text: "/ping",
//             ),
//           ),
//           reply_markup: ReplyMarkupData(
//             inline_keyboard: [],
//           ),
//         ),
//       );
//       textEditingController.clear();
//     });
//     await Future.delayed(const Duration(milliseconds: 500));
//     setState(() {
//       messageDatas.insert(
//         0,
//         MessageData(
//           is_outgoing: false,
//           chat: Chat(
//             id: 0,
//             first_name: "Hasa",
//             last_name: "sas",
//             title: "sasas",
//             type: "group",
//           ),
//           content: MessageContent(
//             type: MessageContentType.messageText,
//             text: MessageText(
//               text: """📣️ Pong

// Version: v0.0.2-Dev""",
//             ),
//           ),
//           reply_markup: ReplyMarkupData(
//             inline_keyboard: [],
//           ),
//         ),
//       );
//     });
//     await Future.delayed(const Duration(milliseconds: 500));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: PreferredSize(
//         preferredSize: Size(context.width, 450), // here the desired height
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(40),
//               bottomRight: Radius.circular(40),
//             ),
//             color: Colors.white.withOpacity(0.85),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color.fromARGB(110, 0, 0, 0),
//                 spreadRadius: 1,
//                 blurRadius: 7,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               MaterialButton(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25.0),
//                 ),
//                 hoverColor: Colors.transparent,
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 onPressed: () async {},
//                 padding: const EdgeInsets.all(15),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Flexible(
//                             child: MaterialButton(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(25.0),
//                               ),
//                               minWidth: 0,
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               padding: const EdgeInsets.all(15),
//                               child: const RotatedBox(
//                                 quarterTurns: 2,
//                                 child: Icon(
//                                   Iconsax.send_1,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Flexible(
//                             child: Padding(
//                               padding: EdgeInsets.all(5),
//                               child: InkWell(
//                                 borderRadius: BorderRadius.circular(25.0),
//                                 onHover: (bool value) {},
//                                 onTap: () {},
//                                 child: FlutterLogo(
//                                   size: 50,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Flexible(
//                             child: Padding(
//                               padding: const EdgeInsets.all(5),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: const [
//                                   Text(
//                                     "AzkaDev Bot",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     "bot",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         MaterialButton(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25.0),
//                           ),
//                           minWidth: 0,
//                           onPressed: () async {
//                             await showSearch(
//                               context: context,
//                               delegate: CustomSearchHintDelegate(searchFieldLabel: "sasas"),
//                               useRootNavigator: true
//                             );
//                           },
//                           padding: const EdgeInsets.all(15),
//                           child: const RotatedBox(
//                             quarterTurns: 1,
//                             child: Icon(Iconsax.search_normal),
//                           ),
//                         ),
//                         PopupMenuButton(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                           child: const RotatedBox(
//                             quarterTurns: 1,
//                             child: Icon(Iconsax.more),
//                           ),
//                           clipBehavior: Clip.antiAlias,
//                           itemBuilder: (context) {
//                             return [
//                               PopupMenuItem(
//                                 child: Row(
//                                   children: const [
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(horizontal: 5),
//                                       child: Icon(
//                                         Iconsax.call,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(horizontal: 5),
//                                       child: Text(
//                                         "Video Call",
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 onTap: () {},
//                               ),
//                               PopupMenuItem(
//                                 child: Row(
//                                   children: const [
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(horizontal: 5),
//                                       child: Icon(
//                                         Iconsax.call,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(horizontal: 5),
//                                       child: Text(
//                                         "Video Call",
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 onTap: () {},
//                               ),
//                               PopupMenuItem(
//                                 child: Row(
//                                   children: const [
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(horizontal: 5),
//                                       child: Icon(
//                                         Iconsax.call,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(horizontal: 5),
//                                       child: Text(
//                                         "Video Call",
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 onTap: () {},
//                               ),
//                             ];
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       extendBodyBehindAppBar: true,
//       extendBody: true,
//       body: Container(
//         constraints: BoxConstraints(
//           minHeight: context.height,
//           minWidth: context.width,
//           // maxHeight: screenSize,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: ImageFlutter.auto(image: "assets/user/girl_2.jpg", default_image: "assets/icons/ghost.png").image,
//             onError: (errDetails, error) {},
//           ),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: LayoutBuilder(
//                 builder: (BuildContext ctx, BoxConstraints constraints) {
//                   return MediaQuery(
//                     data: ctx.mediaQueryData.copyWith(
//                       size: constraints.biggest,
//                     ),
//                     child: Message(
//                       controller: scrollController,
//                       messageDatas: messageDatas,
//                       onTapText: (messageData, index, text, type) async {
//                         setState(() {
//                           messageDatas.insert(
//                             0,
//                             MessageData(
//                               is_outgoing: true,
//                               chat: Chat(
//                                 id: 0,
//                                 first_name: "Hasa",
//                                 last_name: "sas",
//                                 title: "sasas",
//                                 type: "group",
//                               ),
//                               content: MessageContent(
//                                 type: MessageContentType.messageText,
//                                 text: MessageText(
//                                   text: text,
//                                 ),
//                               ),
//                               reply_markup: ReplyMarkupData(
//                                 inline_keyboard: [],
//                               ),
//                             ),
//                           );
//                         });
//                         scrollController.animateTo(
//                           scrollController.position.minScrollExtent,
//                           duration: const Duration(milliseconds: 10),
//                           curve: Curves.bounceIn,
//                         );
//                         // await showDialog(
//                         //   context: context,
//                         //   builder: (BuildContext context) {
//                         //     return const AlertDialog(
//                         //       title: Text("Open Url"),
//                         //       content:  Text("Helo")
//                         //     );
//                         //   },
//                         // );
//                       },
//                       onTapButton: (messageData, int index, int column, int row) {
//                         setState(
//                           () {
//                             messageDatas[index] = MessageData(
//                               is_outgoing: false,
//                               chat: Chat(
//                                 id: 0,
//                                 first_name: "Hasa",
//                                 last_name: "sas",
//                                 title: "sasas",
//                                 type: "group",
//                               ),
//                               content: MessageContent(
//                                 type: MessageContentType.messageText,
//                                 text: MessageText(
//                                   text: """📣️ Pong

// Version: v0.0.2-Dev""",
//                                 ),
//                               ),
//                               reply_markup: ReplyMarkupData(
//                                 inline_keyboard: [],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Container(
//               width: context.mediaQueryData.size.width,
//               constraints: BoxConstraints(
//                 maxHeight: (!isEmoji) ? context.mediaQueryData.size.height * .30 : context.mediaQueryData.size.height * .70,
//               ),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color.fromARGB(110, 0, 0, 0),
//                     spreadRadius: 1,
//                     blurRadius: 7,
//                     offset: Offset(0, 3), // changes positivalueon of shadow
//                   ),
//                 ],
//               ),
//               padding: EdgeInsets.symmetric(
//                 horizontal: (isEmoji) ? 0 : 15,
//               ),
//               child: KeyboardListener(
//                 focusNode: FocusNode(),
//                 child: getInput(isEmojiView: isEmoji),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget getInput({
//     bool isEmojiView = false,
//   }) {
//     if (!isEmojiView) {
//       return Row(
//         crossAxisAlignment: (textEditingController.text.split("\n").length < 2) ? CrossAxisAlignment.center : CrossAxisAlignment.end,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5),
//             child: MaterialButton(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.0),
//               ),
//               minWidth: 0,
//               onPressed: () {
//                 setState(() {
//                   isEmoji = !isEmoji;
//                 });
//               },
//               child: Icon(
//                 Iconsax.emoji_normal,
//                 color: (!isEmoji) ? Colors.black : Colors.blue,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: TextField(
//                 controller: textEditingController,
//                 keyboardType: TextInputType.multiline,
//                 maxLines: null,
//                 cursorColor: Colors.black,
//                 onChanged: (String value) {
//                   setState(() {});
//                 },
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.all(5.0),
//                   hintText: 'input message here',
//                   hintStyle: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 14.0,
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: Colors.transparent,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: Colors.transparent,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   floatingLabelStyle: const TextStyle(
//                     color: Colors.transparent,
//                     fontSize: 18.0,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: Colors.transparent,
//                       width: 1.5,
//                     ),
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5),
//             child: GestureDetector(
//               // shape: RoundedRectangleBorder(
//               //   borderRadius: BorderRadius.circular(25.0),
//               // ),
//               // minWidth: 0,
//               onVerticalDragUpdate: (details) {
//                 if (kDebugMode) {
//                   print(details.globalPosition);
//                 }
//               },
//               onTap: () {},
//               child: const Icon(
//                 Iconsax.attach_circle,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5),
//             child: MaterialButton(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.0),
//               ),
//               minWidth: 0,
//               onPressed: () {},
//               child: const Icon(
//                 Iconsax.image,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5),
//             child: MaterialButton(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.0),
//               ),
//               minWidth: 0,
//               onPressed: () async {
//                 if (textEditingController.text.isEmpty) {
//                   return;
//                 }
//                 // setState(() {
//                 //   task();
//                 // });
//                 // return;
//                 setState(() {
//                   messageDatas.insert(
//                     0,
//                     MessageData(
//                       is_outgoing: true,
//                       chat: Chat(
//                         id: 0,
//                         first_name: "Hasa",
//                         last_name: "sas",
//                         title: "sasas",
//                         type: "group",
//                       ),
//                       content: MessageContent(
//                         type: MessageContentType.messageText,
//                         text: MessageText(
//                           text: textEditingController.text,
//                         ),
//                       ),
//                       reply_markup: ReplyMarkupData(
//                         inline_keyboard: [],
//                       ),
//                     ),
//                   );
//                 });
//                 scrollController.animateTo(
//                   scrollController.position.minScrollExtent,
//                   duration: const Duration(milliseconds: 10),
//                   curve: Curves.bounceIn,
//                 );
//                 if (textEditingController.text.toLowerCase() == "/start") {
//                   textEditingController.clear();
//                   await Future.delayed(const Duration(milliseconds: 500));
//                   setState(() {
//                     messageDatas.insert(
//                       0,
//                       MessageData(
//                         is_outgoing: false,
//                         chat: Chat(
//                           id: 0,
//                           first_name: "Hasa",
//                           last_name: "sas",
//                           title: "sasas",
//                           type: "group",
//                         ),
//                         content: MessageContent(
//                           type: MessageContentType.messageText,
//                           text: MessageText(
//                             text: "Hallo Perkenalkan saya adalah robot apakah anda butuh bantuan?",
//                           ),
//                         ),
//                         reply_markup: ReplyMarkupData(
//                           inline_keyboard: [
//                             [
//                               InLinKeyboardData(title: "Main Menu"),
//                             ],
//                             [
//                               InLinKeyboardData(title: "Github"),
//                               InLinKeyboardData(title: "Telegram"),
//                               InLinKeyboardData(title: "Youtube"),
//                             ]
//                           ],
//                         ),
//                       ),
//                     );
//                   });
//                   scrollController.animateTo(
//                     scrollController.position.minScrollExtent,
//                     duration: const Duration(milliseconds: 100),
//                     curve: Curves.bounceInOut,
//                   );
//                 } else if (textEditingController.text.toLowerCase() == "/ping") {
//                   textEditingController.clear();
//                   await Future.delayed(const Duration(milliseconds: 500));
//                   setState(() {
//                     messageDatas.insert(
//                       0,
//                       MessageData(
//                         is_outgoing: false,
//                         chat: Chat(
//                           id: 0,
//                           first_name: "Hasa",
//                           last_name: "sas",
//                           title: "sasas",
//                           type: "group",
//                         ),
//                         content: MessageContent(
//                           type: MessageContentType.messageText,
//                           text: MessageText(
//                             text: """📣️ Pong

// Version: v0.0.2-Dev""",
//                           ),
//                         ),
//                         reply_markup: ReplyMarkupData(
//                           inline_keyboard: [],
//                         ),
//                       ),
//                     );
//                   });
//                   scrollController.animateTo(
//                     scrollController.position.minScrollExtent,
//                     duration: const Duration(milliseconds: 10),
//                     curve: Curves.ease,
//                   );
//                 } else if (textEditingController.text.toLowerCase() == "hai") {
//                   textEditingController.clear();
//                   await Future.delayed(const Duration(milliseconds: 500));
//                   setState(() {
//                     messageDatas.insert(
//                       0,
//                       MessageData(
//                         is_outgoing: false,
//                         chat: Chat(
//                           id: 0,
//                           first_name: "Hasa",
//                           last_name: "sas",
//                           title: "sasas",
//                           type: "group",
//                         ),
//                         content: MessageContent(
//                           type: MessageContentType.messageText,
//                           text: MessageText(
//                             text: "hai juga manis",
//                           ),
//                         ),
//                         reply_markup: ReplyMarkupData(
//                           inline_keyboard: [],
//                         ),
//                       ),
//                     );
//                   });
//                   scrollController.animateTo(
//                     scrollController.position.minScrollExtent,
//                     duration: const Duration(milliseconds: 10),
//                     curve: Curves.bounceIn,
//                   );
//                 } else {
//                   textEditingController.clear();
//                   await Future.delayed(const Duration(milliseconds: 500));
//                   setState(() {
//                     messageDatas.insert(
//                       0,
//                       MessageData(
//                         is_outgoing: false,
//                         chat: Chat(
//                           id: 0,
//                           first_name: "Hasa",
//                           last_name: "sas",
//                           title: "sasas",
//                           type: "group",
//                         ),
//                         content: MessageContent(
//                           type: MessageContentType.messageText,
//                           text: MessageText(
//                             text: "Maaf saya tidak tahu kamu mengatakan apa bisakah anda mengajari saya?",
//                           ),
//                         ),
//                         reply_markup: ReplyMarkupData(
//                           inline_keyboard: [
//                             [
//                               InLinKeyboardData(title: "Mau"),
//                               InLinKeyboardData(title: "Tidak"),
//                             ],
//                           ],
//                         ),
//                       ),
//                     );
//                   });
//                   scrollController.animateTo(
//                     scrollController.position.minScrollExtent,
//                     duration: const Duration(milliseconds: 10),
//                     curve: Curves.ease,
//                   );
//                 }
//               },
//               child: Icon(
//                 Iconsax.send_1,
//                 color: (textEditingController.text.isNotEmpty) ? Colors.blue : Colors.black,
//               ),
//             ),
//           ),
//         ],
//       );
//     }
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Flexible(
//           child: getInput(),
//         ),
//         // Expanded(
//         //   child: EmojiPicker(
//         //     textEditingController: textEditingController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
//         //     config: Config(
//         //       columns: 7,
//         //       emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
//         //       verticalSpacing: 0,
//         //       horizontalSpacing: 0,
//         //       gridPadding: EdgeInsets.zero,
//         //       // initCategory: Category.RECENT,
//         //       // initCategory: Category.RECENT,
//         //       bgColor: const Color.fromARGB(255, 255, 255, 255),
//         //       indicatorColor: Colors.blue,
//         //       iconColor: Colors.grey,
//         //       iconColorSelected: Colors.blue,
//         //       backspaceColor: Colors.blue,
//         //       skinToneDialogBgColor: Colors.white,
//         //       skinToneIndicatorColor: Colors.grey,
//         //       enableSkinTones: true,
//         //       showRecentsTab: true,
//         //       recentsLimit: 28,
//         //       noRecents: const Text(
//         //         'No Recents',
//         //         style: TextStyle(fontSize: 20, color: Colors.black26),
//         //         textAlign: TextAlign.center,
//         //       ), // Needs to be const Widget
//         //       loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
//         //       tabIndicatorAnimDuration: kTabScrollDuration,
//         //       categoryIcons: const CategoryIcons(),
//         //       buttonMode: ButtonMode.MATERIAL,
//         //     ),
//         //   ),
//         // ),
//       ],
//     );
//   }
// }

// class MessageData {
//   final bool is_outgoing;
//   final Chat chat;
//   final MessageContent content;
//   final ReplyMarkupData? reply_markup;
//   MessageData({
//     this.is_outgoing = false,
//     required this.chat,
//     required this.content,
//     required this.reply_markup,
//   });
// }

// enum MessageContentType {
//   messageText,
//   messagePhoto,
//   messageVideo,
//   messageAudio,
//   messageVoice,
// }

// class MessageContent {
//   final MessageContentType type;
//   final MessageText? text;
//   MessageContent({
//     required this.type,
//     this.text,
//   });
// }

// class MessageText {
//   final String text;
//   MessageText({
//     required this.text,
//   });
// }

// class Chat {
//   final int id;
//   final String? first_name;
//   final String? last_name;
//   final String? username;
//   final String? title;
//   final String type;
//   Chat({
//     required this.id,
//     this.first_name,
//     this.last_name,
//     this.username,
//     this.title,
//     required this.type,
//   });
// }

// class ReplyMarkupData {
//   final List<List<InLinKeyboardData>> inline_keyboard;
//   ReplyMarkupData({required this.inline_keyboard});
// }

// class Message extends StatelessWidget {
//   final List<MessageData> messageDatas;
//   final ScrollController? controller;
//   final Function(MessageData messageData, int index, int column, int row)? onTapButton;
//   final Function(MessageData messageData, int index, String text, String type)? onTapText;
//   const Message({
//     super.key,
//     this.controller,
//     required this.messageDatas,
//     this.onTapButton,
//     this.onTapText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       controller: controller,
//       scrollDirection: Axis.vertical,
//       primary: false,
//       shrinkWrap: true,
//       physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//       reverse: true,
//       itemCount: messageDatas.length,
//       itemBuilder: (BuildContext context, index) {
//         late bool isContentNotification = false;
//         MessageData messageData = messageDatas[index];

//         return Container(
//           alignment: () {
//             if (isContentNotification) {
//               return Alignment.center;
//             } else if (messageData.is_outgoing) {
//               return Alignment.centerRight;
//             }
//             return Alignment.centerLeft;
//           }.call(),
//           margin: const EdgeInsets.symmetric(
//             vertical: 5,
//             horizontal: 5,
//           ),
//           child: Row(
//             mainAxisAlignment: () {
//               if (isContentNotification) {
//                 return MainAxisAlignment.center;
//               } else if (messageData.is_outgoing) {
//                 return MainAxisAlignment.end;
//               }
//               return MainAxisAlignment.start;
//             }.call(),
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // profile picture on group chat
//               Flexible(
//                   child: Visibility(
//                 visible: () {
//                   if (isContentNotification) {
//                     return false;
//                   } else if (messageData.chat.type != "private" && messageData.chat.type != "channel") {
//                     return !messageData.is_outgoing;
//                   }
//                   return false;
//                 }.call(),
//                 child: const Padding(
//                   padding: EdgeInsets.all(5),
//                   child: FlutterLogo(
//                     size: 42,
//                   ),
//                 ),
//               )),
//               LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//                   BorderRadiusGeometry borderRadius = BorderRadius.circular(5);
//                   // if (index == 0) {
//                   //   borderRadius = BorderRadius.circular(5);
//                   // }
//                   // if (index == (messageDatas.length - 1)) {
//                   //   borderRadius = BorderRadius.circular(5);
//                   // }
//                   return MediaQuery(
//                     data: context.mediaQueryData.copyWith(size: constraints.biggest),
//                     child: Column(
//                       crossAxisAlignment: () {
//                         if (isContentNotification) {
//                           return CrossAxisAlignment.center;
//                         } else if (messageData.is_outgoing) {
//                           return CrossAxisAlignment.end;
//                         }
//                         return CrossAxisAlignment.start;
//                       }.call(),
//                       children: [
//                         Container(
//                           constraints: BoxConstraints(
//                             maxWidth: context.mediaQueryData.size.width / 1.3,
//                             // maxHeight: context.mediaQueryData.size.height / 1.3,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: borderRadius,
//                           ),
//                           child: content(
//                             context: context,
//                             messageData: messageData,
//                             onTapText: (text, type) {
//                               if (onTapText != null) {
//                                 onTapText!.call(messageData, index, text, type);
//                               }
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 1,
//                         ),
//                         Visibility(
//                           // visible: false,
//                           visible: (messageData.reply_markup != null && messageData.reply_markup!.inline_keyboard.isNotEmpty),
//                           child: Container(
//                             constraints: BoxConstraints(
//                               minWidth: context.mediaQueryData.size.width / 1.3,
//                               maxWidth: context.mediaQueryData.size.width / 1.3,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.transparent,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             padding: const EdgeInsets.all(2),
//                             child: InlineKeyboardButton(
//                               inLinKeyboardDatas: messageData.reply_markup!.inline_keyboard,
//                               onTap: (column, row) async {
//                                 if (onTapButton != null) {
//                                   onTapButton!.call(
//                                     messageData,
//                                     index,
//                                     column,
//                                     row,
//                                   );
//                                   return;
//                                 }

//                                 await showDialog(
//                                   context: context,
//                                   useRootNavigator: false,
//                                   useSafeArea: false,
//                                   builder: (BuildContext context) {
//                                     String typePageDownload = "main";
//                                     TextEditingController amountCash = TextEditingController();
//                                     return AlertDialog(
//                                       content: StatefulBuilder(
//                                         builder: (BuildContext context, StateSetter setState) {
//                                           List<Widget> mainPage = [
//                                             const Center(
//                                               child: Text(
//                                                 "Support Developer HexaMinate",
//                                                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               height: 15,
//                                             ),
//                                             const Center(
//                                               child: Text(
//                                                 "Since we were first established, our developers have built it alone without the help of friends / coworkers, whatever the value of the donation is very useful for us, thank you very much",
//                                                 textAlign: TextAlign.center,
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               height: 15,
//                                             ),
//                                             Builder(builder: (BuildContext ctx) {
//                                               Widget amount({required String amount, required String title}) {
//                                                 return Padding(
//                                                   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                                                   child: MaterialButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         amountCash.text = amount;
//                                                       });
//                                                     },
//                                                     color: Colors.black,
//                                                     height: 45,
//                                                     shape: RoundedRectangleBorder(
//                                                       borderRadius: BorderRadius.circular(8),
//                                                     ),
//                                                     padding: const EdgeInsets.only(
//                                                       left: 25,
//                                                       right: 25,
//                                                       bottom: 4,
//                                                     ),
//                                                     child: Center(
//                                                       child: Text(
//                                                         title,
//                                                         style: const TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 );
//                                               }

//                                               List<Widget> items = [
//                                                 amount(amount: "50000", title: "50k"),
//                                                 amount(amount: "100000", title: "100k"),
//                                                 Expanded(
//                                                   child: TextField(
//                                                     cursorColor: Colors.black,
//                                                     controller: amountCash,
//                                                     inputFormatters: const [
//                                                       /*
//                                                            FilteringTextInputFormatter.digitsOnly
//                                                            */
//                                                     ],
//                                                     decoration: InputDecoration(
//                                                       contentPadding: const EdgeInsets.all(0.0),
//                                                       hintText: '12',
//                                                       labelStyle: const TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 14.0,
//                                                         fontWeight: FontWeight.w400,
//                                                       ),
//                                                       hintStyle: const TextStyle(
//                                                         color: Colors.grey,
//                                                         fontSize: 14.0,
//                                                       ),
//                                                       prefixIcon: const Icon(
//                                                         Icons.money,
//                                                         color: Colors.black,
//                                                         size: 18,
//                                                       ),
//                                                       enabledBorder: OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: Colors.grey.shade200,
//                                                           width: 2,
//                                                         ),
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                       ),
//                                                       floatingLabelStyle: const TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 18.0,
//                                                       ),
//                                                       focusedBorder: OutlineInputBorder(
//                                                         borderSide: const BorderSide(
//                                                           color: Colors.black,
//                                                           width: 1.5,
//                                                         ),
//                                                         borderRadius: BorderRadius.circular(15.0),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                               ];
//                                               return Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: items);
//                                             }),
//                                             const SizedBox(
//                                               height: 15,
//                                             ),
//                                             Builder(builder: (BuildContext ctx) {
//                                               List<Widget> items = [
//                                                 Padding(
//                                                   padding: const EdgeInsets.all(5),
//                                                   child: TextButton(
//                                                     onPressed: () {},
//                                                     child: const Text(
//                                                       "Just Download",
//                                                       style: TextStyle(
//                                                         color: Color.fromARGB(255, 54, 54, 54),
//                                                         fontSize: 17.0,
//                                                         fontWeight: FontWeight.w800,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Flexible(
//                                                     child: Padding(
//                                                   padding: const EdgeInsets.all(5),
//                                                   child: MaterialButton(
//                                                     onPressed: () async {
//                                                       if (RegExp(r"^[0-9]+$", caseSensitive: false).hasMatch(amountCash.text) && int.parse(amountCash.text) > 0) {
//                                                         setState(() {
//                                                           typePageDownload = "form";
//                                                         });
//                                                       }
//                                                     },
//                                                     color: Colors.black,
//                                                     height: 45,
//                                                     shape: RoundedRectangleBorder(
//                                                       borderRadius: BorderRadius.circular(8),
//                                                     ),
//                                                     padding: const EdgeInsets.only(
//                                                       left: 25,
//                                                       right: 25,
//                                                       bottom: 4,
//                                                     ),
//                                                     child: const Center(
//                                                       child: Text(
//                                                         "Donate + Downloads",
//                                                         style: TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.white,
//                                                         ),
//                                                         overflow: TextOverflow.ellipsis,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )),
//                                               ];
//                                               return Row(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center, children: items);
//                                             }),
//                                           ];

//                                           if (typePageDownload == "form") {
//                                             mainPage = [
//                                               const Center(
//                                                 child: Text("form"),
//                                               )
//                                             ];
//                                           }
//                                           return Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: mainPage);
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget contentText({
//     required String text,
//     required Function(String text, String type) onTapText,
//     required BuildContext context,
//   }) {
//     RegExp emailPattern = RegExp(r"\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b");
//     RegExp urlPattern = RegExp(r"((http(s)?)://)?[a-zA-Z\d@:._+~#=-]{1,256}\.[a-z\d]{2,18}\b([-a-zA-Z\d!@:_+.~#?&/=%,$]*)(?<![$])");
//     RegExp emoPattern = RegExp(r"\[(.*?)\]");
//     RegExp commandPattern = RegExp(r"\/([a-z0-9]+)");
//     RegExp usernamePattern = RegExp(r"@([a-z0-9]+)");
//     RegExp hastagPattern = RegExp(r"#([a-z0-9]+)");
//     final mapping = [
//       urlPattern.pattern,
//       emoPattern.pattern,
//       // atPatternIncomplete.pattern,
//       emailPattern.pattern,
//       commandPattern.pattern,
//       hastagPattern.pattern,
//       usernamePattern.pattern,
//     ];
//     final pattern = '(${mapping.join('|')})';

//     List<InlineSpan> widgets = [];
//     text.splitMapJoin(
//       RegExp(
//         pattern,
//         multiLine: false,
//         caseSensitive: true,
//         dotAll: true,
//         unicode: false,
//       ),
//       onMatch: (Match match) {
//         String? matchText = match[0];
//         matchText ??= "";
//         if (urlPattern.hasMatch(matchText)) {
//           widgets.add(
//             WidgetSpan(
//               alignment: PlaceholderAlignment.middle,
//               child: GestureDetector(
//                 onTap: () {
//                   onTapText.call(matchText!, "url");
//                 },
//                 child: Text(
//                   matchText,
//                   style: const TextStyle(
//                     color: Colors.blue,
//                     fontSize: 14,
//                     overflow: TextOverflow.clip,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         } else if (commandPattern.hasMatch(matchText)) {
//           //链接解析
//           widgets.add(
//             WidgetSpan(
//               alignment: PlaceholderAlignment.middle,
//               child: GestureDetector(
//                 onTap: () {
//                   onTapText.call(matchText!, "command");
//                 },
//                 child: Text(
//                   matchText,
//                   style: const TextStyle(
//                     color: Colors.blue,
//                     fontSize: 14,
//                     overflow: TextOverflow.clip,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         } else if (usernamePattern.hasMatch(matchText)) {
//           //链接解析
//           widgets.add(
//             WidgetSpan(
//               alignment: PlaceholderAlignment.middle,
//               child: GestureDetector(
//                 onTap: () {
//                   onTapText.call(matchText!, "username");
//                 },
//                 child: Text(
//                   matchText,
//                   style: const TextStyle(
//                     color: Colors.blue,
//                     fontSize: 14,
//                     overflow: TextOverflow.clip,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         } else if (hastagPattern.hasMatch(matchText)) {
//           //链接解析
//           widgets.add(
//             WidgetSpan(
//               alignment: PlaceholderAlignment.middle,
//               child: GestureDetector(
//                 onTap: () {
//                   onTapText.call(matchText!, "hastag");
//                 },
//                 child: Text(
//                   matchText,
//                   style: const TextStyle(
//                     color: Colors.blue,
//                     fontSize: 14,
//                     overflow: TextOverflow.clip,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         } else if (emailPattern.hasMatch(matchText)) {
//           widgets.add(
//             WidgetSpan(
//               alignment: PlaceholderAlignment.middle,
//               child: GestureDetector(
//                 onTap: () {
//                   onTapText.call(matchText!, "email");
//                 },
//                 child: Text(
//                   matchText,
//                   style: const TextStyle(
//                     color: Colors.blue,
//                     fontSize: 14,
//                     overflow: TextOverflow.clip,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         } else {
//           widgets.add(TextSpan(
//               text: matchText,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//                 overflow: TextOverflow.ellipsis,
//               )));
//         }
//         return matchText;
//       },
//       onNonMatch: (String text) {
//         widgets.add(TextSpan(
//             text: text,
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 14,
//               overflow: TextOverflow.clip,
//             )));
//         return text;
//       },
//     );
//     widgets.add(
//       const TextSpan(
//         text: "sad",
//         style: TextStyle(
//           color: Color.fromRGBO(255, 255, 255, 1),
//           overflow: TextOverflow.clip,
//         ),
//       ),
//     );
//     return RichText(
//       text: TextSpan(
//         text: '',
//         style: DefaultTextStyle.of(context).style.merge(const TextStyle(
//               fontSize: 16,
//               overflow: TextOverflow.clip,
//             )),
//         children: widgets,
//       ),
//       overflow: TextOverflow.clip,
//       softWrap: true,
//     );
//   }

//   Widget content({
//     required BuildContext context,
//     required MessageData messageData,
//     required Function(String text, String type) onTapText,
//   }) {
//     var additionalInfo = "sad";
//     if (messageData.content.type.name == MessageContentType.messageVoice.name) {
//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Row(
//           //   mainAxisSize: MainAxisSize.min,
//           //   children: [
//           //     Text("Anjani"),
//           //     Spacer(),
//           //     Text("Admin"),
//           //   ],
//           // ),
//           Container(
//             margin: const EdgeInsets.symmetric(
//               vertical: 5,
//             ),
//             child: Row(
//               children: const [
//                 Icon(
//                   Iconsax.voice_cricle,
//                 ),
//               ],
//             ),
//           ),
//           const Text(
//             "Hello world",
//           ),
//           // Row(
//           //   mainAxisSize: MainAxisSize.min,
//           //   children: [
//           //     Spacer(),
//           //     Text("10:52"),
//           //   ],
//           // ),
//         ],
//       );
//     }
//     if (messageData.content.type.name == MessageContentType.messagePhoto.name) {
//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Row(
//           //   mainAxisSize: MainAxisSize.min,
//           //   children: [
//           //     Text("Anjani"),
//           //     Spacer(),
//           //     Text("Admin"),
//           //   ],
//           // ),
//           Flexible(
//             child: PageView.builder(
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return FlutterLogo(
//                   size: context.width,
//                 );
//               },
//             ),
//           ),
//           const Text(
//             "Hello world",
//           ),
//           // Row(
//           //   mainAxisSize: MainAxisSize.min,
//           //   children: [
//           //     Spacer(),
//           //     Text("10:52"),
//           //   ],
//           // ),
//         ],
//       );
//     }

//     if (messageData.content.type.name == MessageContentType.messageText.name) {
//       // return ;
//       return Container(
//         width: () {
//           double width = context.width;

//           List<String> texts = messageData.content.text!.text.split("\n");
//           int count_length = 0;
//           for (var i = 0; i < texts.length; i++) {
//             String text = texts[i];

//             if (text.length > count_length) {
//               count_length = text.length;
//             }
//           }
//           texts = ["Anjani", "Admin"];
//           for (var i = 0; i < texts.length; i++) {
//             String text = texts[i];

//             if (text.length > count_length) {
//               count_length = text.length;
//             }
//           }
//           if ((count_length * 16) < width) {
//             return (count_length * 16).toDouble();
//           }
//           return width;
//         }.call(),
//         padding: const EdgeInsets.all(5),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           // mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Flexible(
//                 child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Anjani",
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Text(
//                   "Admin",
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             )),
//             Flexible(
//                 child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 10,
//               ),
//               child: contentText(
//                 text: "${messageData.content.text!.text}",
//                 onTapText: onTapText,
//                 context: context,
//               ),
//             )),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: Text(
//                 "00:32",
//                 style: const TextStyle(
//                   fontSize: 12.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: const [
//         // Row(
//         //   mainAxisSize: MainAxisSize.min,
//         //   children: [
//         //     Text("Anjani"),
//         //     Spacer(),
//         //     Text("Admin"),
//         //   ],
//         // ),

//         Text(
//           "Unsupported Message Please update application",
//         )
//         // Row(
//         //   mainAxisSize: MainAxisSize.min,
//         //   children: [
//         //     Spacer(),
//         //     Text("10:52"),
//         //   ],
//         // ),
//       ],
//     );
//   }
// }

// class InLinKeyboardData {
//   final String title;
//   InLinKeyboardData({
//     required this.title,
//   });
// }

// class InlineKeyboardButton extends StatelessWidget {
//   final List<List<InLinKeyboardData>> inLinKeyboardDatas;
//   final void Function(int column, int row) onTap;
//   const InlineKeyboardButton({
//     super.key,
//     required this.inLinKeyboardDatas,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.vertical,
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       primary: false,
//       itemCount: inLinKeyboardDatas.length,
//       itemBuilder: (BuildContext context, int index) {
//         List<InLinKeyboardData> inLinKeyboardRowDatas = inLinKeyboardDatas[index];
//         late List<Widget> rows = [];
//         for (var i = 0; i < inLinKeyboardRowDatas.length; i++) {
//           InLinKeyboardData inLinKeyboardData = inLinKeyboardRowDatas[i];
//           BorderRadius borderRadius = BorderRadius.circular(10);
//           if (inLinKeyboardDatas.length > 1) {
//             if (index == 0) {
//               if (inLinKeyboardDatas.length > 1) {
//               } else {}
//             }
//           } else {}
//           rows.add(Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(1),
//               child: MaterialButton(
//                 minWidth: 0,
//                 color: const Color.fromARGB(82, 0, 0, 0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: borderRadius,
//                 ),
//                 onPressed: () {
//                   onTap.call(index, i);
//                 },
//                 clipBehavior: Clip.antiAlias,
//                 child: Visibility(
//                   visible: (index != 0),
//                   replacement: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                       child: Text(
//                         inLinKeyboardData.title,
//                         style: const TextStyle(color: Colors.white),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox.shrink(),
//                       Flexible(
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                             child: Text(
//                               inLinKeyboardData.title,
//                               style: const TextStyle(color: Colors.white),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(2),
//                         child: RotatedBox(
//                           quarterTurns: 1,
//                           child: Icon(
//                             Iconsax.link,
//                             color: Colors.white,
//                             size: 10,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ));
//         }
//         return Row(
//           children: rows,
//         );
//       },
//     );
//   }
// }
