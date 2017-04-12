### tmux guide
http://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/

terminal multiplexer, Simply speaking, tmux acts as a window manager within your terminal1 and allows you to create multiple windows and panes within a single terminal window.

### tmux cmd
#### Enter into tmux mode

    tmux

#### Spliting Panes

    Ctrl+b % to split the pane horizontally.
    Ctrl+b " to split the pane vertically.

#### Navigating Panes

    Ctrl+b <arrow key> to switch to different pane.
    Ctrl+d Close a pane.

#### Create a new window

    Ctrl+b c

#### Switch to a previous window

    Ctrl+b p 

#### to switch to the next window

    Ctrl+b n

#### To detach your current session 

    Ctrl+b d

#### Have tmux give you a choice which of your sessions you want to detach. 
    
    Ctrl+b D

#### List all running sessions

    tmux ls

#### Attach to a session

    tmux attach -t 0

#### See a list of all available commands
    
    Ctrl+b ? 


#### make a pane go full screen
    
    Ctrl+b z

Hit C-b z again to shrink it back to its previous size.



