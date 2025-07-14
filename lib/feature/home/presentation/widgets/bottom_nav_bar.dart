import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../services/add_image_to_profile_cubit.dart';
import '../../../more/presentation/screens/more_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../requests/presentation/screens/requests_screen.dart';
import '../../../wallet/presentation/screens/wallet_screen.dart';
import '../screens/home_screen.dart';


class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26, left: 26, bottom: 10, top: 10),
      child: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: 93,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: CurvedNavigationBar(
              index: widget.currentIndex,
              height: 65,
              color: Color(0xFFD9D9D9), // This will be the bar's color
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Color(0xFFD9D9D9),
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),

              items: <CurvedNavigationBarItem>[
                CurvedNavigationBarItem(
                  child: Icon(Icons.home,
                      size: 30,
                      color:
                      widget.currentIndex == 0 ? Color(0xFFB93439) : Color(0xFF797979)),
                  label: 'Home'.tr(),
                  labelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color:
                      widget.currentIndex == 0 ? Color(0xFFB93439) : Color(0xFF797979)),
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.account_balance_wallet,
                      size: 30,
                      color:
                      widget.currentIndex == 1 ? Color(0xFFB93439) : Color(0xFF797979)),
                  label: 'Wallet'.tr(),
                  labelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color:
                      widget.currentIndex == 1 ? Color(0xFFB93439) : Color(0xFF797979)),
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.person,
                      size: 30,
                      color:
                      widget.currentIndex == 2 ? Color(0xFFB93439) : Color(0xFF797979)),
                  label: 'Profile'.tr(),
                  labelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color:
                      widget.currentIndex == 2 ? Color(0xFFB93439) : Color(0xFF797979)),
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.playlist_add_check_sharp,
                      size: 30,
                      color:
                      widget.currentIndex == 3 ? Color(0xFFB93439) : Color(0xFF797979)),
                  label: 'Requests'.tr(),
                  labelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color:
                      widget.currentIndex == 3 ? Color(0xFFB93439) : Color(0xFF797979)),
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.menu,
                      size: 30,
                      color:
                      widget.currentIndex == 4 ? Color(0xFFB93439) : Color(0xFF797979)),
                  label: 'More'.tr(),
                  labelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: widget.currentIndex == 4
                          ? Color(0xFFB93439)
                          : Color(0xFF797979)),
                ),
              ],
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                    break;
                  case 1:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WalletScreen()));
                    break;

                  case 2:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                providers: [
                BlocProvider<AddImageToProfileCubit>(create: (_) => AddImageToProfileCubit()),

                ], child:  ProfileScreen()

                            ))
                );

                    break;

                  case 3:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequestsScreen()));
                    break;

                  case 4:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MoreScreen()));
                    break;

                }
            
              },
            ),
          ),
        ),
      ]),
    );
  }
}