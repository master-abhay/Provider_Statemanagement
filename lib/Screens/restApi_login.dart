import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Providers/restApi_AuthProvider.dart';

class RestApiLogin extends StatefulWidget {
  const RestApiLogin({super.key});

  @override
  State<RestApiLogin> createState() => _RestApiLoginState();
}

class _RestApiLoginState extends State<RestApiLogin> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RestApiAuthProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _userNameController,
              decoration: const InputDecoration(
                  // errorText: "Please fill the field",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(5),
                  hintText: "username"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                // errorText: "Please fill the field",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(5),
                  hintText: "password"),
            ),
            MaterialButton(
              splashColor:Colors.yellowAccent.withOpacity(0.5),
              onPressed: () {
                provider.login(_userNameController.text.toString(),
                    _passwordController.text.toString());
              },
              color: Colors.green,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              child: provider.loading
                  ?  const CircularProgressIndicator(
                strokeCap: StrokeCap.square,
                      color: Colors.white,
                strokeWidth: 2,

                    )
                  : const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
