import 'package:avatar_generator/helpers.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import 'package:avatar_generator/models/api/avatar_api.dart';
import 'package:avatar_generator/models/avatar_model.dart';

class SearchViewModel extends ChangeNotifier {
  final List<String> hairs = ['short01', 'short02', 'short03', 'short04', 'short05', 'long01', 'long02', 'long03', 'long04', 'long05'];

  final List<String> clothes = ['variant01', 'variant02', 'variant03', 'variant04', 'variant05'];

  final List<String> eyes = ['variant01', 'variant02', 'variant03', 'variant04', 'variant05'];

  List<String> _avatars = [];
  List<String> get avatars => _avatars;

  late TextEditingController keywordController = TextEditingController();

  String keyword = '';

  bool isFetchingAvatars = false;

  void fetchAvatars() {
    keyword = keywordController.text;

    _avatars = [];

    _fetchAvatars(6);
  }

  Future<void> _fetchAvatars(int count) async {
    isFetchingAvatars = true;
    notifyListeners();

    for (int i = 1; i <= count; i++) {
      final AvatarApi api = AvatarApi();

      final String hair = hairs[randomInt(0, hairs.length - 1)];
      final String clothing = clothes[randomInt(0, clothes.length - 1)];
      final String eye = eyes[randomInt(0, clothes.length - 1)];

      AvatarModel avatarModel = await api.getAvatar('$keyword&hair=$hair&clothing=$clothing&eyes=$eye');

      _avatars.add(avatarModel.svg);
    }

    isFetchingAvatars = false;
    notifyListeners();
  }
}