import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder_fake/models/post_model.dart';
import 'package:jsonplaceholder_fake/models/todos_model.dart';

class JsonplaceholderApi {
  final dio = Dio();

  Future<TodosModel> getToDos() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    if (response.statusCode == 200) {
      TodosModel toDos1 = TodosModel.fromJson(response.data);
      return toDos1;
    }
    throw Exception('Aconteceu um erro!');
  }

  void addPost(context, String title, String body, int userId) async {
    PostModel post = PostModel(title: title, body: body, userId: userId);
    try {
      final response =
          await dio.post('https://jsonplaceholder.typicode.com/posts',
              data: post.toJson(),
              options: Options(headers: {
                'Content-Type': 'application/json; charset=UTF-8',
              }));
      print('Resposta do Servidor: ${response.data}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Executado com sucesso!')));
    } catch (erro) {
      print('Erro ao adicionar o post: $erro');
    }
  }
}
