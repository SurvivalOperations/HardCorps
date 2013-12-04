private ["_object","_location","_dir","_worldspace","_objectID","_objectUID","_classname","_codeinput","_convertInput","_i","_stringInput","_numberInput","_fuel"];
_object = cursortarget; //get object
_location = getposATL _object; //get location of object
_dir = getDir _object; //get direction of object
_worldspace = [_dir,_location]; //generate worldspace like in db with direction and location
_objectID = _object getVariable["ObjectID","0"]; //get ObjectID
_objectUID = _object getVariable["ObjectUID","0"]; //get ObjectUID
_classname = _object getVariable["Classname","0"]; //get Classname
//_objectUID = _worldspace call dayz_objectUID2;; //alternative method to get worldspace, not recommended
_codeinput = _this select 0; //get input from keypanel
sleep 3; //some time to make sure its safed
_convertInput =+ _codeinput; //converts the input to positive
for "_i" from 0 to (count _convertInput - 1) do {_convertInput set [_i, (_convertInput select _i) + 48]}; //converts the array to an array that is able to convert to a string
_numberInput = parseNumber (toString _convertInput); //convert to a string and directly convert to number


	if ( _numberInput > 1000 && _numberInput < 10000) then { //checks whether the input number has 4 digits
	dayzDeleteObj = [_objectID,_objectUID]; //prepare global array to pass variables to the delete function
	publicVariableServer "dayzDeleteObj";
	if (isServer) then {
		dayzDeleteObj call server_deleteObj; //delete the object in the database to be able to recreate it
		};
	sleep 3; //wait some time to ensure everything is deleted
	_fuel = _numberInput / 1000; //calculate fuel to make it ready for database
	_object setVariable ["Code",_numberInput,true]; //set the code again to be sure its set to the object
	_object setVariable ["characterID",dayz_playerUID,true]; //set the playerUID again to be sure its set to the object
	dayzPublishObj = [dayz_playerUID,_object,[_dir,_location],_classname,_fuel,_numberInput]; //prepare global array to pass variables to the publish function
	publicVariableServer "dayzPublishObj";
	if (isServer) then {
		dayzPublishObj call server_publishObj; //recreate the database entry with the new code stored in the fuel field
	};
	_object setVariable ["Code",_numberInput,true]; //set the code again to be sure its set to the object
	cutText [format["You have successfully changed your code to: %1",(toString _convertInput)], "PLAIN DOWN",1]; //give positive response to player and put the code out to it can be rechecked
	playsound "beep"; //only sound response
	sleep 0.5;
	playsound "beep";
	sleep 0.5;
	playsound "beep";
	} 
	else { cutText ["Failed to change your code, please use exact 4 numbers!", "PLAIN DOWN"];breakOut "exit"; //if the number wasn't valid it will end the script and you can try it again
	_codeinput = []; //empty the array for safety
	};
	
	_codeinput = []; //empty the array for safety