local Translations = {
    menu = {
        header = 'Prescriptions',
        patient_name = 'Nom du Patient',
        citizen_id = 'ID Citoyen',
        expiration_date = 'Date d\'expiration',
        drug = 'Médicament',
        doctor = 'Docteur',
        notes = 'Notes',
    }
}

if GetConvar('zf_locale', 'en') == 'fr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end