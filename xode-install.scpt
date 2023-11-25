set platformsDict to {iOS:true, watchOS:false, tvOS:false}

tell application "System Events"
	-- Run Xcode if its not running
	if (get name of processes) contains "Xcode" is false then
		tell application "Xcode" to activate
	end if
	
	tell process "Xcode"
		-- Agree with Xcode license 
		if exists window "Xcode and Apple SDKs Agreement" then
			click button "Agree" of window "Xcode and Apple SDKs Agreement"
		end if
		
		-- Check if first run
		if exists group 1 of window "Xcode" then
			-- Choose and install platforms
			tell group 1 of window "Xcode"
				-- iOS
				if iOS of platformsDict is true then
					tell checkbox 2 to if value is 0 then click
				end if
				-- watchOS
				if watchOS of platformsDict is true then
					tell checkbox 3 to if value is 0 then click
				end if
				-- tvOS
				if tvOS of platformsDict is true then
					tell checkbox 4 to if value is 0 then click
				end if
				
				-- Install selected
				click button 1
			end tell
		end if
		
		-- Skip "What’s New in Xcode" window
		if exists window "What’s New in Xcode" then
			click button 1 of window "What’s New in Xcode"
		end if
		
		-- Open "Platforms" window
		tell menu "Xcode" of menu bar item "Xcode" of menu bar 1 to click menu item "Settings…"
		
		-- Install platforms
		if exists window "Platforms" then
			-- Get platforms table
			tell table 1 of scroll area 1 of group 1 of window "Platforms"
				-- iOS
				if iOS of platformsDict is true then
					click button 1 of group 1 of UI element of row 2
				end if
				-- watchOS
				if watchOS of platformsDict is true then
					click button 1 of group 1 of UI element of row 3
				end if
				-- tvOS
				if tvOS of platformsDict is true then
					click button 1 of group 1 of UI element of row 4
				end if
			end tell
		end if
	end tell
end tell
