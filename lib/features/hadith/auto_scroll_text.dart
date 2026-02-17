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

  @override
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

      await _controller.animateTo(
        maxScroll,
        duration: Duration(
          seconds: ((widget.text.length ~/ 12).clamp(8, 40)),
        ),
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
        textAlign: TextAlign.center,
        style: widget.style,
      ),
    );
  }
}
