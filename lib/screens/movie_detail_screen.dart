import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants.dart';
import 'package:movie_app/constants/image_const.dart';

class MovieDetailScreen extends StatefulWidget {
  final Map<String, dynamic> movieData;
  const MovieDetailScreen({required this.movieData, Key? key})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imageSection(context),
            _movieInfoContainer(context),
            const SizedBox(
              height: 48,
            ),
            _movieSummary(),
            const SizedBox(
              height: 48,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleWidget(
                    "Cast & Crew",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.movieData['cast'].length ?? 0,
                    itemBuilder: (context, index) {
                      return _castImageWidget(
                        widget.movieData['cast'][index],
                        "Director",
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Column _castImageWidget(String name, String role) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(avatar),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          name,
          style: fontstyleMedium(fontSize: 16),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          role,
          style: fontstyleMedium(
            fontSize: 16,
            color: blackColor.withOpacity(0.5),
          ),
        )
      ],
    );
  }

  Container _movieSummary() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleWidget(
            "Plot Summary",
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.",
            style: fontstyleMedium(
              fontSize: 16,
              color: blackColor.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }

  Text _titleWidget(String title) {
    return Text(
      title,
      style: fontstyleSemiBold(fontSize: 24),
    );
  }

  Column _movieInfoContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      widget.movieData['title'] ?? "-",
                      style: fontstyleBold(
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (widget.movieData["year"] ?? "-").toString(),
                          style: fontstyleMedium(
                            fontSize: 16,
                            color: blackColor.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          "PG-13",
                          style: fontstyleMedium(
                            fontSize: 16,
                            color: blackColor.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          "2h 32min",
                          style: fontstyleMedium(
                            fontSize: 16,
                            color: blackColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      _chipWidget("Action"),
                      _chipWidget("Biography"),
                      _chipWidget("Drama"),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: pinkColor,
                ),
                child: const Icon(
                  Icons.add,
                  color: whiteColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Container _chipWidget(String title) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.only(right: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: grayColor,
        ),
      ),
      child: Text(
        title,
        style: fontstyleSemiBold(
          fontSize: 16,
          color: secondaryColor,
        ),
      ),
    );
  }

  SizedBox _imageSection(BuildContext context) {
    return SizedBox(
      height: 365,
      child: Stack(
        children: [
          Image.asset(
            movieDetailImage,
          ),
          _backArrowButton(context),
          Positioned(
            bottom: 20,
            child: Container(
              height: 109,
              width: 438 - 60,
              margin: const EdgeInsets.only(left: 32),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: grayColor.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  _ratingColumn(),
                  _rateThisStarWidget(),
                  _metaScoreWidget(),
                  const SizedBox(
                    width: 0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _metaScoreWidget() {
    return SizedBox(
      height: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 24,
            width: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: greenColor,
            ),
            child: Text(
              "86",
              style: fontstyleMedium(
                fontSize: 14,
                color: whiteColor,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Metascore",
            style: fontstyleSemiBold(
              fontSize: 16,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "62 critic reviews",
            style: fontstyleMedium(
              color: blackColor.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _rateThisStarWidget() {
    return SizedBox(
      height: 72,
      child: Column(
        children: [
          Image.asset(
            starEmpty,
            height: 32,
            width: 32,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Rate This",
            style: fontstyleSemiBold(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _ratingColumn() {
    return SizedBox(
      height: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            starFilled,
            height: 32,
            width: 32,
          ),
          const SizedBox(
            height: 4,
          ),
          RichText(
            text: TextSpan(
              text: '8.2',
              style: fontstyleSemiBold(
                fontSize: 16,
                color: primaryColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '/10',
                  style: fontstyleSemiBold(
                    color: secondaryColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "150,212",
            style: fontstyleMedium(
              color: blackColor.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }

  Positioned _backArrowButton(BuildContext context) {
    return Positioned(
      top: 56,
      left: 32,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 24,
        ),
      ),
    );
  }
}
