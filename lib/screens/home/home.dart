import 'package:aikata_v2/constants/consts.dart';
import 'package:aikata_v2/screens/cart/cart_scren.dart';
import 'package:aikata_v2/screens/category/category_screen.dart';
import 'package:aikata_v2/screens/home/home_screen.dart';
import 'package:aikata_v2/screens/profile/profile_screen.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _page = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _page[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: 'Anasayfam',
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 1 ? IconlyBold.bag : IconlyLight.bag),
              label: 'Kategorilerim',
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
              label: 'Sepetim',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? IconlyBold.profile
                  : IconlyLight.profile),
              label: 'Profilim',
            ),
          ],
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: turuncu,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF9E9E9E),
          ),
          unselectedItemColor: const Color(0xFF9E9E9E),
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: turuncu,
          onTap: _onItemTapped,
        ));
  }
}
