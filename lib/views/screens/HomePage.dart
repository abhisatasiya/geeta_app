import 'package:abhi_geeta_app/controllers/providers/json_decode_provider.dart';
import 'package:abhi_geeta_app/controllers/providers/theme_provider.dart';
import 'package:abhi_geeta_app/models/json_decode_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    await Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
        .loadJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9oI63STZMLprqKHmPnP35zuRxNHrEU-J-w&usqp=CAU"),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://e0.pxfuel.com/wallpapers/364/1016/desktop-wallpaper-dwarka-gujarat-temple-india-temple-graphy-krishna-temple-dwarkadhish-temple-thumbnail.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: Provider.of<ChapterJsonDecodeProvider>(context)
                      .chapterJsonDecodeModel
                      .allChapter
                      .length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://ih0.redbubble.net/image.3211954010.7373/raf,360x360,075,t,fafafa:ca443f4786.jpg'),
                                fit: BoxFit.cover)),
                        // color: Colors.blueGrey,
                        child: ListTile(
                          onTap: () {
                            chapterIndex = index;
                            Navigator.of(context).pushNamed("all_verses_page");
                          },
                          leading: Text(
                              "${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[index].id}"),
                          title: Text(Provider.of<ChapterJsonDecodeProvider>(
                                  context,
                                  listen: false)
                              .chapterJsonDecodeModel
                              .allChapter[index]
                              .nameHindi),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
