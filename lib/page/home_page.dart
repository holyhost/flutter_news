import 'package:flutter/material.dart';
import './entity/page_model.dart';
import 'component/cata_type_component.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getCataIcons()
    .then((icons){
      print(icons.toString());
    })
    .catchError((e){
      print(e);
    });

    return Container(
      child: CataTypeComponent(),
    );
  }
}
