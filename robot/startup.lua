term.clear()
term.setCursorPos(1, 1)

print("> Label: ".. os.getComputerLabel().. " #".. os.getComputerID())
print("> Fuel level: ".. turtle.getFuelLevel())

shell.run("connect.lua")
