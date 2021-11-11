syn region   dotComment start="//" end="$" keepend contains=dotComment,dotTodo
hi link dotIdentifier NONE

" override dotString definition
syn region dotString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=xbyTodo
syn match xbyTodo "\[TODO\]"
syn match xbyTodo "\[OPEN\]"
hi def link xbyTodo Todo
