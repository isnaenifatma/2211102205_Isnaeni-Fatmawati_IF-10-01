import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CommentsScreen(),
    );
  }
}

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List comments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  Future<void> fetchComments() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        comments = jsonDecode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception("Failed to load comments");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comments")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(comment['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(comment['body']),
                    trailing: Icon(Icons.comment, color: Colors.blue),
                  ),
                );
              },
            ),
    );
  }
}
