# pw.py - Project: an insecure password locker
# DON'T USE THIS FOR ACTUAL PASSWORDS

PASSWORDS = {
    'email': 'AOPSdq9e3043AAA',
    'FB': 'asdk2#32340)WQel',
    'blog': '934KSDksdxz#iaxlc;E'
}

import sys
import pyperclip

if len(sys.argv) != 2:
    print("Use:\n\tpython3 pw.py [account]\nto copy account password to clipboard")
    sys.exit(1)

account = sys.argv[1]

if account in PASSWORDS:
    pyperclip .copy(PASSWORDS[account])
    print("Passwort for " + account + " copied to clipboard.")
else:
    print("No account with name " + account + " found.")