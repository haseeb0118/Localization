import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization_part2/provider.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Local(),
      locale: Locale('en','US'),


      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final List locale = [
    {'name': 'English','locale' : Locale('en','US')},
    {'name': 'Urdu','locale' : Locale('ur','🇵🇰')},
    {'name': 'Pashto','locale' : Locale('ps','🇦🇫')},
  ];

  updatelanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }
  builddialog(BuildContext context){
    showDialog (context: context,builder: (builder){
      return AlertDialog(
        title: Text('Choose a language'),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context ,index){
                return Padding(
                    padding : const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        updatelanguage(locale[index]['locale']);
                      },
                        child: Text(locale[index]['name'])),
                   );
              },
              separatorBuilder: (context ,index){
                return Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('local'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 70.0,right: 50.0,top: 100.0),
            child :Form(
              key: _key,
              child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  child: Center(
                    child: Text(
                      'Person_info'.tr,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight:  FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name'.tr,
                    hintText: 'ent_u_name'.tr,
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email'.tr,
                    hintText: 'ent_u_email'.tr,
                  ),
                ),
                SizedBox(height: 30.0),
                InkWell(
                  onTap: (){
                    builddialog(context);


                  },
                  child: Container(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width-120,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        'chgeLanguage'.tr,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
        ),
      )

    );
  }
}
