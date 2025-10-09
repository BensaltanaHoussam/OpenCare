<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Register Patient</title></head>
<body>
  <form action="register" method="post">
    <label>Nom:</label><input type="text" name="nom" required /><br/>
    <label>Prénom:</label><input type="text" name="prenom" required /><br/>
    <label>Date de naissance:</label><input type="date" name="date_naissance" required /><br/>
    <label>Numéro de sécurité sociale:</label><input type="text" name="numero_securite_sociale" required /><br/>
    <label>Téléphone:</label><input type="text" name="telephone" /><br/>
    <label>Adresse:</label><input type="text" name="adresse" /><br/>
    <label>Mutuelle:</label><input type="text" name="mutuelle" /><br/>
    <label>Antécédents:</label><textarea name="antecedents"></textarea><br/>
    <label>Allergies:</label><textarea name="allergies"></textarea><br/>
    <label>Traitements en cours:</label><textarea name="traitements_en_cours"></textarea><br/>
    <input type="submit" value="Enregistrer le patient" />
  </form>
</body>
</html>
