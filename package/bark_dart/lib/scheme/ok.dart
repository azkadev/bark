// ignore_for_file: non_constant_identifier_names
import "json_dart.dart";
// import "dart:convert";



class Ok extends JsonScheme {

  
  Ok(super.rawData);
   
  static Map get defaultData {
    return {"@type":"ok"};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }


  
  static Ok create({

    String special_type = "ok",
})  {
    // Ok ok = Ok({

    Ok ok_data_create = Ok({
  
      "@type": special_type,


  });
 
// return ok;
return ok_data_create;



      }
}