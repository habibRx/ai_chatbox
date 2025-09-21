import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../app_theme/app_colors.dart';


class LoadingOverlay extends StatelessWidget {
  final String? message;
  final Color? messageColor;

  final (String, void Function(), int?)? action1;
  final (String, void Function(), int?)? action2;
  final ({
  double sigmaX,
  double sigmaY,
  })? blur;

  final bool useFanLoader;

  const LoadingOverlay({
    super.key,
    this.message,
    this.blur,
    this.action1,
    this.action2,
    this.messageColor,
    this.useFanLoader = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur?.sigmaX ?? 10.0,
            sigmaY: blur?.sigmaY ?? 10.0,
          ),
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildContent(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent(BuildContext context) {
    List<Widget> content = [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: useFanLoader
            ?  _FanLoader(size: 50, color: AppColors.primaryColor)
            : const CircularProgressIndicator(),
      ),
    ];

    if (message != null) {
      content.addAll([
        const SizedBox(height: 10),
        Text(
          message!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: messageColor ?? Colors.black,
            shadows: const [
              Shadow(offset: Offset(-1.5, -1.5), color: Colors.white),
              Shadow(offset: Offset(1.5, -1.5), color: Colors.white),
              Shadow(offset: Offset(1.5, 1.5), color: Colors.white),
              Shadow(offset: Offset(-1.5, 1.5), color: Colors.white),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (action1 != null)
              TextButton(
                onPressed: action1!.$2,
                child: Text(
                  action1!.$1,
                  style: TextStyle(
                    color:
                    action1!.$3 != null ? Color(action1!.$3!) : null,
                  ),
                ),
              ),
            if (action2 != null)
              TextButton(
                onPressed: action2!.$2,
                child: Text(
                  action2!.$1,
                  style: TextStyle(
                    color:
                    action2!.$3 != null ? Color(action2!.$3!) : null,
                  ),
                ),
              ),
          ],
        )
      ]);
    }

    return content;
  }
}

/// 🔄 Custom Fan Loader
class _FanLoader extends StatefulWidget {
  final double size;
  final Color color;

  const _FanLoader({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  State<_FanLoader> createState() => _FanLoaderState();
}

class _FanLoaderState extends State<_FanLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: _FanPainter(color: widget.color),
      ),
    );
  }
}

class _FanPainter extends CustomPainter {
  final Color color;

  _FanPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    for (int i = 0; i < 3; i++) {
      final startAngle = i * (2 * math.pi / 3);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        math.pi / 3,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
