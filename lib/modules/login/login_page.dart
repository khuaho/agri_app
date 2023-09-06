import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../global/app_router/app_router.dart';
import '../../global/gen/assets.gen.dart';
import '../../global/gen/strings.g.dart';
import '../../global/themes/app_colors.dart';
import '../../global/utils/riverpod/app_state.dart';
import '../../global/utils/snack_bar.dart';
import '../../global/widgets/loading_overlay.dart';
import '../../global/widgets/text_label.dart';
import 'provider/login_provider.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final provider = ref.watch(loginProvider.notifier);
  final _formKey = GlobalKey<FormBuilderState>();
  bool passwordObscure = true;

  Future<void> signInWithEmailPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;
      await provider.signInWithEmailPassword(
        email: data['email'],
        password: data['password'],
      );

      if (mounted) {
        if (FirebaseAuth.instance.currentUser != null) {
          context.router.replaceAll(
            [const MainRoute()],
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);
    final state = ref.watch(loginProvider);

    ref.listen(loginProvider, (_, next) {
      next.whenOrNull(
        data: (_, __) {
          AutoRouter.of(context).pop();
          // if (FirebaseAuth.instance.currentUser!.emailVerified) {
          // AutoRouter.of(context).replaceAll([const HomeRoute()]);
          // } else {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text(i18n.login_AccountHaveNotVerified),
          //     ),
          //   );
          // }
        },
        error: (err) => SnackBarUtils.showErr(context, err),
      );
    });

    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: LoadingOverlay(
        loading: state.isLoading,
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: Text(transl.auth.login),
          ),
          body: FormBuilder(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Textlabel(label: transl.auth.email.label),
                FormBuilderTextField(
                  name: 'email',
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  enableSuggestions: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: transl.auth.email.hint,
                    suffixIcon: const SizedBox.square(dimension: 40),
                  ),
                  valueTransformer: (String? value) => value!.trim(),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                        errorText: transl.auth.email.required,
                      ),
                    ],
                  ),
                ),
                Textlabel(label: transl.auth.password.label),
                FormBuilderTextField(
                  name: 'password',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: transl.auth.password.hint,
                    suffixIcon: SizedBox.square(
                      dimension: 40,
                      child: IconButton(
                        icon: Icon(
                          passwordObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.neutral03,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() => passwordObscure = !passwordObscure);
                        },
                      ),
                    ),
                  ),
                  obscureText: passwordObscure,
                  obscuringCharacter: '*',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                        errorText: transl.auth.password.required,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      textStyle: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      // TO DOs: forgot password handle
                    },
                    child: Text(transl.auth.forgotPassword),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: signInWithEmailPassword,
                  child: Text(transl.auth.login),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: transl.auth.haveNotAnAccount,
                    style: textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: transl.auth.register,
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.pushRoute(
                                const RegisterRoute(),
                              ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      const Expanded(child: Divider()),
                      const SizedBox(width: 10),
                      Text(
                        transl.auth.or,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(child: Divider())
                    ],
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: provider.signInWithGoogle,
                  icon: Assets.appIcons.google.image(
                    fit: BoxFit.contain,
                    height: 24,
                    width: 24,
                  ),
                  label: Text(transl.auth.loginWithGoogle),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    // TO DOs: login with facebook
                  },
                  icon: Assets.appIcons.facebook.image(
                    fit: BoxFit.contain,
                    height: 24,
                    width: 24,
                  ),
                  label: Text(transl.auth.loginWithFacebook),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
