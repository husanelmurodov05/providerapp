import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/view/create_page_view_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CreatePageViewModel(),
        child: Consumer(
            builder: (context, CreatePageViewModel object, child) => Scaffold(
                  body: Center(
                      child: object.isLoading
                          ? CircularProgressIndicator.adaptive()
                          : Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    controller: object.bodyC,
                                    decoration:
                                        InputDecoration(hintText: 'body'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: object.titleC,
                                    decoration:
                                        InputDecoration(hintText: 'title'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            object.updatePost(context);
                                          },
                                          child: Text('Update')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            object.createPost(context);
                                          },
                                          child: Text('Post'))
                                    ],
                                  )
                                ],
                              ),
                            )),
                )));
  }
}
