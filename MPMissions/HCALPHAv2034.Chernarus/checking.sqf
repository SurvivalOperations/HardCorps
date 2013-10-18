if (isNil "RadiationInit") then {waitUntil {!(isNil "RadiationInit")};};

[] spawn {
	while {true} do {
		sleep 5;
		if (((player getVariable "ACE_Identity") == "ACE_GlassesGasMask_RU") || ((player getVariable "ACE_Identity") == "ACE_GlassesGasMask_US")) then {
 			//execVM "stop.sqf";
			TitleText["You feel normal","PLAIN DOWN"];
		} else {
			execVM "damage.sqf";
			player setVariable ["Radiation", true];
			TitleText["You feel strange","PLAIN DOWN"];
		};
	};
};
