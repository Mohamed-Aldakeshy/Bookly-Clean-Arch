import 'package:bookly_app_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean_arch/core/errors/failure.dart';
import 'package:bookly_app_clean_arch/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeauteredBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeauteredBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.fetchFeaturedBooks(
      pageNumber: param,
    );
  }
}
