import 'package:flutter/material.dart';
import 'package:oua/registerpage.dart';
import 'package:oua/bilgilerpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oua App',
      home: Giris(),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => RegisterPage(),
        '/bilgiler': (BuildContext context) => BilgilerPage(),
      },
    );
  }
}

class Giris extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 60, 60, 60),
            /*
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFDB4437),
                Color(0xFFF4B400),
                Color(0xFF4285F4),
              ],
            ),
            */
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 48.0),
              Image(
                image: AssetImage('assets/images/oua_logo.png'),
                height: 72.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'OUA SOSYAL AĞ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 48.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(Icons.email, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 24.0),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Şifre',
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 48.0),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Handle login
                      },
                      child: Text('Giriş Yap'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 0, 0, 0),
                        padding: EdgeInsets.symmetric(
                          horizontal: 64.0,
                          vertical: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Hesabınız yok mu? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          child: Text(
                            'Kaydol',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xEDFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
