import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final IconData suffixIcon;
  final Function(String) validator;
  final Function(String) onChanged;

  CustomTextField({
    @required this.label,
    this.hintText,
    this.obscureText,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              label,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            ),
          ),
          TextFormField(
            onChanged: onChanged,
            validator: validator,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black38),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.none,
                  width: 0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}
