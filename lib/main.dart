import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/user/user_bloc.dart';
import '/bloc/users/users_bloc.dart';
import '/pages/pagina2_page.dart';
import '/pages/pagina1_page.dart';
 
void main() => runApp( const BlocsProviders() );


class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsersBloc(), lazy: false, ),
        BlocProvider(create: ( _ ) => UserBloc() )
      ],
      child: const MyApp(),
    );
  }
}
 
class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': ( _ ) => const Pagina1Page(),
          'pagina2': ( _ ) => const Pagina2Page(),
        },
      );
  }
}