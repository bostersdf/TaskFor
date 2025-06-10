import 'package:taskfor/layers/presentation/screens/start_screen.dart';
import 'package:taskfor/layers/presentation/screens/task_screen.dart';
import 'package:go_router/go_router.dart';

class RouterConfigGO {
  final GoRouter router = GoRouter(
    initialLocation: '/start',
   routes: [
    GoRoute(
      path: '/start', 
      builder: (context, state) => ZEROStartClass(),
      ),
     GoRoute(
      path: '/task', 
      builder: (context, state) => ONETaskApp(),
      ),
       ],
     );
}