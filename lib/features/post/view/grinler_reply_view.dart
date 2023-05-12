import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grinler/common/common.dart';
import 'package:grinler/constants/constants.dart';
import 'package:grinler/features/post/controller/post_controller.dart';
import 'package:grinler/features/post/widgets/post_card.dart';
import 'package:grinler/model/post_model.dart';

class GrinlerReplyScreen extends ConsumerWidget {
  static route(Post post) => MaterialPageRoute(
        builder: (context) => GrinlerReplyScreen(
          post: post,
        ),
      );
  final Post post;
  const GrinlerReplyScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostCard(post: post),
            ref.watch(getRepliesToPostsProvider(post)).when(
                  data: (posts) {
                    // any time we get data
                    // new post will be added
                    return ref.watch(getLatestPostProvider).when(
                          data: (data) {
                            final latestPost = Post.fromMap(data.payload);

                            bool isPostAlreadyPresent = false;
                            for (final postModel in posts) {
                              if (postModel.id == latestPost.id) {
                                isPostAlreadyPresent = true;
                                break;
                              }
                            }
                            if (!isPostAlreadyPresent &&
                                latestPost.repliedTo == post.id) {
                              if (data.events.contains(
                                'databases.*.collections.${AppwriteConstants.postsCollection}.documents.*.create',
                              )) {
                                posts.insert(0, Post.fromMap(data.payload));
                              } else if (data.events.contains(
                                'databases.*.collections.${AppwriteConstants.postsCollection}.documents.*.update',
                              )) {
                                final startingPoint =
                                    data.events[0].lastIndexOf('documents.');

                                final endPoint =
                                    data.events[0].lastIndexOf('.update');

                                final postId = data.events[0]
                                    .substring(startingPoint + 10, endPoint);

                                var post = posts
                                    .where((element) => element.id == postId)
                                    .first;

                                final postIndex = posts.indexOf(post);
                                posts.removeWhere(
                                    (element) => element.id == postId);

                                post = Post.fromMap(data.payload);
                                posts.insert(postIndex, post);
                              }
                            }

                            return Expanded(
                              child: ListView.builder(
                                itemCount: posts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final post = posts[index];
                                  return PostCard(post: post);
                                },
                              ),
                            );
                          },
                          error: (error, stackTrace) => ErrorText(
                            error: error.toString(),
                          ),
                          loading: () {
                            // as long its loading show a list view builder
                            return Expanded(
                              child: ListView.builder(
                                itemCount: posts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final post = posts[index];
                                  return PostCard(post: post);
                                },
                              ),
                            );
                          },
                        );
                  },
                  error: (error, stackTrace) => ErrorText(
                    error: error.toString(),
                  ),
                  loading: () => const Loader(),
                )
          ],
        ),
      ),
      bottomNavigationBar: TextField(
        onSubmitted: (value) {
          ref.read(postControllerProvider.notifier).sharePost(
            images: [],
            text: value,
            context: context,
            repliedTo: post.id,
            repliedToUserId: post.uid,
          );
        },
        decoration: const InputDecoration(
          hintText: "Write your reply",
        ),
      ),
    );
  }
}
