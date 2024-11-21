import 'package:quiknote/components/modul.dart';
import 'package:quiknote/components/note_list.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required TextEditingController searchController,
  })  : _scaffoldKey = scaffoldKey,
        _searchController = searchController;

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: BDrawer(),
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
          scaffoldKey: _scaffoldKey,
          searchController: _searchController,
        ),
      ),
      floatingActionButton: BFloatingActionButtom(),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: NoteList(),
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
          builder: (context) => Container(
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
  })  : _scaffoldKey = scaffoldKey,
        _searchController = searchController;

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final TextEditingController _searchController;

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
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          ],
        ),
        context.mediumSpaceBox,
        HeaderOfApp(searchController: _searchController),
      ],
    );
  }
}
