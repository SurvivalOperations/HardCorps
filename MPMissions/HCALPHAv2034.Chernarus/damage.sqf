// ---- FX and damage while radiation
[] spawn {
	while {true} do {
		sleep 5;
		_Damage = getDammage player;
		if (!(player getVariable "Radiation")) then {
			sleep 10;
		} else {
			// ---- Create FX
			if (EnableFX == 1) then {
				[] spawn {
					"dynamicBlur" ppEffectEnable true;
					"dynamicBlur" ppEffectAdjust [0];
					"dynamicBlur" ppEffectCommit 5;
					"dynamicBlur" ppEffectAdjust [5];
					"dynamicBlur" ppEffectCommit 10;
					"dynamicBlur" ppEffectAdjust [5];
					"dynamicBlur" ppEffectCommit 10;
					sleep 15;
					"dynamicBlur" ppEffectAdjust [0];
					"dynamicBlur" ppEffectCommit 10;
				};
				[] spawn {
					sleep 14;
					titleText [" ", "Black Out"];
					sleep 1;
					titleText [" ", "Black In"]; titleFadeOut 1;
				};
				[] spawn {
					_PPRadi = ppEffectCreate ["colorCorrections", 1503];
					_PPRadi ppEffectEnable true;
					_PPRadi ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]];
					_PPRadi ppEffectCommit 5;
					sleep 5;
					_PPRadi ppEffectAdjust [0.162415, 0.209184, 0, [0.123299, 0.590986, 0.148809, 0.161564], [0, 1, 0, 0], [1, 1, 1, 1]]; 
					_PPRadi ppEffectCommit 10;
					sleep 10;
					_PPRadi ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]];
					_PPRadi ppEffectCommit 10;
					sleep 15;
					ppEffectDestroy _PPRadi;
				};
				[] spawn {
					_PPRadiGrain = ppEffectCreate ["filmGrain", 2005];
					_PPRadiGrain ppEffectEnable true;
					_PPRadiGrain ppEffectAdjust [0.1, 9, 0.4, 0.5, 0.7];
					_PPRadiGrain ppEffectCommit 0;
					sleep 5;
					_PPRadiGrain ppEffectEnable true;
					_PPRadiGrain ppEffectAdjust [0.2, 9, 0.2, 0.25, 0.35];
					_PPRadiGrain ppEffectCommit 0;
					sleep 10;
					_PPRadiGrain ppEffectAdjust [0, 0, 0, 0, 0];
					_PPRadiGrain ppEffectCommit 10;
					sleep 10;
					_PPRadiGrain ppEffectEnable false;
				};
			};
			sleep 2;
			if (EnableSound == 1) then {playSound "Geiger"; };
			sleep 8;
			player setDamage (getDammage player) + RaDamage;
		};
		sleep RaDamageInterval;
	};
};