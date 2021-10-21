import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/authentication/login_api.dart';
import 'package:flutter_news_app/screens/home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _autoValidate = false;
  String _email;
  String _password;
  bool _isLoading = false;

  LoginApi loginApi = LoginApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          (_isLoading) ? _drawLoading() : _loginForm(),
        ]),
      ),
    );
  }

  // 1- create login form (UI)
  Widget _loginForm() {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
              hintText: 'Please enter your email',
              labelText: 'Email *',
            ),
            onSaved: (String value) {
              _email = value;
            },
            validator: validateEmail,
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.security),
              hintText: 'Please enter your password',
              labelText: 'Password *',
            ),
            onSaved: (String value) {
              _password = value;
            },
            validator: (String value) {
              return value.length < 3 ? 'must be more than 2 charater.' : null;
            },
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: new RaisedButton(
              color: Colors.red,
              onPressed: _validateInputs,
              child: new Text(
                'Validate',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*
     2- check input data , if valid -> save data into variables
      if not valid -> start auto validator
   */
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      // if all data are correct then save data to our variables
      _formKey.currentState.save();
      // do operations in pass and email
      callApi();
    } else {
      // all data are not valid then start auto validation
      setState(() {
        _autoValidate = true;
      });
    }
  }

  // 3- call login api // lang.jerry@example.net
  void callApi() async {
    setState(() {
      _isLoading = true;
    });

    var response = await loginApi.login(_email, _password);
    if (response) {
      setState(() {
        _isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    } else if (response == false) {
      setState(() {
        _isLoading = false;
        // show error that coming from backend
        _showSnackBar("invalid email or password");
      });
    }
  }

  // 4- validate email using regular expression
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  // 5- loading spinner
  Widget _drawLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  // 6- show snake bar with error
  void _showSnackBar(String errorMessage) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 6),
      content: Text(
        errorMessage,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.white,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    ));
  }
}
