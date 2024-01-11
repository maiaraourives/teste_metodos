import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/constants.dart';
import '../../controllers/contato/contato_controller.dart';
import '../../models/contato/contato_model.dart';
import '../../services/dialog_services.dart';
import '../../utils/fuctions_utils.dart';
import '/views/widgets/cs_app_bar.dart';
import '/views/widgets/cs_button.dart';
import '/views/widgets/cs_icon.dart';
import '/views/widgets/cs_text_form_field.dart';
import '/services/navigation_service.dart';
import '/services/service_locator.dart';
import 'atualizar_cadastro_state.dart';
import 'atualizar_cadastro_validator.dart';

class AtualizarCadastroView extends StatefulWidget {
  const AtualizarCadastroView({
    required this.contato,
    super.key,
  });

  final ContatoModel? contato;

  @override
  State<AtualizarCadastroView> createState() => _AtualizarCadastroViewState();
}

class _AtualizarCadastroViewState extends State<AtualizarCadastroView> {
  final stateView = AtualizarCadastroState();

  late ContatoModel contato;

  ///[Controllers]
  final nomeController = TextEditingController();
  final telefoneController = TextEditingController();
  final emailController = TextEditingController();
  final objetivosProfissionaisController = TextEditingController();
  final enderecoController = TextEditingController();

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

  void atualizar() async {
    FocusScope.of(context).unfocus();

    if (stateView.buttonState == ButtonState.LOADING) return;

    if (!formKey.currentState!.validate()) {
      showSnackbar('Verifique os campos obrigatórios', seconds: 2);
      return;
    }

    try {
      stateView.setButtonState(state: ButtonState.LOADING);

      if (widget.contato == null) {
        await ContatoController().atualizarContato(contato);
      }

      showSnackbar('Contato atualizado com sucesso');

      getIt<NavigationService>().pop(contato);
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
      appBar: const CsAppBar(title: 'Atualizar cadastro'),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CsTextFormField(
                labelText: 'Nome',
                suffixIcon: const CsIcon(icon: Icons.person),
                validator: AtualizarCadastroValidator.nome,
                controller: nomeController,
                onChanged: (nome) {
                  contato.setNome(nome);
                  stateView.setHouveAlteracoes();
                },
              ),
              const SizedBox(height: 10),
              CsTextFormField(
                labelText: 'Número',
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

                  return AtualizarCadastroValidator.telefone(telefone);
                },
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  telefoneMask,
                ],
              ),
              const SizedBox(height: 10),
              CsTextFormField(
                labelText: 'E-mail',
                suffixIcon: const CsIcon(icon: Icons.email),
                validator: AtualizarCadastroValidator.email,
                controller: emailController,
                onChanged: (email) {
                  contato.setEmail(email);
                  stateView.setHouveAlteracoes();
                },
              ),
              const SizedBox(height: 10),
              CsButton(
                title: 'Atualizar',
                onTap: atualizar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
