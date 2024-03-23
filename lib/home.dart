import 'package:e_store/home_appbar.dart';
import 'package:e_store/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar()
                ],)
            ),
          ],
          ),
          ),
    );
    
  }
}



