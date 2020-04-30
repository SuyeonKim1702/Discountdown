class Ad {
  String kind, name, repeat;
  int price, startDiscount, timeGap, discountGap, downNum, plusOne, plusTwo, storeId, storeUserId;
  DateTime startTime, endTime, startDay, endDay;
  bool full;


  Ad.fromJson(Map map) {
  this.kind = map['kind'];
  this.name = map['name'];
  this.repeat = map['repeat'];

  this.price = map['price'];
  this.startDiscount = map['startdiscount'];
  this.timeGap = map['timegap'];
  this.discountGap = map['discountgap'];
  this.downNum = map['downnum'];    //서버에서 고치기
  this.plusOne = map['plusone'];
  this.plusTwo = map['plustwo'];
  this.storeId = map['store_id'];
  this.storeUserId = map['storeuser_id'];

  this.startTime = map['starttime'];
  this.endTime = map['endtime'];
  this.startDay = map['startday'];
  this.endDay = map['endday'];

  this.full = map['full'];
  }
}