import 'package:flutter/material.dart';
import 'package:google_clone/models/organic_model.dart';
import 'package:google_clone/models/search_model.dart';
import 'package:google_clone/models/universal_model.dart';
import 'package:google_clone/network/provider.dart';
import 'package:google_clone/ui/widgets/custom_card_widget.dart';
import 'package:google_clone/utils/colors.dart';
import 'package:google_clone/utils/images.dart';
import 'package:google_clone/utils/style.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ApiProvider provider = ApiProvider();
  bool isEnd = false;
  ScrollController scrollController = ScrollController();

  TextEditingController textEditingController = TextEditingController();
  int page = 0;
  int count = 10;
  String queryText = '';
  List<OrganicModel> results = [];

  fetchData() async {
    page++;

    final result = await provider.searchFromGoogle(
        query: 'Apple inc', page: page, count: count) as UniversalModel;

    if (result.statusCode == 200) {
      results.addAll(result.data.organic);
      setState(() {});
    }
  }

  @override
  void initState() {
    fetchData();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          isEnd = true;
          fetchData();
        } else {
          isEnd = false;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppImages.google,
            height: 70,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              controller: textEditingController,
              style: AppStyle.subhead,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    textEditingController.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: AppColors.cE0E0E0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
            controller: scrollController,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final res = results[index];

              return CustomCard(model: res);
            },
            padding: EdgeInsets.all(16),
            itemCount: results.length,
          )),
          Visibility(child: Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}
