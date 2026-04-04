import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedSection extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double slideOffset;

  const AnimatedSection({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.slideOffset = 20,
  });

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('animated_section_${widget.key}_${widget.hashCode}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        child: AnimatedSlide(
          offset: _visible ? Offset.zero : Offset(0, widget.slideOffset / 100),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}

/// Stagger-animates a list of children with sequential delays.
class StaggeredAnimatedList extends StatefulWidget {
  final List<Widget> children;
  final Duration itemDelay;
  final double slideOffset;
  final Axis direction;

  const StaggeredAnimatedList({
    super.key,
    required this.children,
    this.itemDelay = const Duration(milliseconds: 100),
    this.slideOffset = 20,
    this.direction = Axis.vertical,
  });

  @override
  State<StaggeredAnimatedList> createState() => _StaggeredAnimatedListState();
}

class _StaggeredAnimatedListState extends State<StaggeredAnimatedList> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('staggered_${hashCode}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(widget.children.length, (i) {
          return widget.children[i]
              .animate(target: _visible ? 1.0 : 0.0)
              .fadeIn(
                delay: widget.itemDelay * i,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              )
              .slideY(
                begin: widget.slideOffset / 100,
                end: 0,
                delay: widget.itemDelay * i,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
        }),
      ),
    );
  }
}
