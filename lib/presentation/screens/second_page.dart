import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    int currentpage = 0;

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('videos').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,

              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            scrollDirection: Axis.vertical,
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data();
              final url = data['video'] ?? '';
              final videoId = YoutubePlayerController.convertUrlToId(url) ?? '';

              if (videoId.isEmpty) return const Text("Некорректная ссылка");

              final controller = YoutubePlayerController.fromVideoId(
                videoId: videoId,
                params: const YoutubePlayerParams(
                  showControls: true,
                  showFullscreenButton: true,
                ),
              );

              return Container(
                height: 200,
                width: 100,
                decoration: BoxDecoration(),
                padding: const EdgeInsets.all(8.0),
                child: YoutubePlayer(controller: controller),
              );
            },
          );
        },
      ),
    );
  }
}
