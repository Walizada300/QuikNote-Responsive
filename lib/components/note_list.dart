import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiknote/Screens/note_screen.dart';
import 'package:quiknote/Screens/trash_page.dart';
import 'package:quiknote/bloc/note_cubit/note_cubit.dart';
import 'package:quiknote/bloc/note_cubit/note_cubit_state.dart';
import 'package:quiknote/components/modul.dart';
import 'package:quiknote/sqliteDB/quiknote_services.dart';

class NoteList extends StatefulWidget {
  const NoteList({
    super.key,
    required this.view,
  });
  final String? view;

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final NoteCubit _noteCubit = NoteCubit(QuiknoteServices());
  @override
  void initState() {
    _noteCubit.fetAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      bloc: _noteCubit,
      builder: (context, state) {
        if (state is NoteLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NoteLoaded) {
          if (state.noteList.isEmpty) {
            return Center(
              child: Icon(Icons.note_alt_rounded),
            );
          } else {
            return MasonryGridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.isDesktop
                      ? widget.view == "grid"
                          ? 4
                          : 1
                      : widget.view == "list"
                          ? 1
                          : 2,
                ),
                itemCount: state.noteList.length,
                itemBuilder: (context, index) {
                  final notes = state.noteList[index];
                  return NoteItemList(
                    title: notes['title'].toString(),
                    content: notes['content'].toString(),
                    created: notes['created'].toString(),
                    color: notes['color'].toString(),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return NoteScreen(
                              title: notes['title'],
                              content: notes['content'],
                              color: notes['color'],
                              create: notes['created'],
                              id: notes['id'],
                            );
                          },
                        ),
                      );
                    },
                  );
                });
          }
        } else if (state is NoteError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Center(
            child: Text("No notes exist."),
          );
        }
      },
    );
  }
}

class NoteItemList extends StatelessWidget {
  const NoteItemList({
    super.key,
    required this.title,
    required this.content,
    required this.created,
    required this.color,
    required this.onPress,
  });

  final String? title;
  final String? content;
  final String? created;
  final String? color;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(int.parse(color!)).withAlpha(60),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BTextSimple(
              text: title,
              textAlign: TextAlign.start,
              fontSize: context.isDesktop ? 22 : 16,
              fontWeight: FontWeight.bold,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            BTextSimple(
              text: content,
              textAlign: TextAlign.start,
              fontSize: context.isDesktop ? 18 : 14,
              maxLines: 12,
              overflow: TextOverflow.ellipsis,
            ),
            Divider(color: context.disableColor.withAlpha(80)),
            BTextSimple(
              text: created,
              textAlign: TextAlign.start,
              fontSize: context.isDesktop ? 16 : 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
