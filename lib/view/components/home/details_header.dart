import 'package:b_pointer/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsHeader extends StatelessWidget {
  final int idx;
  const DetailsHeader({super.key, required this.idx});

  @override
  Widget build(BuildContext context) {
    final vModel = context.watch<HomeViewModel>();
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.width * 0.6,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 49, 92),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          // Image
          Positioned(
            top: 50,
            left: 50,
            right: 50,
            bottom: 10,
            child: Image.network(
              vModel.productModelData[idx].image!,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
