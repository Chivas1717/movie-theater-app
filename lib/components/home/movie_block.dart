import 'package:flutter/material.dart';

class MovieBlock extends StatelessWidget {
  const MovieBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('assets/imgs/test_movie.png'),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3f06080c),
                  offset: Offset(0, 16),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.fromLTRB(100, 0, 0, 190),
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0xffff7f36),
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3fff8036),
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  '7.9',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 1.2575,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'The Batman',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'Action',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
