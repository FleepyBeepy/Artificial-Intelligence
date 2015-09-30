del bin\*.ilk
del bin\*.pdb
del src\lib\Debug\*.* /Q
del src\lib\release\*.* /Q
del src\lua\Debug\*.* /Q
del src\lua\release\*.* /Q
del src\luac\Debug\*.* /Q
del src\luac\release\*.* /Q
rd src\debug
rd src\release
rd src\lib\Debug
rd src\lib\release
rd src\lua\Debug
rd src\lua\release
rd src\luac\Debug
rd src\luac\release
