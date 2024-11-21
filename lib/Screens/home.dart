import 'package:quiknote/Screens/desktop_home_screen.dart';
import 'package:quiknote/Screens/mobile_home_screen.dart';

import '../components/modul.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return context.isDesktop
        ? DesktopScreen(
            scaffoldKey: _scaffoldKey,
            searchController: _searchController,
          )
        : MobileScreen(
            scaffoldKey: _scaffoldKey,
            searchController: _searchController,
          );
  }
}
