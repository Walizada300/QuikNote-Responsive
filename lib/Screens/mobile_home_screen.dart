import 'package:quiknote/Screens/about_page.dart';
import 'package:quiknote/Screens/trash_page.dart';
import 'package:quiknote/components/modul.dart';
import 'package:quiknote/components/note_list.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required TextEditingController searchController,
  })  : _scaffoldKey = scaffoldKey,
        _searchController = searchController;

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final TextEditingController _searchController;

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _selectedIndex = 0;
  String _view = "grid";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: BDrawer(
        selectedIndex: _selectedIndex,
        onNote: () {
          setState(() {
            _selectedIndex = 0;
          });
          Navigator.pop(context);
        },
        onTrash: () {
          setState(() {
            _selectedIndex = 1;
          });
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return TrashPage();
            },
          ));
        },
        onAbout: () {
          setState(() {
            _selectedIndex = 2;
          });
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AboutPage();
            },
          ));
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 140,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        title: AppBarContent(
          scaffoldKey: widget._scaffoldKey,
          searchController: widget._searchController,
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
      ),
      floatingActionButton: BFloatingActionButtom(),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: NoteList(
          view: _view,
        ),
      ),
    );
  }
}

class BFloatingActionButtom extends StatelessWidget {
  const BFloatingActionButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                color: context.backgroundColor,
                border: Border.all(color: context.dividerColor),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              padding: EdgeInsets.only(
                top: 8,
                left: 15,
                right: 15,
                bottom: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  context.miniSpaceBox,
                  BText(
                    text: "New Note",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  context.mediumSpaceBox,
                  AddNoteForm(),
                ],
              ),
            ),
          ),
        );
      },
      backgroundColor: context.primaryColor,
      child: Icon(Icons.add),
    );
  }
}

class AppBarContent extends StatelessWidget {
  const AppBarContent({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required TextEditingController searchController,
    required this.onGridView,
    required this.onListView,
  })  : _scaffoldKey = scaffoldKey,
        _searchController = searchController;

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final TextEditingController _searchController;
  final VoidCallback? onGridView;
  final VoidCallback? onListView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/note_white.svg',
                  width: 34,
                ),
                SizedBox(width: 10),
                BText(
                  text: "QuikNote",
                  fontSize: 22,
                  color: context.backgroundColor,
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: context.backgroundColor,
              ),
            ),
          ],
        ),
        context.mediumSpaceBox,
        HeaderOfApp(
          searchController: _searchController,
          onGridView: onGridView,
          onListView: onListView,
        ),
      ],
    );
  }
}
