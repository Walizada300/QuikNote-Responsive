import 'package:quiknote/bloc/note_cubit/note_cubit.dart';
import 'package:quiknote/sqliteDB/quiknote_services.dart';

import '../components/modul.dart';

class HeaderOfApp extends StatelessWidget {
  const HeaderOfApp({
    super.key,
    required TextEditingController searchController,
    required this.onGridView,
    required this.onListView,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  final VoidCallback? onGridView;
  final VoidCallback? onListView;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (context.isDesktop)
          BFillIconButton(
            icon: Icons.add,
            label: "Add New",
            onPress: () {
              showDialog(
                context: context,
                builder: (context) => NewNoteDialog(),
              );
            },
          ),
        if (context.isDesktop) const SizedBox(width: 10),
        Expanded(
          child: SearchBox(
            controller: _searchController,
            onChange: (value) {
              print(value);
            },
          ),
        ),
        const SizedBox(width: 10),
        ViewButton(
          onGridView: onGridView,
          onListView: onListView,
        ),
      ],
    );
  }
}

class NewNoteDialog extends StatelessWidget {
  const NewNoteDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: context.dividerColor),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BText(text: "Add Note"),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 500,
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final _titleController = TextEditingController();

  final _contentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final FocusScopeNode focusScopeNode = FocusScopeNode();

  final FocusNode titleFocus = FocusNode();
  String colorController = "0xffFEBE66";
  String currentDate = DateTime.now().year.toString() +
      "-" +
      DateTime.now().month.toString() +
      "-" +
      DateTime.now().day.toString();

  NoteCubit _noteCubit = NoteCubit(QuiknoteServices());

  @override
  void initState() {
    super.initState();
  }

  final QuiknoteServices _repository = QuiknoteServices();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: BTextInput(
                  hint: "Title",
                  label: "Title",
                  maxline: 1,
                  focusNode: titleFocus,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Locales.string(context, 'enter_details');
                    }

                    return null;
                  },
                  controller: _titleController,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              PopupMenuButton(
                icon: Icon(
                  Icons.color_lens,
                  color: Color(int.parse(colorController)),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          colorController = "0xffFEBE66";
                        });
                      },
                      child: ColorItem(
                        color: Color(0xffFEBE66),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          colorController = "0xff104e8f";
                        });
                      },
                      child: ColorItem(
                        color: Color(0xff104e8f),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          colorController = "0xff00CDAC";
                        });
                      },
                      child: ColorItem(
                        color: Color(0xff00CDAC),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          colorController = "0xffFF5FA7";
                        });
                      },
                      child: ColorItem(
                        color: Color(0xffFF5FA7),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          colorController = "0xffe26939";
                        });
                      },
                      child: ColorItem(
                        color: Color(0xffe26939),
                      ),
                    ),
                  ];
                },
              )
            ],
          ),
          Divider(),
          BTextInput(
            hint: "Content",
            label: "Content",
            maxline: context.isDesktop ? 12 : 10,
            controller: _contentController,
          ),
          context.mediumSpaceBox,
          BFillIconButton(
            label: "Add Note",
            icon: Icons.add,
            onPress: () async {
              try {
                if (_formKey.currentState!.validate()) {
                  Map<String, dynamic> noteData = {
                    'title': _titleController.text,
                    'content': _contentController.text,
                    'color': colorController,
                    'created': currentDate,
                    'isRemoved': 0,
                  };
                  try {
                    await _noteCubit.insertNoteAndFetch(noteData);
                  } catch (e) {
                    print("Error: $e");
                  }
                  Navigator.pop(context);
                  context.isDesktop
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: BText(text: "Successfull Saved."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: context.positiveColor,
                            margin: EdgeInsets.symmetric(
                                horizontal: 400, vertical: 20),
                          ),
                        )
                      : print("Mobile");
                }
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 40,
      decoration: BoxDecoration(
        color: color!.withAlpha(50),
        border: Border.all(color: color!, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

class BTextInput extends StatelessWidget {
  const BTextInput({
    super.key,
    this.controller,
    required this.label,
    required this.hint,
    this.maxline,
    this.textStyle,
    this.lenghtChar,
    this.onChange,
    this.onTap,
    this.focusNode,
    this.keyboardType,
    this.validator,
  });
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final int? maxline;
  final TextStyle? textStyle;
  final int? lenghtChar;
  final ValueChanged<String>? onChange;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      maxLines: maxline,
      controller: controller,
      validator: validator,
      onChanged: onChange,
      onTap: onTap,
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: Locales.string(context, hint!),
        hintStyle: TextStyle(
            fontSize: 18,
            color: context.disableColor,
            fontWeight: FontWeight.w500),
        border: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      ),
      style: textStyle ?? const TextStyle(fontSize: 16),
    );
  }
}

class BFillIconButton extends StatelessWidget {
  const BFillIconButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPress,
  });
  final String? label;
  final IconData? icon;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: context.backgroundColor,
            ),
            const SizedBox(width: 10),
            BText(
              text: label,
              fontSize: 18,
              color: context.backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ViewButton extends StatelessWidget {
  const ViewButton({
    super.key,
    required this.onGridView,
    required this.onListView,
  });

  final VoidCallback? onGridView;
  final VoidCallback? onListView;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: const BPopupButton(
        icon: Icons.grid_view,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: context.dividerColor)),
      color: context.backgroundColor,
      tooltip: Locales.string(context, "View"),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: onListView,
          child: ListTile(
            horizontalTitleGap: 10,
            leading: Icon(Icons.list),
            title: BText(
              text: "List View",
              textAlign: TextAlign.start,
            ),
          ),
        ),
        PopupMenuItem(
          onTap: onGridView,
          child: ListTile(
            horizontalTitleGap: 10,
            leading: Icon(Icons.grid_view),
            title: BText(
              text: "Grid View",
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}

class BPopupButton extends StatelessWidget {
  const BPopupButton({
    super.key,
    required this.icon,
  });
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: context.dividerColor, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      height: 47,
      child: Icon(
        icon,
        color: !context.isDesktop
            ? context.backgroundColor
            : context.secondaryColor,
      ),
    );
  }
}

class SearchBox extends StatefulWidget {
  const SearchBox({
    super.key,
    this.controller,
    this.onChange,
  });
  final TextEditingController? controller;
  final ValueChanged? onChange;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    // Initialize the focus node
    _focusNode = FocusNode();

    // Listen to focus changes
    _focusNode.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    // Listen to text changes if a controller is provided
    widget.controller?.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // Dispose the focus node
    _focusNode.dispose();

    // Remove listener from the controller
    widget.controller?.removeListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    // Do not dispose the controller if it is provided by the parent
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChange,
      onSubmitted: widget.onChange,
      focusNode: _focusNode,
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        hintText: Locales.string(context, 'Search QuikNote'),
        hintStyle: const TextStyle(fontSize: 18),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: (_focusNode.hasFocus &&
                (widget.controller?.text.isNotEmpty ?? false))
            ? InkWell(
                onTap: () {
                  widget.controller?.clear();
                },
                child: Icon(
                  Icons.close,
                  color: context.disableColor,
                ),
              )
            : null,
        enabledBorder: context.isDesktop
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: context.dividerColor),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: context.isDesktop
              ? BorderSide(color: Theme.of(context).colorScheme.primary)
              : BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      style: const TextStyle(fontSize: 18),
    );
  }
}
