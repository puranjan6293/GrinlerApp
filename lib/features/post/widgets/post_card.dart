import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grinler/common/error_page.dart';
import 'package:grinler/common/loading_page.dart';
import 'package:grinler/constants/assets_constants.dart';
import 'package:grinler/core/enums/post_type_enum.dart';
import 'package:grinler/features/auth/controllers/auth_controller.dart';
import 'package:grinler/features/post/controller/post_controller.dart';
import 'package:grinler/features/post/view/grinler_reply_view.dart';
import 'package:grinler/features/post/widgets/carousel_image.dart';
import 'package:grinler/features/post/widgets/hashtag_text.dart';
import 'package:grinler/features/post/widgets/post_icon_button.dart';
import 'package:grinler/features/user_profile/view/user_profile_view.dart';
import 'package:grinler/model/post_model.dart';
import 'package:grinler/theme/pallete.dart';
import 'package:like_button/like_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends ConsumerWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    return currentUser == null
        ? const SizedBox()
        : ref.watch(UserDetailsProvider(post.uid)).when(
              data: (user) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      GrinlerReplyScreen.route(post),
                    );
                  },
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context, UserProfileView.route(user));
                              },
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.profilePic),
                                radius: 30,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (post.repostedBy.isNotEmpty)
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AssetsConstants.repostIcon,
                                        color: Pallete.greyColor,
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        '${post.repostedBy} reposted',
                                        style: const TextStyle(
                                          color: Pallete.greyColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        right: 0,
                                      ), //change for full width
                                      child: Text(
                                        user.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '@${user.name} . ${timeago.format(
                                            post.postedAt,
                                            locale: 'en_short',
                                          )}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Pallete.greyColor,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //replied to
                                if (post.repliedTo.isNotEmpty)
                                  ref
                                      .watch(
                                          getPostByIdProvider(post.repliedTo))
                                      .when(
                                        data: (repliedToPost) {
                                          final replyingToUser = ref
                                              .watch(UserDetailsProvider(
                                                  repliedToPost.uid))
                                              .value;
                                          return RichText(
                                            text: TextSpan(
                                              text: 'Replying to',
                                              style: const TextStyle(
                                                  color: Pallete.greyColor,
                                                  fontSize: 16),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      ' @${replyingToUser?.name}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                        error: (error, st) => ErrorText(
                                          error: error.toString(),
                                        ),
                                        loading: () => const SizedBox(),
                                      ),

                                //!Puranjan changed the ui
                                // HashtagText(text: post.text),

                                // if (post.postType == PostType.image)
                                //   CarouselImage(imageLinks: post.imageLinks),
                                // if (post.link.isNotEmpty) ...[
                                //   const SizedBox(height: 4),
                                //   AnyLinkPreview(
                                //     displayDirection:
                                //         UIDirection.uiDirectionHorizontal,
                                //     link: 'https://${post.link}',
                                //   ),
                                // ],
                                // Container(
                                //   margin: const EdgeInsets.only(
                                //     top: 10,
                                //     right: 20,
                                //   ),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       // PostIconButton(
                                //       //   pathName: AssetsConstants.viewsIcon,
                                //       //   text: (post.commentIds.length +
                                //       //           post.reshareCount +
                                //       //           post.likes.length)
                                //       //       .toString(),
                                //       //   onTap: () {},
                                //       // ),
                                //       PostIconButton(
                                //         pathName: AssetsConstants.commentIcon,
                                //         text: post.commentIds.length.toString(),
                                //         onTap: () {
                                //           Navigator.push(
                                //             context,
                                //             GrinlerReplyScreen.route(post),
                                //           );
                                //         },
                                //       ),
                                //       PostIconButton(
                                //         pathName: AssetsConstants.repostIcon,
                                //         text: post.reshareCount.toString(),
                                //         onTap: () {
                                //           ref
                                //               .read(postControllerProvider
                                //                   .notifier)
                                //               .resharePost(
                                //                 post,
                                //                 currentUser,
                                //                 context,
                                //               );
                                //         },
                                //       ),
                                //       LikeButton(
                                //         size: 25,
                                //         onTap: (isLiked) async {
                                //           ref
                                //               .read(postControllerProvider
                                //                   .notifier)
                                //               .likePost(
                                //                 post,
                                //                 currentUser,
                                //               );
                                //           return !isLiked;
                                //         },
                                //         isLiked: post.likes
                                //             .contains(currentUser.uid),
                                //         likeBuilder: (isLiked) {
                                //           return isLiked
                                //               ? SvgPicture.asset(
                                //                   AssetsConstants
                                //                       .likeFilledIcon,
                                //                   color: Pallete.redColor,
                                //                 )
                                //               : SvgPicture.asset(
                                //                   AssetsConstants
                                //                       .likeOutlinedIcon,
                                //                   color: Pallete.greyColor,
                                //                 );
                                //         },
                                //         likeCount: post.likes.length,
                                //         countBuilder:
                                //             (likeCount, isLiked, text) {
                                //           return Padding(
                                //             padding: const EdgeInsets.only(
                                //                 left: 2.0),
                                //             child: Text(
                                //               text,
                                //               style: TextStyle(
                                //                 color: isLiked
                                //                     ? Pallete.redColor
                                //                     : Pallete.whiteColor,
                                //                 fontSize: 16,
                                //               ),
                                //             ),
                                //           );
                                //         },
                                //       ),

                                //       //Save meme
                                //     ],
                                //   ),
                                // ),
                                // const SizedBox(height: 1),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //! Puranjan added here
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                            ),
                            child: HashtagText(text: post.text),
                          )),
                      if (post.postType == PostType.image)
                        CarouselImage(imageLinks: post.imageLinks),
                      if (post.link.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        AnyLinkPreview(
                          displayDirection: UIDirection.uiDirectionHorizontal,
                          link: 'https://${post.link}',
                        ),
                      ],
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, right: 30, left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // PostIconButton(
                            //   pathName: AssetsConstants.viewsIcon,
                            //   text: (post.commentIds.length +
                            //           post.reshareCount +
                            //           post.likes.length)
                            //       .toString(),
                            //   onTap: () {},
                            // ),
                            PostIconButton(
                              pathName: AssetsConstants.commentIcon,
                              text: post.commentIds.length.toString(),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  GrinlerReplyScreen.route(post),
                                );
                              },
                            ),
                            PostIconButton(
                              pathName: AssetsConstants.repostIcon,
                              text: post.reshareCount.toString(),
                              onTap: () {
                                ref
                                    .read(postControllerProvider.notifier)
                                    .resharePost(
                                      post,
                                      currentUser,
                                      context,
                                    );
                              },
                            ),
                            LikeButton(
                              size: 25,
                              onTap: (isLiked) async {
                                ref
                                    .read(postControllerProvider.notifier)
                                    .likePost(
                                      post,
                                      currentUser,
                                    );
                                return !isLiked;
                              },
                              isLiked: post.likes.contains(currentUser.uid),
                              likeBuilder: (isLiked) {
                                return isLiked
                                    ? SvgPicture.asset(
                                        AssetsConstants.likeFilledIcon,
                                        color: Pallete.redColor,
                                      )
                                    : SvgPicture.asset(
                                        AssetsConstants.likeOutlinedIcon,
                                        color: Pallete.greyColor,
                                      );
                              },
                              likeCount: post.likes.length,
                              countBuilder: (likeCount, isLiked, text) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Text(
                                    text,
                                    style: TextStyle(
                                      color: isLiked
                                          ? Pallete.redColor
                                          : Pallete.whiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              },
                            ),

                            //Save meme
                          ],
                        ),
                      ),
                      const SizedBox(height: 1),
                      const Divider(
                        color: Pallete.greyColor,
                      ),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) => ErrorText(
                error: error.toString(),
              ),
              loading: () => const Loader(),
            );
  }
}
