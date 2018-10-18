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

#### Open another person's calendar


In Calendar, click Home.

In the Manage Calendars group, click Open Calendar, and then click Open Shared
Calendar.

Type a name in the Name box, or click Name to select a name from the Address
Book.

The shared Calendar appears next to any calendar that is already in the view.

After you access a shared Calendar for the first time, the Calendar is added
to the folder pane. The next time that you want to view the shared Calendar,
you can click it in the Folder Pane.

If the other person whose Calendar you want to open hasn’t granted you
permission to view it, Outlook prompts you to ask the person for permission.
If you click Yes, a sharing request email message opens automatically. The
message requests the person to share his or her Calendar with you and also
provides the option to share your default Calendar with him or her.

