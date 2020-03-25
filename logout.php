<?php

    session_start();
    
    // Vérifie si le rédacteur est connecté
    if(!array_key_exists('authentification', $_SESSION))
    {
        // Redirection vers la page de connexion
        header('Location: index.php');
        exit;
    }
    else
    {
        // Redirection vers la page de connexion
        unset($_SESSION['authentification']);
        header('Location: index.php');
        exit;
    }
    