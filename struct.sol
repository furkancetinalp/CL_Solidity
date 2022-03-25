// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
// ATTEMPT 1: 'enrolled_list' variable is consist of already enrolled students' name (which means unsuccessful attempts)

contract hw1{
    uint index;

    struct student{
        address adres;
        string name;   
        bool isEnrolled; 
    }

    event Notify(string message);

    student[25] public  registered_list;
    string[]  enrolled_list;
    mapping(string=>student) private userName;
    mapping(address=>student) private userAddress;

    function add_student(address _address, string memory _name) public  { 
        enrolled_list.push(_name);
        require(index<25,"Insufficient try! Max length of list is 25!!!");

        if(!(userName[_name].isEnrolled || userAddress[_address].isEnrolled)){

            userName[_name].adres =_address;
            userName[_name].name =_name;
            userName[_name].isEnrolled=true;

            userAddress[_address].adres =_address;
            userAddress[_address].name =_name;
            userAddress[_address].isEnrolled=true;

            registered_list[index]=student(_address,_name,userName[_name].isEnrolled); 
            index ++;
            enrolled_list.pop();
        }
        else{
            emit Notify("Already enrolled!!");           
        }       
    }
    function alreadyEnrolledList(uint _index) public  view  returns(string memory){
        return enrolled_list[_index];
    }
}