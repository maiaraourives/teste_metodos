import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_metodos/views/widgets/cs_app_bar.dart';
import 'package:teste_metodos/views/widgets/cs_button.dart';
import 'package:teste_metodos/views/widgets/cs_icon.dart';
import 'package:teste_metodos/views/widgets/cs_text_form_field.dart';

import '../../config/constants.dart';
import '../../config/routes/local_routes.dart';
import '../../controllers/contato/contato_controller.dart';
import '../../models/contato/contato_model.dart';
import '../../services/dialog_services.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../utils/fuctions_utils.dart';
import 'cadastrar_state.dart';
import 'cadastrar_validator.dart';

class CadastrarView extends StatefulWidget {
  const CadastrarView({
    this.contato,
    super.key,
  });

  final ContatoModel? contato;

  @override
  State<CadastrarView> createState() => _CadastrarViewState();
}

class _CadastrarViewState extends State<CadastrarView> {
  final stateView = CadastrarState();

  late ContatoModel contato;

  ///[Controllers]
  final nomeController = TextEditingController();
  final telefoneController = TextEditingController();
  final emailController = TextEditingController();
  final objetivosProfissionaisController = TextEditingController();
  final enderecoController = TextEditingController();

  //Providers and state
  final formKey = GlobalKey<FormState>();

  ///[Mask]
  final telefoneMask = TextInputMask(mask: '(99) 9 9999-9999');

  @override
  void initState() {
    super.initState();

    contato = widget.contato ?? ContatoModel();

    if (widget.contato != null) {
      _initialData();
    } else {
      _initialUserData();
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    telefoneController.dispose();
    emailController.dispose();

    super.dispose();
  }

  void _initialData() {
    nomeController.text = contato.nome ?? '';
    telefoneController.text = telefoneMask.magicMask.getMaskedString(contato.telefone ?? '');
    emailController.text = contato.email ?? '';
  }

  void _initialUserData() {
    if (getIt.isRegistered<ContatoModel>()) {
      final contato = getIt<ContatoModel>();

      contato
        ..setNome(contato.nome!)
        ..setTelefone(contato.telefone!)
        ..setEmail(contato.email!);

      nomeController.text = contato.nome ?? '';
      telefoneController.text = telefoneMask.magicMask.getMaskedString(contato.telefone ?? '');
      emailController.text = contato.email ?? '';
    }
  }

  void cadastrar() async {
    FocusScope.of(context).unfocus();

    if (stateView.buttonState == ButtonState.LOADING) return;

    if (!formKey.currentState!.validate()) {
      showSnackbar('Verifique os campos obrigatórios', seconds: 2);
      return;
    }

    try {
      stateView.setButtonState(state: ButtonState.LOADING);

      if (widget.contato == null) {
        await ContatoController().cadastrarContato(contato);
      } 

      showSnackbar('Contato salvo com sucesso');

      getIt<NavigationService>().popAndPushNamed(LocalRoutes.HOME);
    } catch (err) {
      stateView.setHasError(value: true);
    } finally {
      stateView.setButtonState(state: ButtonState.DONE);

      if (stateView.hasError) {
        Future.delayed(
          const Duration(seconds: 1, milliseconds: 500),
          stateView.resetState,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(title: 'Cadastrar'),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            CsTextFormField(
              hintText: 'Insira seu nome',
              suffixIcon: const CsIcon(icon: Icons.person),
              validator: CadastrarValidator.nome,
              controller: nomeController,
              onChanged: (nome) {
                contato.setNome(nome);
                stateView.setHouveAlteracoes();
              },
            ),
            const SizedBox(height: 10),
            CsTextFormField(
              hintText: 'Insira seu número',
              suffixIcon: const CsIcon(icon: Icons.phone),
              controller: telefoneController,
              onChanged: (telefone) {
                contato.setTelefone(telefone);
                stateView.setHouveAlteracoes();
              },
              validator: (telefone) {
              if (!isNullOrEmpty(telefone)) {
                telefone = telefoneMask.magicMask.clearMask(telefone!);
              }

              return CadastrarValidator.telefone(telefone);
              },
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                telefoneMask,
              ],
            ),
            const SizedBox(height: 10),
            CsTextFormField(
              hintText: 'Insira seu e-mail',
              suffixIcon: const CsIcon(icon: Icons.email),
              validator: CadastrarValidator.email,
              controller: emailController,
              onChanged: (email) {
                contato.setEmail(email);
                stateView.setHouveAlteracoes();
              },
            ),
            const SizedBox(height: 10),
            CsButton(
              title: 'Cadastrar',
              onTap: cadastrar,
            ),
          ],
        ),
      ),
    );
  }
}
