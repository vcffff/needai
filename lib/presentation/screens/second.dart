import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:needai/presentation/themes/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtubepage extends StatefulWidget {
  const Youtubepage({super.key});

  @override
  State<Youtubepage> createState() => _YoutubepageState();
}

class _YoutubepageState extends State<Youtubepage> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    const videourl = 'https://youtu.be/2SUwOgmvzK4?si=xj89-jNSiKAdH_Vt';
    final videoId = YoutubePlayer.convertUrlToId(videourl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: maincolor,
    );
  }
}

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  String cleanYoutubeUrl(String rawUrl) {
    rawUrl = rawUrl.replaceAll('"', '').trim();

    final uri = Uri.tryParse(rawUrl);
    if (uri == null) return '';

    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.first;
    }

    if (uri.queryParameters.containsKey('v')) {
      return uri.queryParameters['v']!;
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('videos').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final rawUrl = data['video'] ?? '';
              final videoId = cleanYoutubeUrl(rawUrl);

              if (videoId.isEmpty) {
                return const Text('Некорректная ссылка');
              }

              final controller = YoutubePlayerController(
                initialVideoId: videoId,
                flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
              );

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
