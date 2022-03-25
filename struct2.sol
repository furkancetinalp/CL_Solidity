pragma solidity >=0.6.0 <0.9.0;

// ATTEMPT 2: 'enrolledStudents' variable is consist of registered students' name. (Line37)
contract hw1_attempt2{

    uint256 public index=0;
    struct Students{
        address adres;
        string name;
        bool checking;
    }
    Students[25] public studentList;  

    string[] enrolledStudents;

    mapping(string=>Students) private userName;
    mapping(address=>Students) private userAddress;

    function add_student(address  _adres, string memory _name) public {
        require(index<25,"Insufficient try!! Max number of list is 25!!!");
        enrolledStudents.push(_name);
        require(!(userAddress[_adres].checking || userName[_name].checking),"Already enrolled!!!!");
        studentList[index]=(Students({adres: _adres, name: _name,checking:true}));

        userName[_name].adres =_adres;
        userName[_name].name =_name;
        userName[_name].checking=true;

        userAddress[_adres].adres =_adres;
        userAddress[_adres].name =_name;
        userAddress[_adres].checking=true;
        index ++;

    }

    function getAlready(uint _index) public view returns(string memory){
        return enrolledStudents[_index];


    }

}