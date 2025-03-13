import 'package:flutter/material.dart';

import '../../../../dg-components/constants/data.dart';

class OtpWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpWidget(this.controller, this.autoFocus, {Key? key})
      : super(key: key);
  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56, // Set desired width
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            offset: Offset(0, 4), //(x,y)
            blurRadius: 15.0,
          ),
        ],
        borderRadius: BorderRadius.circular(15), // Match inner border radius
        gradient: LinearGradient(
          colors: [buttonTopColor, buttonBottomColor], // Gradient border colors
        ),
      ),
      padding: EdgeInsets.all(2), // Creates border effect
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color inside TextField
          borderRadius: BorderRadius.circular(15),
        ),
        height: 56,
        width: 56,
        padding: EdgeInsets.all(2),
        child: TextFormField(
          autofocus: widget.autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: widget.controller,
          maxLength: 1,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none, // Remove default border
              ),
              counterText: '',
              hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          validator: _validateInput,
        ),
      ),
    );
  }

  // Validator function for text field
  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be empty"; // Error message
    }
    return null; // If input is valid
  }
}
