---
layout: post
title: "Learning the vi and Vim Editors"
date: 2016-10-05
category: books
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

|CTRL-L|Redrawing the screen|

#### Movement within a screen
H| Move to home - the top line on screen
M| Move to middle line on screen
L| MOve to last line on screen
nH| Move to n lines below top line
nL| Move to n lines above last line

#### Movement by Text Blocks
e| Move to end of word
E| Move to end of word (ignore punctuation)
(|Move to beginning of current sentence
)|Move to beginning of next sentence
{|Move to beginning of current paragraph
}|Move to beginning of next paragraph
[[|Move to beginning of current section
]]|Move to beginning of next section

CTRL-G|display at the bottom of your screen: the current line number, 
        the total number of lines in the file, what percentage of the total the present 
        line number represents.

#### Advancing to a specific place
vi +n file|Opens file at line number n
vi + file|Opens file at last line
vi +/pattern file|opens file at the first occurrence of pattern

### ex Editor 
vi is the visual mode of the more general, underlying line editor, which is **ex**.

ex practice| At the unix prompt, invoke the ex editor on a file called practice
:1/:1p| Go to and print(display) the 1st line
:1,3|Print(display) lines 1 througth 3
:1s/screen/line|Substitute screen for line on line 1
:vi|Invoke the vi editor on file

#### Editing with ex(allow you to modify large blocks of text with a single command)

Full name |Abbreviation |Meaning
delete |d |Delete lines
move |m |Move lines
copy |co |Copy lines
    | t |Copy lines (a synonym for co)


:3, 18d |Delete lines 3 through 18
:160,224m23| Move lines 160 through 224 to follow line 23(like delete and put in vi)
:23,29co100|Copy lines 23 through 29 and put after line 100.(like yank and put in vi)

:1,10#|Temporarily display the line numbers for a set of lines

:=|Print the total number of lines
:.=|Print the line number of the current line
:/pattern/=|Print the line number of the first line that matches pattern

Line Addressing Symobls
.|stands for the current line
$|stands for the last line of the file
%|stands for every line in the file(same as 1,$)

|:.,$d|Delete from current line to end of file|
|:%d|Delete all the lines in a file|
|:%t$|Copy all lines and place them at the end of the file|

Global searches
ex has a global command, *g*, that lets you search for a pattern and display 
all lines containing the pattern when it finds them. 
The command: g! does the opposite of :g.
Use :g! to search for all lines that do *not* contain pattern.

|:g/pattern|Finds (moves to) the last occurrence of pattern in the file|
|:g/pattern/p|Finds and displays all lines in the file containing *pattern*|
|:g!/pattern/nu|Finds and displays all lines in the file that don't contain *pattern*;
    also displays the line number for each line found.|

#### Saving and Existing Files

|:w|Writes (saves) the buffer to the file but does not exit|
|:q|Quits the editor (and returns to the Unix prompt)|
|:wq|Both writes the file and quits the editor. The write happens unconditionally, even
    if the file was not changed.|
|:x|Both writes the file and quits the editor. The file is written only if it has been
    modified.|

#### Ivoking vi on Multiple Files

vi file1 file2

|:n|Call in the next file, before switch, need to save the file by :w first|
|:args/:ar| lists the files named on the comamnd line, with the current file enclosed in brackets|
|:rewind/:rew|resets the current file to be the first file named on the command line|
|:last|move to the last file on the command line|
|CTRL+^| Switching back to previous file|

![images](../images/books/vi-on-Multiple-Files.png)

Setting options
1. wrapmargin(its abbreviation is wm): set a distance from the right margin at which
vi will automatically insert a newline character.
:set wm=10

2. Show line number
:set nu

3. wrapscan: controls whether searches wrap
:set nowrapscan


