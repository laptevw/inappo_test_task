import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/bloc/example_bloc.dart';
import 'package:test_task/view/main/main_screen_states.dart';
import 'package:test_task/widgets/event_item.dart';
import 'package:test_task/widgets/navigation_button.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExampleBloc, MainScreenState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: (){},
              color: Colors.white,
              icon: Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                  icon: SvgPicture.asset('assets/images/leading_icon.svg'),
                  onPressed: (){})
            ],
          ),
          // Just a showcase of all event's states
            body: Column(
              children: [
                ClipPath(
                  child: Container(
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/mock.png')
                              ),
                              borderRadius: BorderRadius.circular(27),
                              border: Border.all(
                                color: Colors.white,
                                width: 2
                              )
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text('User Name', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text('Lorem ipsum', style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                          ),
                          ),
                          SizedBox(height: 12,),
                          Text('Lorem ipsum', style: TextStyle(
                              fontSize: 14,
                              color: Colors.white54
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NavigationButton(
                            badgeNumber: 10,
                            iconImage: SvgPicture.asset(
                                'assets/images/document_icon.svg',
                                width: 20,
                                height: 20,
                            ),
                            labelText: 'Contract',
                        ),

                        NavigationButton(
                          badgeNumber: 0,
                          iconImage: SvgPicture.asset(
                              'assets/images/wallet_icon.svg',
                            width: 20,
                            height: 20,
                          ),
                          labelText: 'Finance',
                        ),

                        NavigationButton(
                          badgeNumber: 0,
                          iconImage: SvgPicture.asset(
                              'assets/images/gallery_icon.svg',
                            width: 20,
                            height: 20,
                          ),
                          labelText: 'Photos',
                        ),

                        NavigationButton(
                          badgeNumber: 0,
                          iconImage: SvgPicture.asset(
                              'assets/images/video_icon.svg',
                            width: 20,
                            height: 20,
                          ),
                          labelText: 'Movies',
                        ),

                        NavigationButton(
                          badgeNumber: 0,
                          iconImage: SvgPicture.asset(
                              'assets/images/location_icon.svg',
                            width: 20,
                            height: 20,
                          ),
                          labelText: 'Location',
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      EventItem(
                        canAddEvent: true,
                        canAccept: false,
                        isCompleted: false,
                        isPending: true,
                        numberOfSubevents: 3,
                      ),
                      EventItem(
                        canAddEvent: false,
                        canAccept: false,
                        isCompleted: true,
                        isPending: false,
                        numberOfSubevents: 0,
                      ),
                      EventItem(
                        canAddEvent: false,
                        canAccept: true,
                        isCompleted: false,
                        isPending: false,
                        numberOfSubevents: 0,
                      ),
                      EventItem(
                        canAddEvent: true,
                        canAccept: true,
                        isCompleted: false,
                        isPending: false,
                        numberOfSubevents: 2,
                      ),
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}
