# swkeep-tablet

A new replacement for my old Tablet Nui

# Installation

## step 1

- Open of qb-core\shared\items.lua
- add code below at end of QBShared.Items table

```lua
['keeptablet'] = {
        ['name'] = 'keeptablet',
        ['label'] = 'Adv tablet',
        ['weight'] = 2000,
        ['type'] = 'item',
        ['image'] = 'tablet.png',
        ['unique'] = true,
        ['useable'] = true,
        ['shouldClose'] = true,
        ['combinable'] = nil,
        ['description'] = 'Expensive tablet'
},
```

## step 2

-- Add it as a product inside to your mechanic shop

```lua
[1] = {
        name = "keeptablet",
        price = 25000,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
        requiredJob = {"mechanic"}
},
```

![icon](https://raw.githubusercontent.com/swkeep/swkeep-tablet/master/.github/images/swkeepTablet2.png)
![mainMenu](https://raw.githubusercontent.com/swkeep/swkeep-tablet/master/.github/images/swkeepTablet.png)
