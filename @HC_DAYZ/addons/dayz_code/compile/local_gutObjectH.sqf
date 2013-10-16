private ["_humanbody"];

_humanbody = _this select 0;

if (local _humanbody) then {
		_animalbody addMagazine "ItemTrophyEar";
	};
	

	[time, _humanbody] spawn {
		private ["_timer","_body","_pos","_inRange"];
		_timer = _this select 0;
		_body = _this select 1;
        	_pos = getPosATL _body;
		while {(count magazines _body > 0) and (time - _timer < 300) } do {
			sleep 5;
		};
		hideBody _body;
				
		//Send to server let everyone in 100 meters of the body know its just been hidden.
		_inRange = _pos nearEntities ["CAManBase",100];
		{
			PVDZ_send = [_x,"HideBody",[_body]];
			publicVariableServer "PVDZ_send";
		} forEach _inRange;
		
		sleep 5;
		deleteVehicle _body;
		true;
	};
};
