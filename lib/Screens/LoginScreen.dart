import 'package:flutter/material.dart';
import '../Helper.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập')),
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String email = '';
  String password = '';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/Anh_KS.jpg',
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),

              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                validator: (value) {
                  email = value!;
                  if (email.isEmpty) {
                    return 'Bạn chưa nhập Email';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Nhập email',
                    prefixIcon: Image.asset(
                      'assets/images/email.png',
                      width: 30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (value) {
                  password = value!;
                  if (password.isEmpty) {
                    return 'Bạn chưa nhập mật khẩu';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Nhập mật khẩu',
                    prefixIcon: Image.asset(
                      'assets/images/password-icon-1.png',
                      width: 30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                  }
                },
                child:
                const Text(style: TextStyle(fontSize: 20), 'Đăng nhập'),
              ),
              const SizedBox(height: 30,),
              const Text(
                  style: TextStyle(fontSize: 18, color: Colors.red),
                  'Bạn chưa có tài khoản?'),
              ElevatedButton(
                onPressed: () {
                  Helper.nextPage(context, RegisterScreen());
                },
                child:
                const Text(style: TextStyle(fontSize: 20), 'Đăng kí ngay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}