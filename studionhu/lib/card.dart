import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'author_card.dart';
import 'app_theme.dart';

/*
 * Thêm trang Card cho ứng dụng
 * Nội dung card có các widget tùy biến
 * Hiệu chỉnh
 */
class Card1 extends StatelessWidget {
  const Card1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      //widget canh giữa cho các đối tượng con
      child: Container(
        //Container chứa khung ảnh
        padding: const EdgeInsets.all(16),
        width: 350, //rộng
        height: 500, //cao
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/mag5.png'), //thêm hình ảnh
              fit: BoxFit.cover),
          borderRadius:
              BorderRadius.all(Radius.circular(10.0)), //gốc ảnh bo tròn
        ),
        child: Column(
          children: [
            const AuthorCard(),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      'Phạm Văn Á',
                      style: AppTheme.lightTextTheme.displayLarge,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      //widget xoay đối tượng con
                      quarterTurns: 3, //xoay theo gốc 3/4
                      child: Text(
                        'Studio Như',
                        style: AppTheme.lightTextTheme.displayLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          /**
           * Thêm stack vào Column
           * Cần dùng widget Expanded
           * Khoảng trống còn lại sẽ được sử dụng hết cho stack
           */
        ),
      ),
    );
  }
}
