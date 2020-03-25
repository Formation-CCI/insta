<?php

	session_start();
	
	// Vérifie si le rédacteur est connecté
    if(!array_key_exists('authentification', $_SESSION))
    {
		// Redirection vers la page de connexion
        header('Location: sign-in.php');
        exit;
    }
    else
    {
		//	Connexion à la base de données
		include('./php-include/database-connection.php');
		
		$query = 'SELECT id, filename FROM images WHERE idUsers = ?';
		$sth = $dbh->prepare($query);
		$sth -> bindValue(1, $_SESSION['authentification'], PDO::PARAM_INT);
		$sth->execute();
		$publication = $sth->fetchAll();

		// Inclusion du PHTML
		include './php-include/dashboard.phtml';
	}