import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../global/app_router/app_router.dart';
import '../../../../global/data/models/app_event/app_event.dart';
import '../../../../global/gen/strings.g.dart';
import '../../../../global/themes/app_colors.dart';
import '../../../../global/utils/app_mixin.dart';
import '../../../../global/utils/riverpod/app_state.dart';
import '../../../../global/widgets/avatar.dart';
import '../../../../global/widgets/loading_overlay.dart';
import '../../../../global/widgets/shadow_wrapper.dart';
import 'provider/settings_provider.dart';

@RoutePage()
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> with AppMixin {
  late final provider = ref.watch(setingsProvider.notifier);
  late StreamSubscription updateUserSub;
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    updateUserSub = eventBus.on<UpdateUserEvent>().listen((_) {
      setState(() {
        currentUser = FirebaseAuth.instance.currentUser;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    updateUserSub.cancel();
    super.dispose();
  }

  Future<void> logout() async {
    await provider.logout();
    if (mounted) {
      if (FirebaseAuth.instance.currentUser == null) {
        context.router.replaceAll(
          [const LoginRoute()],
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(setingsProvider);

    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);

    return LoadingOverlay(
      loading: state.isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(transl.settings.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.pushRoute(const ProfileRoute());
                },
                child: ShadowWrapper(
                  borderRadius: 8,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Avatar(
                        name: currentUser?.displayName,
                        imageUrl: currentUser?.photoURL,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentUser?.displayName ?? 'Agri App User',
                              style: textTheme.titleMedium?.copyWith(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(currentUser?.email ?? '_')
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: AppColors.neutral03,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: logout,
            child: Text(transl.settings.logout),
          ),
        ),
      ),
    );
  }
}
