local function download(url, file, overwrite)
	if fs.exists(file) then
		if overwrite == "force" then
			print("Overwriting ".. file)

		else if overwrite == false then
			print(file.. " already exists. Skipping.")
			return

		else if overwrite == true then
			while true do
				print(file.. " already exists. Overwrite? [y/n]")
				local choice = read()
				if choice == "y" then print("Overwriting...") break
				else if choice == "n" then print("Skipping...") return
				else print("Invalid option.")
				end
			end
		end
	end

	local response, err = http.get(url)
	if err then print("> ERROR: Unable to download url: ".. url.. "\nError: ".. err) return end

	local file = fs.open(file, "w")
	file.write(response.readAll())

	file.close()
end
end
end
end

local files = { --[["install.lua",]] "startup.lua", "json.lua", "connect.lua", "control.lua" }
local baseUrl = "https://raw.githubusercontent.com/JCAspit/CC-Remote/refs/heads/master/robot/"
for _, file in pairs(files) do
	print("Downloading ".. file.. " to ".. "/".. file)
	download(baseUrl.. file, "/".. file, "force")
end

shell.run("reboot")
