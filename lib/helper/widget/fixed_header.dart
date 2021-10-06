import 'package:flutter/widgets.dart';

class SliverFiexdHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverFiexdHeaderDelegate({
    required this.height,
    required this.child,
  });
  final double height;
  final Widget child;
  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverFiexdHeaderDelegate oldDelegate) {
    return height != oldDelegate.height || child != oldDelegate.child;
  }
}
