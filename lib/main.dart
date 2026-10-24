import 'package:auth_test/views/loginbage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://numjshuvoezsiskjizdm.supabase.co",
    publishableKey: "sb_publishable_rzKmTCWxrZ3EokTjS2CFrg_e9Mip4pD",
  );

  runApp(ProviderScope(child: MyApp()));
}

// It's handy to then extract the Supabase client in a variable for later uses
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}