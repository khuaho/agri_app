import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers/user_provider.dart';
import '../../../global/data/models/discuss/discuss.dart';
import '../../../global/gen/strings.g.dart';
import '../../../global/widgets/comment_text_field.dart';
import '../../../global/widgets/empty_data.dart';
import '../providers/discuss_provider.dart';
import 'discuss_tile.dart';

class Discusses extends ConsumerStatefulWidget {
  const Discusses({
    super.key,
    this.cropId,
  });

  final String? cropId;

  @override
  ConsumerState<Discusses> createState() => _DiscussesState();
}

class _DiscussesState extends ConsumerState<Discusses> {
  void handleComment(String content) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final getUser = ref.watch(userProvider);
    final discuss = Discuss(
      avatar: currentUser?.photoURL,
      fullName: currentUser?.displayName,
      content: content,
      role: getUser.role,
      userId: getUser.uid ?? currentUser?.uid,
      reactions: [0, 0, 0, 0],
      createdAt: DateTime.now(),
    );

    ref.read(discussProvider(widget.cropId).notifier).addDiscuss(discuss);
  }

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final state = ref.watch(discussProvider(widget.cropId));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: state.when(
            loading: () {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: 2,
                itemBuilder: (_, __) {
                  return const ShimmerDiscussTile();
                },
              );
            },
            data: (data, __) {
              final discuss = data ?? [];

              if (discuss.isEmpty) {
                return const SingleChildScrollView(
                  child: EmptyData(),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: discuss.length,
                itemBuilder: (context, index) {
                  final item = discuss[index];
                  return DiscussTile(
                    data: item,
                    cropId: widget.cropId!,
                  );
                },
              );
            },
            initial: () => const SizedBox(),
            error: (err) => Center(
              child: Text('Error: $err'),
            ),
          ),
        ),
        CommentTextField(
          onTapSend: (value) {
            if (value.isNotEmpty) {
              handleComment(value);
            }
          },
          onTextChange: (content) {},
          hintText: transl.detailCrop.writeComment,
        )
      ],
    );
  }
}
