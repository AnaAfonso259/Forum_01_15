<?php
include_once('verificar_sessao.php');
require_once('metadados.php');

if ($_SESSION['tipo'] == 2) {
    header('location:topicos.php');
    die();
}
?>

<!DOCTYPE html>
<html lang="pt-pt">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar topico</title>
</head>

<body>
    <div class="container">
        <?php include_once('header.php'); ?>
        <?php include_once('navegacao.php'); ?>
        <div class="my-1 p-3 bg-topico rounded">
            <div class="row pt-2">
                <div class="col-sm-12 d-flex justify-content-center">
                    <form action="./inserir_topico.php" method="post" style="width: 50%;">
                        <textarea class="form-control mb-1" id="topico" name="topico" rows="1" required autocomplete="off" placeholder="Nome do tópico"></textarea>
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-outline-success mt-1">Criar Tópico</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

        <?php include_once('footer.php'); ?>
</body>

</html>