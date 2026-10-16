import 'package:flutter/material.dart';
import 'autoWidget.dart';
import 'bikeWidget.dart';
import 'cabWidget.dart';
import 'moreWidget.dart';

class RideGrid extends StatelessWidget {
  const RideGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isNarrow = width < 370;
        final isWide = width >= 700;
        final cardHeight = isWide ? 410.0 : (isNarrow ? 320.0 : 367.0);
        final gap = width < 370 ? 10.0 : 16.0;

        return SizedBox(
          height: cardHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 11, child: ResponsiveAutoCardWidget(onTap: () {})),
              SizedBox(width: gap),
              Expanded(
                flex: 11,
                child: Column(
                  children: [
                    Expanded(flex: 11, child: ResponsiveCabCardWidget()),
                    SizedBox(height: gap),
                    Expanded(
                      flex: 9,
                      child: Row(
                        children: [
                          Expanded(
                            child: ResponsiveBikeCardWidget(onTap: () {}),
                          ),
                          SizedBox(width: gap * 0.8),
                          Expanded(child: ResponsiveMoreCardWidget(onTap: () {})),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
