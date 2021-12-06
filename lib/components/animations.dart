import 'package:flutter/material.dart';

class SlideYFadeIn extends StatefulWidget {
  const SlideYFadeIn(
      {Key? key,
      this.index,
      required this.child,
      this.slideDuration,
      this.fadeDuration,
      this.delayDuration,
      this.beginOffsetY})
      : super(key: key);

  @override
  _SlideYFadeInState createState() => _SlideYFadeInState();

  final int? index;
  final Widget child;
  final int? slideDuration;
  final int? fadeDuration;
  final int? delayDuration;
  final double? beginOffsetY;
}

class _SlideYFadeInState extends State<SlideYFadeIn>
    with TickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late AnimationController _slideAnimationController;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    _slideAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.slideDuration ?? 500));
    _fadeAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.fadeDuration ?? 700));
    _slideAnimation = CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.easeInOutQuad,
    );

    Future.delayed(Duration(
            milliseconds:
                widget.delayDuration ?? 0 + ((widget.index ?? 0) * 150)))
        .then((value) {
      _slideAnimationController.forward();
      _fadeAnimationController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
              begin: Offset(0, widget.beginOffsetY ?? -0.4), end: Offset.zero)
          .animate(_slideAnimation),
      child: FadeTransition(
          opacity: _fadeAnimationController
              .drive(CurveTween(curve: Curves.easeInOutQuad)),
          child: widget.child),
    );
  }
}

class FadeIn extends StatefulWidget {
  const FadeIn(
      {Key? key,
      this.index,
      required this.child,
      this.fadeDuration,
      this.delayDuration})
      : super(key: key);

  @override
  _FadeInState createState() => _FadeInState();

  final int? index;
  final Widget child;
  final int? fadeDuration;
  final int? delayDuration;
}

class _FadeInState extends State<FadeIn>
    with TickerProviderStateMixin {
  late AnimationController _fadeAnimationController;

  @override
  void initState() {
    _fadeAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.fadeDuration ?? 700));

    Future.delayed(Duration(
            milliseconds:
                widget.delayDuration ?? 0 + ((widget.index ?? 0) * 150)))
        .then((value) {
      _fadeAnimationController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _fadeAnimationController
            .drive(CurveTween(curve: Curves.easeInOutQuad)),
        child: widget.child);
  }
}
