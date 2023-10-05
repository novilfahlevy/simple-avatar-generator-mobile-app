import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import 'package:avatar_generator/models/api/avatar_api.dart';
import 'package:avatar_generator/models/avatar_model.dart';

class FeedsViewModel extends ChangeNotifier {
  List<String> _avatars = [];
  List<String> get avatars => _avatars;

  late ScrollController scrollController;

  bool isFetchingAvatars = false;

  FeedsViewModel() {
    scrollController = ScrollController();
    scrollController.addListener(_handleScrollNotification);

    _fetchAvatars(8);
  }

  void _handleScrollNotification() {
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double currentScroll = scrollController.position.pixels;
    const double delta = 200.0;

    if ((maxScroll - currentScroll) <= delta && !isFetchingAvatars) {
      _fetchAvatars(4);
    }
  }

  Future<void> _fetchAvatars(int count) async {
    isFetchingAvatars = true;
    notifyListeners();

    try {
      final Faker faker = Faker();
      
      for (int i = 1; i <= count; i++) {
        final AvatarApi api = AvatarApi();
      
        AvatarModel avatarModel = await api.getAvatar(faker.person.firstName());
      
        _avatars.add(avatarModel.svg);
      }
    } on Exception catch (_) {
      // TODO
    }

    isFetchingAvatars = false;
    notifyListeners();
  }
}