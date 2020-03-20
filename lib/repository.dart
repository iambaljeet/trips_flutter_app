import 'package:tripsflutterapp/categorymodel.dart';
import 'package:tripsflutterapp/tripdetailmodel.dart';

String description =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
    " when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

List<TripDetails> getTripList() {
  List<TripDetails> recommendedTripList = [
    TripDetails.data(
        1,
        'https://images.unsplash.com/photo-1537996194471-e657df975ab4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1954&q=80',
        'Flight to Bali',
        'Trip',
        '\$100',
        description,
        false,
        5),
    TripDetails.data(
        2,
        'https://images.unsplash.com/photo-1505761671935-60b3a7427bad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
        'Flight to London',
        'Trip',
        '\$200',
        description,
        false,
        5),
    TripDetails.data(
        3,
        'https://images.unsplash.com/flagged/photo-1562503542-2a1e6f03b16b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1936&q=80',
        'Flight to Singapore',
        'Trip',
        '\$550',
        description,
        false,
        5),
    TripDetails.data(
        4,
        'https://images.unsplash.com/photo-1519451241324-20b4ea2c4220?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
        'Flight to Thailand',
        'Trip',
        '\$150',
        description,
        false,
        5),
    TripDetails.data(
        5,
        'https://images.unsplash.com/photo-1534430480872-3498386e7856?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
        'Flight to New York',
        'Trip',
        '\$250',
        description,
        false,
        5),
  ];
  return recommendedTripList;
}

List<CategoryModel> getCategoryList() {
  List<CategoryModel> categoryList = [
    CategoryModel.data(1, 'assets/images/icons/airplane.png', 'Flights'),
    CategoryModel.data(1, 'assets/images/icons/hotel.png', 'Hotels'),
    CategoryModel.data(1, 'assets/images/icons/calendar.png', 'Events'),
    CategoryModel.data(1, 'assets/images/icons/car.png', 'Cars')
  ];
  return categoryList;
}
