import 'package:abhi_geeta_app/controllers/providers/json_decode_provider.dart';
import 'package:abhi_geeta_app/models/json_decode_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllVersesPage extends StatefulWidget {
  const AllVersesPage({Key? key}) : super(key: key);

  @override
  State<AllVersesPage> createState() => _AllVersesPageState();
}

class _AllVersesPageState extends State<AllVersesPage> {
  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    await Provider.of<ShlokJsonDecodeProvider>(context, listen: false).loadJSON(
        Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
            .chapterJsonDecodeModel
            .allChapter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
              .chapterJsonDecodeModel
              .allChapter[chapterIndex]
              .nameTranslationEnglish,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCsjkB9O2VFaZA9L7ClgVQ7-qz3FAG778f0D5072N0JMkLtPBy5eQagXdP5YPJBNfwNB0&usqp=CAU"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListView.builder(
            itemCount: Provider.of<ShlokJsonDecodeProvider>(context)
                .shlokJsonDecodeModel
                .allShloks
                .length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => ListTile(
              tileColor: Colors.white38,
              onTap: () {
                shlokIndex = index;
                Navigator.of(context).pushNamed("shlok_detail_page");
              },
              leading: Text(
                Provider.of<ShlokJsonDecodeProvider>(context)
                    .shlokJsonDecodeModel
                    .allShloks[index]
                    .verse,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              title: Text(Provider.of<ShlokJsonDecodeProvider>(context)
                  .shlokJsonDecodeModel
                  .allShloks[index]
                  .sanskrit),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ],
      ),
    );
  }
}
