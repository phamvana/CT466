// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'app_theme.dart';

class ProfilesPage extends StatelessWidget {
  ProfilesPage({super.key});

  final List<Profile> _profiles = Profile.loadProfiles(100);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /**
         * widget text phía trên Listview
         * định dạng text
         */
        const Text(
          'Danh sách thành viên',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Expanded(
          /**
           * Dùng widget Expanded lấy phần còn lại của column
           * lồng ListView vào expanded
           */
          child: ListView.builder(
            itemCount: _profiles.length,
            itemBuilder: (BuildContext context, int index) {
              final profile = _profiles[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(profile.image),
                ),
                title: Text(profile.name),
                subtitle: Text(profile.diengiai),
                trailing: const Icon(Icons.more_vert),
              );
              // Text(_profiles[index].name);
            },
          ),
        ),
      ],
    );
  }
}

//Model Profiles
class Profile {
  final String name;
  final String diengiai;
  final String image;

  const Profile(this.name, this.diengiai, this.image);

  static List<Profile> loadProfiles(int count) {
    return List.generate(
      count,
      (index) => Profile('Số thứ tự: $index', 'Mô tả: $index',
          'assets/avatars/avatar-${(index % 10) + 1}.png'),
    );
  }
}
