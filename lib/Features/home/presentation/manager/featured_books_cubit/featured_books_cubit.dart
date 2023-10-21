import 'package:bloc/bloc.dart';
import 'package:bookly_app_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/Features/home/domain/use_cases/fetch_feautered_booksuse_case.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeauteredBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeauteredBooksUseCase fetchFeauteredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }

    var result = await fetchFeauteredBooksUseCase.call(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(failure.message));
        } else {
          emit(FeaturedBooksPaginationFailure(failure.message));
        }
      },
      (books) => emit(
        FeaturedBooksSuccess(books),
      ),
    );
  }
}
