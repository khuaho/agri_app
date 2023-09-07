import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../themes/app_colors.dart';
import 'shimmer_box.dart';
import 'shimmer_wrapper.dart';

final cacheImageStreamProvider = StreamProvider.family<File, String>(
  (ref, imagePath) async* {
    // Cache image
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/$imagePath';
    final file = File(filePath);

    if (await file.exists()) {
      yield file;
    } else {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child(imagePath);
      await file.create(recursive: true);
      final downloadTask = imageRef.writeToFile(file);
      await for (final snapshot in downloadTask.snapshotEvents) {
        if (snapshot.state == TaskState.success) {
          yield file;
        }
      }
    }
  },
);

class ShimmerFirestoreImage extends ConsumerWidget {
  const ShimmerFirestoreImage({
    super.key,
    required this.imagePath,
    this.iconErrorSize = 20,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.errorWidget,
    this.onTap,
    this.onDoubleTap,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final double iconErrorSize;
  final BoxFit fit;
  final Widget? errorWidget;
  final Function(File file)? onTap;
  final Function(File file)? onDoubleTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(cacheImageStreamProvider(imagePath));

    final shimmerBox = ShimmerWrapper(
      child: ShimmerBox(
        height: height ?? 200,
        width: width,
      ),
    );

    final errorBox = ColoredBox(
      color: AppColors.neutral05,
      child: SizedBox(
        width: width ?? 200,
        height: height,
        child: errorWidget ??
            Icon(
              Icons.error,
              size: iconErrorSize,
            ),
      ),
    );

    return stream.when(
      data: (data) => GestureDetector(
        onTap: () => onTap?.call(data),
        onDoubleTap: () => onDoubleTap?.call(data),
        child: Image(
          image: FileImage(data),
          fit: fit,
          height: height,
          width: width,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return shimmerBox;
          },
          errorBuilder: (context, error, stackTrace) => errorBox,
        ),
      ),
      loading: () => shimmerBox,
      error: (_, __) => errorBox,
    );
  }
}
