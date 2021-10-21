class BaseProductOption {
  String optionName;
  String optionValue;
  String optionMeta;
  double optionPrice;

  BaseProductOption(
      this.optionName, this.optionValue, this.optionMeta, this.optionPrice);

  BaseProductOption.fromJson(Map<String, dynamic> jsonObject) {
    this.optionName = jsonObject['option_name'];
    this.optionValue = jsonObject['option_value'];
    this.optionMeta = jsonObject['option_meta'];
    this.optionPrice = jsonObject['option_price'];
  }
}
