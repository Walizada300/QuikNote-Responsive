import 'package:quiknote/components/modul.dart';

class NoteList extends StatelessWidget {
  const NoteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop ? 4 : 2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => NoteItemList(),
    );
  }
}

class NoteItemList extends StatelessWidget {
  const NoteItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.amberAccent.withOpacity(.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BTextSimple(
                  text: "text",
                  textAlign: TextAlign.start,
                  fontSize: context.isDesktop ? 22 : 18,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                )
              ],
            ),
            Divider(),
            BTextSimple(
              text:
                  "text fdjkf fjdh dkj dsjkfh  fdfdsfsdafsd fsdafsdaf fdsa fsdkj dsfh dskj hsdkjfhskjdfhsdkjf ds fjds hdskk fdsjhf dsk",
              textAlign: TextAlign.start,
              fontSize: context.isDesktop ? 16 : 14,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BTextSimple(
                  text: "20-Oct-2024",
                  textAlign: TextAlign.start,
                  fontSize: context.isDesktop ? 16 : 14,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/svg/trash.svg',
                    color: context.secondaryColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
