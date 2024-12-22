import '../components/modul.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/quiknote_logo.svg'),
              context.mediumSpaceBox,
              BText(
                text: "Welcome to QuikNote",
                fontSize: context.isDesktop ? 34 : 26,
                fontWeight: FontWeight.bold,
              ),
              context.mediumSpaceBox,
              Image.asset('assets/svg/getstarted_shape.png'),
              context.largeSpaceBox,
              BButton(
                bgColor: context.primaryColor,
                label: "Get Started",
                width: 200,
                labelColor: context.backgroundColor,
                onPress: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
