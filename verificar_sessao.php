<?php
    session_start();
    if (!isset($_SESSION['utilizador'])) {
        $_SESSION['erro'] = 'Inicie a sessão';
        header('Location: login.php');
        die();
    }
?>

