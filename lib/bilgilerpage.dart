import 'package:flutter/material.dart';

class BilgilerPage extends StatelessWidget {
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
                'Kişisel Bilgiler',
                style: TextStyle(
                  color: Color.fromARGB(248, 255, 255, 255),
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
                        hintText: 'Slack Kullanıcı Adı',
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(Icons.code, color: Colors.white),
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
                      decoration: InputDecoration(
                        hintText: 'LinkedIn Linki',
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon:
                            Icon(Icons.business_center, color: Colors.white),
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
                      decoration: InputDecoration(
                        hintText: 'GitHub Linki',
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(Icons.data_array, color: Colors.white),
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
                      decoration: InputDecoration(
                        hintText: 'Telefon Numarası',
                        hintStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(Icons.call, color: Colors.white),
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
                        // TODO: Handle registration
                      },
                      child: Text('Hesap Oluştur'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 0, 0, 0),
                        padding: EdgeInsets.symmetric(
                          horizontal: 64.0,
                          vertical: 16.0,
                        ),
                      ),
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
