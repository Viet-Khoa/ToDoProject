<?php
//Session starten um Tasks zu behalten
session_start();

//Prüfe ob die Session Variable definiert wurde, wenn nicht initialisiere ein array
if (!isset($_SESSION['value'])) {
  $_SESSION['value'] = array();
}

//Prüfe in der REQUEST METHOD nach einen POST Request nach und prüfe ob aus dem Textfeld mit dem namen input ein Wert mitgeliefert wurde.
if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['input'])) {
  array_push($_SESSION['value'], $_POST['input']);
}

//Selbe Prüfung nur für den Delete 
if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['delete'])) {
  $sIndex = $_POST['delete'];
  if (isset($_SESSION['value'][$sIndex])) {
    unset($_SESSION['value'][$sIndex]);
    $_SESSION['value'] = array_values($_SESSION['value']);
  }
}
?>
<!doctype html>
<html lang="de">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title></title>
  <link href="css/style.css" rel="stylesheet" />
</head>

<body>
  <form action="" method="post">
    <input type="text" name="input" />
    <input type="submit" value="Add" />
  </form>
  <ul>
    <?php foreach ($_SESSION['value'] as $sIndex => $sItem) { ?>
      <li>
        <?= $sItem ?>
        <form method="post" style='display:inline'>
          <input type="hidden" name="delete" value="<?php echo $sIndex; ?>" />
          <button type="submit">Delete</button>
        </form>
      </li>
    <?php } ?>
  </ul>
</body>

</html>
