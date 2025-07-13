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
    if direction ~= -1 and direction ~= 1 then print("turn() only accepts -1 or 1") return end
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

return control
