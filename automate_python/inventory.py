inventory = {'arrow': 12, 'gold': 15, 'potions': 3, 'rope': 1}
loot = ['arrow', 'gold', 'gold', 'gold', 'arrow', 'diamond', 'food']

def print_items(dict):
    total = 0
    for k, v in dict.items():
        print(str(v) + 'x ' + k)
        total += v
    print('Total items: ' + str(total))

    return total

def add_items(inv, items):
    for i in items:
        if i in inv:
            inv[i] += 1
        else:
            inv[i] = 1

print_items(inventory)

add_items(inventory, loot)

print_items(inventory)