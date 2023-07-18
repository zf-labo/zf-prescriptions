CreateThread(function()
    for _,zone in pairs(Prescriptions.Locations) do
        zf.addZone('prescription_'.._, zone.coords, zone.length or 1.5, zone.width or 1.5, {
            name = 'prescription_'.._,
            heading = zone.heading,
            debugPoly = zone.debug,
            minZ = zone.coords.z - 1.0,
            maxZ = zone.coords.z + 1.0,
        }, {
            options = {
                {
                    icon = zone.icon,
                    label = zone.label,
                    job = zone.job,
                    action = function()
                        OpenPrescriptionDialog()
                    end
                }
            },
            distance = 1.5
        })
    end
end)

function OpenPrescriptionDialog()
    local doctorName = zf.getPlayerName()
    local dialog = lib.inputDialog(Lang:t('menu.header'), {
        {
            type = 'input',
            label = Lang:t('menu.patient_name'),
            icon = '',
            required = true
        },
        {
            type = 'input',
            label = Lang:t('menu.citizen_id'),
            icon = '',
            required = true
        },
        {
            type = 'date',
            label = Lang:t('menu.expiration_date'),
            icon = '',
            required = true
        },
        {
            type = 'input',
            label = Lang:t('menu.drug'),
            icon = '',
            required = true
        },
        {
            type = 'input',
            label = Lang:t('menu.doctor'),
            icon = '',
            default = doctorName,
            required = true,
            disabled = true
        },
        {
            type = 'textarea',
            label = Lang:t('menu.notes'),
            icon = '',
            required = false
        }
    })

    if dialog then
        TriggerServerEvent('zf-perscriptions:makePrescription', dialog)
    end
end

RegisterNetEvent('zf-prescriptions:openPrescription', function(metas)
    lib.registerContext({
        id = 'zfprescriptions_prescriptiondetails',
        title = Lang:t('menu.header'),
        options = {
            {
                icon = 'fas fa-prescription-bottle-alt',
                title = Lang:t('menu.patient_name'),
                description = metas.patientname
            },
            {
                icon = 'fas fa-id-card',
                title = Lang:t('menu.citizen_id'),
                description = metas.patientid
            },
            {
                icon = 'fas fa-calendar-alt',
                title = Lang:t('menu.expiration_date'),
                description = metas.expiration_date
            },
            {
                icon = 'fas fa-pills',
                title = Lang:t('menu.drug'),
                description = metas.drug
            },
            {
                icon = 'fas fa-user-md',
                title = Lang:t('menu.doctor'),
                description = metas.doctor
            },
            {
                icon = 'fas fa-sticky-note',
                title = Lang:t('menu.notes'),
                description = metas.notes
            }
        }
    })
    lib.showContext('zfprescriptions_prescriptiondetails')
end)