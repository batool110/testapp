class TransactionModel {
    TransactionModel({
        this.date,
        this.amount,
        this.type,
        this.currencyCode,
        this.iban,
        this.description,
        this.bic,
        this.id,
    });

    DateTime date;
    String amount;
    Type type;
    String currencyCode;
    String iban;
    String description;
    String bic;
    String id;

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        date: DateTime.parse(json["date"]),
        amount: json["amount"],
        type: typeValues.map[json["type"]],
        currencyCode: json["currencyCode"],
        iban: json["iban"],
        description: json["description"],
        bic: json["bic"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "amount": amount,
        "type": typeValues.reverse[type],
        "currencyCode": currencyCode,
        "iban": iban,
        "description": description,
        "bic": bic,
        "id": id,
    };
}

enum Type { WITHDRAWAL, DEPOSIT, INVOICE, PAYMENT }

final typeValues = EnumValues({
    "deposit": Type.DEPOSIT,
    "invoice": Type.INVOICE,
    "payment": Type.PAYMENT,
    "withdrawal": Type.WITHDRAWAL
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
