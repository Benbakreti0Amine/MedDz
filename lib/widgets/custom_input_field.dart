import 'package:flutter/material.dart';
import 'package:happy_tech_mastering_api_with_flutter/static/colors.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const CustomInputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon = false,
    this.obscureText = false,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              widget.labelText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          TextFormField(
            obscureText: widget.obscureText ? _obscureText : false,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.secondary.withOpacity(0.5),
            
              border: OutlineInputBorder(
                borderSide: BorderSide.none,                 borderRadius:
                    BorderRadius.circular(20),               ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,                 borderRadius:
                    BorderRadius.circular(20),               ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.blue, width: 0.2),                 borderRadius:
                    BorderRadius.circular(20),               ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.red,
                    width: 0.1),                 borderRadius:
                    BorderRadius.circular(20),               ),
              
              errorStyle: const TextStyle(color: Colors.red), 
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon
                  ? Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_outlined,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                  )
                  : null,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (widget.validator != null) {
                return widget.validator!(value);
              }
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
