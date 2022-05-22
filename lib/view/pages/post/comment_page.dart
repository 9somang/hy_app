// import 'package:flutter/material.dart';
//
// class cmtpages extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Comment Page"),
//         backgroundColor: Colors.pink,
//       ),
//       body: Container(
//         child: CommentBox(
//           userImage:
//           "",
//           child: commentChild(filedata),
//           labelText: 'Write a comment...',
//           withBorder: false,
//           errorText: 'Comment cannot be blank',
//           sendButtonMethod: () {
//             if (formKey.currentState.validate()) {
//               print(commentController.text);
//               setState(() {
//                 var value = {
//                   'name': 'New User',
//                   'pic':
//                   '',
//                   'message': commentController.text
//                 };
//                 filedata.insert(0, value);
//               });
//               commentController.clear();
//               FocusScope.of(context).unfocus();
//             } else {
//               print("Not validated");
//             }
//           },
//           formKey: formKey,
//           commentController: commentController,
//           backgroundColor: Colors.black,
//           textColor: Colors.white,
//           sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
