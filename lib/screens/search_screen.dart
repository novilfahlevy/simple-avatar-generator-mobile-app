import 'package:avatar_generator/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:avatar_generator/screens/view_models/search_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final SearchViewModel searchViewModel = Provider.of<SearchViewModel>(context);

    return Stack(
      children: [
        searchViewModel.isFetchingAvatars
          ? const Center(child: LoadingIndicator(color: Colors.blue))
          : searchViewModel.avatars.isNotEmpty
            ? Container(
                margin: const EdgeInsets.only(top: 50),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Consumer<SearchViewModel>(
                    builder: (context, state, _) {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10
                        ),
                        itemCount: state.avatars.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: SvgPicture.string(state.avatars[index])
                          );
                        },
                      );
                    }
                  )
                )
              )
            : const Center(child: Text('Let\'s find something')),
        TextField(
          controller: searchViewModel.keywordController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            label: const Text('Type your name here...'),
            suffixIcon: GestureDetector(
              onTap: searchViewModel.fetchAvatars,
              child: const Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}