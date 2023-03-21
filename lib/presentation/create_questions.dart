
import 'package:flutter/material.dart';

class CreateQuestions extends StatelessWidget {
  const CreateQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Questions', style: TextStyle(color:Colors.black87)),
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: [
          TextField(),
          ElevatedButton(onPressed: (){}, child: Text('Create Question'))
        ],),
      ),
    );
  }
}
