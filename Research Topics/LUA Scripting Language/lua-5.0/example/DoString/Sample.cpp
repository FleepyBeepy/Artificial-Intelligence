
extern "C"{
	#include <lua.h>
	#include <lualib.h>
	#include <lauxlib.h>
}

#include <stdio.h>


int main(int argc, char* argv[])
{
	lua_State* luaVM  = lua_open();
	char* strLuaInput = 0;

	if (NULL == luaVM)
	{
		printf("Error Initializing lua\n");
		return -1;
	}

    //initialize lua standard library functions
	lua_baselibopen(luaVM);
	lua_iolibopen(luaVM);
	lua_strlibopen(luaVM);
	lua_mathlibopen(luaVM);

	strLuaInput = "a = 1 + 1;\nprint (\"1+1=\" .. a);\n";

	lua_dostring(luaVM, strLuaInput);

	lua_close(luaVM);
	return 0;
}
