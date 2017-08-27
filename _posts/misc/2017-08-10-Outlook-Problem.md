#### Outlook 2016 hangs / gets stuck at processing & starting window

The Fix:

    1) Click the Windows button or press the Windows key on your keyboard
    2)In the Run box, type outlook.exe /safe
    3) Click OK
    4) When prompted to ‘Choose a Profile’, click OK (you may need to choose a profile if you have multiple ones)
    5) Outlook will open and it appears to repair itself
    6) You can exit Outlook and restart it normally to verify that the fix worked.

The solutions are copied from link [Outlook 2016 hangs / gets stuck at processing & starting window](https://angelcom.com/outlook-hangs-at-processing-starting-screen/)


# Outlook in Windows VM can't connect to the server

Solution Steps:

    Control Panel -> Mail -> Show Profiles -> Add -> Create new profile by
    using a new name.

Then, it will prompt a web connect page, you need to select use different
account in right bottom part, then next, it will try to set the profile
automatically.

After set successful, in the Mail panel, select Always use this profile,
select right profile. 

Then, open outlook, it should works!


Another solution is enter safe mode first(by issue `outlook /safe`), and then,
restart  the outlook, it should works!
