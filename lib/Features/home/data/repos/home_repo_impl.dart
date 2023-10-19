import 'package:bookly_app_clean_arch/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_clean_arch/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_arch/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean_arch/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksL = homeLocalDataSource.fetchFeaturedBooks();
      if (booksL.isNotEmpty) {
        return right(booksL);
      }
      var booksR = await homeRemoteDataSource.fetchFeaturedBooks();

      return right(booksR);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var booksL = homeLocalDataSource.fetchNewestBooks();
      if (booksL.isNotEmpty) {
        return right(booksL);
      }
      var booksR = await homeRemoteDataSource.fetchNewestBooks();

      return right(booksR);
    } catch (e) {
      return left(Failure());
    }
  }
}