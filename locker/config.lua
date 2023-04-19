Config = {}

Config.Lockers = {
    {
        name = "locker_mrpd",
        location = {461.96408081055, -1000.0057373047, 30.791093826294},
        jobs = {"police", "offpolice"},
    },
}

Config.Uniforms = {
    {
        name = "Streifendienst",
        description = "Die regülare Uniform für den Streifendienst",
        jobs = {"police"},
        male = true,
        skin = {
            tshirt_1     = 126,
            tshirt_2     = 0,
            bproof_1     = 53,
            torso_1      = 28,
            torso_2      = 1,
            arms         = 0,
            chain_1      = 0,
            pants_1      = 145,
            pants_2      = 1,
            shoes_1      = 22,
            shoes_2      = 1,
        },
        skinGrades = {
            [0] = {
                torso_1      = 27,
                arms         = 4,
            },
            [2] = {
                torso_2      = 2,
            },
        },
    },
    {
        name = "Taktische Ausrüstung",
        description = "Streifenuniform mit taktischer Zusatzausrüstung für Gefahrenlagen",
        jobs = {"police"},
        male = true,
        skin = {
            tshirt_1     = 126,
            tshirt_2     = 0,
            bproof_1     = 4,
            torso_1      = 28,
            torso_2      = 1,
            arms         = 0,
            chain_1      = 0,
            pants_1      = 145,
            pants_2      = 1,
            shoes_1      = 22,
            shoes_2      = 1,
        },
        skinGrades = {
            [0] = {
                torso_1      = 27,
                arms         = 4,
            },
            [2] = {
                torso_2      = 2,
            },
        },
    },
}