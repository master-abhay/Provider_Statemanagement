import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class RestApiAuthProvider with ChangeNotifier {

  bool _isLoading = false;
  bool get loading => _isLoading;


  void setLoading(bool loading){
    _isLoading = loading;
    notifyListeners();

  }

  void login(String email, String password) async {

    setLoading(true);
    try {


      Response response = await post(

        Uri.parse('https://reqres.in/api/login'),
        body: {
          "email" : email,
          "password" :password
        },
      );

      if(response.statusCode == 200){
        print("------------->>>>>>>>Login Successful");
        setLoading(false);

      }
      else{
        print("------------->>>>>>>>>>>>Login Unsuccessful");
        setLoading(false);
      }




    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
