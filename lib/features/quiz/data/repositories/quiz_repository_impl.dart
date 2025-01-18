class QuizRepositoryImpl {
  final QuizRemoteDataSource remoteDataSource;
  final QuizLocalDataSource localDataSource;

  QuizRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Quiz>>> getQuizzes() async {
    try {
      final quizzes = await remoteDataSource.getQuizzes();
      await localDataSource.cacheQuizzes(quizzes);
      return Right(quizzes);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
