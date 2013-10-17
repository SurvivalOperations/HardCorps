// get the action id from the call
       _actionID = _this select 2;
       // remove the action
       player removeAction _genAct;
       
titleCut ["", "BLACK OUT", 0.5];
sleep 1;
player switchmove "RepairingErc";
sleep 3;
player switchMove "Stand"; 
player setPos (getPos debug);
disableUserInput true;
playsound "Door";
sleep 5;
disableUserInput false;
player setPos (getPos p2);
titleCut ["", "BLACK IN", 0.5];
};