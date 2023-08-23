import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

import '../../../global/enum/reaction_enum.dart';
import '../../../global/gen/strings.g.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/utils/app_icons.dart';
import '../../../global/widgets/avatar.dart';

class DiscussTile extends StatelessWidget {
  const DiscussTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);
    final textBtnStyle = TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: const Size(50, 20),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: const TextStyle(
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
      ),
    );

    return Container(
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
              const Avatar(
                name: 'K',
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ho Thi Khua',
                      style: textTheme.titleSmall,
                    ),
                    const Text(
                      'Farmer',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 1) {
                    // if value 1 then delete comment
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
          const Text('dsfsdg fhgsdh sbhjc hsdgfh shjgfdy'),
          const SizedBox(height: 6),
          Row(
            children: [
              ReactionButton(
                initialReaction: Reaction(
                  icon: _buildReactionIcon(
                    AppIcons.thumbs_up,
                    AppColors.information,
                    transl.common.reaction.like,
                  ),
                  previewIcon: _buildReactionIcon(
                    AppIcons.thumbs_up,
                    AppColors.information,
                    transl.common.reaction.like,
                  ),
                  value: '0',
                ),
                onReactionChanged: (value) {},
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
              ),
              const SizedBox(width: 10),
              TextButton(
                style: textBtnStyle,
                onPressed: () {
                  // TO DOs: comment handle
                  // if user exist -> using this feat or else
                  if (FirebaseAuth.instance.currentUser != null) {
                    print('user exists');
                  } else {
                    print('user is not exists');
// context.pushRoute(const LoginRoute());
                  }
                },
                child: Text(transl.common.button.comment),
              ),
              const SizedBox(width: 10),
              const Text(
                '2 tuan',
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildReactionIcon(IconData icon, Color? colorIcon, String title) {
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
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
