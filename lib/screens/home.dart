import 'package:flutter/material.dart';
import 'package:flutter_slivers/models/post.dart';
import 'package:flutter_slivers/models/story.dart';
import 'package:flutter_slivers/shared/post_card.dart';
import 'package:flutter_slivers/shared/story_card.dart';
import 'package:uuid/uuid.dart';

class Home extends StatelessWidget {
  final Uuid uuid = const Uuid();

  const Home({Key? key}) : super(key: key);

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
              // stretch: true,
              // floating: true,
              // snap: true,
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
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return StoryCard(
                      story: Story(
                        id: index,
                        imageUrl: 'https://picsum.photos/100/180?${uuid.v4()}',
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(4.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PostCard(
                      post: Post(id: index),
                    );
                  },
                  childCount: 3,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return StoryCard(
                      story: Story(
                        id: index,
                        imageUrl: 'https://picsum.photos/100/180?${uuid.v4()}',
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(4.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PostCard(
                      post: Post(id: index),
                    );
                  },
                  childCount: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
