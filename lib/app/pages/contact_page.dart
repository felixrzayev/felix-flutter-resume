import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:felixrzayev/data/constants.dart';
import 'package:felixrzayev/app/widgets/common_widgets_titles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../data/rep/inherited_data.dart';
import '../../data/strings.dart';
import '../../model/data_model.dart';
import '../widgets/base_page.dart';

class GetInTouchPage extends StatefulWidget {
  GetInTouchPage(GlobalKey key) : super(key: key);

  @override
  _GetInTouchPageState createState() => _GetInTouchPageState();
}

class _GetInTouchPageState extends State<GetInTouchPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  bool isSubmitting = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void toggleIsSubmitting(bool value) {
    setState(() {
      this.isSubmitting = value;
    });
  }

  //----------------------------------------------------------------------------
  // BUILD
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    DataModel data = InheritedData.of(context).data;

    return Form(
      key: _formKey,
      child: BasePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonPageTitle(contact),
            //TODO: Paddings
            SizedBox(height: 64),
            LayoutBuilder(
              builder: (_, constrain) {
                final maxWidth = constrain.maxWidth >= 500;
                return _childLayout(
                  maxWidth: maxWidth,
                  children: [
                    buildContactList(data),
                    buildTextFormField(),
                    buildSubmitButton(),
                  ],
                );
              },
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Tablet or Mobile Layout
  //----------------------------------------------------------------------------

  Widget _childLayout(
      {required bool maxWidth, required List<Widget> children}) {
    if (maxWidth) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: children[0],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                children[1],
                children[2],
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    }
  }

  //----------------------------------------------------------------------------
  // Contact List
  //----------------------------------------------------------------------------

  Widget buildContactList(DataModel data) {
    String subject = 'Hello Felix!';
    String body = '';
    List items = [
      [
        data.phoneNumber,
        "tel:${data.phoneNumber.trim()}",
        Icons.call,
      ],
      [
        data.email,
        "mailto:${data.email}?subject=$subject&body=$body",
        Icons.email_outlined,
      ],
    ];
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            iconColor: blackColor.withOpacity(0.5),
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            hoverColor: outlineColor.withOpacity(0.1),
            leading: Icon(item[2]),
            title: Text(item[0], style: t1TextStyle),
            onTap: () async {
              if (await canLaunchUrlString(item[1])) {
                await launchUrlString(item[1]);
              } else {
                throw "Error occured.";
              }
            },
          ),
        );
      },
    );
  }

  //----------------------------------------------------------------------------
  // Text Forms
  //----------------------------------------------------------------------------

  Widget buildTextFormField() {
    //hint, controller, email (boolean), maxLines
    List items = [
      ["Your name", nameController, false, 1],
      ["Email address", emailController, true, 1],
      ["Message...", messageController, false, 4],
    ];

    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: TextFormField(
            controller: item[1],
            maxLines: item[3],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: outlineColor, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: item[0],
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: item[3] == 1 ? 0 : 12,
              ),
            ),
            style: TextStyle(fontSize: 14),
            cursorColor: outlineColor,
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'The field is required';
              } else if (item[2] &&
                  !RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                return "Invalid email";
              }
              return null;
            },
          ),
        );
      },
    );
  }

  Widget buildSubmitButton() {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      onPressed: submit,
      color: isSubmitting ? Colors.grey : outlineColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        this.isSubmitting ? "Submitting..." : "Submit Message",
        style: t1TextStyleMetod(color: mainColor),
      ),
    );
  }

  void submit() async {
    if (_formKey.currentState!.validate() && !isSubmitting) {
      try {
        toggleIsSubmitting(true);
        final collection = FirebaseFirestore.instance.collection('feedback');

        // Write the server's timestamp and the user's feedback
        await collection.doc().set({
          'timestamp': FieldValue.serverTimestamp(),
          'name': nameController.text,
          'email': emailController.text,
          'message': messageController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Thank you for your message"),
            backgroundColor: Colors.green,
          ),
        );
        nameController.clear();
        emailController.clear();
        messageController.clear();
        toggleIsSubmitting(false);
      } on Exception {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something went wrong"),
            backgroundColor: Colors.red,
          ),
        );
        toggleIsSubmitting(false);
      }
    }
  }
}
