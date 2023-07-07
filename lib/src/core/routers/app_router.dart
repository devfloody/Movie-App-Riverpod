part of 'routers.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: GoRoutePath.home,
    debugLogDiagnostics: true,
    routes: [
      /* StatefulShellRoute.indexedStack(
        branches: [],
      ), */
      GoRoute(
        path: GoRoutePath.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: GoRoutePath.discover,
        builder: (context, state) => const DiscoverMoviePage(),
      ),
      GoRoute(
        path: GoRoutePath.search,
        builder: (context, state) => const SearchMoviePage(),
      ),
    ],
    errorBuilder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '404',
            style: AppFont.plusJakartaBold.copyWith(fontSize: 32, color: AppColor.primaryColor),
          ),
          Text(
            'Page Not Found',
            style: AppFont.plusJakartaBold.copyWith(fontSize: 24, color: AppColor.primayTextColor),
          ),
        ],
      );
    },
  );
});

class GoRoutePath {
  static String home = '/';
  static String discover = '/discover';
  static String search = '/search';
  static String nowPlaying = '/now-playing';
  static String popular = '/popular';
  static String upcoming = '/upcoming';
}
