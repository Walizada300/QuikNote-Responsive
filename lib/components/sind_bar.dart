// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:provider/provider.dart';

import 'modul.dart';

class BDrawer extends StatelessWidget {
  const BDrawer({
    required this.onNote,
    required this.onTrash,
    required this.onAbout,
    required this.selectedIndex,
  });

  final VoidCallback? onNote;
  final VoidCallback? onTrash;
  final VoidCallback? onAbout;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.primaryColor,
      child: Padding(
        padding: EdgeInsets.all(context.spaceMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: SvgPicture.asset("assets/svg/note_white.svg"),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.dividerColor),
                    ),
                  ),
                ),
                context.mediumSpaceBox,
                drawerListTile(
                  iconName: "add",
                  title: "Notes",
                  onTap: onNote!,
                  tileColor: selectedIndex == 0
                      ? context.textColor.withAlpha(30)
                      : null,
                ),
                drawerListTile(
                  iconName: "trash",
                  title: "Trash",
                  onTap: onTrash!,
                  tileColor: selectedIndex == 1
                      ? context.textColor.withAlpha(30)
                      : null,
                ),
                drawerListTile(
                  iconName: "about",
                  title: "About",
                  tileColor: selectedIndex == 2
                      ? context.textColor.withAlpha(30)
                      : null,
                  onTap: onAbout!,
                ),
              ],
            ),
            Column(
              children: [
                PopupMenuButton(
                  color: Theme.of(context).colorScheme.background,
                  tooltip: Locales.string(context, "theme"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/theme.svg',
                          color: context.backgroundColor,
                        ),
                        SizedBox(width: 10),
                        BText(
                          text: "Theme",
                          fontSize: 18,
                          color: context.backgroundColor,
                        ),
                      ],
                    ),
                  ),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      onTap: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .setTheme(ThemeMode.system);
                      },
                      child: const BText(
                        text: "system",
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .setTheme(ThemeMode.light);
                      },
                      child: const BText(
                        text: "light",
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .setTheme(ThemeMode.dark);
                      },
                      child: const BText(
                        text: "dark",
                      ),
                    ),
                  ],
                ),
                PopupMenuButton(
                  color: Theme.of(context).colorScheme.background,
                  tooltip: Locales.string(context, "Language"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/language.svg',
                          color: context.backgroundColor,
                        ),
                        SizedBox(width: 10),
                        BText(
                          text: "Language",
                          fontSize: 18,
                          color: context.backgroundColor,
                        ),
                      ],
                    ),
                  ),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      onTap: () {
                        LocaleNotifier.of(context)!.change('en');
                      },
                      child: const BText(
                        text: "english",
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        LocaleNotifier.of(context)!.change('fa');
                      },
                      child: const BText(
                        text: "dari",
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        LocaleNotifier.of(context)!.change('ps');
                      },
                      child: const BText(
                        text: "pashto",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class drawerListTile extends StatelessWidget {
  const drawerListTile({
    super.key,
    required this.title,
    required this.iconName,
    required this.onTap,
    required this.tileColor,
  });
  final String? title;
  final String? iconName;
  final VoidCallback onTap;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      onTap: onTap,
      tileColor: tileColor,
      horizontalTitleGap: 10,
      leading: SvgPicture.asset(
        "assets/svg/$iconName.svg",
        color: context.backgroundColor,
      ),
      title: BText(
        text: title,
        fontSize: 18,
        textAlign: TextAlign.start,
        color: context.backgroundColor,
      ),
    );
  }
}
