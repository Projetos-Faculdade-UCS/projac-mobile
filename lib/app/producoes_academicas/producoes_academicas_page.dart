import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/producoes_academicas/bloc/producoes_academicas/producoes_academicas_bloc.dart';
import 'package:projac_mobile/app/producoes_academicas/get_it.dart';
import 'package:projac_mobile/app/producoes_academicas/widgets/producoes_academicas_list.dart';

class ProducoesAcademicasPage extends StatefulWidget {
  const ProducoesAcademicasPage({super.key});

  @override
  State<ProducoesAcademicasPage> createState() =>
      _ProducoesAcademicasPageState();
}

class _ProducoesAcademicasPageState extends State<ProducoesAcademicasPage> {
  late final bool _disposeGetIt;
  late final ProducoesAcademicasBloc bloc;

  @override
  void initState() {
    super.initState();
    _disposeGetIt = setupProducoesAcademicasGetIt();
    bloc = producoesAcademicasGetIt.get<ProducoesAcademicasBloc>();
  }

  @override
  void dispose() {
    disposeProducoesAcademicasGetIt(dispose: _disposeGetIt);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(FetchProducoesAcademicas()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text('Produções Acadêmicas'),
        ),
        body: BlocBuilder<ProducoesAcademicasBloc, ProducoesAcademicasState>(
          builder: (context, state) {
            if (state is ProducoesAcademicasLoaded) {
              return ProducoesAcademicasList(
                producoesAcademicas: state.producoesAcademicas,
              );
            }

            if (state is ProducoesAcademicasError) {
              return Center(
                child: Text(state.error),
              );
            }

            return ProducoesAcademicasList.skeleton;
          },
        ),
      ),
    );
  }
}