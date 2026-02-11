# Cake Cut Script

A FiveM script for GTA V that allows players to celebrate their birthday by cutting a cake at a designated location and receiving a cake slice item.

## Features

- 🎂 **Birthday-Exclusive Action** - Only players with the specified Citizen ID can cut the cake
- 🎬 **Smooth Animations** - Custom cutting animation with customizable duration
- ⏱️ **Cooldown System** - Prevent spam with configurable cooldown timers
- 🎯 **Zone-Based Interaction** - Uses ox_target for intuitive interaction
- 📦 **Inventory Integration** - Seamless item distribution via qb-core
- 🔔 **Notifications** - Clear feedback for all actions

## Dependencies

This script requires the following frameworks and resources to be installed:

- [qb-core](https://github.com/qbcore-framework/qb-core) - Core framework for QBCore-based servers
- [ox_target](https://github.com/overextended/ox_target) - Advanced targeting system

## Installation

1. Clone or download this resource to your resources folder
2. Ensure the resource is named or placed in a folder named `cake-cut`
3. Add `ensure cake-cut` to your `server.cfg`
4. Restart your server or use `/refresh` and `/start cake-cut`

## Item Setup

The script requires the `cake_slice` item to be added to your qb-core database. Add the following to your `qb-core/shared/items.lua` file:

```lua
['cake_slice'] = {
    name = 'cake_slice',
    label = 'Cake Slice',
    weight = 100,
    type = 'item',
    image = 'cake_slice.png',
    unique = false,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = 'A delicious slice of birthday cake'
},
```

**Note:** If you're using a custom item system or different item manager, adjust the item definition accordingly. The item name must match `Config.ItemName` in your config file.

## Configuration

Edit [b1/config.lua](b1/config.lua) to customize the script:

```lua
Config.Location = vector3(-564.71734619141, 5024.41015625, 160.92323303223)
Config.AllowedCitizenId = "MC05B7Q9"  -- Replace with birthday person's Citizen ID
Config.ItemName = 'cake_slice'        -- Item to give when cutting cake
Config.ItemAmount = 1                 -- Amount of items to give
Config.Cooldown = 0                   -- Cooldown in seconds (0 to disable)
```

### Animation Configuration

Customize the cutting animation:

```lua
Config.Animation = {
    dict = 'amb@prop_human_bbq@male@idle_a',  -- Animation dictionary
    anim = 'idle_b',                           -- Animation name
    duration = 5000,                           -- Animation duration in ms
    label = 'Cutting Cake...'                  -- Progress bar label
}
```

### Text Configuration

Customize all in-game messages:

```lua
Config.Text = {
    TargetLabel = "Cut Cake",
    Success = "You cut a slice of cake!",
    Cooldown = "The knife needs to rest...",
    Error = "You can't do that right now.",
    NotBirthday = "Today is not your birthday xD"
}
```

## Usage

1. Set the `Config.AllowedCitizenId` to the birthday person's Citizen ID
2. Navigate to the configured location
3. Look at the zone and interact using the ox_target menu
4. Select "Cut Cake" to trigger the animation
5. Upon completion, you'll receive the cake slice item

## Author

**KuleY** - Version 1.0.0

## License

This project is created for FiveM servers. Use responsibly.
