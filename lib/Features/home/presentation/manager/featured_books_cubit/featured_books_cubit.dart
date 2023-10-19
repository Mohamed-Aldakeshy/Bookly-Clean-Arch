import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:bookly_app_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/Features/home/domain/use_cases/fetch_feautered_booksuse_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeauteredBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeauteredBooksUseCase fetchFeauteredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await fetchFeauteredBooksUseCase.call();

    result.fold(
      (failure) => emit(
        FeaturedBooksFailure(failure.message),
      ),
      (books) => emit(
        FeaturedBooksSuccess(books),
      ),
    );
  }
}
