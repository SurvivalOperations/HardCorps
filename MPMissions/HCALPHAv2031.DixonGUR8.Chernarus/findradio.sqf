private["_units","_radioFound","_unitWithRadio"];
       
       _units = _this select 0;
       _radioFound = false;

       // look for the radio on units inside the trigger
       {
       if(isNumber(configFile >> "CfgWeapons" >> secondaryWeapon _x >> "ACE_is_radio")) then{
        _radioFound = true;
        _unitWithRadio = _x;
       };
       } forEach _units;

       // one of the units has the radio
       if(_radioFound) then {
        hint "ACCESS GRANTED";       
		_unitWithRadio addAction ["Enter Underground Bunker", "Complexes\movepos1.sqf"];
       }else{
        hint "ACCESS DENIED";
       };