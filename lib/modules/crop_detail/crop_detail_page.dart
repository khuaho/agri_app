import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/utils/riverpod/app_state.dart';
import '../../global/widgets/loading_overlay.dart';
import 'providers/crop_detail_provider.dart';

@RoutePage()
class CropDetailPage extends ConsumerStatefulWidget {
  const CropDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<CropDetailPage> createState() => _CropDetailPageState();
}

class _CropDetailPageState extends ConsumerState<CropDetailPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cropDetailProvider(widget.id));

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail crops: ${widget.id}'),
      ),
      body: LoadingOverlay(
        loading: state.isLoading,
        child: Column(
          children: [
            Text('data: ${state.data}'),
          ],
        ),
      ),
    );
  }
}
