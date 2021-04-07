<?php
include 'Model.php';
class Heroes extends Model {
  public $id, $name, $description, $race, $class_role;
  public function __construct() {parent::__construct('Heroes');}
  public function find($id) {
    if($this->connection->getConnectionStatus()) {
      $request = $this->connection->connection->query("SELECT * FROM `heroes` WHERE id={$id}");
      $table = $request->fetch(PDO::FETCH_ASSOC);
      if($table) {
        $this->id = $table->$id; 
        $this->name = $table->name; 
        $this->description = $table->description; 
        $this->race = $table->race; 
        $this->class_role = $table->class_role;
        unset($row);
        $query = NULL;
      }
    }
  }
  public function delete() {
    if($this->connection->getConnectionStatus()) {
      $request = $this->connection->connection->query("SELECT count(*) FROM `heroes` WHERE id={$this->id}");
      $table = $request->fetch(PDO::FETCH_ASSOC);
      if ($table['id']) {
        $request = $this->connection->connection->prepare("DELETE FROM {$this->table} WHERE id = {$this->id})");
        $request->execute();
        $this->id = null;
        $this->name = null;
        $this->description = null;
        $this->race = null;
        $this->class_role = null;
      }
    }
  }
  public function save() {
    if($this->connection->getConnectionStatus()) {
      $request = $this->connection->connection->query("SELECT count(*) FROM `heroes` WHERE id={$this->id}");
      if($request->fetch()[0] == 0){
        $request = $this->connection->connection->prepare("INSERT INTO heroes VALUES(:id,:name,:race,:class_role,:description)");
        $request->execute(['id' => $this->id, 
                           'name' => $this->name,
                           'race' => $this->race,
                           'class_role' => $this->class_role,
                           'description' => $this->description]);
      }
      else {
        $request = $this->connection->connection->prepare("UPDATE heroes SET name=?,race=?,class_role=?,description=? WHERE id=?");
        $request->execute([$this->name, $this->race, $this->class_role, $this->description, $this->id]);
      }
      unset($request);
    }
  }
}
?>
