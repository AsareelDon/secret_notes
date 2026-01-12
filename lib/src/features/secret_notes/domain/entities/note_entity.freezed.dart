// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteEntity {

 int? get noteId; String get noteTitle; String get noteContent; DateTime get creationDate; DateTime? get lastEditDate;
/// Create a copy of NoteEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteEntityCopyWith<NoteEntity> get copyWith => _$NoteEntityCopyWithImpl<NoteEntity>(this as NoteEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteEntity&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.noteTitle, noteTitle) || other.noteTitle == noteTitle)&&(identical(other.noteContent, noteContent) || other.noteContent == noteContent)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastEditDate, lastEditDate) || other.lastEditDate == lastEditDate));
}


@override
int get hashCode => Object.hash(runtimeType,noteId,noteTitle,noteContent,creationDate,lastEditDate);

@override
String toString() {
  return 'NoteEntity(noteId: $noteId, noteTitle: $noteTitle, noteContent: $noteContent, creationDate: $creationDate, lastEditDate: $lastEditDate)';
}


}

/// @nodoc
abstract mixin class $NoteEntityCopyWith<$Res>  {
  factory $NoteEntityCopyWith(NoteEntity value, $Res Function(NoteEntity) _then) = _$NoteEntityCopyWithImpl;
@useResult
$Res call({
 int? noteId, String noteTitle, String noteContent, DateTime creationDate, DateTime? lastEditDate
});




}
/// @nodoc
class _$NoteEntityCopyWithImpl<$Res>
    implements $NoteEntityCopyWith<$Res> {
  _$NoteEntityCopyWithImpl(this._self, this._then);

  final NoteEntity _self;
  final $Res Function(NoteEntity) _then;

/// Create a copy of NoteEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? noteId = freezed,Object? noteTitle = null,Object? noteContent = null,Object? creationDate = null,Object? lastEditDate = freezed,}) {
  return _then(_self.copyWith(
noteId: freezed == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as int?,noteTitle: null == noteTitle ? _self.noteTitle : noteTitle // ignore: cast_nullable_to_non_nullable
as String,noteContent: null == noteContent ? _self.noteContent : noteContent // ignore: cast_nullable_to_non_nullable
as String,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastEditDate: freezed == lastEditDate ? _self.lastEditDate : lastEditDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NoteEntity].
extension NoteEntityPatterns on NoteEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteEntity value)  $default,){
final _that = this;
switch (_that) {
case _NoteEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NoteEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? noteId,  String noteTitle,  String noteContent,  DateTime creationDate,  DateTime? lastEditDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteEntity() when $default != null:
return $default(_that.noteId,_that.noteTitle,_that.noteContent,_that.creationDate,_that.lastEditDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? noteId,  String noteTitle,  String noteContent,  DateTime creationDate,  DateTime? lastEditDate)  $default,) {final _that = this;
switch (_that) {
case _NoteEntity():
return $default(_that.noteId,_that.noteTitle,_that.noteContent,_that.creationDate,_that.lastEditDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? noteId,  String noteTitle,  String noteContent,  DateTime creationDate,  DateTime? lastEditDate)?  $default,) {final _that = this;
switch (_that) {
case _NoteEntity() when $default != null:
return $default(_that.noteId,_that.noteTitle,_that.noteContent,_that.creationDate,_that.lastEditDate);case _:
  return null;

}
}

}

/// @nodoc


class _NoteEntity implements NoteEntity {
  const _NoteEntity({this.noteId, required this.noteTitle, required this.noteContent, required this.creationDate, this.lastEditDate});
  

@override final  int? noteId;
@override final  String noteTitle;
@override final  String noteContent;
@override final  DateTime creationDate;
@override final  DateTime? lastEditDate;

/// Create a copy of NoteEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteEntityCopyWith<_NoteEntity> get copyWith => __$NoteEntityCopyWithImpl<_NoteEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteEntity&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.noteTitle, noteTitle) || other.noteTitle == noteTitle)&&(identical(other.noteContent, noteContent) || other.noteContent == noteContent)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastEditDate, lastEditDate) || other.lastEditDate == lastEditDate));
}


@override
int get hashCode => Object.hash(runtimeType,noteId,noteTitle,noteContent,creationDate,lastEditDate);

@override
String toString() {
  return 'NoteEntity(noteId: $noteId, noteTitle: $noteTitle, noteContent: $noteContent, creationDate: $creationDate, lastEditDate: $lastEditDate)';
}


}

/// @nodoc
abstract mixin class _$NoteEntityCopyWith<$Res> implements $NoteEntityCopyWith<$Res> {
  factory _$NoteEntityCopyWith(_NoteEntity value, $Res Function(_NoteEntity) _then) = __$NoteEntityCopyWithImpl;
@override @useResult
$Res call({
 int? noteId, String noteTitle, String noteContent, DateTime creationDate, DateTime? lastEditDate
});




}
/// @nodoc
class __$NoteEntityCopyWithImpl<$Res>
    implements _$NoteEntityCopyWith<$Res> {
  __$NoteEntityCopyWithImpl(this._self, this._then);

  final _NoteEntity _self;
  final $Res Function(_NoteEntity) _then;

/// Create a copy of NoteEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? noteId = freezed,Object? noteTitle = null,Object? noteContent = null,Object? creationDate = null,Object? lastEditDate = freezed,}) {
  return _then(_NoteEntity(
noteId: freezed == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as int?,noteTitle: null == noteTitle ? _self.noteTitle : noteTitle // ignore: cast_nullable_to_non_nullable
as String,noteContent: null == noteContent ? _self.noteContent : noteContent // ignore: cast_nullable_to_non_nullable
as String,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastEditDate: freezed == lastEditDate ? _self.lastEditDate : lastEditDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
