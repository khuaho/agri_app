import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../global/data/models/my_crop/my_crop.dart';
import '../../../../../../global/enum/crop_status.dart';
import '../../../../../../global/gen/strings.g.dart';
import '../../widgets/my_crop_overview.dart';
import '../../widgets/my_crop_upsert_form.dart';
import 'provider/upsert_my_crop_provider.dart';

@RoutePage()
class UpsertMyCropPage extends ConsumerStatefulWidget {
  const UpsertMyCropPage({super.key, this.id});

  final String? id;

  @override
  ConsumerState<UpsertMyCropPage> createState() => _UpsertMyCropPageState();
}

class _UpsertMyCropPageState extends ConsumerState<UpsertMyCropPage> {
  var formKey = GlobalKey<FormBuilderState>();
  MyCrop? myCrop;
  bool loading = false;

  // @override
  // void initState() {
  //   final upsertMyCrop = ref.read(upsertMyCropProvider(widget.id));
  //   upsertMyCrop.l
  //   // TODO: implement initState
  //   super.initState();
  // }

  void handleReset() {
    // TODOs: ...
  }

  void handleCancel() {
    // TODOs: ...
  }

  void handleSubmit() {
    // TODOs: ...
  }

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final isInsert = widget.id == null;
    final upsertMyCrop = ref.watch(upsertMyCropProvider(widget.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isInsert ? transl.upsertMyCrop.title : transl.myCropDetail.title,
        ),
      ),
      body: upsertMyCrop.when(
        initial: () => const SizedBox(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (data, _) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (!isInsert) ...[
                MyCropOverview(myCrop: data),
                const SizedBox(height: 16)
              ],
              FormBuilder(
                key: formKey,
                enabled: isInsert
                    ? true
                    : myCrop?.cropStatus == CropStatus.todo ||
                        myCrop?.cropStatus == CropStatus.inprogress,
                child: MyCropUpsertForm(initial: data),
              ),
            ],
          );
        },
        error: (err) => Center(child: Text('Err: $err')),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: isInsert ? handleReset : handleCancel,
                child: Text(
                  isInsert
                      ? transl.common.button.reset
                      : transl.common.button.cancel,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: handleSubmit,
                child: Text(
                  widget.id == null
                      ? transl.common.button.create
                      : transl.common.button.update,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
