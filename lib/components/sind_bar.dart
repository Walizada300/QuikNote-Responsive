import 'modul.dart';

class BDrawer extends StatelessWidget {
  const BDrawer({
    super.key,
  });

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
                  index: 0,
                  iconName: "add",
                  title: "Notes",
                  onTap: () {},
                ),
                drawerListTile(
                  index: 1,
                  iconName: "trash",
                  title: "Trash",
                  onTap: () {},
                ),
                drawerListTile(
                  index: 2,
                  iconName: "about",
                  title: "About",
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetStartScreen(),
                        ));
                  },
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

class drawerListTile extends StatefulWidget {
  const drawerListTile({
    super.key,
    required this.title,
    required this.iconName,
    required this.onTap,
    required this.index,
  });
  final String? title;
  final String? iconName;
  final Function() onTap;
  final int index;

  @override
  State<drawerListTile> createState() => _drawerListTileState();
}

class _drawerListTileState extends State<drawerListTile> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      onTap: () {
        widget.onTap();
      },
      horizontalTitleGap: 0,
      leading: SvgPicture.asset(
        "assets/svg/${widget.iconName}.svg",
        color: context.backgroundColor,
      ),
      title: BText(
        text: widget.title,
        fontSize: 18,
        textAlign: TextAlign.start,
        color: context.backgroundColor,
      ),
    );
  }
}
