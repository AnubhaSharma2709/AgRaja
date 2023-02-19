import 'package:flutter/material.dart';

class Hospital extends StatelessWidget {
  final Function? onMapFunction;
  const Hospital({Key? key , this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              onMapFunction!('hospitals near me');
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Text('Hospitals')
        ],
      ),
    );
  }
}
