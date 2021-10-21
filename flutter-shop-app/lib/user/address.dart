class Address {
  String streetName;
  String streetNumber;
  String country;
  String city;
  String state;
  String postalCode;

  Address.fromJson(Map<String, dynamic> jsonObject) {
    this.streetName = jsonObject['street_name'];
    this.streetNumber = jsonObject['street_number'];
    this.city = jsonObject['city'];
    this.country = jsonObject['country'];
    this.state = jsonObject['state'];
    this.postalCode = jsonObject['postal_code'];
  }
}
