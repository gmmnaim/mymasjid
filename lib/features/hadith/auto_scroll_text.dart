import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollText extends StatefulWidget {

  final String text;
  final TextStyle style;

  const AutoScrollText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  State<AutoScrollText> createState() => _AutoScrollTextState();
}

class _AutoScrollTextState extends State<AutoScrollText> {

  final ScrollController _controller = ScrollController();

  Timer? _timer;
  int _scrollToken = 0;
  static const double wordsPerMinute = 160;   /// 🔥 TV READING SPEED



  //static const double secondsPerLine = 2.5; /// 🔥 SAME SPEED PER LINE (TV BEST)

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      startScrolling();
    });
  }

  @override
  void didUpdateWidget(covariant AutoScrollText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.text != widget.text) {

      _scrollToken++;
      _timer?.cancel();

      if (_controller.hasClients) {
        _controller.position.moveTo(_controller.position.pixels);
        _controller.jumpTo(0);
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        startScrolling();
      });
    }
  }

  void startScrolling() {

    final currentToken = _scrollToken;

    _timer = Timer(const Duration(seconds: 2), () async {

      if (!_controller.hasClients || currentToken != _scrollToken) return;

      final maxScroll = _controller.position.maxScrollExtent;

      if (maxScroll == 0) return;

      /// 🔥 EXACT RENDERED LINE COUNT
      final textPainter = TextPainter(
        text: TextSpan(text: widget.text, style: widget.style),
        textDirection: TextDirection.ltr,
        maxLines: null,
      )..layout(
        maxWidth: _controller.position.viewportDimension,
      );

      final wordCount = widget.text.split(RegExp(r'\s+')).length;

      final seconds = (wordCount / wordsPerMinute) * 60;

      final duration = Duration(
        milliseconds: (seconds * 1000).toInt(),
      );


      await _controller.animateTo(
        maxScroll,
        duration: duration,
        curve: Curves.linear,
      );

      if (!_controller.hasClients || currentToken != _scrollToken) return;

      _timer = Timer(const Duration(seconds: 2), () {

        if (!_controller.hasClients || currentToken != _scrollToken) return;

        _controller.jumpTo(0);
        startScrolling();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      physics: const NeverScrollableScrollPhysics(),
      child: Text(
        widget.text,
        textAlign: TextAlign.left,
        style: widget.style,
      ),
    );
  }
}
