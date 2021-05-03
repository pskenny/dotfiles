# Add local bin to path
set PATH $PATH ~/.local/bin

# Add Cargo bin to path
set PATH $PATH ~/.cargo/bin

function fish_greeting
	set todo ~/Dropbox/todo.md
	if test -e "$todo" 
		cat $todo | cowthink -s -n | lolcat
	end
end

funcsave fish_greeting

