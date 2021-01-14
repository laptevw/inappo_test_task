import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EventItem extends StatelessWidget {
  // Mock parameters
  bool canAccept;
  bool canAddEvent;
  bool isPending;
  bool isCompleted;
  int numberOfSubevents;

  EventItem(
      {this.canAccept = false,
      this.canAddEvent = false,
      this.isPending = false,
      this.isCompleted = false,
      this.numberOfSubevents = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Dec 18, 2020',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Visibility(
                          visible: isCompleted && !canAddEvent,
                          child: Chip(
                            label: Text('Completed',
                                style: TextStyle(color: Colors.white)),
                          )),
                      Visibility(
                          visible: canAddEvent && !isCompleted,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(Icons.add, color: Colors.white),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  Text('15:00',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Videoclip', style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Stanford, CA',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  Visibility(
                      visible: canAccept,
                      child: Column(
                        children: [
                          Divider(),
                          Row(
                            children: [
                              Text('Would You Like Accept It?',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black54)),
                              Spacer(),
                              MaterialButton(
                                height: 26,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.green,
                                onPressed: () {},
                                child: Text('Accept',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              MaterialButton(
                                height: 26,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.red,
                                onPressed: () {},
                                child: Text('Remove',
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: numberOfSubevents > 0,
          child: Padding(
              padding: const EdgeInsets.all(8.0), child: _buildSubItemsList()),
        )
      ],
    );
  }

  _buildSubItemsList() => ListView.builder(
      shrinkWrap: true,
      itemCount: numberOfSubevents,
      itemBuilder: (context, index) => TimelineTile(
            beforeLineStyle: LineStyle(thickness: 1),
            afterLineStyle: LineStyle(thickness: 1),
            endChild: Container(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('15:00',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Visibility(
                              visible: isCompleted,
                              child: Chip(
                                label: Text(
                                  'Completed',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text('Videoclip', style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 16,
                      ),
                      Text('Stanford, CA',
                          style:
                              TextStyle(fontSize: 14, color: Colors.black54)),
                      Visibility(
                          visible: isPending,
                          child: Column(
                            children: [
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                      'Your studio is still rewieving this proposal',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black54)),
                                  Spacer(),
                                  Chip(
                                    backgroundColor: Colors.amber,
                                    label: Text(
                                      'Pending',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            indicatorStyle:
                IndicatorStyle(color: Theme.of(context).primaryColor),
          ));
}
