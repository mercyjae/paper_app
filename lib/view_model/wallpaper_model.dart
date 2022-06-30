class WallPaperModel{
 final String photographer;
 final String photographer_url;
final int photographer_id;
final SrcModel src;

  WallPaperModel({required this.photographer, required this.photographer_url,
    required this.photographer_id, required this.src});

  factory WallPaperModel.fromMap(Map<String, dynamic> jsonData){
    return WallPaperModel(
      src: SrcModel.fromMap(jsonData["src"]),
      photographer: jsonData["photographer"],
      photographer_id: jsonData["photographer_id"],
      photographer_url: jsonData["photographer_url"],
    );
  }
}

class SrcModel{
  final String original;
  final String small;
  final String portrait;

  SrcModel({required this.original,required this.small, required this.portrait});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData){
    return SrcModel(
      original: jsonData["original"],
      small: jsonData["small"],
      portrait: jsonData["portrait"]
    );
  }
}