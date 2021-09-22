<?php

include "database.php";

$obj = new Database();

// $obj->insert("employee",['name'=>'Nabeel','age'=>20,'city'=>'Lahore']);
// echo "Insert Result is : ";
// print_r($obj->getResult());

// $obj->update("employee",['name'=>'Muneeb','age'=>26,'city'=>'Lahore'],'id = 14 ');
// echo "Update Result is : ";
// print_r($obj->getResult());

// $obj->update("employee",['city'=>'Lahore'],'city = "Rawalpindi" ');
// echo "Update Result is : ";
// print_r($obj->getResult());

// $obj->delete("employee",'id = 10 ');
// echo "Delete Result is : ";
// print_r($obj->getResult());

// $obj->delete("employee",'id IN (11,13) ');
// echo "Delete Result is : ";
// print_r($obj->getResult());

// $obj->sql("SELECT * FROM employee WHERE age = '20'");
// echo "SQL Result is : ";
// echo "<pre>";
//  print_r($obj->getResult());
//  echo "</pre>";

// $obj->select('employee','*',null,'city="Bahawalpur"',null,2);
// echo "SQL Result is : ";
// echo "<pre>";
//  print_r($obj->getResult());
//  echo "</pre>";

// $obj->pagination('employee',null,'city="Bahawalpur"',2);


// WITH JOINS

// $join = "citytb ON employee.city = citytb.cid";
// $colName = "employee.id, employee.name, employee.age, citytb.cname";
// $limit= 2;
// $where = null;

// $obj->select('employee',$colName,$join,$where,null,$limit );
// echo "SQL Result is : ";
// echo "<pre>";
//  print_r($obj->getResult());
//  echo "</pre>";

// $obj->pagination('employee',$join,$where,$limit );



 
?>