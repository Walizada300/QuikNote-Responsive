import 'package:quiknote/components/btrash_listtil.dart';
import 'package:quiknote/components/modul.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isDesktop
          ? null
          : AppBar(
              title: BText(
                text: "Trash",
                color: context.backgroundColor,
              ),
              iconTheme: IconThemeData(color: context.backgroundColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                            child: BText(
                          text: "Empty Trash",
                        )),
                      ];
                    },
                  ),
                )
              ],
            ),
      body: Padding(
        padding: context.isDesktop
            ? EdgeInsets.symmetric(horizontal: 20)
            : EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            if (context.isDesktop)
              Container(
                color: context.backgroundColor,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BText(
                      text: "Trash",
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                    BOulineButton(
                      onPress: () {},
                      label: "Empty Trash",
                    ),
                  ],
                ),
              ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TrashListTile(
                      title: "title",
                      subtitle: "subtitle",
                      color: "0xff0000ff",
                      onUpdate: () {},
                      onDelete: () {},
                      onPress: () {},
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
