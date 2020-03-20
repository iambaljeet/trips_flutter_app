import 'package:flutter/material.dart';
import 'package:tripsflutterapp/repository.dart';
import 'package:tripsflutterapp/starrating.dart';
import 'package:tripsflutterapp/style.dart';
import 'package:tripsflutterapp/tripdetailmodel.dart';

class TripDetail extends StatefulWidget {
  int index;
  List<TripDetails> tripDetailItemList;
  TripDetails tripDetails;

  TripDetail(int index) {
    this.index = index;
    this.tripDetailItemList = getTripList();
    this.tripDetails = tripDetailItemList[index];
  }

  @override
  _TripDetailState createState() => _TripDetailState();
}

class _TripDetailState extends State<TripDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            widget.tripDetails.tripImage,
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
          Opacity(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.grey[800],
                    Colors.grey[600],
                    Colors.grey[200]
                  ],
                ),
              ),
            ),
            opacity: 0.2,
          ),
          Positioned(
            top: 0.0,
            left: 10.0,
            child: SafeArea(
              child: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Text(widget.tripDetails.tripTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: appTheme.textTheme.bodyText2.copyWith(
                                color: Colors.white,
                                fontSize: 35,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.tripDetails.tripCategory,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: appTheme.textTheme.headline3
                                  .copyWith(color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          StarRating(
                            rating: widget.tripDetails.rating.toDouble(),
                            starCount: 5,
                            color: Colors.yellow,
                            onRatingChanged: null,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(widget.tripDetails.tripDescription,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: appTheme.textTheme.bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.tripDetails.tripPrice,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: appTheme.textTheme.bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 20,
                            ),
                            width: double.maxFinite,
                            child: RaisedButton(
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              onPressed: null,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text('Find Tickets',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: appTheme.textTheme.headline4
                                        .copyWith(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
