import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripsflutterapp/categorymodel.dart';
import 'package:tripsflutterapp/repository.dart';
import 'package:tripsflutterapp/starrating.dart';
import 'package:tripsflutterapp/style.dart';
import 'package:tripsflutterapp/tripdetail.dart';
import 'package:tripsflutterapp/tripdetailmodel.dart';

List<TripDetails> tripList = getTripList();
List<CategoryModel> categoryModelList = getCategoryList();

List<Widget> categoryList = [
  _categoryIconListItem(categoryModelList[0]),
  _categoryIconListItem(categoryModelList[1]),
  _categoryIconListItem(categoryModelList[2]),
  _categoryIconListItem(categoryModelList[3]),
];

double screenHeight = 0.0;
double screenWidth = 0.0;

class HomeLayout extends StatefulWidget {
  HomeLayout({Key key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5.0,
              child: Image(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1551887488-13343d412680?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1868&q=80',
                ),
                fit: BoxFit.cover,
                height: 210,
                width: double.maxFinite,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Text(
                'Categories',
                style: appTheme.textTheme.headline5,
              ),
            ),
            Row(children: categoryList),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Text(
                'Recommended',
                style: appTheme.textTheme.headline5,
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: tripList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: _recommendedTripListItem(tripList[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripDetail(index),
                        ),
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

Widget _categoryIconListItem(CategoryModel categoryModel) {
  String asset = categoryModel.categoryImage;
  String categoryName = categoryModel.categoryTitle;

  return Flexible(
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          height: screenWidth / 4,
          width: screenWidth / 4,
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Image(
                image: AssetImage(
                  asset,
                ),
                fit: BoxFit.cover,
                height: 65,
                width: 65,
              ),
            ),
          ),
        ),
        Text(
          categoryName,
          style: appTheme.textTheme.bodyText1.copyWith(fontSize: 14.0),
        )
      ],
    ),
  );
}

Widget _recommendedTripListItem(TripDetails tripDetails) {
  return Flexible(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.grey[200],
        shape: BoxShape.rectangle,
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Image(
                image: NetworkImage(
                  tripDetails.tripImage,
                ),
                fit: BoxFit.cover,
                height: 65,
                width: 65,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                shape: BoxShape.rectangle,
              ),
              clipBehavior: Clip.antiAlias,
            ),
          ),
          Flexible(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tripDetails.tripTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: appTheme.textTheme.bodyText1.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  StarRating(
                    color: Colors.yellow,
                    onRatingChanged: null,
                    rating: tripDetails.rating.toDouble(),
                    starCount: 5,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
    ),
  );
}
