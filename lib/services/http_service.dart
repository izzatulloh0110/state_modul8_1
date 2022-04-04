  import 'dart:convert';
  import 'package:http/http.dart';
import 'package:state_modul8_1/models/user_model.dart';

  class HttpService {
    // Base url
    static String BASE_URL = "api.github.com";

    // Header
    static Map<String, String> headers = {
    };

    // Apis
    static String API_USER = "/users/izzatulloh0110";
    static String API_USER_ONE = "/users/"; // {ID}
    static String API_CREATE_USER = "/users";
    static String API_UPDATE_USER = "/users/"; //  {ID}
    static String API_EDIT_USER = "/users/"; //  {ID}
    static String API_DELETE_USER = "/users/"; //  {ID}

    // Methods
    static Future<String?> GET(String api, Map<String, String> params) async {
      var uri = Uri.https(BASE_URL, api, params);
      Response response = await get(uri, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    }

    static Future<String?> POST(String api, Map<String, String> params) async {
      var uri = Uri.https(BASE_URL, api);
      Response response = await post(
          uri, headers: headers, body: jsonEncode(params));
      if (response.statusCode == 201) {
        return response.body;
      }
      return null;
    }

    static Future<String?> PUT(String api, Map<String, String> params) async {
      var uri = Uri.https(BASE_URL, api);
      Response response = await put(
          uri, headers: headers, body: jsonEncode(params));
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    }

    static Future<String?> PATCH(String api, Map<String, String> params) async {
      var uri = Uri.https(BASE_URL, api);
      Response response = await patch(
          uri, headers: headers, body: jsonEncode(params));
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    }

    static Future<String?> DELETE(String api,
        Map<String, String> params) async {
      var uri = Uri.https(BASE_URL, api, params);
      Response response = await delete(uri, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    }

    // Params
    static Map<String, String> paramEmpty() {
      Map<String, String> map = {};
      return map;
    }

  // static Map<String, String> paramsCreate(Todo todo) {
  //   Map<String, String> map = {
  //     'userId': todo.userId.toString(),
  //     'title': todo.title,
  //     'completed' : todo.completed.toString(),
  //   };
  //   return map;
  // }
  //
  // static Map<String, String> paramsUpdate(Todo todo) {
  //   Map<String, String> map = {
  //     'userId': todo.userId.toString(),
  //     'id': todo.id.toString(),
  //     'title': todo.title,
  //     'completed' : todo.completed.toString(),
  //   };
  //   return map;
  // }
  //
  // static Map<String, String> paramsEdit(String key, String value) {
  //   Map<String, String> map = {
  //     key: value,
  //   };
  //   return map;
  // }

 // Parsing
 //  static UserIzzatullohsGit parseUserList(String body) {
 //  List json = jsonDecode(body);
 //  UserIzzatullohsGit list = UserIzzatullohsGit.fromJson(json);
 //  return list;
 //  }

  static UserIzzatullohsGit parseUserOne(String body) {
  Map<String, dynamic> json = jsonDecode(body);
  UserIzzatullohsGit user = UserIzzatullohsGit.fromJson(json);
  return user;


  }


  /// {
  ///         "id": 1,
  ///         "name": "Leanne Graham",
  ///         "username": "Bret",
  ///         "email": "Sincere@april.biz",
  ///         "address": {
  ///             "street": "Kulas Light",
  ///             "suite": "Apt. 556",
  ///             "city": "Gwenborough",
  ///             "zipcode": "92998-3874",
  ///             "geo": {
  ///                 "lat": "-37.3159",
  ///                 "lng": "81.1496"
  ///             }
  ///         },
  ///         "phone": "1-770-736-8031 x56442",
  ///         "website": "hildegard.org",
  ///         "company": {
  ///             "name": "Romaguera-Crona",
  ///             "catchPhrase": "Multi-layered client-server neural-net",
  ///             "bs": "harness real-time e-markets"
  ///         }
  ///     }
  }
