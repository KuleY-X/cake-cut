Config = {}

-- Location to target (Zone)
Config.Location = vector3(-564.71734619141, 5024.41015625, 160.92323303223)

-- Validation
Config.AllowedCitizenId = "MC05B7Q9" -- Replace with the birthday person's Citizen ID MC05B7Q9

-- Item to give
Config.ItemName = 'cake_slice'
Config.ItemAmount = 1

-- Animation settings
Config.Animation = {
    dict = 'amb@prop_human_bbq@male@idle_a',
    anim = 'idle_b', -- Cutting motion
    duration = 5000,
    label = 'Cutting Cake...'
}

-- Cooldown in seconds (0 to disable)
Config.Cooldown = 0

-- Text UI
Config.Text = {
    TargetLabel = "Cut Cake",
    Success = "You cut a slice of cake!",
    Cooldown = "The knife needs to rest...",
    Error = "You can't do that right now.",
    NotBirthday = "Today is not your birthday xD"
}
