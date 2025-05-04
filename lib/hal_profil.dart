import 'package:flutter/material.dart';

class HalProfil extends StatelessWidget {
  const HalProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Judul Profil
              Text(
                'PROFIL FEBRYOFTAVIONA',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 20),
              // Foto
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/1662737778968.jpg'),
              ),
              SizedBox(height: 20),
              // Nama
              Text(
                'Febryoftaviona Bulan Pratika',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DMSerifDisplay',
                ),
                textAlign: TextAlign.center,
              ),
              // NIM
              Card(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.badge),
                  title: Text('NIM: 220102035'),
                ),
              ),
              // Status Mahasiswa
              Card(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Mahasiswa'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
