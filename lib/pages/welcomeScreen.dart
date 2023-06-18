import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: camel_case_types
class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

// ignore: camel_case_types
class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 100,
              ),
              Lottie.asset('assets/images/delivery-boy.json',
                  height: 300, width: 600),
              const Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  'Enjoy the app :)',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                      // height: 1.5,
                      fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 80,
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 3.3,
                            vertical: 20)),
                    onPressed: () {},
                    child: const Text(
                      'Start Using Marifood!',
                      style: TextStyle(fontSize: 17),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
