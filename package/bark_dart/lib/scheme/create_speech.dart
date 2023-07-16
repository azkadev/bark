// ignore_for_file: non_constant_identifier_names
import "json_dart.dart";
// import "dart:convert";



class CreateSpeech extends JsonScheme {

  
  CreateSpeech(super.rawData);
   
  static Map get defaultData {
    return {"@type":"createSpeech","text":""};
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


  
  String? get text {
    try {
      if (rawData["text"] is String == false){
        return null;
      }
      return rawData["text"] as String;
    } catch (e) {
      return null;
    }
  }


  
  static CreateSpeech create({

    String special_type = "createSpeech",
    String? text,
})  {
    // CreateSpeech createSpeech = CreateSpeech({

    CreateSpeech createSpeech_data_create = CreateSpeech({
  
      "@type": special_type,
      "text": text,


  });
 
// return createSpeech;
return createSpeech_data_create;



      }
}