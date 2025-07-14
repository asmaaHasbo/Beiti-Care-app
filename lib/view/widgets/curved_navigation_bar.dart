import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/feature/app/domain/repo/preferences_repository.dart';
import 'package:beiti_care/view/screens/api/dio_consumer.dart';
import 'package:beiti_care/view/screens/cubit/requests_cubit.dart';
import 'package:beiti_care/view/screens/cubit/services_cubit.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/more_user_screen.dart';
import '../screens/requests_user_screen.dart';
import '../screens/suggestions_screen.dart';
import '../screens/user_profile_screen.dart';
import '../screens/welcome_screen.dart';

class CurvedNavigationBarWidget extends StatefulWidget {
  final int currentIndex;

  const CurvedNavigationBarWidget({super.key, required this.currentIndex});

  @override
  State<CurvedNavigationBarWidget> createState() => _CurvedNavigationBarWidgetState();
}

class _CurvedNavigationBarWidgetState extends State<CurvedNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    String? id = getIt<PreferencesRepository>().getString("idUser");
    return Padding(
      padding: const EdgeInsets.only(right: 26, left: 26, bottom: 10, top: 0),
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
              // letIndexChange: (index) => true,

              items: <CurvedNavigationBarItem>[
                CurvedNavigationBarItem(
                  child: Icon(Icons.home,
                      size: 30,
                      color:
                      widget.currentIndex == 0 ? Color(0xFFB93439) : Color(0xFF797979)),
                  label: 'Home',
                  labelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color:
                      widget.currentIndex == 0 ? Color(0xFFB93439) : Color(0xFF797979)),
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.list_alt,
                      size: 30,
                      color:
                      widget.currentIndex == 1 ? Color(0xFFB93439) : Color(0xFF797979)),
                  label: 'Services',
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
                  label: 'Profile',
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
                  label: 'Requests',
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
                  label: 'More',
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

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BlocProvider(
                                    create: (context) =>
                                        RequestsCubit(
                                            NadaDioConsumer( dio: Dio())
                                        ),
                                    child: BlocProvider(
                                        create: (context) =>
                                        ServicesCubit(
                                            NadaDioConsumer(
                                                dio:
                                                Dio()))
                                          ..getServices(),
                                        child:
                                        WelcomeScreen()))));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const WelcomeScreen()));
                    break;
                  case 1:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>BlocProvider(
                              create: (context) => ServicesCubit(NadaDioConsumer(dio: Dio()))..getServices(),
                              child:  SuggestionsScreen(),
                            )
                            ));
                    break;

                  case 2:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfileScreen()));
                    break;

                  case 3:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>BlocProvider(
                              create: (context) => RequestsCubit(NadaDioConsumer(dio: Dio()))..getRequests(id),
                              child: RequestsUserScreen(),
                            )));
                    break;

                  case 4:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MoreUserScreen()));
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

// int index = 0;

//   BottomNavigationBar(
//     backgroundColor: Color(0xFFD9D9D9), // Ensures the background is consistent
//     selectedItemColor: Color(0xFFB93439), // Sets the color of the selected icons
//     unselectedItemColor: Color(0xFF797979), // Sets the color of unselected icons
//     showSelectedLabels: false, // Hides selected labels
//     // showUnselectedLabels: false, // Hides unselected labels
//     currentIndex: currentIndex, // Default selected index
//     type: BottomNavigationBarType.fixed, // Prevents animation on shifting types
//     items: [
//       BottomNavigationBarItem(
//         icon: SizedBox(
//           // height: 27.h, // Adjust icon size
//           child:
//             IconButton(onPressed: (){}, icon: Icon(Icons.home))
//           // Image.asset(
//           //   "assets/images/meteor-icons_home.png",
//           //   // color: currentIndex == 0 ? Colors.white : Colors.black,
//           //   fit: BoxFit.fill,
//           // ),
//         ),
//         // activeIcon: SizedBox(
//         //   // height: 27.h, // Active icon size adjustment
//         //   child: Image.asset(
//         //     "assets/images/meteor-icons_home.png",
//         //     color: currentIndex == 0 ? Colors.white : Colors.black,
//         //
//         //     fit: BoxFit.fill,
//         //   ),
//         // ),
//         label: "Home",
//       ),
//       BottomNavigationBarItem(
//         icon: SizedBox(
//           // height: 27.h, // Adjust icon size
//             child:
//             IconButton(onPressed: (){}, icon: Icon(Icons.list_alt))
//         ),
//         label: "Services",
//       ),
//       BottomNavigationBarItem(
//         icon: SizedBox(
//           // height: 27.h, // Adjust icon size
//             child:
//             IconButton(onPressed: (){}, icon: Icon(Icons.person))
//         ),
//         label: "Profile",
//       ),
//       BottomNavigationBarItem(
//         icon: SizedBox(
//           // height: 27.h, // Adjust icon size
//             child:
//             IconButton(onPressed: (){}, icon: Icon(Icons.playlist_add_check_sharp, ))
//         ),
//         label: "Requests",
//       ),BottomNavigationBarItem(
//         icon: SizedBox(
//           // height: 27.h, // Adjust icon size
//             child:
//             IconButton(onPressed: (){}, icon: Icon(Icons.menu))
//         ),
//         label: "More",
//       ),
//     ]
// );
//   }
// }

// final items = <Widget>[
//
//   Icon(Icons.home, size: 30, color: Color(0xFF797979),),
//   Icon(Icons.list_alt, size: 30, color: Color(0xFF797979),),
//   Icon(Icons.person, size: 30, color: Color(0xFF797979),),
//   Icon(Icons.playlist_add_check_sharp, size: 30, color: Color(0xFF797979),),
//   Icon(Icons.menu, size: 30, color: Color(0xFF797979),)
//   // Image.asset("assets/images/1.png", width: 30, height: 30),
//   // Image.asset("assets/images/2.png", width: 30, height: 30),
//   // Image.asset("assets/images/5.png", width: 25, height: 25),
//   // Image.asset("assets/images/3.png", width: 30, height: 30),
//   //
//   // Image.asset("assets/images/4.png", width: 30, height: 30),
// ];
