local function parse_and_save_frames(txt_filename)
	local frames = {}
	local current_frame = {}
	local line_count = 0
	local frame_length = 14

	-- Open the text file for reading
	local txt_file = io.open(txt_filename, "r")
	if not txt_file then
		error("Failed to open text file: " .. txt_filename)
	end

	-- Parse frames with 8 lines per frame
	for line in txt_file:lines() do
		if line_count ~= 0 then
			table.insert(current_frame, line)
		end
		line_count = line_count + 1

		if line_count == frame_length then
			-- Add the current frame as a concatenated string
			table.insert(frames, table.concat(current_frame, "\n"))
			current_frame = {} -- Reset for the next frame
			line_count = 0
		end
	end

	-- Add the last frame if it has remaining lines
	if #current_frame > 0 then
		table.insert(frames, table.concat(current_frame, "\n"))
	end

	txt_file:close()

	return frames
end

return parse_and_save_frames
