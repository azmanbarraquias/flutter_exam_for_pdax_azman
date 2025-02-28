import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_exam_for_pdax_azman/models/persons.dart';
import 'package:flutter_exam_for_pdax_azman/view/my_favourite_page.dart';
import 'package:flutter_exam_for_pdax_azman/view/person_detail_page.dart';
import 'package:get/get.dart';
import '../controller/favourites_controller.dart';
import '../services/remote_service.dart';
import '../widgets/person_list_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _hasMore = true;
  int _page = 1;
  final int _limitPerFetch = 10; // Number of items per request
  final int _totalLimit = 40; // Maximum items before stopping

  Persons? persons;
  List<Datum> personList = [];

  var customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: Duration(days: 1),
      maxNrOfCacheObjects: 2000,
    ),
  );

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    getData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        (Theme.of(context).platform == TargetPlatform.windows) ||
        (Theme.of(context).platform == TargetPlatform.macOS);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actionsPadding: EdgeInsets.only(right: 10),
        actions: [favouriteBtn()],
      ),
      floatingActionButton:
          isDesktop
              ? FloatingActionButton(
                onPressed: onRefresh,
                tooltip: 'Refresh Page',
                child: const Icon(Icons.refresh),
              )
              : null, // T
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: personList.isNotEmpty ? personsList() : loadingWidget(),
      ),
    );
  }

  Widget favouriteBtn() {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.favorite_outline, size: 30, color: Colors.red),
          onPressed: () {
            Get.to(MyFavouritePage());
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Text(
            'Favorite',
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Future<void> _loadMoreData() async {
    if (!_isLoading && _hasMore) {
      getData();
    }
  }

  Widget personsList() {
    final FavoritesController favoritesController = Get.find();

    return ListView.builder(
      controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: personList.length + 1,
      itemBuilder: (ctx, index) {
        if (index < personList.length) {
          final personData = personList[index];
          final personURL = 'https://picsum.photos/200/300?random=$index';

          return Obx(
            () => PersonListItem(
              key: ValueKey(personData.id),
              name: '${index + 1}. ${personData.getFullName()}',
              email: personData.email,
              image: personURL,
              onTap: () {
                Get.to(
                  PersonDetailPage(),
                  arguments: {
                    'id': personData.id,
                    'name': personData.getFullName(),
                    'email': personData.email,
                    'image': personURL,
                  },
                );
              },
              isFev: favoritesController.isFavorite(personData),
              fevTap: () {
                if (favoritesController.isFavorite(personData)) {
                  favoritesController.removeFavorite(personData);
                } else {
                  favoritesController.addFavorite(personData);
                }
              },
            ),
          );
        } else {
          return _hasMore ? loadingIndicator() : noMoreDataWidget();
        }
      },
    );
  }

  Widget loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget noMoreDataWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          "No more data available",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Please Wait . . . '),
        ],
      ),
    );
  }

  void getData() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    Persons? newPersons = await RemoteService().getPersons(
      quantity: _limitPerFetch,
      page: _page,
    );

    if (newPersons != null && newPersons.data.isNotEmpty) {
      setState(() {
        personList.addAll(newPersons.data);
        _page++;

        // Stop loading if we reach the total limit
        if (personList.length >= _totalLimit) {
          _hasMore = false;
        }

        _isLoading = false;
      });
    } else {
      setState(() {
        _hasMore = false;
        _isLoading = false;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      _loadMoreData();
    }
  }

  Future<void> onRefresh() async {
    setState(() {
      persons = null;
      _hasMore = true;
      _page = 1;
      personList.clear();
    });
    getData();
  }
}
