# Add local bin to path
set PATH $PATH ~/.local/bin

# Add Cargo bin to path
set PATH $PATH ~/.cargo/bin

function fish_greeting
	set todo ~/Dropbox/todo.md
	if test -e "$todo" 
		head -n 5 $todo | cowsay
	end
end

funcsave fish_greeting

