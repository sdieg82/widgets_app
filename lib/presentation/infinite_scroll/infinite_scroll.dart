import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScroll extends StatefulWidget {
  static const name = 'infinite_scroll';
  const InfiniteScroll({super.key});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return false;
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 2));

    addFiveImages();
    isLoading = false;
    //TODO revisar si está montado el componente/widget
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
    
  }

  void moveScrollToBottom(){
    if(scrollController.position.pixels+150 <= scrollController.position.maxScrollExtent){
    return ;
    }
    scrollController.animateTo(
      scrollController.position.pixels +120,
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 2));
    if (!isMounted) return;
    final lastId = imagesIds.last;
    isLoading = true;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text('Infinite scroll'),
      // ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: AssetImage('assets/Images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/200/300',
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: _ViewSpinWidget(context),
    );
  }

  FloatingActionButton _ViewSpinWidget(BuildContext context) {
    if (isLoading) {
      return FloatingActionButton(
        onPressed: () => context.pop(),
        child: SpinPerfect(infinite: true, child: Icon(Icons.refresh_rounded)),
      );
    }
    return FloatingActionButton(
      onPressed: () => context.pop(),
      child: FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)),
    );
  }
}
