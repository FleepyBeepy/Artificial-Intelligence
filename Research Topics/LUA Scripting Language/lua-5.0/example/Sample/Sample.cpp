
#include <stdio.h>
#include <memory.h>
#include <string.h>

extern "C"{
	#include <lua.h>
	#include <lualib.h>
	#include <lauxlib.h>
}

int script_createUnit( lua_State* lvm);
int script_destroyUnit( lua_State* lvm);


int main(int argc, char* argv[])
{
	lua_State* lvm  = lua_open();
	char* strLuaInput = 0;

	if (NULL == lvm)
	{
		printf("Error Initializing lua\n");
		return -1;
	}

    //initialize lua standard library functions
	lua_baselibopen(lvm);
	lua_iolibopen(lvm);
	lua_strlibopen(lvm);
	lua_mathlibopen(lvm);


	lua_register( lvm, "createUnit", script_createUnit );
	lua_register( lvm, "destroyUnit", script_destroyUnit );

	lua_dofile(lvm, "startup.lua");


	lua_close(lvm);
	return 0;
}

int script_createUnit(lua_State* lvm)
{
	static int nextId = 100;

	const char* type = lua_tostring(lvm, -1);

	if (memcmp(type, "peon", strlen(type))){
		return 0;
	}
	
	int unitId = nextId++;

	printf("script_createUnit. type: %s assigned id: %d\n", type,  unitId);

	lua_pop(lvm, 1);
	lua_pushnumber(lvm, unitId);
	return 1;
}

int script_destroyUnit(lua_State* lvm)
{
	int a = (int)lua_tonumber(lvm, -1);
	printf("script_destroyUnit: %d\n",a);
	return 1;
}
