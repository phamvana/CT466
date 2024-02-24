import 'package:flutter/material.dart';
import 'app_theme.dart';

/*
 * Chuyển từ StatelessWidget thành StatefulWidget
 */
class AuthorCard extends StatefulWidget {
  const AuthorCard({super.key});

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceBetween, //canh điều khoảng cách giữa 2 thành phần trong row
      children: [
        /**
         * Tạo thêm Row chứa 2 thành phần avata và text column
         * Row chứa 1 row và 1 icon để dễ dàng canh chỉnh khoảng cách
         */

        Row(
          children: [
            //avatar
            const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/pva.jpg'),
            ),
            //sizeBox để cách một khoảng
            const SizedBox(
              width: 10,
            ),
            //text column
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, //canh lề trái cho 2 text con phía dưới
              children: [
                Text(
                  "Phạm Văn Á",
                  style: AppTheme.lightTextTheme.displayMedium,
                ),
                Text(
                  'Designer',
                  style: AppTheme.lightTextTheme.displaySmall,
                ),
              ],
            ),
          ],
        ),
        IconButton(
          /*
          * Thêm icon cho auth card
          * Hình trái tim
          * click vào có hiệu ứng
          * Cách làm là thêm 1 biến vào, nếu true thì trái tim màu đỏ
          */
          onPressed: () {
            setState(() {
              _isFavorite = !_isFavorite;
            });

            // print(_isFavorite); // in biến ra để kiểm tra
          },
          icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
          color: Colors.red,
        ),
        //IconButton
      ],
    );
  }
}
