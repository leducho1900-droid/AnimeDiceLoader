-- Anime Dice V43 | GitHub public bootstrap
-- PUBLIC FILE: no main V43 source, no key, no admin secret.
-- V43 remains encrypted in Cloudflare D1 and is provided only after validation.

local LICENSE_LOADER = "https://anime-dice-license.leducho1900.workers.dev/loader.lua"

local ok, contents = pcall(function()
    return game:HttpGet(LICENSE_LOADER)
end)
if not ok or type(contents) ~= "string" or #contents < 200 then
    warn("[Anime Dice] Khong tai duoc loader xac thuc. Vui long thu lai.")
    return
end

local run, compileError = loadstring(contents)
if not run then
    warn("[Anime Dice] Loader khong hop le: " .. tostring(compileError))
    return
end

local started, runtimeError = pcall(run)
if not started then
    warn("[Anime Dice] Loader loi: " .. tostring(runtimeError))
end
