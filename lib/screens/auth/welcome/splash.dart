import 'package:aikata_v2/constants/consts.dart';
import 'package:aikata_v2/screens/auth/signin/sign_in.dart';
import 'package:aikata_v2/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const SignIn());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: turuncu,
      body: Column(
        children: [
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Image(
                image: AssetImage(
                  icAppLogo,
                ),
                // height: 250,
                // width: 250,
              ),
            ),
          ),
          const Spacer(),
          const Center(
            child: SpinKitCircle(
              color: Colors.white,
              size: 80,
            ),
          ),
          80.heightBox
        ],
      ),
    );
  }
}
