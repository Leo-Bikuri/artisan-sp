import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'skills_record.g.dart';

abstract class SkillsRecord
    implements Built<SkillsRecord, SkillsRecordBuilder> {
  static Serializer<SkillsRecord> get serializer => _$skillsRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'image_url')
  String get imageUrl;

  @nullable
  String get charge;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SkillsRecordBuilder builder) => builder
    ..name = ''
    ..imageUrl = ''
    ..charge = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('skills');

  static Stream<SkillsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SkillsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SkillsRecord._();
  factory SkillsRecord([void Function(SkillsRecordBuilder) updates]) =
      _$SkillsRecord;

  static SkillsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSkillsRecordData({
  String name,
  String imageUrl,
  String charge,
}) =>
    serializers.toFirestore(
        SkillsRecord.serializer,
        SkillsRecord((s) => s
          ..name = name
          ..imageUrl = imageUrl
          ..charge = charge));
