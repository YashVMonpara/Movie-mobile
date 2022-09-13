import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants.dart';
import 'package:movie_app/constants/image_const.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';
import 'package:movie_app/service/api_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic>? _movieDataResponse;
  bool _isLoading = false;

  int selectedIndex = 0;

  @override
  void initState() {
    getMovieDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 56,
                  ),
                  _topIconsRow(),
                  _tabbarWidget(),
                  _movieTypeChipRow(),
                  const SizedBox(
                    height: 72,
                  ),
                  _carouselWidget()
                ],
              ),
            ),
    );
  }

  CarouselSlider _carouselWidget() {
    return CarouselSlider(
      options: CarouselOptions(height: 600, viewportFraction: 0.76),
      items: _movieDataResponse!.map(
        (movieObj) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MovieDetailScreen(
                          movieData: movieObj,
                        );
                      },
                    ),
                  );
                },
                child: SizedBox(
                  // height: 1000,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(moviePoster),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      _movieTitle(movieObj),
                      const SizedBox(
                        height: 10,
                      ),
                      _ratingWIdget()
                    ],
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }

  Text _movieTitle(movieObj) {
    return Text(
      movieObj['title'],
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: fontstyleBold(
        fontSize: 32,
        color: primaryColor,
      ),
    );
  }

  Row _ratingWIdget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          starFilled,
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "8.2",
          style: fontstyleSemiBold(
            fontSize: 18,
          ),
        )
      ],
    );
  }

  Container _movieTypeChipRow() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 32, top: 48),
      height: 40,
      child: ListView.builder(
        itemCount: movieTypes.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _movieTypeChipWidget(movieTypes[index]);
        },
      ),
    );
  }

  Container _tabbarWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 32, top: 48),
      height: 60,
      child: ListView.builder(
        itemCount: tabBarTitles.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _movieTypeWidget(index);
        },
      ),
    );
  }

  Container _movieTypeChipWidget(String title) {
    return Container(
      height: 40,
      width: 105,
      margin: const EdgeInsets.only(right: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: grayColor,
        ),
      ),
      child: Text(
        title,
        style: fontstyleBold(
          fontSize: 20,
          color: secondaryColor,
        ),
      ),
    );
  }

  GestureDetector _movieTypeWidget(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 40),
            child: Text(
              tabBarTitles[index],
              style: fontstyleBold(
                color: selectedIndex == index ? primaryColor : grayColor,
              ),
            ),
          ),
          selectedIndex == index ? _pinkIndicatorWidget() : Container(),
        ],
      ),
    );
  }

  Positioned _pinkIndicatorWidget() {
    return Positioned(
      bottom: 0,
      child: Container(
        width: 40,
        height: 6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: pinkColor,
        ),
      ),
    );
  }

  Padding _topIconsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Image.asset(
            menuIcon,
            height: 24,
            width: 24,
          ),
          const Spacer(),
          Image.asset(
            searchIcon,
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }

  getMovieDataFromApi() async {
    setState(() {
      _isLoading = true;
    });
    List? movieDataResponse = await APIHelper().getMovieData();

    if (movieDataResponse != null) {
      _movieDataResponse = movieDataResponse;
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
