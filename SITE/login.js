function login() {
    // acessar campos pelo id diretamente
    var usuario = id_usuario.value;
    var senha = id_Senha.value;

    if (usuario == "" || senha == "") {
        mostrarErro("Preencha todos os campos!");
        return;
    }

}
