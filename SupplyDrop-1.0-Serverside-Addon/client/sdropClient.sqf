if(!isDedicated)then{
	"SDROP_globalHint" addPublicVariableEventHandler { 
		_this select 1 spawn {	hint parseText format["%1", _this select 1]; };
	}; 
};
