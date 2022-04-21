import 'package:flutter/material.dart';
import 'package:http_provider/providers/data_class.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataClass(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Demo"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: postModel.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: postModel.post!.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(postModel.post!.data![index].firstName!+ " " + postModel.post!.data![index].lastName! ),
                    subtitle: Text(postModel.post!.data![index].email!),
                  );
                },
              ),
      ),
    );
  }
}
