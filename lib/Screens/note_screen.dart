// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiknote/bloc/note_cubit/note_cubit.dart';
import 'package:quiknote/components/abx_text.dart';
import 'package:quiknote/components/header_app.dart';
import 'package:quiknote/components/theme/theme.dart';
import 'package:quiknote/sqliteDB/quiknote_services.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({
    Key? key,
    this.title,
    this.content,
    this.create,
    this.color,
    this.id,
  }) : super(key: key);
  final String? title;
  final String? content;
  final String? create;
  final String? color;
  final int? id;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  final QuiknoteServices _repository = QuiknoteServices();
  NoteCubit _noteCubit = NoteCubit(QuiknoteServices());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      appBar: AppBar(
        title: BTextSimple(
          text: widget.title ?? "Title",
          color: Theme.of(context).colorScheme.background,
        ),
        backgroundColor: Color(
          int.parse(
            widget.color ?? Theme.of(context).colorScheme.primary.toString(),
          ),
        ),
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.background),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.done)),
                PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(
                              Icons.share,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            SizedBox(width: 10),
                            BText(
                              text: "Share",
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () async {
                          try {
                            await _repository.deleteData(
                                'notes', widget.id ?? 0);
                          } catch (e) {
                            print("Error: $e");
                          }
                          _noteCubit.fetAllNotes();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: BText(text: "Moved to trash."),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: customColors!.positive,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 400, vertical: 20),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            SizedBox(width: 10),
                            BText(
                              text: "Delete",
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BTextInput(
          controller: _controller,
          label: "Content",
          hint: "Content",
        ),
        // TextField(
        //   controller: TextEditingController(text: _controller.text),
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(borderSide: BorderSide.none),
        //   ),
        //   maxLines: 100,
        // ),
        // BTextSimple(
        //   text: widget.content ?? "content",
        //   fontSize: 22,
        // ),
      ),
    );
  }
}
