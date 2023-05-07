import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Booking Hotel',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SafeArea(child: IntroScreen()));
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const TextStyle1 = TextStyle(
        fontSize: 40,
        height: 2,
        color: Colors.blue,
        fontWeight: FontWeight.bold);
    const TextStyle2 = TextStyle(
        fontSize: 25,
        height: 2,
        color: Colors.red,
        decoration: TextDecoration.underline);
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
        ),
        SizedBox(
          height: 0.5 * size.height,
          width: size.width,
          child: Image.asset(
            'assets/images/Anh_KS.jpg',
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0.4 * size.height,
          child: Container(
            height: 0.3 * size.height,
            width: size.width,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Text(
              style: TextStyle1,
              'Chào mừng đến với Nhóm 14',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 0.3 * size.height,
            width: size.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Helper.nextPage(context, LoginScreen());
                  },
                  icon: const Icon(Icons.login),
                  label: const Text(style: TextStyle2, 'Đăng nhập'),
                ),
                TextButton.icon(
                  onPressed:(){
                    Helper.nextPage(context, RegisterScreen());
                  },
                  icon: const Icon(Icons.app_registration),
                  label: const Text(style: TextStyle2, 'Đăng kí'),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class Helper {
  static void nextPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}

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
  String username = '';
  String password = '';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              validator: (value) {
                username = value!;
                if (username.isEmpty) {
                  return 'Bạn chưa nhập tên đăng nhập';
                }
              },
              decoration: InputDecoration(
                  labelText: 'User name',
                  hintText: 'Nhập tên đăng nhập',
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
                style: TextStyle(fontSize: 18,color: Colors.red),'Bạn chưa có tài khoản?'),
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
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng kí')),
      body: RegisterBody(),
    );
  }
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  String username = '';
  String password = '';
  String repassword='';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              validator: (value) {
                username = value!;
                if (username.isEmpty) {
                  return 'Bạn chưa nhập tên đăng nhập';
                }
              },
              decoration: InputDecoration(
                  labelText: 'User name',
                  hintText: 'Nhập tên đăng nhập',
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
                  repassword = value;
                });
              },
              validator: (value) {
                repassword = value!;
                if (repassword.isEmpty) {
                  return 'Bạn chưa nhập lại mật khẩu';
                }
                if(repassword != password){
                  return 'Mật khẩu nhập lại không khớp';
                }
              },
              decoration: InputDecoration(
                  labelText: 'Retype Password',
                  hintText: 'Nhập lại mật khẩu',
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
              const Text(style: TextStyle(fontSize: 20), 'Đăng kí'),
            ),
          ],
        ),
      ),
    );
  }
}
