---
layout: post
title: "Learning the vi and Vim Editors"
date: 2016-10-05
category: study 
tags: [books]
---
Learning the vi and Vim Editors - 
Arnold Robbins, Elbert Hannah & Linda Lamp
----

Line Editors: ed/ex
    Display a line of the file on the screen. 
Screen Editors: vi and Emacs
    Display a part of the file on your terminal screen.

vi is short for visual editor. It has 2 modes: command mode and insert mode.

Bottom-Line commands:
    The slash(/) and the question mark (?) begin search commands.
    A colon(:) begins all ex commands. ex commands are those used by the ex line editor. 
The ex editor is availabe to you when you use vi. because ex is the underlying editor and vi is really
just its "visual" mode. 

Remember that you are always working on a copy of your file in the buffer, 
and that your edits will not affect your original file until you save teh buffer. 

vi in view mode:
    vi -R 

Saving and Quitting a File: :wq in ex command line or ZZ in command mode. 

Wipe out all of the edits you have made in a session and then return to the original file:
    :e!  -- erase
    ! means performing the operation even though the buffer has been modified.

To delete a unneeded file and free some space:
:!rm junkfile

Starting an ex command with an exclamation point gives you access to Unix

In a job-control shell:
    CTRL-Z: suspend vi/a foreground process
    fg: return to vi

#### Moving the cursor

    1. You can precede movement commands with numbers. For example: 4l = llll
    2. 0 Moving to beginning of line.
    3. $ Moving to end of line.
    4. w move the cursor forward one word at a time, counting symbols and punctuation as equivalent to words.
    W move the cursor forward one word at a time, not counting symbols and punctuation as equivalent to words.
    b move backward by work
    B not counting punctuation
    5. Move to a specific line: G(Go To) command
        Plain G: goes to the end of the file
        1G: goes to the top of the file
        42G: gotest to line 42

#### Changing Text

|cw| change to the end of a word.|
|c2b| change back 2 words.|
|c$| change to the end of line.|
|c0| change to the beginning of .|
|cc| replace the entire current line, and go into insert mode.|
|C(same to c$)| replaces characters from the current cursor position to the end of the line. |
|r| replace character|
|R| replace text, but enter overstrike mode.|
|s| substitute text|
|S| change the whole line|
|~| change the case of current letter. |

#### Delete text "d (a text object)"

|dw| delete a word|
|dd| delete a line|
|D(shortcut for d$)| delete from the cursor position to the end of the line.|

|x| delete a single character|
|X| delete the character before the cursor|
|xp| delete character and put after cursor, transpose 2 letters|

#### Copying text

|y| yank|
|yy(same to Y)| yank the whole line|

|.| repeat command|
|u| undo the last command|
|U| undo all edits on a single line, as long as the cursor remains on that line.|

|A| append text to end of current line.|
|I| insert text at beginning of line.|
|o| open blank line below cursor for text|
|O| open blank line above cursor for text|

50i*
25a*-

|J| joining two lines|

#### Scrolling the screen

|^F| Scroll forward one screen|
|^B| Scroll backward one screen|
|^D| Scroll forward half screen(down)|
|^U| Scroll backward half screen(up)|
 
### Repositioning the Screen with z

|z [Enter]| Move current line to top of screen and scroll|
|z.       | Move current line to center of screen and scroll|
|z-       | Move current line to bottom of screen and scroll|


Setting options
1. wrapmargin(its abbreviation is wm): set a distance from the right margin at which
vi will automatically insert a newline character.
:set wm=10

2. Show line number
:set nu


