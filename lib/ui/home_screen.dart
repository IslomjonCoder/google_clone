import 'package:flutter/material.dart';
import 'package:google_clone/models/universal_model.dart';
import 'package:google_clone/network/provider.dart';
import 'package:google_clone/ui/search_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  ApiProvider provider = ApiProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SearchScreen()),
    );
  }
}
