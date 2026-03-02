-- Xeno Uyumlu Xbox One Spoofer (Hookmetamethod'suz - Mart 2026)
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

pcall(function()
    -- Input ayarları (Xbox taklidi)
    UserInputService.TouchEnabled = false
    UserInputService.MouseEnabled = false
    UserInputService.KeyboardEnabled = false
    UserInputService.GamepadEnabled = true
    UserInputService.ControllerEnabled = true
end)

pcall(function()
    -- Platform override
    local mt = getrawmetatable and getrawmetatable(UserInputService) or {}
    local oldNamecall = mt.__namecall
    if oldNamecall then
        setreadonly(mt, false)
        mt.__namecall = function(self, ...)
            local method = getnamecallmethod()
            if self == UserInputService and (method == "GetPlatform" or method == "GetPlatformName") then
                if method == "GetPlatform" then return Enum.Platform.XBoxOne end
                return "XboxOne"
            elseif self == GuiService and method == "IsTenFootInterface" then
                return true
            end
            return oldNamecall(self, ...)
        end
        setreadonly(mt, true)
    end
end)

print("[Xeno Xbox Spoofer] Başarılı! Platform Xbox One olarak spoof edildi.")
