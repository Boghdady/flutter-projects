import 'package:flutter/material.dart';

class SharedTextField extends StatefulWidget {
  // @required
  final Stream stream;
  final String hintText;
  final Function(String) onChanged;
  final IconData suffixIcon;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType textInputType;
  const SharedTextField({
    this.stream,
    this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.controller,
    this.textInputType,
  });

  @override
  _SharedTextFieldState createState() => _SharedTextFieldState();
}

class _SharedTextFieldState extends State<SharedTextField> {
  IconData passIcon;
  bool passwordObscure;

  @override
  void initState() {
    super.initState();
    passIcon = widget.prefixIcon;
    passwordObscure = widget.obscureText;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: widget.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            controller: widget.controller,
            //  enableInteractiveSelection: false,
            onChanged: widget.onChanged,
            obscureText: passwordObscure,
            keyboardType: widget.textInputType,
//              textDirection: TextDirection.ltr,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
//              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey.shade200,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.body2,
              errorText: snapshot.error,
              suffixIcon: Icon(
                widget.suffixIcon,
                color: Colors.grey[600],
              ),
              prefixIcon: InkWell(
                onTap: () {
                  setState(() {
                    if (passIcon == Icons.lock) {
                      passIcon = Icons.lock_open;
                      passwordObscure = false;
                    } else {
                      passIcon = Icons.lock;
                      passwordObscure = true;
                    }
                  });
                },
                child: Icon(
                  passIcon,
                  color: Colors.grey,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          );
        });
  }
}
