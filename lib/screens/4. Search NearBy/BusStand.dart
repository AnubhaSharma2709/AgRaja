import 'package:flutter/material.dart';

class BusStand extends StatelessWidget {
  final Function? onMapFunction;
  const BusStand({Key? key , this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              onMapFunction!('bus stand near me');
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Text('Bus Stand')
        ],
      ),
    );
  }
}
