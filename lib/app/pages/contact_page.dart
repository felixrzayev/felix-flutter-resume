import 'package:felixrzayev/model/data.dart';
import 'package:felixrzayev/data/constants.dart';
import 'package:felixrzayev/app/widgets/common_widgets_titles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  bool isSubmitting = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void toggleIsSubmitting(bool value) {
    setState(() {
      this.isSubmitting = value;
    });
  }

  Widget buildTextFormField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
    bool isEmail = false,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: subColor, width: 1.0),
          borderRadius: BorderRadius.circular(18),
        ),
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: maxLines == 1 ? 0 : 12,
        ),
      ),
      style: TextStyle(fontSize: 14),
      cursorColor: subColor,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'The field is required';
        } else if (isEmail &&
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
          return "Invalid email";
        }
        return null;
      },
    );
  }

  Widget buildContactItem(IconData icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: subColor,
          size: 28,
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              content,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildSubmitButton() {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      onPressed: submit,
      color: isSubmitting ? Colors.grey : subColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        this.isSubmitting ? "Submitting..." : "Submit Message",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void submit() async {
    if (_formKey.currentState!.validate() && !isSubmitting) {
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      final subject = subjectController.text.trim();
      final message = messageController.text.trim();
      final targetMail = Data.EMAIL;
      try {
        toggleIsSubmitting(true);
        var response = await http.post(Uri.parse(Data.MESSAGE_API), body: {
          "name": name,
          "email": email,
          "subject": subject,
          "target_mail": targetMail,
          "message": message,
        });
        final statusCode = response.statusCode;
        if (statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Thank for your message ^^~"),
              backgroundColor: Colors.green,
            ),
          );
          nameController.clear();
          emailController.clear();
          subjectController.clear();
          messageController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Something went wrong :("),
              backgroundColor: Colors.red,
            ),
          );
        }
        toggleIsSubmitting(false);
      } on Exception {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something went wrong :("),
            backgroundColor: Colors.red,
          ),
        );
        toggleIsSubmitting(false);
      }
    }
  }

  Widget buildTabletLayout() {
    final lineHeight = 84.0;
    return Column(
      children: <Widget>[
        SizedBox(
          height: lineHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 256,
                child: buildContactItem(Icons.call, "Phone", Data.PHONE_NUMBER),
              ),
              Expanded(
                child: buildTextFormField("Your name", nameController),
                flex: 2,
              ),
              SizedBox(width: 12),
              Expanded(
                child: buildTextFormField(
                  "Email address",
                  emailController,
                  isEmail: true,
                ),
                flex: 2,
              ),
            ],
          ),
        ),
        SizedBox(
          height: lineHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 256,
                child: buildContactItem(Icons.email, "Email", Data.EMAIL),
              ),
              Expanded(
                child: buildTextFormField("Subject", subjectController),
                flex: 2,
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 256,
              child: buildContactItem(
                  Icons.my_location, "Location", Data.LOCATION),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 124,
                    child: buildTextFormField(
                      "Message...",
                      messageController,
                      maxLines: 4,
                    ),
                  ),
                  buildSubmitButton(),
                ],
              ),
              flex: 2,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPhoneLayout() {
    final space = SizedBox(height: 36);
    final smallSpace = SizedBox(height: 18);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildContactItem(Icons.call, "Phone", Data.PHONE_NUMBER),
        space,
        buildContactItem(Icons.email, "Email", Data.EMAIL),
        space,
        buildContactItem(Icons.my_location, "Location", Data.LOCATION),
        space,
        buildTextFormField("Your name", nameController),
        smallSpace,
        buildTextFormField("Email address", emailController, isEmail: true),
        smallSpace,
        buildTextFormField("Subject", subjectController),
        smallSpace,
        buildTextFormField("Message...", messageController, maxLines: 4),
        space,
        buildSubmitButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BasePage(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonPageTitle("Get in touch"),
            SizedBox(height: 64),
            LayoutBuilder(
              builder: (_, constrain) {
                final maxWidth = constrain.maxWidth;
                final widthForTablet = 500;
                return maxWidth >= widthForTablet
                    ? buildTabletLayout()
                    : buildPhoneLayout();
              },
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
