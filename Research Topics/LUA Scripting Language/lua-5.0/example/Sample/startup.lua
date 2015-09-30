
unitIds = {}

for i=1, 10 do
	unitIds[i] = createUnit([[peon]])	
end

for i=1, 10 do
	print([[UnitId:]], unitIds[i])
end

for i=1, 10 do
	destroyUnit(unitIds[i])
end
