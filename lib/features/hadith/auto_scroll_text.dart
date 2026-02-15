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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      startScrolling();
    });
  }

  void startScrolling(){

    Future.delayed(const Duration(seconds:2), (){

      if(!_controller.hasClients) return;

      final maxScroll = _controller.position.maxScrollExtent;

      if(maxScroll == 0) return;

      _controller.animateTo(
        maxScroll,
        duration: Duration(
            seconds: (widget.text.length ~/ 20)
        ),
        curve: Curves.linear,
      ).then((_){

        Future.delayed(const Duration(seconds:2), (){

          _controller.jumpTo(0);
          startScrolling();

        });

      });

    });
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
