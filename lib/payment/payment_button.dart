import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wallet_app_workshop/core/styles.dart';

const dragSnapDuration = Duration(milliseconds: 300);
const draggableMinWidth = 60.0;

class PaymentButton extends StatefulWidget {
  const PaymentButton({
    super.key,
    this.enabled = false,
    this.width = 100,
  });

  final bool enabled;
  final double width;

  @override
  State<PaymentButton> createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
  final dragOffsetNotifier = ValueNotifier<double>(0);
  Duration dragDuration = Duration.zero;

  double get draggableMaxWidth => widget.width - 4 * 2;

  double get maxDraggableDistance => draggableMaxWidth - draggableMinWidth;

  double get dragThreshold => maxDraggableDistance * 0.8;

  _handleHorizontalDragStart(DragStartDetails details) {
    //...
  }

  _handleHorizontalDragUpdate(DragUpdateDetails details) {
    //...
  }

  _handleHorizontalDragEnd(DragEndDetails details) {
    //...
  }

  void _dragListener() {
    //...
  }

  @override
  void initState() {
    super.initState();
    dragOffsetNotifier.addListener(_dragListener);
  }

  @override
  void dispose() {
    dragOffsetNotifier.removeListener(_dragListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.black,
      ),
      height: 60,
      padding: const EdgeInsets.all(4),
      clipBehavior: Clip.hardEdge,
      child: ValueListenableBuilder(
        valueListenable: dragOffsetNotifier,
        builder: (context, dragOffset, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(left: draggableMinWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Slide to pay',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 10),
                      _AnimatedArrows(enabled: widget.enabled),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                width: draggableMinWidth + dragOffset,
                child: GestureDetector(
                  onHorizontalDragUpdate: _handleHorizontalDragUpdate,
                  onHorizontalDragStart: _handleHorizontalDragStart,
                  onHorizontalDragEnd: _handleHorizontalDragEnd,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 60,
                        child: Center(
                          child: Transform(
                            transform: Matrix4.identity()
                              ..rotateY(
                                4 * pi * (dragOffset / maxDraggableDistance),
                              ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/icons/dollar.png',
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned.fill(
                child: Opacity(
                  opacity: 0,
                  child: Center(
                    child: Text(
                      'Release to pay',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Positioned.fill(
                child: FractionalTranslation(
                  translation: Offset(0, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      SizedBox(width: 10),
                      Center(
                        child: Text(
                          'Payment Successful',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AnimatedArrows extends StatefulWidget {
  const _AnimatedArrows({
    this.enabled = false,
  });

  final bool enabled;

  @override
  State<_AnimatedArrows> createState() => __AnimatedArrowsState();
}

class __AnimatedArrowsState extends State<_AnimatedArrows>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const offset = 10.0;
    const count = 5;

    return SizedBox(
      width: (count + 1) * offset,
      child: Stack(
        children: List.generate(
          count,
          (index) => Positioned(
            left: offset * index,
            bottom: 0,
            top: 0,
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 17,
            ),
          ),
        ),
      ),
    );
  }
}
