import 'package:app/components/controller/image_controller.dart';
import 'package:app/widgets/card/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Список'),
      ),
      body: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Фотографії',
                            style: Theme.of(context).textTheme.titleLarge),

                        Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Logo_of_Unsplash.svg/1024px-Logo_of_Unsplash.svg.png', width: 50,)
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(                    
                    height: MediaQuery.of(context).size.height * .8,
                    child: GetX<ImageController>(
                        init: ImageController(),
                        builder: (controller) {
                          return controller.loadImages.value
                              ? Center(
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator.adaptive(),
                                    SizedBox(height: 10),
                                    Text('Завантаження...')
                                  ],
                                ))
                              : controller.images == null
                                  ? Center(child: Text('Даних немає'))
                                  : GridView.builder(
                                      primary: false,
                                      padding: const EdgeInsets.all(0.0),
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio: 1.7 / 2,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                      itemCount: controller.images.length,
                                      itemBuilder: (context, index) {
                                        var image = controller.images[index];
                                        return ImageCard(model: image);
                                      },
                                    );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ярослав Лук\'янчук',
                            style: Theme.of(context).textTheme.caption),

                         Text('yarikthe@gmail.com',
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}
