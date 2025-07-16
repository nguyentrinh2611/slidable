import 'package:flutter/material.dart';

class ItemSlidable extends StatefulWidget {
  final int index;
  const ItemSlidable({super.key, required this.index});

  @override
  State<ItemSlidable> createState() => _ItemSlidableState();
}

class _ItemSlidableState extends State<ItemSlidable> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animationOffset;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    animationOffset = Tween(begin: const Offset(0, 0), end: const Offset(-0.4, 0))
        .animate(CurveTween(curve: Curves.linear).animate(animationController));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animationController.animateTo(0.0);
      },
      onHorizontalDragUpdate: (data) {
        animationController.value -= (data.primaryDelta! / (context.size!.width * 0.4));
      },
      onHorizontalDragEnd: (data) {
        if (data.primaryVelocity! > 1500) {
          animationController.animateTo(0.0);
        } else if (animationController.value >= 0.5 || data.primaryVelocity! < -1500) {
          animationController.animateTo(1.0);
        } else {
          animationController.animateTo(0.0);
        }
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            SlideTransition(
              position: animationOffset,
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                width: double.infinity,
                height: 80,
                alignment: Alignment.center,
                color: Theme.of(context).colorScheme.inversePrimary,
                child: Text("Item ${widget.index}"),
              ),
            ),
            AnimatedBuilder(
                animation: animationOffset,
                builder: (context, child) {
                  if (animationOffset.value.dx < 0) {
                    return Positioned(
                        right: 0,
                        bottom: 0,
                        child: Row(
                          children: [
                            Container(
                                width: (constraints.maxWidth * animationOffset.value.dx * -1) / 2,
                                color: Colors.redAccent,
                                height: 80,
                                child: IconButton(
                                    onPressed: () {
                                      animationController.animateTo(0.0);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ))),
                            Container(
                              width: (constraints.maxWidth * animationOffset.value.dx * -1) / 2,
                              height: 80,
                              color: Colors.green,
                              child: IconButton(
                                  onPressed: () {
                                    animationController.animateTo(0.0);
                                  },
                                  icon: const Icon(
                                    Icons.notifications_off_outlined,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ));
                  }
                  return Container();
                }),
          ],
        );
      }),
    );
  }
}
