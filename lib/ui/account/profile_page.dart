import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
    _modalBottomSheetMenu(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(82, 81, 112, 1),
    );
  }

  void _modalBottomSheetMenu(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
        //backgroundColor: const Color.fromRGBO(82, 81, 112, 1),
          context: context,
          isScrollControlled: true,
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
              bottom: Radius.circular(30),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          builder: (builder) {
            return GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.85,
                color: Colors.white,
                padding: EdgeInsets.all(20),
              ),
            );
          });
    });
  }

}
