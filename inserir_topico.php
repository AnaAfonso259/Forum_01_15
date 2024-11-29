<?php 
    include_once('verificar_sessao.php');
    
    if ($_SESSION['tipo'] == 2) {
        header('location:topicos.php');
        die();
    }

    require_once('./bd.php'); 

    // Recupera os valores do formulário e da sessão
    $topico = $_POST['topico'];
    $idutilizador = $_SESSION['idutilizador'];
    try {
        $conn = ligarBD();
        $sql = 'INSERT INTO t_topico (titulo, refidutilizador) VALUES (:titulo, :idutilizador)';
        $stmt = $conn->prepare($sql);
        $stmt->execute([':titulo' => $topico,':idutilizador' => $idutilizador]);

        header('location:topicos.php');
    } catch (PDOException $e) {
        echo "Erro ao inserir tópico: " . $e->getMessage();
    }
?>