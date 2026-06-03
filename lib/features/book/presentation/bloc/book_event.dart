part of 'book_bloc.dart';

sealed class BookEvent {}

final class GetAllBookEvent extends BookEvent{}

final class GetBookByDetail extends BookEvent{
  final String id;

  GetBookByDetail({required this.id});
}