import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'app_theme.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  /*
   * Thêm text cho ứng dụng
   */
  final String category = 'thẻ';
  final String title = 'Ảnh Thẻ';
  final String description = 'ảnh thẻ học sinh, sinh viên, nhân viên';
  final String auth = "Copyright PhamVanA";
  @override
  Widget build(BuildContext context) {
    return Center(
      //widget canh giữa cho các đối tượng con
      child: Container(
        //Container chứa khung ảnh
        padding: const EdgeInsets.all(16),
        width: 350, //rộng
        height: 460, //cao
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/1.jpg'), //thêm hình ảnh
              fit: BoxFit.cover),
          borderRadius:
              BorderRadius.all(Radius.circular(10.0)), //gốc ảnh bo tròn
        ),
        child: Stack(
          //thêm Stack
          children: [
            //thêm text là các con của stack
            Text(
              category, //nội dung text
              style: AppTheme.lightTextTheme.bodyLarge, //định dạng text
            ),
            Positioned(
              top: 20,
              child: Text(
                title,
                style: AppTheme.darkTextTheme.displayMedium,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 2,
              child: Text(
                description,
                style: AppTheme.lightTextTheme.bodyLarge,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                auth,
                style: AppTheme.darkTextTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
