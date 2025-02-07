import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DisplayUsersPannelPage extends StatefulWidget {
  const DisplayUsersPannelPage({super.key});

  @override
  State<DisplayUsersPannelPage> createState() => _DisplayUsersPannelPageState();
}

class _DisplayUsersPannelPageState extends State<DisplayUsersPannelPage> {
  Map usersList = {};
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  setUsersList(data) {
    setState(() {
      usersList = data;
    });
  }

  Future<void> getUserData() async {
    try {
      const url = "https://dummyjson.com/users";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setUsersList(convert.jsonDecode(response.body));
        print(usersList);
      } else {
        print("Request failed :${response.statusCode}");
      }
    } catch (error) {
      print("An error has occured : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Wrap(
        spacing: 20,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for (var item in usersList["users"])
            Container(
              height: screenSize.height * 0.2,
              width: screenSize.width * 0.2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 2),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(item["image"]),
                  ),
                  Text(
                    item["firstName"],
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
