import 'dart:io';

import 'package:adaptive_selector/adaptive_selector.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/enum/role_enum.dart';
import '../../global/gen/strings.g.dart';
import '../../global/themes/app_colors.dart';
import '../../global/widgets/avatar.dart';
import '../../global/widgets/text_label.dart';
import '../main/selector/role_selector.dart';
import 'provider/profile_provider.dart';
import 'widgets/image_dialog.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  late final provider = ref.watch(asyncProfileProvider.notifier);
  String imgFile = '';

  void updateProfile() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final data = _formKey.currentState?.value;
      provider.updateUser(data!, imgFile.isNotEmpty);
    }
  }

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final asyncUser = ref.watch(asyncProfileProvider);
    final genders = [
      AdaptiveSelectorOption(
        label: transl.profile.gender.male,
        value: false,
      ),
      AdaptiveSelectorOption(
        label: transl.profile.gender.female,
        value: true,
      ),
    ];

    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text(transl.profile.title),
        ),
        body: asyncUser.when(
          data: (data) {
            return FormBuilder(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: FormBuilderField(
                      name: 'avatar',
                      initialValue: data.avatar,
                      builder: (field) {
                        return SizedBox(
                          height: 80,
                          width: 80,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              imgFile.isEmpty
                                  ? Avatar(
                                      name: data.fullName,
                                      imageUrl: data.avatar,
                                    )
                                  : CircleAvatar(
                                      backgroundImage: FileImage(
                                        File(imgFile),
                                      ),
                                    ),
                              Positioned(
                                bottom: -4,
                                right: -30,
                                child: RawMaterialButton(
                                  onPressed: () async {
                                    final value = await showDialog(
                                      context: context,
                                      builder: (_) {
                                        return const ImageDialog();
                                      },
                                    );
                                    if (value != null) {
                                      field.didChange(value);
                                      setState(() {
                                        imgFile = value;
                                      });
                                    }
                                  },
                                  elevation: 2.0,
                                  fillColor: AppColors.neutral10,
                                  shape: const CircleBorder(),
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.information,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Textlabel(label: transl.auth.username.label),
                  FormBuilderTextField(
                    name: 'username',
                    initialValue: data.username,
                    decoration: InputDecoration(
                      hintText: transl.auth.username.hint,
                      suffixIcon: const SizedBox.square(dimension: 40),
                    ),
                    valueTransformer: (String? value) => value!.trim(),
                  ),
                  Textlabel(label: transl.auth.fullName.label),
                  FormBuilderTextField(
                    name: 'fullName',
                    initialValue: data.fullName,
                    decoration: InputDecoration(
                      hintText: transl.auth.fullName.hint,
                      suffixIcon: const SizedBox.square(dimension: 40),
                    ),
                    valueTransformer: (String? value) => value!.trim(),
                  ),
                  Textlabel(label: transl.auth.email.label),
                  FormBuilderTextField(
                    name: 'email',
                    enabled: false,
                    initialValue: data.email,
                    decoration: InputDecoration(
                      hintText: transl.auth.email.hint,
                      suffixIcon: const SizedBox.square(dimension: 40),
                    ),
                    valueTransformer: (String? value) => value!.trim(),
                  ),
                  Textlabel(label: transl.profile.gender.label),
                  FormBuilderField<bool?>(
                    initialValue: data.gender,
                    name: 'gender',
                    builder: (field) {
                      return AdaptiveSelector<bool?>(
                        initial: genders
                            .where((e) => e.value == data.gender)
                            .toList(),
                        allowClear: false,
                        options: genders,
                        type: SelectorType.menu,
                        onChanged: (genderOptions) {
                          if (genderOptions.isEmpty) return;
                          field.didChange(genderOptions.first.value);
                        },
                        decoration: InputDecoration(
                          hintText: transl.profile.gender.hint,
                        ),
                      );
                    },
                  ),
                  Textlabel(label: transl.profile.role.label),
                  FormBuilderField(
                    name: 'role',
                    initialValue: data.role,
                    builder: (field) {
                      return RoleSelector(
                        initial: RoleEnum.fromValue(data.role),
                        onChanged: (options) {
                          field.didChange(options?.value);
                        },
                      );
                    },
                  )
                ],
              ),
            );
          },
          error: (err, _) => Center(child: Text('Error: $err')),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: updateProfile,
            child: Text(transl.common.button.update),
          ),
        ),
      ),
    );
  }
}
