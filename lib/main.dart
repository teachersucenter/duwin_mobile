import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'app.dart';
import 'constants/colors.dart';

Future<ValueNotifier<GraphQLClient>> initClient() async {
  await initHiveForFlutter();

  final HttpLink link = HttpLink(
    'https://api.teachersucenter.com/api/duwin',
  );

  // final AuthLink authLink = AuthLink(getToken: () => '');
  //
  // final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  return client;
}

void main() async {
  ValueNotifier<GraphQLClient> client = await initClient();

  return runApp(
    GraphQLProvider(
      client: client,
      child: MaterialApp(
        theme: buildDuwinTheme(),
        home: const Duwin(),
      ),
    ),
  );
}

ThemeData buildDuwinTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: duwinPink,
      secondary: duwinOrange,
      tertiary: duwinYellow,
    ),
    textTheme: buildDuwinTextTheme(base.textTheme),
  );
}

TextTheme buildDuwinTextTheme(TextTheme base) {
  return base.copyWith().apply(fontFamily: '');
}
