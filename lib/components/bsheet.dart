import 'package:flutter/material.dart';
import 'package:quiknote/components/abx_text.dart';

class BSheetForm extends StatefulWidget {
  final String? title;
  final Widget? content;
  const BSheetForm({
    super.key,
    this.title,
    this.content,
  });

  @override
  State<BSheetForm> createState() => _BSheetFormState();
}

class _BSheetFormState extends State<BSheetForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding:
            const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 5,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 115, 115, 115),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(height: 10),
            BText(
              text: widget.title,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 15),
            widget.content ??
                Center(
                  child: Text("Content Here"),
                ),
          ],
        ),
      ),
    );
  }
}
