//仿微信钱包余额动画

import 'package:flutter/material.dart';
import 'package:ztool/ztool_safe.dart';

class ZzAnimatCountWidget extends StatefulWidget {
  final double count;
  final String? prefix; //前缀
  final String? suffix; //后缀
  final TextStyle countStyle;
  final TextStyle? prefixStyle;
  final TextStyle? pointStyle;
  final bool? needPoint;
  final TextStyle? suffixStyle;
  final Duration? duration; //动画时间
  final int? fractionDigits; //保留小数点后几位(默认两位)

  const ZzAnimatCountWidget(
      {Key? key,
      required this.count,
      this.prefix,
      this.suffix,
      required this.countStyle,
      this.prefixStyle,
      this.suffixStyle,
      this.duration,
      this.fractionDigits,
      this.pointStyle,
      this.needPoint = true})
      : super(key: key);

  @override
  State<ZzAnimatCountWidget> createState() => _ZzAnimatCountWidgetState();
}

class _ZzAnimatCountWidgetState extends State<ZzAnimatCountWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  )..forward();

  late Animation<num> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<num>(begin: 0, end: widget.count).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant ZzAnimatCountWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.count != widget.count) {
      _controller.reset();
      _animation = Tween<num>(begin: oldWidget.count, end: widget.count)
          .animate(_controller);
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        String value = "";
        int dotIndex = 0;
        if ((widget.fractionDigits ?? 2) > 0) {
          value = _animation.value.toStringAsFixed(widget.fractionDigits ?? 2);
          dotIndex = value.indexOf('.');
        } else {
          value = _animation.value.toInt().toString();
        }

        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              $notempty(widget.prefix)
                  ? TextSpan(
                      text: widget.prefix ?? "",
                      style: widget.prefixStyle ?? widget.countStyle)
                  : const TextSpan(),
              TextSpan(
                  text: value.substring(0, dotIndex), style: widget.countStyle),
              widget.needPoint == true
                  ? TextSpan(
                      text: value.substring(dotIndex),
                      style: widget.pointStyle ?? widget.countStyle,
                    )
                  : const TextSpan(),
              $notempty(widget.suffix)
                  ? TextSpan(
                      text: widget.suffix ?? "",
                      style: widget.suffixStyle ?? widget.countStyle)
                  : const TextSpan(),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
