class TripDetails {
  int itemId;
  String tripImage;
  String tripTitle;
  String tripCategory;
  String tripPrice;
  String tripDescription;
  bool isFavorite;
  int rating;

  TripDetails();

  TripDetails.data(
      this.itemId,
      this.tripImage,
      this.tripTitle,
      this.tripCategory,
      this.tripPrice,
      this.tripDescription,
      this.isFavorite,
      this.rating);
}
