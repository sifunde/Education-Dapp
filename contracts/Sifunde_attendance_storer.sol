pragma solidity ^0.4.0;

import "./date_time.sol";

contract attendance_storer{
    // Because the minimal efficient model depends on these 2 mappings.
    mapping(uint => address[])   addresses_of_actors_from_uint_of_date;
    
    event stored_attendance(
        address     indexed     of_actor,
        uint        indexed     as_present_at_unix_time
    );
            
    function store_attendance(address of_actor) 
    public{
        uint16  year            = DateTime.getYear(now);
        uint8   month           = DateTime.getMonth(now);
        uint8   day             = DateTime.getDay(now);
        uint8   hour            = DateTime.getHour(now);
        uint    current_hour    = DateTime.toTimestamp(year, month, day, hour);
        addresses_of_actors_from_uint_of_date[current_hour].push(of_actor);
        emit stored_attendance(of_actor,current_hour);
    }
    
}