import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showAcademic = false;
  int likeCount = 0;

  // just my info here, changed some para wag masyado personal
  String fullName = "Claude Fredrich S. Alvarez";
  String nickname = "Klod";
  String age = "20";
  String birthday = "July 22, 2006";
  String address = "Laguna, Philippines";
  String hobby = "Drawing, chess and mobile games";
  String motto = "Ctrl+Z isn't real life, unfortunately..";
  String course = "BS Information Technology";
  String yearLevel = "3rd Year";
  String section = "3-ITA  ";

  void likeProfile() {
    setState(() {
      likeCount = likeCount + 1;
    });
  }

  void toggleAcademic() {
    setState(() {
      showAcademic = !showAcademic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E0),
      appBar: AppBar(
        title: Text("My Student Profile"),
        backgroundColor: Color(0xFF00695C),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // header part with pic and name, ginawan ko ng gradient hehe
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00695C), Color(0xFF26A69A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFFFFB74D), width: 3),
                      ),
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          "https://i.pravatar.cc/300?img=12",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      fullName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "\"$nickname\"",
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFFFFE0B2),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: likeProfile,
                          icon: Icon(Icons.favorite, color: Color(0xFFFF7043)),
                        ),
                        Text(
                          "$likeCount likes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // personal info card
              Card(
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.person, color: Color(0xFF00695C)),
                            SizedBox(width: 8),
                            Text(
                              "Personal Information",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF00695C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1, color: Color(0xFFFFCC80)),
                      ListTile(
                        leading: Icon(Icons.cake, color: Color(0xFFFF8A65)),
                        title: Text("Age"),
                        subtitle: Text(age),
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_today, color: Color(0xFFFF8A65)),
                        title: Text("Birthday"),
                        subtitle: Text(birthday),
                      ),
                      ListTile(
                        leading: Icon(Icons.home, color: Color(0xFFFF8A65)),
                        title: Text("Address"),
                        subtitle: Text(address),
                      ),
                      ListTile(
                        leading: Icon(Icons.sports_esports, color: Color(0xFFFF8A65)),
                        title: Text("Hobby"),
                        subtitle: Text(hobby),
                      ),
                      ListTile(
                        leading: Icon(Icons.format_quote, color: Color(0xFFFF8A65)),
                        title: Text("Motto"),
                        subtitle: Text(motto),
                      ),
                      ListTile(
                        leading: Icon(Icons.school, color: Color(0xFFFF8A65)),
                        title: Text("Course/Program"),
                        subtitle: Text(course),
                      ),
                      ListTile(
                        leading: Icon(Icons.stairs, color: Color(0xFFFF8A65)),
                        title: Text("Year Level"),
                        subtitle: Text(yearLevel),
                      ),
                      ListTile(
                        leading: Icon(Icons.groups, color: Color(0xFFFF8A65)),
                        title: Text("Section"),
                        subtitle: Text(section),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // button to show/hide academic info, para naman interactive
              ElevatedButton(
                onPressed: toggleAcademic,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF7043),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  showAcademic ? "Hide Academic Info" : "Show Academic Info",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 10),

              // this part lang lalabas pag pinindot yung button sa taas
              if (showAcademic)
                Card(
                  elevation: 3,
                  color: Color(0xFFE0F2F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Academic Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF00695C),
                          ),
                        ),
                        Divider(color: Color(0xFF80CBC4)),
                        Row(
                          children: [
                            Icon(Icons.menu_book, color: Color(0xFF00695C)),
                            SizedBox(width: 8),
                            Text("Favorite Subject: Mobile App Development"),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.code, color: Color(0xFF00695C)),
                            SizedBox(width: 8),
                            Text("Programming Language: Dart / Flutter"),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.build, color: Color(0xFF00695C)),
                            SizedBox(width: 8),
                            Text("Technical Skill: UI/UX Design"),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.flag, color: Color(0xFF00695C)),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Career Goal: Become a Mobile App Developer",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              SizedBox(height: 16),

              // just a lil footer, contact me daw
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Contact Me"),
                        content: Text("Email: ricalvarez74@gmail.com"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "Tap here for contact info",
                  style: TextStyle(color: Color(0xFF00695C)),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}