import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quiknote/components/modul.dart';
import 'package:quiknote/components/note_list.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({
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
      drawer: const BDrawer(),
      body: SafeArea(
        child: Row(
          children: [
            if (context.isDesktop)
              const Expanded(
                child: BDrawer(),
              ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    HeaderOfApp(searchController: _searchController),
                    context.mediumSpaceBox,
                    Expanded(
                      child: NoteList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
