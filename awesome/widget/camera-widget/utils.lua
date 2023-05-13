local utils = {}

function utils.extract_camera_status(lsmod_output)
	local on
	local off

	for line in lsmod_output:gmatch("%d") do
		if string.match(line, "0") then
			off = true
			return off
		end
	end

	return on
end

return utils
