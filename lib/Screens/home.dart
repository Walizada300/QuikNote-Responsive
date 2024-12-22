import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiknote/Screens/desktop_home_screen.dart';
import 'package:quiknote/Screens/mobile_home_screen.dart';
import 'package:quiknote/bloc/note_cubit/note_cubit.dart';
import 'package:quiknote/sqliteDB/quiknote_services.dart';

import '../components/modul.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteCubit(QuiknoteServices()),
        ),
      ],
      child: context.isDesktop
          ? DesktopScreen(
              scaffoldKey: _scaffoldKey,
              searchController: searchController,
            )
          : MobileScreen(
              scaffoldKey: _scaffoldKey,
              searchController: searchController,
            ),
    );
  }
}
