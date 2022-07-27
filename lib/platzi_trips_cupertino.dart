import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/Place/ui/screens/home_trips.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/ui/screens/profile_trips.dart';
import 'package:trips_app/Place/ui/screens/search_trip.dart';

class PlatziTripsCupertino extends StatelessWidget {
  const PlatziTripsCupertino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.indigo)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.indigo)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.indigo)),
        ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => const HomeTrips(
                  descriptionDummy:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                ),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => const SearchTrips(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                      child: ProfileTrips(), bloc: UserBloc());
                },
              );
            default:
              return CupertinoTabView(
                  builder: (BuildContext context) => const HomeTrips(
                        descriptionDummy: '',
                      ));
          }
        },
      ),
    );
  }
}
