-- Flash player opens full-screen windows from Firefox.  It closes
-- them if they lose focus, but also if they get focus too quickly.
-- Therefore set focus 200 ms after such a window is mapped (this may
-- need to be adjusted on slower computers).

_NET_WM_STATE = ioncore.x_intern_atom('_NET_WM_STATE', false)
_NET_WM_STATE_FULLSCREEN = ioncore.x_intern_atom('_NET_WM_STATE_FULLSCREEN',
                                                 false)

function is_fullscreen(cwin)
    local state = ioncore.x_get_window_property(cwin:xid(), _NET_WM_STATE, 4,
                                                1, true)
    if state then
        for k, v in pairs(state) do
            if v == _NET_WM_STATE_FULLSCREEN then
                return true
            end
        end
    end
    return false
end

defwinprop {
    class = 'Firefox-bin',
    match = function(prop, cwin, id) return is_fullscreen(cwin); end,
    switchto = false,
    flash_fullscreen = true,
}

ioncore.get_hook('clientwin_do_manage_alt'):add(
    function(cwin, table)
        local winprop = ioncore.getwinprop(cwin)
        if winprop and winprop.flash_fullscreen then
            local timer = ioncore.create_timer()
            timer:set(200, function() cwin:goto() end)
            return true
        else
            return false
        end
    end
)

