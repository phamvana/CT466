import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'home.dart';
// import 'card.dart';
import 'profile_page.dart';
import 'shop_page.dart';

/*
 * Flutter cung cấp cho chúng ta các Widget, tập các giao diện được đinh nghĩa sẵn.
 * Ứng dụng chạy hàm main()
 * Hàm main gọi đến hàm runApp có tham số MyApp().
 */
void main() {
  runApp(const MyApp());
}

//phamvana Định nghĩa lớp myApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.studioNhu();
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Xóa chữ debug trên máy ảo
      title: 'Phạm Văn Á Project',
      theme: theme, // gọi theme từ app_theme.dart
      home:
          /**
       * home là trang đầu tiên của app
       * ứng dụng gọi đến MyHomePage()
       */
          const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  /*
   * Trang Home được gọi đến
   * Sử dụng StatefulWidget là một widget có cập nhật lại trạng thái
   */
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 1; //định nghĩa biến đếm
  int _selectedIndex = 0; //biến acyive của bottomNavigationBar
  /*
   * Định nghĩa danh sách các trang
   * dùng để chuyển trang theo bottomNavigationBar đã cài đặt 
   */
  static final List<Widget> _pages = [
    // Container(color: Colors.red),
    const Home(),
    const ShopPage(),

    Container(color: Colors.yellow),
    // Container(color: Colors.green),
    ProfilesPage(),
  ];
  /*
   * Nội dung của app thể hiện tại đây.
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studio Như'),
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // backgroundColor: Colors.red,
        /**
         * Thanh menu phía trên của app được định nghĩa tại đây.
         * tại đây có thể tùy chỉnh định dạng của appBar.
         * backgroundColor
         */
        leading: IconButton(
          //thêm icon cho appBar
          onPressed: () {
            setState(() {
              //hàm cập nhật lại trạng thái của giao diện
              _selectedIndex = 0;
            });
          },
          icon: const Icon(Icons.home),
        ),
      ),
      body: _pages[_selectedIndex],
      /**
       * Hiệu chỉnh nội dung body
       * Lấy giá trị _selectedIndex trong List<Widget> 
       */
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text(
      //         'Chào mừng bạn!',
      //         style: TextStyle(fontSize: 20),
      //       ),
      //       const Text(
      //         'Bạn đã ấn số lần: ',
      //         style: TextStyle(fontSize: 20),
      //       ),
      //       Text(
      //         '$_counter',
      //         style: TextStyle(fontSize: 40),
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: NavigationBar(
        /**
         * Tạo NavigationBar, đây là một widget nằm trong scafold.
         * Tạo 3 icon và label theo yêu cầu
         */

        selectedIndex: _selectedIndex, //Lựa chọn active cho bottomNavigationBar
        onDestinationSelected: (index) {
          setState(() {
            //hàm cập nhật lại trạng thái của giao diện
            _selectedIndex = index;
          });

          // print(index); //in giá trị ra debug console để kiểm tra
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.image), label: 'Hình Ảnh'),
          NavigationDestination(icon: Icon(Icons.map), label: 'Bản đồ'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Thành viên'),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _counter++;
      //     });

      //     //print(_counter);
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
