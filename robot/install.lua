local function download(url, file, overwrite)
	local response, err = http.get(url)
	if err then print("> ERROR: Unable to download url: ".. url.. "\nError: ".. err) return end

	local file = fs.open(file, "w")
	file.write(response.readAll())

	file.close()
end

local files = {	"startup.lua", "json.lua", "connect.lua", "control.lua", "install.lua" }
local baseUrl = "https://raw.githubusercontent.com/JCAspit/CC-Remote/refs/heads/master/robot/"
for _, file in pairs(files) do
	print("Downloading ".. file.. " to ".. "/".. file)
	download(baseUrl.. file, "/".. file, "force")
end

shell.run("reboot")
