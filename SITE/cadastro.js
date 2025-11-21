function cadastrar() {
    // acessar campos diretamente pelo id
    var usuario = id_usuario.value;
    var idade = id_idade.value;
    var atividade = id_atividade.value;
    var senha = id_Senha.value;
    var confirmar = id_confirmasenha.value;
    var erro = '';

    // validar campos
    if (usuario == "" || idade == "" || atividade == "#" || senha == "" || confirmar == "") {
        erro += "Preencha todos os campos!";
        return;
    }

    if (senha != confirmar) {
        erro += "As senhas não coincidem!";
        return;
    }

    if (idade <= 0 || idade > 120) {
        mostrarErro("Digite uma idade válida!");
        return;
    }
}