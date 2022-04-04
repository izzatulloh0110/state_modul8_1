import 'package:flutter/material.dart';
import 'package:state_modul8_1/models/user_model.dart';

import '../services/http_service.dart';
class HomePage extends StatefulWidget {
  static const String id ="home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

UserIzzatullohsGit? _userIzzatullohsGit;
bool isLoading = false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getApi();
  }
void _getApi()async{
  setState(() {
    isLoading = true;
  });
  HttpService.GET(HttpService.API_USER, HttpService.paramEmpty()).then((response) {
  if(response!=null){
    print(response);
    _parseResponse(response);
  }});

}

void _parseResponse(String response){
  setState(() {
    _userIzzatullohsGit = HttpService.parseUserOne(response);
    isLoading=false;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          isLoading?
              Center(child: CircularProgressIndicator.adaptive(),)
          :
          Container(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text(_userIzzatullohsGit!.followersUrl),
                Text(_userIzzatullohsGit!.followingUrl),
                ClipRRect(borderRadius: BorderRadius.circular(10),
                    child: Image.network(_userIzzatullohsGit!.avatarUrl)),
              ],
            ),
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
