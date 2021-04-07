<?php
  class DatabaseConnection {
    public $connection;
    public function __construct($host, $port, $username, $password, $database) {$this->connection = new PDO('mysql:host=$host;dbname=$database', $username, $password);}
    public function __destruct() {$this->connection = null;}
    public function getConnectionStatus() {if(isset($this->connection)) return true; else false;}
  }
?>
