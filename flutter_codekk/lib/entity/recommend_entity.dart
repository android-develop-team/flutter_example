import 'package:json_annotation/json_annotation.dart';

part 'recommend_entity.g.dart';

@JsonSerializable()
class RecommendEntity extends Object with _$RecommendEntitySerializerMixin {
  final DataEntity data;
  final int code;
  final String message;

  factory RecommendEntity.fromJson(Map<String, dynamic> json) =>
      _$RecommendEntityFromJson(json);

  RecommendEntity(this.data, this.code, this.message);
}

@JsonSerializable()
class DataEntity extends Object with _$DataEntitySerializerMixin {
  final List<RecommendArrayEntity> recommendArray;

  factory DataEntity.fromJson(Map<String, dynamic> json) =>
      _$DataEntityFromJson(json);

  DataEntity(this.recommendArray);
}

@JsonSerializable()
class RecommendArrayEntity extends Object
    with _$RecommendArrayEntitySerializerMixin {
  @JsonKey(name: '_id')
  final String id;
  final bool toCodeKKWx;
  final bool isDelete;
  final String createTime;
  final String url;
  final String title;
  final String desc;
  final String type;
  final String userName;
  final String codeKKUrl;
  final bool isFavorite;
  final String encodeUrl;
  final List<ArticleTagsEntity> articleTags;
  final List<String> contentTypes;

  factory RecommendArrayEntity.fromJson(Map<String, dynamic> json) =>
      _$RecommendArrayEntityFromJson(json);

  RecommendArrayEntity(
      this.id,
      this.toCodeKKWx,
      this.isDelete,
      this.createTime,
      this.url,
      this.title,
      this.desc,
      this.type,
      this.userName,
      this.codeKKUrl,
      this.isFavorite,
      this.encodeUrl,
      this.articleTags,
      this.contentTypes);
}

@JsonSerializable()
class ArticleTagsEntity extends Object with _$ArticleTagsEntitySerializerMixin {
  final String createTime;
  final String name;
  final String userName;
  final String type;

  factory ArticleTagsEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleTagsEntityFromJson(json);

  ArticleTagsEntity(this.createTime, this.name, this.userName, this.type);
}
