import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers/user_provider.dart';
import '../../../global/data/models/discuss/discuss.dart';
import '../../../global/enum/reaction_enum.dart';
import '../../../global/enum/role_enum.dart';
import '../../../global/extensions/date_time_ext.dart';
import '../../../global/gen/strings.g.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/widgets/avatar.dart';
import '../../../global/widgets/shimmer/shimmer_wrapper.dart';
import '../models/reaction_data.dart';
import '../providers/discuss_provider.dart';

class DiscussTile extends ConsumerStatefulWidget {
  const DiscussTile({
    super.key,
    required this.data,
    required this.cropId,
  });

  final Discuss data;
  final String cropId;

  @override
  ConsumerState<DiscussTile> createState() => _DiscussTileState();
}

class _DiscussTileState extends ConsumerState<DiscussTile> {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  String currentFavorite = '';

  void changedReact(String? value) {
    final data = widget.data;
    if (uid != null) {
      // reaction amount
      List<ReactionData> reactions =
          data.reactions.map((e) => ReactionData(amount: e)).toList();
      Map<String, String> mergeReactionsOfUser = HashMap<String, String>();
      // reaction status id
      final reactionId = ReactionEnum.fromValue(value).id;
      if (data.reactionsOfUser.containsKey(uid)) {
        if (value == data.reactionsOfUser[uid]) {
          print('reaction status exists');
          final reactionOfUsers = data.reactionsOfUser.entries
              .where((e) => e.key != uid)
              .map((entry) {
            return {entry.key: entry.value};
          }).toList();

          for (var map in reactionOfUsers) {
            map.forEach((key, value) => mergeReactionsOfUser.addAll(map));
          }

          reactions[reactionId] = reactions[reactionId].copyWith(
            amount: data.reactions[reactionId] - 1,
          );
        } else {
          print('reactions status changed');
          final reactionOfUsers = data.reactionsOfUser.entries.map((entry) {
            if (entry.key == uid) {
              return {entry.key: value!};
            }
            return {entry.key: entry.value};
          }).toList();

          for (var map in reactionOfUsers) {
            map.forEach((key, value) => mergeReactionsOfUser.addAll(map));
          }

          reactions[reactionId] = reactions[reactionId].copyWith(
            amount: data.reactions[reactionId] + 1,
          );
          final reactionOldId =
              ReactionEnum.fromValue(data.reactionsOfUser[uid]).id;
          reactions[reactionOldId] = reactions[reactionOldId].copyWith(
            amount: data.reactions[reactionOldId] - 1,
          );
        }
      } else {
        print('user is not exist into reactions of user');
        mergeReactionsOfUser
          ..addAll({uid!: value!})
          ..addAll(data.reactionsOfUser);

        reactions[reactionId] = reactions[reactionId].copyWith(
          amount: data.reactions[reactionId] + 1,
        );
      }
      ref.read(discussProvider(widget.cropId).notifier).changedReact(
            widget.data.copyWith(
              reactionsOfUser: mergeReactionsOfUser,
              reactions: reactions.map((e) => e.amount).toList(),
            ),
          );
      reactions = List.generate(4, (index) => const ReactionData(amount: 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);
    final role = widget.data.userId == uid
        ? RoleEnum.fromValue(ref.watch(userProvider).role) ??
            RoleEnum.fromValue(widget.data.role)
        : RoleEnum.fromValue(widget.data.role);

    final myReact = ReactionEnum.fromValue(widget.data.reactionsOfUser[uid]);
    final reacted = widget.data.reactions
        .asMap()
        .entries
        .where((e) => e.value > 0)
        .map((entry) => ReactionEnum.fromValueWithId(entry.key))
        .toList();

    final reactionAmount = widget.data.reactions.reduce((a, b) => a + b);

    final textBtnStyle = TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: const Size(50, 20),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: const TextStyle(
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.neutral09,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Avatar(
                  name: widget.data.fullName,
                  imageUrl: widget.data.avatar,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.fullName ?? '_',
                        style: textTheme.titleSmall,
                      ),
                      Text(
                        role?.label(context) ?? '_',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.data.userId == uid)
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == 1) {
                        if (widget.data.uid != null) {
                          ref
                              .read(discussProvider(widget.cropId).notifier)
                              .deleteDiscuss(widget.data.uid!);
                        }
                      }
                    },
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.delete,
                              color: AppColors.errorDefault,
                            ),
                            const SizedBox(width: 10),
                            Text(transl.common.button.delete)
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(widget.data.content ?? '_'),
            const SizedBox(height: 10),
            Row(
              children: [
                ReactionButton(
                  initialReaction: Reaction(
                    icon: _buildReactionIcon(
                      myReact.icon(),
                      myReact.bgIcon(),
                      myReact.reactionTitle(context),
                    ),
                    previewIcon: _buildReactionIcon(
                      myReact.icon(),
                      myReact.bgIcon(),
                      myReact.reactionTitle(context),
                    ),
                    value: myReact.value,
                  ),
                  reactions: ReactionEnum.values
                      .map(
                        (e) => Reaction(
                          previewIcon: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              e.icon(),
                              color: e.bgIcon(),
                            ),
                          ),
                          icon: _buildReactionIcon(
                            e.icon(),
                            e.bgIcon(),
                            e.reactionTitle(context),
                          ),
                          value: e.value,
                        ),
                      )
                      .toList(),
                  onReactionChanged: (value) => changedReact(value),
                ),
                const SizedBox(width: 10),
                TextButton(
                  style: textBtnStyle,
                  onPressed: () {
                    // TO DOs: comment handle
                  },
                  child: Text(transl.common.button.reply),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.data.createdAt?.timeAgoCustom(context) ?? '_',
                  ),
                ),
                Row(
                  children: [
                    ...reacted.map(
                      (e) => Icon(
                        e!.icon(),
                        color: e.bgIcon(),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 4),
                    if (widget.data.reactions.isNotEmpty)
                      Text(
                        reactionAmount > 0 ? reactionAmount.toString() : '',
                        style: textTheme.titleSmall,
                      ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildReactionIcon(IconData icon, Color? colorIcon, String title) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return Row(
      children: [
        Icon(
          icon,
          color: colorIcon,
          size: 20,
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(
            fontWeight: widget.data.reactionsOfUser[uid] != null
                ? FontWeight.w600
                : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class ShimmerDiscussTile extends StatelessWidget {
  const ShimmerDiscussTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ShimmerWrapper(
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
