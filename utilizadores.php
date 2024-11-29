<?php
    include_once('verificar_sessao.php');
    include_once('bd.php');
    if($_SESSION['tipo'] != 0){
        header('location:topicos.php');
        die();
    }
?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fórum</title>
    <?php require_once('metadados.php') ?>
</head>
<body>
    <div class="container">
        <?php include_once('header.php'); ?>
        <?php include_once('navegacao.php'); ?>
        <table class="table table-sm table-striped table-hover table-bordered mt-2">
            <thead class="px-3">
                <tr>
                    <th scope="col">Utilizadores</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $sql = 'SELECT  idutilizador, utilizador, tipo, ativo';
                $sql .= ' FROM t_utilizador ';
                $sql .= ' ORDER BY utilizador ASC';
                $rs = consultarBD($sql);
                foreach ($rs as $registo) {    
                    $idutilizador = $registo['idutilizador'];
                    $utilizador = $registo['utilizador'];
                    $tipo = $registo['tipo'];
                    $ativo = $registo['ativo'];
                ?>   
                
                    <tr>
                        <td class="p-2">
                            <p>
                                <a class="link-offset-3-hover link-underline 
                                    link-underline-opacity-0 link-underline-opacity-75-hover" >
                                </a>
                                <p>
                                <?php echo $utilizador; ?>
                                </p>
                            </p>
                        </td>
                        <td>
                            <button type="button" id="btn_ativo" >On</button>
                            <button type="button" id="btn_desativo_<?php echo $idutilizador ?>">Off</button>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>

        <?php include_once('footer.php'); ?>
    </div>

    <script>

        let btnAtivo;
        let btnDesativo;

        btnAtivo =document.getElementById("btn_ativo");
        btnDesativo =document.getelementById("btn_desativo_<?php echo $idutilizador ?>")

        btnAtivo.addEventListener('click',function(evento){
            btnAtivo.style.color = "#f9f9f9";
            btnDesativo.style.color = null;
        });
        btnDesativo.addEventListener('click',function(evento){
            btnAtivo.style.color = null;
            btnDesativo.style.color = "#f9f9f9";
        });
                            if(<?php echo $ativo ?> == 1){
                                    desativar_conta();
                                } else{
                                    ativar_conta();
                                }


            //                     function ativar_conta(){
            //                         document.getElementById("btn_ativo_<?php echo $idutilizador ?>").removeAttribute("disabled");
            //                         document.getElementById("btn_desativo_<?php echo $idutilizador ?>").setAttribute("disabled", "disabled");
            //                         $sql = 'UPDATE t_utilizador SET ativo= 1 WHERE idutilizador = "' +$idutilizador+ '";';
            //                     }

            //                     function desativar_conta(){
            //                         document.getElementById("btn_ativo_<?php echo $idutilizador ?>").setAttribute("disabled", "disabled");
            //                         document.getElementById("btn_desativo_<?php echo $idutilizador ?>").removeAttribute("disabled");
            // $sql = 'UPDATE t_utilizador SET ativo= 0 WHERE idutilizador = "' +$idutilizador+ '";';
         // }

                                
                              
    </script>
</body>
</html>



