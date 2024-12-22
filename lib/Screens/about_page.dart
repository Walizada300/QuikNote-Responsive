import 'package:quiknote/components/contact.dart';
import 'package:quiknote/components/modul.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isDesktop
          ? null
          : AppBar(
              title: BText(
                text: "About",
                color: context.backgroundColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              iconTheme: IconThemeData(color: context.backgroundColor),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return GetInTouch();
                        },
                      );
                    },
                    child: BText(
                      text: "contact",
                      color: context.backgroundColor,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (context.isDesktop)
                BText(
                  text: "Trash",
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.isDesktop ? 200 : 0,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/quiknote_logo.svg',
                          width: context.isDesktop ? 100 : 70,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BText(
                              text: "QuikNote",
                              fontSize: context.isDesktop ? 40 : 30,
                              fontWeight: FontWeight.w600,
                            ),
                            BText(
                              text: "Version: 1.0.0",
                              fontSize: context.isDesktop ? 22 : 16,
                              fontWeight: FontWeight.w500,
                              color: context.disableColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    context.largeSpaceBox,
                    BTextSimple(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book...",
                      fontSize: context.isDesktop ? 22 : 16,
                      fontWeight: FontWeight.w500,
                    ),
                    context.mediumSpaceBox,
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: context.primaryColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/qoot.svg",
                            width: 50,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: BTextSimple(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                              fontSize: context.isDesktop ? 22 : 16,
                              color: context.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    context.largeSpaceBox,
                    Column(
                      children: [
                        BText(
                          text: "Powered By",
                          fontSize: 22,
                          color: context.primaryColor,
                        ),
                        SvgPicture.asset(
                          "assets/svg/walizada.svg",
                          color: context.primaryColor,
                        ),
                        BText(
                          text: "Abdul Baes Walizadah",
                          fontSize: 22,
                          color: context.primaryColor,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
