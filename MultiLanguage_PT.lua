local addonName = ...
local optionsFrame = CreateFrame("Frame")

local function languageExists(value)
    for _, language in ipairs(MultiLanguageOptions.AVAILABLE_LANGUAGES) do
        if language.value == value then
            return true
        end
    end
    return false
end

local function addLanguageOption()
    if not languageExists('pt') then
        table.insert(MultiLanguageOptions.AVAILABLE_LANGUAGES, {value = 'pt', text = 'Portuguese'})
        AddLanguageDropdownOption()
    end

    if MultiLanguageTranslations['pt'] == nil then
        MultiLanguageTranslations['pt'] = {
            description = "Descrição",
            objectives = "Objetivos"
        }
    end
end

local function addonLoaded(self, event, addonLoadedName)
    if addonLoadedName == addonName then
        addLanguageOption()
    end
end

optionsFrame:RegisterEvent("ADDON_LOADED")
optionsFrame:SetScript("OnEvent", addonLoaded)
