import 'package:flutter/material.dart';
import 'package:flutter_slivers/shared/main_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.add_alert),
                onPressed: () {
                  print('On leading tap');
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    print('Button 1 clicked');
                  },
                  icon: const Icon(Icons.ac_unit),
                )
              ],
              stretch: true,
              floating: true,
              snap: true,
              pinned: true,
              expandedHeight: 200,
              onStretchTrigger: () async {
                print('onStretchTrigger');
              },
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text('Slivers Fun'),
                background: Image.asset(
                  'assets/images/app_bar_bg.jpg',
                  fit: BoxFit.cover,
                ),
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                ],
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                builder,
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? builder(BuildContext context, int index) {
    if (index > 0 && index % 4 == 0) {
      return SliverToBoxAdapter(
        child: SliverList(
          delegate: SliverChildListDelegate([
            Card(
              color: Colors.blue,
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Test 1'),
              ),
            ),
            Card(
              color: Colors.blue,
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Test 2'),
              ),
            ),
          ]),
        ),
      );
    } else if (index > 0 && index % 2 == 0) {
      return Container(
        height: 10,
        width: 10,
        color: Colors.red,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 16,
        child: SizedBox(
          height: 50,
          width: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$index'),
          ),
        ),
      ),
    );
  }
}
