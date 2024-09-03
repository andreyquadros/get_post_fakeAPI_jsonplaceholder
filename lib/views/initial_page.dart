import 'package:flutter/material.dart';
import 'package:jsonplaceholder_fake/routes/app_routes.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Página Inicial',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text('Menu - Opções: '),
            SizedBox(height: 30,),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),
                onPressed: (){
              Navigator.pushNamed(context, AppRoutes.get_page);
            }, child: Text('Executar uma Operação GET', style: TextStyle(color: Colors.white),)),
            ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),
                onPressed: (){
              Navigator.pushNamed(context, AppRoutes.post_page);
            }, child: Text('Executar uma Operação POST', style: TextStyle(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
