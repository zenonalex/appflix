enum MovieListType {
  search("3/search/movie", "Search"),
  topRated("3/movie/top_rated", "Trending"),
  popular("3/movie/popular", "Popular");

  final String endpoint;
  final String label;
  
  const MovieListType(this.endpoint, this.label);
}
