import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:meli_app_flutter/models/models.dart';

class CardSwiper extends StatelessWidget {
  final String query;
  final List<Result> resultsSeller;
  const CardSwiper(this.query, this.resultsSeller);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // if (!query.isEmpty)
    //   return Container(
    //     width: double.infinity,
    //     height: size.height * 0.5,
    //     child: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    return Container(
      padding: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: size.height * 0.5,
      // color: Colors.red,
      child: Swiper(
        itemCount: resultsSeller.length,
        layout: SwiperLayout.DEFAULT,
        viewportFraction: 0.51,
        scale: 0,
        // itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.47,
        itemBuilder: (_, int index) {
          final result = resultsSeller[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, "details", arguments: null),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"),
                image: NetworkImage(result.thumbnail),
                // image: NetworkImage("https://via.placeholder.com/300x400"),
                // image: NetworkImage(movie.fullPosterImag),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
