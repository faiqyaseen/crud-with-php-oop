<?php
class Database
{
    // PROPERTIES 
    private $db_host = "localhost";
    private $db_user = "root";
    private $db_password = "";
    private $db_name = "test1";
    private $mysqli = "";
    private $result = array();
    private $conn = false;


    // CONSTRUCT FUNCTION TO RUN FIRST ** MAKE CONNECTION
    public function __construct()
    {
        if (!$this->conn) {

            $this->mysqli = new mysqli($this->db_host, $this->db_user, $this->db_password, $this->db_name);
            $this->conn = true;

            if ($this->mysqli->connect_error) {
                array_push($this->result, $this->mysqli->connect_error);
                return false;
            } else {
                return true;
            }

        }
    }


    // TABLE EXIST FUNCTION
    private function tableExists($table)
    {
        $sql = "SHOW TABLES FROM $this->db_name LIKE '$table'";
        $tableInDb = $this->mysqli->query($sql);

        if ($tableInDb) {
            if ($tableInDb->num_rows == 1) {
                return true;
            } else {
                array_push($this->result, $table . " table doesn't exist in database.");
                return false;
            }
        }
    }


    // INSERT FUNCTION TO INSERT DATA
    public function insert($table, $params = array())
    {
        $table_columns = implode(', ', array_keys($params));
        $table_value = implode("', '", $params);

        if ($this->tableExists($table)) {

            $sql = "INSERT INTO $table ($table_columns) VALUES ('$table_value')";

            if ($this->mysqli->query($sql)) {
                array_push($this->result, $this->mysqli->insert_id);
                return true;
            } else {
                array_push($this->result, $this->mysqli->error);
                return false;
            }
        } else {
            return false;
        }
    }


    // UPDATE FUNCTION TO UPDATE DATA
    public function update($table, $params = array(), $where = null)
    {
        if ($this->tableExists($table)) {

            $args = array();

            foreach ($params as $key => $value) {
                $args[] = "$key = '$value'";
            }

            // $values = implode(', ',$args);
            // echo $sql = "UPDATE $table SET $values";
            // OR

            $sql = "UPDATE $table SET " . implode(', ', $args);

            if ($where != null) {
                $sql .= " WHERE $where";
            }

            if ($this->mysqli->query($sql)) {
                array_push($this->result, $this->mysqli->affected_rows);
                return true; // The data has been updated
            } else {
                array_push($this->result, $this->mysqli->error);
                return false;
            }

        } else {
            return false;
        }
    }


    // DELETE FUNCTION TO DELETE DATA
    public function delete($table, $where = null)
    {
        if ($this->tableExists($table)) {

            $sql = "DELETE FROM $table";

            if ($where != null) {
                $sql .= " WHERE $where";
            }

            if ($this->mysqli->query($sql)) {
                array_push($this->result, $this->mysqli->affected_rows);
                return true; // The data has been deleted  
            } else {
                array_push($this->result, $this->mysqli->error);
                return false;
            }

        } else {
            return false;
        }
    }



    // SELECT FUNCTION TO SELECT DATA
    public function select($table, $row = "*", $join = null, $where = null, $order = null, $limit = null)
    {
        if ($this->tableExists($table)) {
            $sql = "SELECT $row FROM $table";

            if ($join != null) {
                $sql .= " JOIN $join";
            }

            if ($where != null) {
                $sql .= " WHERE $where";
            }

            if ($order != null) {
                $sql .= " ORDER BY $order";
            }

            if ($limit != null) {
                if (isset($_GET['page'])) {
                    $page = $_GET['page'];
                } else {
                    $page = 1;
                }
                $start = ($page - 1) * $limit;
                $sql .= " LIMIT $start,$limit";
            }

            $query = $this->mysqli->query($sql);

            if ($query) {
                $this->result = $query->fetch_all(MYSQLI_ASSOC);
                return true;
            } else {
                array_push($this->result, $this->mysqli->error);
                return false;
            }

        } else {
            return false;
        }
    }

    // SELECT DATA WITH QUERY
    public function sql($sql)
    {
        $query = $this->mysqli->query($sql);
        if ($query) {
            $this->result = $query->fetch_all(MYSQLI_ASSOC);
            return true;
        } else {
            array_push($this->result, $this->mysqli->error);
            return false;
        }
    }


    // PAGINATION
    public function pagination($table, $join = null, $where = null, $limit = null)
    {
        if ($this->tableExists($table)) {
            if ($limit != null) {
                $sql = "SELECT COUNT(*) FROM $table";
            }

            if ($join != null) {
                $sql .= " JOIN $join";
            }

            if ($where != null) {
                $sql .= " WHERE $where";
            }

            $query = $this->mysqli->query($sql);

            $total_record = $query->fetch_array();
            $total_record = $total_record[0];
            $total_pages = ceil($total_record / $limit);

            $url = basename($_SERVER['PHP_SELF']);

            if (isset($_GET['page'])) {
                $page = $_GET['page'];
            } else {
                $page = 1;
            }

            $output = "<ul class='pagination'>";
            if ($total_record > $limit) {

                if ($page > 1) {
                    $output .= "<li><a href='$url?page=" . ($page - 1) . "'>Previous</a></li>";
                }

                for ($i = 1; $i <= $total_pages; $i++) {

                    if ($page == $i) {
                        $cls = "class='active'";
                    } else {
                        $cls = "";
                    }

                    $output .= "<li><a $cls href='$url?page=$i'>$i</a></li>";
                }

                if ($page < $total_pages) {
                    $output .= "<li><a href='$url?page=" . ($page + 1) . "'>Next</a></li>";
                }
            }

            $output .= "<ul class='pagination'>";

            echo $output;
        } else {
            return false;
        }
    }

    
    // GET RESULT FUNCTION FROM RESULT ARRAY
    public function getResult()
    {
        $val = $this->result;
        $this->result == array();
        return $val;
    }


    // CLOSE CONNECTION WITH DESTRUCT METHOD WHICH CALL WHEN ALL DATA WILL RUN
    public function __destruct()
    {
        if ($this->conn) {

            if ($this->mysqli->close()) {
                $this->conn = false;
                return true;
            }

        } else {
            return false;
        }
    }
}
