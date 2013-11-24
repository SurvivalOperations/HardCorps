//RADIATION SCRIPT MADE BY OGIRDOR v1.0 
//Thanks to BTK

EnableFX = 1;
RaDamage = 0.1;
RaDamageInterval = 30;
EnableSound = 1;

RadiationInit = true;

//Variable Creation
if (isDedicated) exitWith {};
player setVariable ["Radiation", false];
player setVariable ["GasmaskUnsafe", false];
player setVariable ["GasmaskArea", false];
player setVariable ["ACE_Identity", "ACE_Original_Identity"];
sleep 1;


//Restart on respawn
[] spawn {
	while {true} do {
		sleep 5;
		waitUntil {!(alive player)};
		sleep 5;
		waitUntil {(alive player)};
		player setVariable ["Radiation", false];
		player setVariable ["GasmaskUnsafe", false];
		player setVariable ["GasmaskArea", false];
		player setVariable ["ACE_Identity", "ACE_Original_Identity"];
	};
};

