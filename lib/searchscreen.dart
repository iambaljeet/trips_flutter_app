import 'package:flutter/material.dart';
import 'package:tripsflutterapp/repository.dart';
import 'package:tripsflutterapp/starrating.dart';
import 'package:tripsflutterapp/style.dart';
import 'package:tripsflutterapp/tripdetail.dart';
import 'package:tripsflutterapp/tripdetailmodel.dart';

List<TripDetails> tripList = getTripList();

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: appTheme.textTheme.headline5,
        ),
      ),
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.grey[200],
                    shape: BoxShape.rectangle,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: TextField(
                    maxLines: 1,
                    scrollPadding: EdgeInsets.all(8.0),
                    autocorrect: false,
                    textInputAction: TextInputAction.search,
                    onChanged: (filter) {},
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter a search term'),
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
                        child: tripListItem(tripList[index]),
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
        ),
      ),
    );
  }

  tripListItem(TripDetails tripDetails) {
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
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Icon(Icons.favorite_border),
            )
          ],
        ),
      ),
    );
  }
}
