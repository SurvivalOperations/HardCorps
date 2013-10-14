private ["_humanbody","_ehLoc"];
_humanbody = _this select 0;
// _qty = _this select 1;

if (local _humanbody) then {
	_humanbosy addMagazine "ItemTrophyEar";
	
	[time, _humanbody] spawn { 
		private ["_timer", "_body"]; 
		_timer = _this select 0; 
		_body = _this select 1; 
		while {(count magazines _body >0) and (time - _timer < 300) } do { 
			sleep 5;
		}; 
		//["dayzHideBody",_body] call broadcastRpcCallAll;
		dayzHideBody = _body;
		hideBody _body; // local player
		publicVariable "dayzHideBody"; // remote player
		sleep 5;
		deleteVehicle _body;
		true;
	};
	
};