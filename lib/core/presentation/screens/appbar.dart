import 'package:bankingapp/core/presentation/bloc/home_blocs/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_event.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/home_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(LoadHomeData(HomeRepositoryImpl()))
        ..add(LoadHomeDataEvent()),
      child: Builder(
        builder: (context) {
          return AppBar(
            backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: ClipOval(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return Image.asset(
                          state.usuario_pic,
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Text(
                        state.usuario_name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      "assets/images/horizontal.png",
                      width: 120,
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
