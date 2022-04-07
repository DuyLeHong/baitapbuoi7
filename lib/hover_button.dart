import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// cái logic app này muốn:
// khi người dùng di ngón tay vào button này, thì nó phải đổi màu xanh

class HoverButton extends StatelessWidget {
  const HoverButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.orange,
      ),
      onTap: () {},
    );
  }
}
