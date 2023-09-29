import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class APIServices extends GetxController {
//! User Services
  //Get the logged in user email
  Future<String> showLoggedinUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");
    return email!;
  }

  //Show all users in the database
  Future showAllUsers() async {
    Uri url =
        Uri.parse("https://king-prawn-app-zrp6n.ondigitalocean.app/api/users");

    var response = await http.get(url);
    return response.body;
  }

  //Show a single user in the database
  Future showAnUser({String? email}) async {
    Uri url = Uri.parse(
        "https://king-prawn-app-zrp6n.ondigitalocean.app/api/user/$email");

    var response = await http.get(url);
    return response.body;
  }

  //Update a particular user
  Future updateAnUser({String? name, String? bio}) async {
    Uri url = Uri.parse(
        "https://king-prawn-app-zrp6n.ondigitalocean.app/api/user/profile/update");

    String email = await showLoggedinUserEmail();
    name ??= '';
    bio ??= '';

    var response = await http.post(url, body: {
      "email": email,
      "name": name,
      "bio": bio,
    });
     
    return response;
  }
}
