# The INFO1112 Assignment 1 Spec as Checklists

- [ ] Shell runs infinitely (in an infinite loop) until it is terminated either by EOF (CTRL + D) or user enters `exit`.
- [ ] If user enters CTRL + C but no command is running (i.e., the prompt is being displayed), then CTRL + C should be silently ignored, and a new prompt should be displayed.
- [ ] If user inputs a blank command (an empty line, with or without whitespace), the shell should simply display a new prompt
- [ ] When we input a line, the line is split by whitespace, spaces, tabs, etc, with each "word" forming an "argument"
- [ ] The line `hello there      how  are you` is split into ` ["hello", "there", "how", "are", "you"]`
- [ ] For quoted strings (both single `'` and double quotes `"`), the outer level of quotes are stripped from the quoted string. If a string is inside some quotes, and it includes whitespace, the whitespace is preserved. For example, the input line `hello  there "how are you" 'going   today'` will be split as ` ["hello", "there", "how are you", "going   today"]`. Meanwhile, the input line `hello  there  'my   name is  "Sarah"'` will be split as ` ["hello", "there", 'my   name is  "Sarah"']`
- [ ] Quotes can also be escaped by typing a backslash (`\`) before the quote character. So things like `\"` or `\'` will not be interpreted as opening/closing quotes, but instead, as a quote CHARACTER. For example, the input line `my "\"string\"" which 'is \'quoted\''` will be split as `["my", '"string"', "which", "is 'quoted'"]` (you're encouraged to use the `shlex` module!)
- [ ] SOME EDGE CASES - it's valid to have double quotes inside single quotes, and single quotes inside double quotes. It's ALSO valid for quotes to be spliced inside of arguments and can even be next to each other, as long as the other layer of quotes is stripped out. For example, the input line ` hello there "quotes are""next to 'each'"-other` should be split as ` ["hello", "there", "quotes arenext to 'each'-other"]`
- [ ] SOME ERROR CASES - a non-closed quoted argument should be considered syntax error, and you MUST output this error message to `stderr`: `mysh: syntax error: unterminated quote`
- [ ] Unterminated quote characters are valid if they are inside quotes of a DIFFERENT type. e.g., ` this  is   "Tom's PC"` should be split as ` ["this", "is", "Tom's PC"]`
- [ ] When a line is split the first word is always defined as the name of commands to execute. For example, the input line ` sort     input.txt  -o output.txt` will be split as `["sort", "input.txt", "-o", "output.txt"]` with `sort` being the name of the command to execute, and `["input.txt", "-o", "output.txt"]` being the arguments.
- [ ] The command (i.e., first word) will be matched to a built-in command, otherwise, it will be used to execute an executable given by an absolute or relative path e.g., `./my_compiled_prog`
- [ ] The info you learn ao
