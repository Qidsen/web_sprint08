<?php
include 'DatabaseConnection.php';
abstract class Model {
  public function __construct($table) {$this->setTable($table); $this->setConnection();}
  protected function setTable($table) {$this->table = $table;}
  public function setConnection() {$this->connection = new DatabaseConnection("localhost", 8080, "yvovnenko", "securepass", "ucode_web");}
  abstract function find($id);
  abstract function delete();
  abstract function save();
}
?>
