import 'package:flutter/material.dart';
import 'package:jsonplaceholder_fake/models/todos_model.dart';
import 'package:jsonplaceholder_fake/services/jsonplaceholder_api.dart';

class GetPage extends StatefulWidget {
  const GetPage({Key? key}) : super(key: key);

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  bool isLoading = false;
  bool isInitialized = false;
  TodosModel? toDos1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Recuperar ToDo1',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue)),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                  isInitialized = false;
                });
                toDos1 = await JsonplaceholderApi().getToDos();
                setState(() {
                  isLoading = false;
                  isInitialized = true;
                });
              },
              child: Center(
                child: Text(
                  'Recuperar Dados Via Get',
                  style: TextStyle(color: Colors.white),
                ),
              )),
          if (isLoading == true && isInitialized == false)
            CircularProgressIndicator()
          else if (isLoading == false &&
              isInitialized == true &&
              toDos1 != null)
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  children: [
                    Text('UserId: ${toDos1!.userId}'),
                    Text('Id: ${toDos1!.id}'),
                    Text('Title: ${toDos1!.title}'),
                    Text('Completed: ${toDos1!.completed}'),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
