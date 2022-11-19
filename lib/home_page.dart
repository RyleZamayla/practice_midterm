import 'package:flutter/material.dart';
import 'package:practice_final/models/person_model.dart';
import 'package:practice_final/tabs/people_tabs.dart';
import 'package:practice_final/tabs/person_tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController tabController;

  List<PersonModel> person_list = [];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        leading: Icon(Icons.home),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Icon(Icons.person),
            Icon(Icons.people)
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Person(person_list: person_list,),
          People()
        ],
      ),
    );
  }
}
