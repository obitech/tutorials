# Adds bullet points to multi-line string

import pyperclip as pyc 
text = pyc.paste()

# Seperate Lines
lines = text.split('\n')

# Add stars
for i in range(len(lines)):
    lines[i] = '* ' + lines[i]

# Join lines
text = '\n'.join(lines)

pyc.copy(text)