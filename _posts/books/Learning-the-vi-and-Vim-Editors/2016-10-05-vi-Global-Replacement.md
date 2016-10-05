---
layout: post
title: "vi Global Replacement"
date: 2016-10-05
category: books
tags: [books]
---
Learning the vi and Vim Editors - 
Arnold Robbins, Elbert Hannah & Linda Lamp
----
### Global Replacement

|:s/old/new/|Changes *the first* occurrence of the pattern *old* to *new* on the current line|
|:s/old/new/g|Changes *every* occurrence of the pattern *old* to *new* on the current line, the g option in the syntax above stands for global.(The g option affects each pattern on a line, don't confuse it with the :g command, which affect each line of a file.)|
|:50,100s/old/new/g|Change every occurrence of old to new from line 50 to line 100|
|:1,$s/old/new/g|Change every occurrence of old to new within the entire file, same to ':%s/old/new/g'|

#### Confirming Substitutions

|:1,30s/his/the/gc|after search, confirm each replacement before it is made|

Another way to make repetitive changes that you may not want to make globally.

**Combination of the vi commands n (repeat last search) and dot (.) (repeat last command)**

Replace *which* with *that* 

|/which|Search for *which*|
|cwthat [ESC]|Change to that|
|n|Repeat Search|
|n|Repeat Search, skip a change|
|.|Repeat change (if appropriate)|

#### Context-Sensitive Replacement

    :g/pattern/s/old/new/g

1st g tells the command to operate on all lines of a file. 
*pattern* identifies the lines on which a substitution is to take place.
On those lines containing *pattern*, ex is to substitute (s) for old the characters in new.
The last g indicates that the substitution is to occur globally on that line.

### Pattern-Matching Rules (*regular expressions*)

Regular expressions can be used with the vi search commands / and ?, as well as in the ex commands :g and :s.
Works with other Unix programs, such as grep, sed and awk.

#### Metacharacters Used in Search Patterns

|. (period, dot)| Matches any single character except a newline.|
|* |Matches zero or more (as many as there are) of the single character that immediately precedes it. for example: bugs*|
|^ |When used at the start of a regular expression, requires that the following regular expression be found at the beginning of the line.|
|$ |When used at the end of a regular expression, requires that the preceding regular expression be found at the end of the line. |
|\ |Treats the following special character as an ordinary character (escaping the character)|
|[]|Matches any one of the characters enclosed between the brackets.|
|\< \>|Matches characters at the beginning (\<) or at the end (\>) of a word|
|~ | Matches whatever regular expression was used in the last search. Can use this pattern only in a regular search (with /).|

\( \) : Saves the pattern enclosed between \( and \) into a special holding space, or a "hold buffer". 
Up to nine patterns can be saved in this way on a single line. 
For example, the pattern "\(That) or \(this\)" saves *That* in hold buffer number 1 and saves *this* in hold buffer number 2. 
The pattern held can be "replayed" in substitutions by the sequences \1 to \9. 

    That or this --> this or That

    :%s/\(That\) or \(this\)/\2 or \1/

    abcdabcd --> alphabet-soup

    :%s/\(abcd\)\1/alphabet-soup/

[^0-9] matches any character that is not a digit.




