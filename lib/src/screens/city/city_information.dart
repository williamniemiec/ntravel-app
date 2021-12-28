import 'package:flutter/material.dart';
import 'package:ntravel/src/config/locales_config.dart';
import 'package:ntravel/src/domain/city.dart';
import 'package:ntravel/src/utils/device_utils.dart';


/// Responsible for displaying city information on City screen.
class CityInformation extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final BuildContext screenContext;
  final City city;
  final bool isFavorited;
  final void Function(String) onFavoriteCity;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const CityInformation({
    Key? key,
    required this.screenContext,
    required this.city,
    required this.isFavorited,
    required this.onFavoriteCity
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 220),
          decoration: _buildContainerStyle(),
          child: Column(
            children: [
              _buildHeader(),
              _buildDescription(),
              _buildDivision(),
              _buildAttractionsTitle(context),
              _buildAttractionsBody()
            ]
          )
        )
      ]
    );
  }

  BoxDecoration _buildContainerStyle() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20), 
        topRight: Radius.circular(20)
      )
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildHeaderLeft(),
        _buildHeaderRight()
      ]
    );
  }

  Container _buildHeaderLeft() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCityName(),
          _buildCityReview()
        ]
      )
    );
  }

  Container _buildCityName() {
    const TextStyle textStyle = TextStyle(
      fontFamily: 'Helvetica Neue',
      fontSize: 19,
      fontWeight: FontWeight.bold
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        city.name,
        style: textStyle
      )
    );
  }

  Row _buildCityReview() {
    List<MaterialColor> reviewStarColors = _generateStarColors();
    const TextStyle reviewStyle = TextStyle(
      color: Colors.blue,
      fontSize: 11,
      fontWeight: FontWeight.bold
    );

    return Row(
      children: [
        Icon(Icons.star, color: reviewStarColors[0], size: 15),
        Icon(Icons.star, color: reviewStarColors[1], size: 15),
        Icon(Icons.star, color: reviewStarColors[2], size: 15),
        Icon(Icons.star, color: reviewStarColors[3], size: 15),
        Icon(Icons.star, color: reviewStarColors[4], size: 15),
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: Text(
            city.review.toStringAsFixed(2),
            style: reviewStyle
          )
        )
      ]
    );
  }

  Container _buildHeaderRight() {
    return Container(
        margin: const EdgeInsets.all(15),
        child: IconButton(
          icon: Icon(
            isFavorited ? Icons.favorite : Icons.favorite_border, 
            color: Colors.red
          ),
          onPressed: () => onFavoriteCity(city.name),
        )
      );
  }

  List<MaterialColor> _generateStarColors() {
    int reviewScoreRounded = city.review.floor();
    
    return [
      (reviewScoreRounded / 1 >= 1) ? Colors.blue : Colors.grey, 
      (reviewScoreRounded / 2 >= 1) ? Colors.blue : Colors.grey, 
      (reviewScoreRounded / 3 >= 1) ? Colors.blue : Colors.grey, 
      (reviewScoreRounded / 4 >= 1) ? Colors.blue : Colors.grey, 
      (reviewScoreRounded / 5 >= 1) ? Colors.blue : Colors.grey, 
    ];
  }

  Container _buildDescription() {
    const TextStyle textStyle = TextStyle(
      fontFamily: 'Helvetica Neue',
      fontSize: 11,
      fontWeight: FontWeight.bold,
      color: Colors.grey
    );

    return Container(
      margin: const EdgeInsets.only(
        top: 0, 
        left: 15, 
        right: 15, 
        bottom: 10
      ),
      child: Text(
        city.description,
        style: textStyle
      )
    );
  }

  Divider _buildDivision() {
    return const Divider(thickness: 1);
  }

  Container _buildAttractionsTitle(BuildContext screenContext) {
    LocalesConfig locale = LocalesConfig.of(screenContext)!;
    const TextStyle textStyle = TextStyle(
      fontFamily: 'Helvetica Neue',
      fontSize: 12,
      fontWeight: FontWeight.bold
    );

    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        locale.translate("MAIN_ATTRACTIONS").toUpperCase(),
        style: textStyle
      )
    );
  }

  GridView _buildAttractionsBody() {
    return GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.only(
        top: 0, 
        bottom: DeviceUtils.getFooterHeight(screenContext)
      ),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 10 / 11,
      children: List.generate(
        city.places.length, 
        (index) => _buildAttractionBox(index)
      )
    );
  }

  Container _buildAttractionBox(int cityIndex) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          _buildAttractionImage(cityIndex),
          _buildAttractionName(cityIndex)
        ]
      )
    );
  }

  Container _buildAttractionName(int cityIndex) {
    const TextStyle textStyle = TextStyle(
      fontFamily: 'Helvetica Neue',
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black
    );

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        city.places[cityIndex].name,
        style: textStyle
      )
    );
  }

  Expanded _buildAttractionImage(int cityIndex) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipRRect(
          child: Image.network(
            city.places[cityIndex].img,
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(20),
        )
      )
    );
  }
}
