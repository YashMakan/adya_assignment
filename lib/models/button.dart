class Button {
  final String text;
  final int index;

  Button(this.text, this.index);

  factory Button.fromJson(Map<String, dynamic> json) => Button(
        json["buttonName"],
        json["buttonIndex"],
      );
}
