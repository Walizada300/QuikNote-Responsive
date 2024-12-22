import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiknote/components/abx_text.dart';
import 'package:quiknote/components/bsheet.dart';
import 'package:quiknote/components/button.dart';
import 'package:url_launcher/link.dart';

class GetInTouch extends StatelessWidget {
  const GetInTouch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BSheetForm(
      title: "Get In Touch",
      content: Column(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/svg/walizada_logo.png"),
            radius: 80,
          ),
          const SizedBox(height: 10),
          BText(
            text: "abdul_baes_walizada",
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.primary,
          ),
          BText(
            text: "software_developer",
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Link(
                uri: Uri.parse('https://facebook.com/AbdulBaesWalizada'),
                target: LinkTarget.self,
                builder: (context, followLink) => InkWell(
                  onTap: followLink,
                  child: SvgPicture.asset(
                    'assets/svg/facebook.svg',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Link(
                uri: Uri.parse('https://www.instagram.com/baes_walizada/'),
                target: LinkTarget.self,
                builder: (context, followLink) => InkWell(
                  onTap: followLink,
                  child: SvgPicture.asset(
                    'assets/svg/instagram.svg',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Link(
                uri: Uri.parse('https://www.youtube.com/@baes_walizada'),
                target: LinkTarget.self,
                builder: (context, followLink) => InkWell(
                  onTap: followLink,
                  child: SvgPicture.asset(
                    'assets/svg/youtube.svg',
                  ),
                ),
              ),
            ],
          ),
          Text(
            "@baes_walizada",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'poppin',
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 20),
          Link(
            uri: Uri.parse('https://walizada.vercel.app/'),
            target: LinkTarget.self,
            builder: (context, followLink) => BButtonIcon(
              icon: SvgPicture.asset(
                'assets/svg/web.svg',
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              label: "open_website",
              onPress: followLink,
            ),
          ),
        ],
      ),
    );
  }
}
