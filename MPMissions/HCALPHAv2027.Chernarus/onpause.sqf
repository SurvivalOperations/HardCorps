private["_display","_btnRespawn","_btnAbort","_timeOut","_timeMax","_isDead","_id","_valuea","_valueb","_valuec","_valued","_pid"];
		disableSerialization;
		waitUntil {
			_display = findDisplay 49;
			!isNull _display;
		};
		_btnRespawn = _display displayCtrl 1010;
		_btnAbort = _display displayCtrl 104;
		_btnRespawn ctrlEnable false;
		_btnAbort ctrlEnable false;
		_timeOut = 0;
		_timeMax = 10;
		dayz_lastCheckBit = time;
		
		if(r_player_dead) exitWith {_btnAbort ctrlEnable true;};
		if(r_fracture_legs) exitWith {_btnRespawn ctrlEnable true; _btnAbort ctrlEnable true;};
		
		//force gear save
		if (time - dayz_lastCheckBit > 10) then {
			call dayz_forceSave;
		};	


		_id = GetPlayerUID player;
		_pid = parseNumber _id;
		_valuea = 0;
		_valueb = 0;
		_valuec = 0;
		_valued = 0;
		_valuea = _pid/10000;
		_valueb = _valuea - (_valuea*(0.00047));
		_valuec = (_valueb/2) + 96;
		_valued = round _valuec;

		if(!isNull _display) then {
		["GearUP Rewards",format["Pin: %1",_valued]] spawn BIS_fnc_infoText;
		};		
		while {!isNull _display} do {
			switch true do {
				case ({isPlayer _x} count (player nearEntities ["AllVehicles", 6]) > 1) : {
					_btnAbort ctrlEnable false;
					cutText [format[localize "str_abort_playerclose",_text], "PLAIN DOWN"];
				};
				case (_timeOut < _timeMax && count (player nearEntities ["zZombie_Base", 35]) > 0) : {
					_btnAbort ctrlEnable false;
					cutText [format ["Can Abort in %1", (_timeMax - _timeOut)], "PLAIN DOWN"];
					//cutText [format[localize "str_abort_zedsclose",_text, "PLAIN DOWN"];
				};
				case (player getVariable["combattimeout", 0] >= time) : {
					_btnAbort ctrlEnable false;
					//cutText ["Cannot Abort while in combat!", "PLAIN DOWN"];
					cutText [format[localize "str_abort_playerincombat",_text], "PLAIN DOWN"];					
				};

// ------------------------ MaC added for testing 131011 ----------------------------------------------------
				
				case (player getVariable["combattimeout", 0] == time) : {
					_btnAbort ctrlEnable True;
					//cutText ["Cannot Abort while in combat!", "PLAIN DOWN"];
					//cutText [format[localize "str_abort_playerincombat",_text], "PLAIN DOWN"];					
				};
				
//-----------------------------------------------------------------------------------------------------------

				case (count (position player nearObjects ["Hanged", 100]) > 0) : {
					_btnAbort ctrlEnable false;
					cutText ["Logging out here is not allowed!", "PLAIN DOWN"];
				};
				default {
					_btnAbort ctrlEnable true;
					cutText ["", "PLAIN DOWN"];	
					call dayz_forceSave;
				};
			};
			sleep 1;
			_timeOut = _timeOut + 1;
		};
		cutText ["", "PLAIN DOWN"];

