import 'package:flutter/material.dart';

import '../../../global/gen/strings.g.dart';
import '../../../global/widgets/comment_text_field.dart';
import 'discuss_tile.dart';

class Discuss extends StatelessWidget {
  const Discuss({super.key});

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 10),
            children: const [
              DiscussTile(),
            ],
          ),
        ),
        CommentTextField(
          onTextChange: (String value) {},
          hintText: transl.detailCrop.writeComment,
        )
      ],
    );
  }
}
