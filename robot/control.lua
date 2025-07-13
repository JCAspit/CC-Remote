local control = {}

function control.forward(blocks)
    blocks = blocks or 1

    local count = 0
    while count < blocks do
        turtle.forward()
        count = count + 1
    end
end

function control.back(blocks)
    blocks = blocks or 1

    local count = 0
    while count < blocks do
        turtle.back()
        count = count + 1
    end
end

function control.turn(direction, turns)
    if direction ~= -1 and direction ~= 1 then print("> Error: turn() only accepts -1 or 1") return end
    turns = turns or 1

    local count = 0
    if direction == 1 then
        while count < turns do
            turtle.turnRight()
        end
    end
    if direction == -1 then
        while count < turns do
            turtle.turnLeft()
        end
    end
end

function control.up(blocks)
	blocks = blocks or 1

	local count = 0
	while count < blocks do
		turtle.up()
	end
end

function control.down(blocks)
	blocks = blocks or 1

	local count = 0
	while count < blocks do
		turtle.down()
	end
end

function control.dig(direction)
	direction = direction or 0

	if direction == 0 then
		turtle.dig()

	elseif direction == 1 then
		turtle.digUp()

	elseif direction == -1 then
		turtle.digDown()

	end
end

function control.lua(command)
	if command == "" then print("> Error: no command provided") return end
	shell.execute(command)
end

return control
