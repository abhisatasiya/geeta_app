import 'package:abhi_geeta_app/controllers/providers/json_decode_provider.dart';
import 'package:abhi_geeta_app/models/json_decode_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShlokDetailPage extends StatefulWidget {
  const ShlokDetailPage({Key? key}) : super(key: key);

  @override
  State<ShlokDetailPage> createState() => _ShlokDetailPageState();
}

class _ShlokDetailPageState extends State<ShlokDetailPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ShlokJsonDecodeProvider>(context, listen: false)
        .englishLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<ShlokJsonDecodeProvider>(context, listen: false)
            .shlokJsonDecodeModel
            .allShloks[shlokIndex]
            .verse),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                Provider.of<ShlokJsonDecodeProvider>(context, listen: false)
                    .shlokJsonDecodeModel
                    .allShloks[shlokIndex]
                    .sanskrit,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Divider(),
              Text(
                "Translation",
              ),
              Divider(),
              const SizedBox(
                height: 10,
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Provider.of<ShlokJsonDecodeProvider>(context, listen: false)
                      .englishLanguage();
                },
                child: const Text('English'),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Provider.of<ShlokJsonDecodeProvider>(context, listen: false)
                      .hindiLanguage();
                },
                child: const Text('Hindi'),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Provider.of<ShlokJsonDecodeProvider>(context, listen: false)
                      .gujaratiLanguage();
                },
                child: const Text('Gujarati'),
              ),
              Divider(),
              const SizedBox(
                height: 10,
              ),
              Text(
                Provider.of<ShlokJsonDecodeProvider>(context)
                    .shlokJsonDecodeModel
                    .allShloks[shlokIndex]
                    .translation,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
