import 'package:flutter/material.dart';

import '../main.dart';

class ExplorePlaces extends StatelessWidget {
  const ExplorePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: ExploreImageCard(
            title: 'RamojI Film City',
            imageUrl:
                'assets/images/ramoji.png',
          ),
        ),
        SizedBox(width: 18),
        Expanded(
          child: ExploreImageCard(
            title: 'Historic landmark',
            imageUrl: 'assets/images/charminar.png',
          ),
        ),
      ],
    );
  }
}

class ExploreImageCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ExploreImageCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 1.12,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.transparent,
                BlendMode.darken,
              ),
              child: Image.asset(imageUrl, fit: BoxFit.fill),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     height: 54,
            //     alignment: Alignment.bottomLeft,
            //     padding: const EdgeInsets.all(10),
            //     decoration: const BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [Colors.transparent, Color(0x99000000)],
            //       ),
            //     ),
            //     child: Text(
            //       title,
            //       maxLines: 1,
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.w700,
            //         fontSize: 13,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
