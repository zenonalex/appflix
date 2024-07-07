enum MovieListType {
  topRated("3/movie/top_rated"),
  popular("3/movie/popular");

  final String endpoint;
  const MovieListType(this.endpoint);
}
