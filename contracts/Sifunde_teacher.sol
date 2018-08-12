pragma solidity ^0.4.0;

import './Sifunde_institution.sol';

contract teacher{
    institution 
    use_institution;

    constructor(address where_institution_lives) public{
        use_institution = institution(where_institution_lives)
    }
    
    function request_institution_to_acknowledge_my_attendance()
    public{
        use_institution.acknowledge_teacher_attendance(msg.sender);
    }
    
    function request_institution_to_acknowledge_attendance_of_student(address of_account) 
    public{
        use_institution.acknowledge_student_attendance(of_account,msg.sender);
    }
    
}