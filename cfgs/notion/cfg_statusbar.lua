--
-- Ion statusbar module configuration file
-- 


-- Create a statusbar
mod_statusbar.create{
    -- First screen, bottom left corner
    screen=0,
    pos='bl',
    -- Set this to true if you want a full-width statusbar
    fullsize=true,
    -- Swallow systray windows
    systray=true,

    -- Template. Tokens %string are replaced with the value of the 
    -- corresponding meter. Currently supported meters are:
    --   date          date
    --   load          load average (1min, 5min, 15min)
    --   load_Nmin     N minute load average (N=1, 5, 15)
    --   mail_new      mail count (mbox format file $MAIL)
    --   mail_unread   mail count
    --   mail_total    mail count
    --   mail_*_new    mail count (from an alternate mail folder, see below)
    --   mail_*_unread mail count
    --   mail_*_total  mail count
    --
    -- Space preceded by % adds stretchable space for alignment of variable
    -- meter value widths. > before meter name aligns right using this 
    -- stretchable space , < left, and | centers.
    -- Meter values may be zero-padded to a width preceding the meter name.
    -- These alignment and padding specifiers and the meter name may be
    -- enclosed in braces {}.
    --
    -- %filler causes things on the marker's sides to be aligned left and
    -- right, respectively, and %systray is a placeholder for system tray
    -- windows and icons.
    --
    template="[ %load ] %mpd  %filler %systray  [ %date ]",

}


-- Launch ion-statusd. This must be done after creating any statusbars
-- for necessary statusd modules to be parsed from the templates.
mod_statusbar.launch_statusd{
    -- Date meter
    date={
        -- ISO-8601 date format with additional abbreviated day name
        date_format='%a %Y-%m-%d %H:%M',
        -- Finnish etc. date format
        --date_format='%a %d.%m.%Y %H:%M',
        -- Locale date format (usually shows seconds, which would require
        -- updating rather often and can be distracting)
        --date_format='%c',
        
        -- Additional date formats. 
        --[[ 
        formats={ 
            time = '%H:%M', -- %date_time
        }
        --]]
    },      

    -- Load meter
    load={
        update_interval=15*1000,
        --important_threshold=1.5,
        --critical_threshold=4.0,
    },
mem = {
update_interval = 25*1000, --> Milliseconds
used_alarm = 85,
units = "m"        --> "g" or "k" too
},
--

    -- Mail meter
    --
    -- To monitor more mbox files, add them to the files table.  For
    -- example, add mail_work_new and mail_junk_new to the template
    -- above, and define them in the files table:
    --
    -- files = { work = "/path/to/work_email", junk = "/path/to/junk" }
    --
    -- Don't use the keyword 'spool' as it's reserved for mbox.
    --mail={
        --update_interval=60*1000,
        --mbox=os.getenv("MAIL"),
        --files={},
    --},
laptopstatus = {                                                                             
    interval = 10,                    -- Polling interval in seconds
    temperature_important = 56,       -- Temperature which will cause important hint
    temperature_critical = 66,        -- Temperature which will cause critical hint
    batterypercent_important = 20,    -- Battery percent which will cause important hint
    batterypercent_critical = 9,      -- Battery percent which will cause critical hint
    batterytimeleft_important = 600,  -- Battery time left (in secs) which will cause important hint
    batterytimeleft_critical = 300,   -- Battery time left (in secs) which will cause critical hint
    ac_state = {"/proc/acpi/ac_adapter/AC/state"},
    temp_info = {"/proc/acpi/ibm/thermal"},
    bat_info = {"/proc/acpi/battery/BAT0/info",
                "/proc/acpi/battery/BAT1/info"},
    bat_state = {"/proc/acpi/battery/BAT0/state",
                 "/proc/acpi/battery/BAT1/state"}
  },

mpd = { 

    address="hal"
    }

}

