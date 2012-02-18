Setup.Package
{
    vendor = "liflg.org",
    id = "racer",               -- unique identifier, will be proposed as installdirectory SAMPLE: "fakk2"
    description = "Racer",      -- full name of the game, will be used during setup SAMPLE: "Heavy Metal: FAKK2"
    version = "0.5.4beta1-english_x86",          -- version of the game SAMPLE: "1.02-english"
    splash = "splash.png", -- name of the splash file which has to be placed inside the meta directory
    splashpos = "left",    
    superuser = false, 
    write_manifest = true, -- needs to be true if an uninstall-option should be provided
                           -- NOTE: atm installing serveral thousands files will slow down the installation process

    support_uninstall = true, 
    recommended_destinations =
    {
        "/usr/local/games",
	"/opt/",
	MojoSetup.info.homedir,
    }, 

    Setup.Eula
    {
        description = "Racer license",
        source = "license.txt",
    },

    Setup.Readme
    {
        description = "README",
        source = "README.liflg"
    },

    Setup.DesktopMenuItem
    {
        disabled = false,
        name = "Racer",           -- name of the menu-entry. SAMPLE: "Heavy Metal: FAKK2"
        genericname = "Racing Game",    -- generic name. SAMPLE: "Ego-Shooter"
        tooltip = "play Racer",        -- tooltip SAMPLE "play Heavy Metal: FAKK2"
        builtin_icon = false,
        icon = "racer.xpm",   -- path to icon file, realtive to the base-dir of the installation
        commandline = "%0/racer",    -- gamebinary or startscript, "%0/" stands for the base directory of the installation SAMPLE: "%0/fakk2.sh"
        category = "Game", 
    },

   Setup.Option
    {    
    	value = true,
	required = true,   -- user will not be asked about this option, will be installed always
    	disabled = false,
    	bytes = 59811126, -- size of the files, used only(?) for progressbar, Mojosetup does not check available space 
    	description = "Required game data",

    	Setup.File                                                            -- no source = "xy" means installing from the "data"-dir of the installer
    	{
		wildcards = { "racer.xpm", "README.liflg", },                    -- installs file1 and the complete dir1 from the "data"-dir of the installer
    	},

	Setup.File
	{
		source = "base:///racer_0.5.4beta1.tar.xz/",
	},

	Setup.File
	{
		source = "base:///racer_0.5.4beta1-binaries.tar.xz/",
		permissions = "0755",
	},
    },
}

