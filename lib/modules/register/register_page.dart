import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../global/gen/strings.g.dart';
import '../../global/themes/app_colors.dart';
import '../../global/utils/riverpod/app_state.dart';
import '../../global/utils/snack_bar.dart';
import '../../global/widgets/loading_overlay.dart';
import '../../global/widgets/text_label.dart';
import 'provider/register_provider.dart';

@RoutePage()
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  late final provider = ref.watch(registerProvider.notifier);
  bool passwordObscure = true;
  bool confirmPasswordobscure = true;

  void signUpWithEmailPassword() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;
      provider.signUpWithEmailPassword(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(registerProvider);

    ref.listen(registerProvider, (_, next) {
      next.whenOrNull(
        data: (_, __) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Verify email'),
            ),
          );
          AutoRouter.of(context).pop();
        },
        error: (err) => SnackBarUtils.showErr(context, err),
      );
    });

    return LoadingOverlay(
      loading: state.isLoading,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text(transl.auth.register),
        ),
        body: FormBuilder(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              Textlabel(label: transl.auth.username.label),
              FormBuilderTextField(
                name: 'username',
                textInputAction: TextInputAction.next,
                autocorrect: false,
                enableSuggestions: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: transl.auth.username.hint,
                  suffixIcon: const SizedBox.square(dimension: 40),
                ),
                valueTransformer: (String? value) => value!.trim(),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: transl.auth.username.required,
                    ),
                  ],
                ),
              ),
              Textlabel(label: transl.auth.fullName.label),
              FormBuilderTextField(
                name: 'fullName',
                textInputAction: TextInputAction.next,
                autocorrect: false,
                enableSuggestions: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: transl.auth.fullName.hint,
                  suffixIcon: const SizedBox.square(dimension: 40),
                ),
                valueTransformer: (String? value) => value!.trim(),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: transl.auth.fullName.required,
                    ),
                  ],
                ),
              ),
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
                    ),
                    FormBuilderValidators.minLength(
                      8,
                      errorText: transl.auth.password.isAtLeast8Characters,
                    ),
                    FormBuilderValidators.match(
                      r'^(?=.*?[0-9])(?=.*?[!@#\$&*~%.^]).{8,}$',
                      errorText: transl.auth.password.isNotValid,
                    )
                  ],
                ),
              ),
              Textlabel(label: transl.auth.confirmPassword.label),
              FormBuilderTextField(
                name: 'confirmPassword',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: transl.auth.confirmPassword.hint,
                  suffixIcon: SizedBox.square(
                    dimension: 40,
                    child: IconButton(
                      icon: Icon(
                        confirmPasswordobscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.neutral03,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() =>
                            confirmPasswordobscure = !confirmPasswordobscure);
                      },
                    ),
                  ),
                ),
                obscureText: confirmPasswordobscure,
                obscuringCharacter: '*',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: transl.auth.confirmPassword.required,
                    ),
                    (value) {
                      if (value !=
                          _formKey.currentState?.fields['password']?.value) {
                        return transl.auth.confirmPassword.notMatch;
                      }
                      return null;
                    },
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: signUpWithEmailPassword,
                child: Text(transl.auth.register),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: 'You have an account? ',
                  children: [
                    TextSpan(
                      text: transl.auth.login,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = AutoRouter.of(context).pop,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
