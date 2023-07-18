RegisterNetEvent('zf-perscriptions:makePrescription', function(prescriptionData)
    local itemData = {
        patientname = prescriptionData[1],
        patientid = prescriptionData[2],
        expiration = prescriptionData[3],
        drug = prescriptionData[4],
        doctor = prescriptionData[5],
        notes = prescriptionData[6]
    }

    zf.giveItem(source, 'prescription', 1, itemData)
end)

zf.createUsableItem('prescription', function(source, item)
    if not source then return end
    local metas = item.info
    if item.metadata then metas = item.metadata end
    local expi = tostring(metas.expiration)
    local correctDate = string.sub(expi, 1, #expi - 3)
    metas.expiration_date = os.date('%d %B %Y', correctDate)
    TriggerClientEvent('zf-prescriptions:openPrescription', source, metas)
end)

zf.checkVersion('zf-labo/zf-prescriptions')