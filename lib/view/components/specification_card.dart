import 'package:flutter/material.dart';

class SpecificationCard extends StatelessWidget {
  final String title;
  final String content;
  const SpecificationCard({
    super.key,
    required this.title,
    this.content = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        gradient:const LinearGradient(
  colors: [
    Color.fromARGB(255, 0, 4, 40),
    Color.fromARGB(255, 0, 78, 146),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            
            Text(
              title,
              style:
            const  TextStyle(
                fontWeight: FontWeight.w500,
             fontSize:   18,
                color: Colors.white,
              ),
              
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style:const TextStyle(
                fontWeight: FontWeight.w400,
             fontSize:   15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
