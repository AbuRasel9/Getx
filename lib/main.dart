/*
//getx use korte hole MaterialApp ke GetMaterialApp use korte hoi
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //getx use korte hole MaterialApp ke GetMaterialApp use korte hoi
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //set state use na kore button a click korlei button a increment hobe
  //set state carai rebuild hoi
  RxInt _counter = 0.obs;

  void _incrementCounter() {
    _counter++;
    //when counter increment than show message
    Get.snackbar(
        snackPosition:SnackPosition.BOTTOM,
        "Increment", "Increment Successfull");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            //set state na use kore getx use koreci
            //Obx diye oi je value change hobe oita lekhte hoi
            Obx(
              () => Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
                onPressed: () {

                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SecondPage()));
                  //use Getx to go to next page
                  Get.to(SecondPage());
                  //getx use kore snackbar use koreci
                  Get.snackbar("Hi", "Next Page Gone, Successfully");
                },
                child: const Text("Go to Next Page"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//Second Page
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is Second Page "),
      ),

    );
  }
}
