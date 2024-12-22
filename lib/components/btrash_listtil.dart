import 'package:quiknote/components/modul.dart';

class TrashListTile extends StatelessWidget {
  const TrashListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.created,
    required this.color,
    required this.onUpdate,
    required this.onDelete,
    required this.onPress,
  });

  final String? title;
  final String? subtitle;
  final String? created;
  final String? color;
  final VoidCallback? onUpdate;
  final VoidCallback? onDelete;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title: BTextSimple(
        text: title,
        fontSize: 26,
        fontWeight: FontWeight.w500,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(int.parse(color!)).withAlpha(60),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      subtitle: BTextSimple(
        text: subtitle,
        fontSize: 16,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onUpdate,
            icon: Icon(
              Icons.refresh,
              color: context.primaryColor,
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete,
              color: context.negativeColor,
            ),
          ),
        ],
      ),
    );
  }
}

class BOulineButton extends StatelessWidget {
  const BOulineButton({
    Key? key,
    required this.label,
    required this.onPress,
  }) : super(key: key);
  final String? label;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.textColor.withAlpha(60)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: BText(
        text: label,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
