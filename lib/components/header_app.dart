import '../components/modul.dart';

class HeaderOfApp extends StatelessWidget {
  const HeaderOfApp({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

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
        ViewButton(),
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
        borderRadius: BorderRadius.circular(10),
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

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BTextInput(
          hint: "Title",
          label: "Title",
          maxline: 1,
        ),
        context.mediumSpaceBox,
        BTextInput(
          hint: "Content",
          label: "Context",
          maxline: 10,
        ),
        context.mediumSpaceBox,
        BFillIconButton(
          label: "Add Note",
          icon: Icons.add,
          onPress: () {},
        ),
      ],
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
  });
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final int? maxline;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.top,
      maxLines: maxline,
      controller: controller,
      decoration: InputDecoration(
        hintText: Locales.string(context, hint!),
        hintStyle: const TextStyle(fontSize: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: context.dividerColor),
        ),
        label: BText(text: label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      style: const TextStyle(fontSize: 18),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            BText(
              text: label,
              fontSize: 18,
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
  });

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
        const PopupMenuItem(
          child: ListTile(
            horizontalTitleGap: 0,
            leading: Icon(Icons.list),
            title: BText(
              text: "List View",
              textAlign: TextAlign.start,
            ),
          ),
        ),
        const PopupMenuItem(
          child: ListTile(
            horizontalTitleGap: 0,
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
