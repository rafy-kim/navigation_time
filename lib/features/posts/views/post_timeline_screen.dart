import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/features/posts/view_models/timeline_view_model.dart';
import 'package:thread_clone/features/posts/views/widgets/post.dart';

class PostTimelineScreen extends ConsumerStatefulWidget {
  const PostTimelineScreen({super.key});

  @override
  PostTimelineScreenState createState() => PostTimelineScreenState();
}

class PostTimelineScreenState extends ConsumerState<PostTimelineScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // 스크롤이 맨 아래에 도달했을 때
      ref.read(timelineProvider.notifier).fetchNextPage();
    }
  }

  Future<void> _onRefresh() {
    return ref.read(timelineProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(timelineProvider).when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(
              "could not load posts: $error",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          data: (posts) {
            return RefreshIndicator(
              onRefresh: _onRefresh,
              displacement: 50,
              edgeOffset: 20,
              color: Theme.of(context).primaryColor,
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  const SliverAppBar(
                    // snap: true,
                    floating: true,
                    stretch: true,
                    // backgroundColor: Colors.white,
                    // elevation: 1,
                    collapsedHeight: 80,
                    expandedHeight: 120,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 10,
                      ),
                      stretchModes: [
                        StretchMode.blurBackground,
                        StretchMode.zoomBackground,
                        StretchMode.fadeTitle
                      ],
                      // background: Image.network(
                      //   "https://mblogthumb-phinf.pstatic.net/MjAyMjA5MjNfMjcx/MDAxNjYzOTEzMjI2MjEw.FBd103pylVi-nZy3nWW9iLXgMhWp8TLj_TF6FwNUVO0g.lArVFBKhdY0T4_PD1WTjH47UFK5KdCZhu0XZ9zLBIZcg.JPEG.vavidolls/DSC06687.JPG?type=w800",
                      //   fit: BoxFit.cover,
                      // ),
                      title: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: FaIcon(
                          FontAwesomeIcons.threads,
                          size: 36,
                        ),
                      ),
                    ),
                  ),

                  SliverList.separated(
                    itemCount: posts.length,
                    itemBuilder: (context, index) => Post(
                      userName: posts[index].userName,
                      content: posts[index].content,
                      imgs: posts[index].imgs ?? [],
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 0.5,
                    ),
                  ),

                  // MakeList(scrollController: _scrollController, posts: posts)
                ],
              ),
            );
          },
        );
  }
}
