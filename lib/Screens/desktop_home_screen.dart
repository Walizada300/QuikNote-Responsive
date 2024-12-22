import 'package:quiknote/Screens/about_page.dart';
import 'package:quiknote/Screens/trash_page.dart';
import 'package:quiknote/components/modul.dart';
import 'package:quiknote/components/note_list.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required TextEditingController searchController,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    NotePage(),
    TrashPage(),
    AboutPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      body: SafeArea(
        child: Row(
          children: [
            if (context.isDesktop)
              Expanded(
                child: BDrawer(
                  selectedIndex: _selectedIndex,
                  onNote: () {
                    setState(
                      () {
                        _selectedIndex = 0;
                      },
                    );
                  },
                  onTrash: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  onAbout: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
              ),
            Expanded(
              flex: 5,
              child: pages[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}

class NotePage extends StatefulWidget {
  const NotePage({
    super.key,
  });

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  String _view = "grid";
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            HeaderOfApp(
              searchController: searchController,
              onGridView: () {
                setState(() {
                  _view = "grid";
                });
              },
              onListView: () {
                setState(() {
                  _view = "list";
                });
              },
            ),
            context.mediumSpaceBox,
            Expanded(
              child: NoteList(
                view: _view,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
