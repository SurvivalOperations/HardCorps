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
player setPos (getPos p1);
titleCut ["", "BLACK IN", 0.5];
};