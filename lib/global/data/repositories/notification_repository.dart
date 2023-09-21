import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../models/failures/failure.dart';
import '../models/notification/notification.dart';
import '_base_repository.dart';

final notificationRepositoryProvider = Provider(
  (ref) => _NotificationRepositoryImpl(),
);

abstract class NotificationRepository {
  Future<Either<Failure, List<Notification>>> getNotifications();

  Future<Either<Failure, int>> getNotificationsUnreadCount();

  Future<Either<Failure, Unit>> upsertNotification(Notification data);
}

class _NotificationRepositoryImpl extends BaseRepository
    implements NotificationRepository {
  final notificationRef = FirebaseFirestore.instance
      .collection('notifications')
      .withNotificationConverter();

  @override
  Future<Either<Failure, List<Notification>>> getNotifications() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final docSnapShot = await notificationRef
          .where('userId', isEqualTo: currentUser?.uid)
          .get();

      final data =
          docSnapShot.docs.map((e) => e.data().copyWith(uid: e.id)).toList();
      return data;
    });
  }

  @override
  Future<Either<Failure, int>> getNotificationsUnreadCount() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final query = await notificationRef
          .where('userId', isEqualTo: currentUser?.uid)
          .where('isRead', isEqualTo: false)
          .count()
          .get();

      return query.count;
    });
  }

  @override
  Future<Either<Failure, Unit>> upsertNotification(Notification data) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (data.uid != null) {
        await notificationRef.doc(data.uid).update(data.toJson());
      } else {
        final res =
            await notificationRef.add(data.copyWith(userId: currentUser?.uid));
        sendNotification(data, res.id);
      }

      return unit;
    });
  }

  Future<void> sendNotification(Notification data, String notifyId) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body: jsonEncode(
          {
            'to': 'userToken',
            'priority': 'high',
            'data': {
              'type': data.type,
              'id': notifyId,
              'cropId': data.cropId,
            },
            'notification': {
              'title': 'Agri App',
              'body': '${data.userReactedName} ${data.content['vi']}',
            },
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Constants.serverMessageKey,
        },
      );
      print('FCM request for device sent!');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
