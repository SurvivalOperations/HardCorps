private ["_bunker", "_id", "_args", "_code"];
_bunker = _this select 0;
_id = _this select 2;
_args = _this select 3;
_code = _args select 0;
_move = _args select 1;

TARGET = _bunker;
ACTION_ID = _id;
CODE = _code;
TARGET_MOVE = _move;

_displayok = createdialog "KeypadDefuse";