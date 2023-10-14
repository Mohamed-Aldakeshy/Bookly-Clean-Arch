import 'package:bookly_app_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean_arch/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeauteredBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeauteredBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    return homeRepo.fetchFeaturedBooks();
  }
}
