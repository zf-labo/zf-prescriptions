local Translations = {
    menu = {
        header = 'Prescriptions',
        patient_name = 'Patient Name',
        citizen_id = 'State ID',
        expiration_date = 'Expiration Date',
        drug = 'Drug',
        doctor = 'Doctor',
        notes = 'Notes',
    }
}

if GetConvar('zf_locale', 'en') == 'en' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end