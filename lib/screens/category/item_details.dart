import 'package:aikata_v2/constants/consts.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(IconlyLight.send)),
          IconButton(onPressed: () {}, icon: const Icon(IconlyLight.send)),
        ],
      ),
    );
  }
}
