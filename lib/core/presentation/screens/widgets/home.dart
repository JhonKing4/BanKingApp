import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({required this.currentIndex, required this.onTap});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List<AnimationController>.generate(
      5,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      ),
    );

    _animations = _controllers
        .map((controller) => Tween<double>(begin: 1.0, end: 1.2).animate(
              CurvedAnimation(
                parent: controller,
                curve: Curves.easeInOut,
              ),
            ))
        .toList();

    _controllers[widget.currentIndex].forward();
  }

  @override
  void didUpdateWidget(CustomBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _controllers[oldWidget.currentIndex].reverse();
      _controllers[widget.currentIndex].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color.fromRGBO(30, 33, 33, 0.8),
      ),
      child: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        items: [
          _buildBottomNavigationBarItem(Icons.home_outlined, 0),
          _buildBottomNavigationBarItem(Icons.arrow_circle_up_outlined, 1),
          _buildBottomNavigationBarItem(Icons.handshake_outlined, 2),
          _buildBottomNavigationBarItem(Icons.credit_card_outlined, 3),
          _buildBottomNavigationBarItem(Icons.shopping_bag_outlined, 4),
        ],
        onTap: (index) {
          widget.onTap(index);
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/casa');
              break;
            case 1:
              Navigator.pushNamed(context, '/transferencia');
              break;
            case 2:
              Navigator.pushNamed(context, '/mistarjetas');
              break;
            case 3:
              Navigator.pushNamed(context, '/tarjetas');
              break;
            case 4:
              Navigator.pushNamed(context, '/servicios');
              break;
          }
        },
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: AnimatedBuilder(
        animation: _animations[index],
        builder: (context, child) {
          return Transform.scale(
            scale: _animations[index].value,
            child: Icon(
              icon,
              color: widget.currentIndex == index ? Colors.amber : Colors.white,
            ),
          );
        },
      ),
      label: '',
    );
  }
}
