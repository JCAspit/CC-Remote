local json = require("json")
local control = require("control")

local url = ""
if not url then print("Please provide a URL to which to connect.") return end
local ws, err = http.websocket(url)
if err then print("ERROR: Unable to connect to server.\n".. err) return end
print("> Connected to server.")
print("> Awaiting command...")

local function signal()
    ws.send('{"type":"CLIENT","message":"'.. os.getComputerLabel().. '"}')
end

local function eval(encoded)
    local decoded = json.decode(encoded)
    print("> Evaluating: ".. decoded.command)
    --local f = load(decoded.command)
    --local success, err = f()
    local success, err = control[decoded.command]()
    if err then
        print("> ERROR: Unable to evaluate command: ".. decoded.command)
        print("  Error: ".. err)
    end
end

while true do
    local cmd = ws.receive()
    signal()
    eval(cmd)
end
ws.close()
