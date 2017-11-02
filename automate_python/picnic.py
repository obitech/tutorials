picnic_items = {
    'apples': 3,
    'milk': 1,
    'bread': 5,
    'wine': 3,
    'grapes': 5,
    'sandwiches': 13
}

def print_picnic(picnic_items):
    l_len = max([len(x) for x in picnic_items.keys()]) + 2
    r_len = 4
    max_len = l_len + r_len

    print('PICNIC ITEMS'.center(max_len + 1,'-'))
    for k, v in picnic_items.items():
        print(k.ljust(l_len, '.') + str(v).rjust(r_len + 1, ' '))

print_picnic(picnic_items)