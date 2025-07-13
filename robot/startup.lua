term.clear()
term.setCursorPos(1, 1)

if os.getComputerLabel() then
	print("> Label: ".. os.getComputerLabel().. " #".. os.getComputerID())
else
	print("> Label: Unnamed #".. os.getComputerID())
end
print("> Fuel level: ".. turtle.getFuelLevel())

shell.run("connect.lua")
