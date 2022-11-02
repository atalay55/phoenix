import 'package:phoenix/Entity/Mesage.dart';

class ProductValidator {

  checkProductName(String name) {
    Message msg = Message();
    if (name.isEmpty) {
      msg.message = "product ismi boş geçilemez";
      msg.isCorrect = false;
      return msg.message;
    }

    if (name.contains(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]'))) {
      msg.message = "Geçersiz product isim";
      msg.isCorrect = false;
      return msg.message;
    }

    msg.isCorrect = true;
    return null;
  }
  checkPrductPrice(String price) {
    Message msg = Message();
    if (price.isEmpty) {
      msg.message = "price boş geçilemez";
      msg.isCorrect = false;
      return msg.message;
    }
    if(!price.contains(RegExp(r"[0123456]"))){
      msg.message = "price rakam bulanması gerekir";
      msg.isCorrect = false;
      return msg.message;
    }

    if(price.contains(RegExp(r"[a-zA-Z]"))){
      msg.message = "price kısmında harf bulanamaz";
      msg.isCorrect = false;
      return msg.message;
    }

    msg.isCorrect = true;
    return null;
  }
  checkPrductPiece(String price) {
    Message msg = Message();
    if (price.isEmpty) {
      msg.message = "piece boş geçilemez";
      msg.isCorrect = false;
      return msg.message;
    }
    if(!price.contains(RegExp(r"[0123456]"))){
      msg.message = "piece rakam bulanması gerekir";
      msg.isCorrect = false;
      return msg.message;
    }

    if(price.contains(RegExp(r"[a-zA-Z]"))){
      msg.message = "piece kısmında harf bulanamaz";
      msg.isCorrect = false;
      return msg.message;
    }

    msg.isCorrect = true;
    return null;
  }
  checkPrductImage(String image) {

    Message msg = Message();
    if (image.isEmpty) {
      msg.message = "image boş geçilemez";
      msg.isCorrect = false;
      return msg.message;
    }


    msg.isCorrect = true;
    return null;
  }

  checkPrductDesc(String desc) {

    Message msg = Message();
    if (desc.isEmpty) {
      msg.message = " Hakkında alanı boş geçilemez";
      msg.isCorrect = false;
      return msg.message;
    }


    msg.isCorrect = true;
    return null;
  }



}
