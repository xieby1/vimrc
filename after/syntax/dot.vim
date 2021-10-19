syn region   dotComment start="//" end="$" keepend contains=dotComment,dotTodo
hi link dotIdentifier NONE

" override dotString definition
syn region dotString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=xbyTodo
syn keyword xbyTodo [TODO] [OPEN]
hi def link xbyTodo Todo
