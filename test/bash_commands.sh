#!/bin/bash 
2 ############################################################################## 
3 # SHORTCUTS 
4 ############################################################################## 
5 
 
6 
 
7 CTRL+A  # move to beginning of line 
8 CTRL+B  # moves backward one character 
9 CTRL+C  # halts the current command 
10 CTRL+D  # deletes one character backward or logs out of current session, similar to exit 
11 CTRL+E  # moves to end of line 
12 CTRL+F  # moves forward one character 
13 CTRL+G  # aborts the current editing command and ring the terminal bell 
14 CTRL+J  # same as RETURN 
15 CTRL+K  # deletes (kill) forward to end of line 
16 CTRL+L  # clears screen and redisplay the line 
17 CTRL+M  # same as RETURN 
18 CTRL+N  # next line in command history 
19 CTRL+O  # same as RETURN, then displays next line in history file 
20 CTRL+P  # previous line in command history 
21 CTRL+R  # searches backward 
22 CTRL+S  # searches forward 
23 CTRL+T  # transposes two characters 
24 CTRL+U  # kills backward from point to the beginning of line 
25 CTRL+V  # makes the next character typed verbatim 
26 CTRL+W  # kills the word behind the cursor 
27 CTRL+X  # lists the possible filename completions of the current word 
28 CTRL+Y  # retrieves (yank) last item killed 
29 CTRL+Z  # stops the current command, resume with fg in the foreground or bg in the background 
30 
 
31 ALT+B   # moves backward one word 
32 ALT+D   # deletes next word 
33 ALT+F   # moves forward one word 
34 
 
35 DELETE  # deletes one character backward 
36 !!      # repeats the last command 
37 exit    # logs out of current session 
38 
 
39 
 
40 ############################################################################## 
41 # BASH BASICS 
42 ############################################################################## 
43 
 
44 env                 # displays all environment variables 
45 
 
46 echo $SHELL         # displays the shell you're using 
47 echo $BASH_VERSION  # displays bash version 
48 
 
49 bash                # if you want to use bash (type exit to go back to your previously opened shell) 
50 whereis bash        # finds out where bash is on your system 
51 which bash          # finds out which program is executed as 'bash' (default: /bin/bash, can change across environments) 
52 
 
53 clear               # clears content on window (hide displayed lines) 
54 
 
55 
 
56 ############################################################################## 
57 # FILE COMMANDS 
58 ############################################################################## 
59 
 
60 
 
61 ls                            # lists your files in current directory, ls <dir> to print files in a specific directory 
62 ls -l                         # lists your files in 'long format', which contains the exact size of the file, who owns the file and who has the right to look at it, and when it was last modified 
63 ls -a                         # lists all files, including hidden files (name beginning with '.') 
64 ln -s <filename> <link>       # creates symbolic link to file 
65 touch <filename>              # creates or updates (edit) your file 
66 cat <filename>                # prints file raw content (will not be interpreted) 
67 any_command > <filename>      # '>' is used to perform redirections, it will set any_command's stdout to file instead of "real stdout" (generally /dev/stdout) 
68 more <filename>               # shows the first part of a file (move with space and type q to quit) 
69 head <filename>               # outputs the first lines of file (default: 10 lines) 
70 tail <filename>               # outputs the last lines of file (useful with -f option) (default: 10 lines) 
71 vim <filename>                # opens a file in VIM (VI iMproved) text editor, will create it if it doesn't exist 
72 mv <filename1> <dest>         # moves a file to destination, behavior will change based on 'dest' type (dir: file is placed into dir; file: file will replace dest (tip: useful for renaming)) 
73 cp <filename1> <dest>         # copies a file 
74 rm <filename>                 # removes a file 
75 diff <filename1> <filename2>  # compares files, and shows where they differ 
76 wc <filename>                 # tells you how many lines, words and characters there are in a file. Use -lwc (lines, word, character) to ouput only 1 of those informations 
77 chmod -options <filename>     # lets you change the read, write, and execute permissions on your files (more infos: SUID, GUID) 
78 gzip <filename>               # compresses files using gzip algorithm 
79 gunzip <filename>             # uncompresses files compressed by gzip 
80 gzcat <filename>              # lets you look at gzipped file without actually having to gunzip it 
81 lpr <filename>                # prints the file 
82 lpq                           # checks out the printer queue 
83 lprm <jobnumber>              # removes something from the printer queue 
84 genscript                     # converts plain text files into postscript for printing and gives you some options for formatting 
85 dvips <filename>              # prints .dvi files (i.e. files produced by LaTeX) 
86 grep <pattern> <filenames>    # looks for the string in the files 
87 grep -r <pattern> <dir>       # search recursively for pattern in directory 
88 
 
89 
 
90 ############################################################################## 
91 # DIRECTORY COMMANDS 
92 ############################################################################## 
93 
 
94 
 
95 mkdir <dirname>  # makes a new directory 
96 cd               # changes to home 
97 cd <dirname>     # changes directory 
98 pwd              # tells you where you currently are 
99 
 
100 
 
101 ############################################################################## 
102 # SSH, SYSTEM INFO & NETWORK COMMANDS 
103 ############################################################################## 
104 
 
105 
 
106 ssh user@host            # connects to host as user 
107 ssh -p <port> user@host  # connects to host on specified port as user 
108 ssh-copy-id user@host    # adds your ssh key to host for user to enable a keyed or passwordless login 
109 
 
110 whoami                   # returns your username 
111 passwd                   # lets you change your password 
112 quota -v                 # shows what your disk quota is 
113 date                     # shows the current date and time 
114 cal                      # shows the month's calendar 
115 uptime                   # shows current uptime 
116 w                        # displays whois online 
117 finger <user>            # displays information about user 
118 uname -a                 # shows kernel information 
119 man <command>            # shows the manual for specified command 
120 df                       # shows disk usage 
121 du <filename>            # shows the disk usage of the files and directories in filename (du -s give only a total) 
122 last <yourUsername>      # lists your last logins 
123 ps -u yourusername       # lists your processes 
124 kill <PID>               # kills the processes with the ID you gave 
125 killall <processname>    # kill all processes with the name 
126 top                      # displays your currently active processes 
127 bg                       # lists stopped or background jobs ; resume a stopped job in the background 
128 fg                       # brings the most recent job in the foreground 
129 fg <job>                 # brings job to the foreground 
130 
 
131 ping <host>              # pings host and outputs results 
132 whois <domain>           # gets whois information for domain 
133 dig <domain>             # gets DNS information for domain 
134 dig -x <host>            # reverses lookup host 
135 wget <file>              # downloads file 
136 
 
137 
 
138 ############################################################################## 
139 # VARIABLES 
140 ############################################################################## 
141 
 
142 
 
143 varname=value                # defines a variable 
144 varname=value command        # defines a variable to be in the environment of a particular subprocess 
145 echo $varname                # checks a variable's value 
146 echo $$                      # prints process ID of the current shell 
147 echo $!                      # prints process ID of the most recently invoked background job 
148 echo $?                      # displays the exit status of the last command 
149 export VARNAME=value         # defines an environment variable (will be available in subprocesses) 
150 
 
151 array[0]=valA                # how to define an array 
152 array[1]=valB 
153 array[2]=valC 
154 array=([2]=valC [0]=valA [1]=valB)  # another way 
155 array=(valA valB valC)              # and another 
156 
 
157 ${array[i]}                  # displays array's value for this index. If no index is supplied, array element 0 is assumed 
158 ${#array[i]}                 # to find out the length of any element in the array 
159 ${#array[@]}                 # to find out how many values there are in the array 
160 
 
161 declare -a                   # the variables are treaded as arrays 
162 declare -f                   # uses function names only 
163 declare -F                   # displays function names without definitions 
164 declare -i                   # the variables are treaded as integers 
165 declare -r                   # makes the variables read-only 
166 declare -x                   # marks the variables for export via the environment 
167 
 
168 ${varname:-word}             # if varname exists and isn't null, return its value; otherwise return word 
169 ${varname:=word}             # if varname exists and isn't null, return its value; otherwise set it word and then return its value 
170 ${varname:?message}          # if varname exists and isn't null, return its value; otherwise print varname, followed by message and abort the current command or script 
171 ${varname:+word}             # if varname exists and isn't null, return word; otherwise return null 
172 ${varname:offset:length}     # performs substring expansion. It returns the substring of $varname starting at offset and up to length characters 
173 
 
174 ${variable#pattern}          # if the pattern matches the beginning of the variable's value, delete the shortest part that matches and return the rest 
175 ${variable##pattern}         # if the pattern matches the beginning of the variable's value, delete the longest part that matches and return the rest 
176 ${variable%pattern}          # if the pattern matches the end of the variable's value, delete the shortest part that matches and return the rest 
177 ${variable%%pattern}         # if the pattern matches the end of the variable's value, delete the longest part that matches and return the rest 
178 ${variable/pattern/string}   # the longest match to pattern in variable is replaced by string. Only the first match is replaced 
179 ${variable//pattern/string}  # the longest match to pattern in variable is replaced by string. All matches are replaced 
180 
 
181 ${#varname}                  # returns the length of the value of the variable as a character string 
182 
 
183 *(patternlist)               # matches zero or more occurrences of the given patterns 
184 +(patternlist)               # matches one or more occurrences of the given patterns 
185 ?(patternlist)               # matches zero or one occurrence of the given patterns 
186 @(patternlist)               # matches exactly one of the given patterns 
187 !(patternlist)               # matches anything except one of the given patterns 
188 
 
189 $(UNIX command)              # command substitution: runs the command and returns standard output 
190 
 
191 
 
192 ############################################################################## 
193 # FUNCTIONS 
194 ############################################################################## 
195 
 
196 
 
197 # The function refers to passed arguments by position (as if they were positional parameters), that is, $1, $2, and so forth. 
198 # $@ is equal to "$1" "$2"... "$N", where N is the number of positional parameters. $# holds the number of positional parameters. 
199 
 
200 
 
201 function functname() { 
202   shell commands 
203 } 
204 
 
205 unset -f functname  # deletes a function definition 
206 declare -f          # displays all defined functions in your login session 
207 
 
208 
 
209 ############################################################################## 
210 # FLOW CONTROLS 
211 ############################################################################## 
212 
 
213 
 
214 statement1 && statement2  # and operator 
215 statement1 || statement2  # or operator 
216 
 
217 -a                        # and operator inside a test conditional expression 
218 -o                        # or operator inside a test conditional expression 
219 
 
220 # STRINGS 
221 
 
222 str1 = str2               # str1 matches str2 
223 str1 != str2              # str1 does not match str2 
224 str1 < str2               # str1 is less than str2 (alphabetically) 
225 str1 > str2               # str1 is greater than str2 (alphabetically) 
226 -n str1                   # str1 is not null (has length greater than 0) 
227 -z str1                   # str1 is null (has length 0) 
228 
 
229 # FILES 
230 
 
231 -a file                   # file exists 
232 -d file                   # file exists and is a directory 
233 -e file                   # file exists; same -a 
234 -f file                   # file exists and is a regular file (i.e., not a directory or other special type of file) 
235 -r file                   # you have read permission 
236 -s file                   # file exists and is not empty 
237 -w file                   # your have write permission 
238 -x file                   # you have execute permission on file, or directory search permission if it is a directory 
239 -N file                   # file was modified since it was last read 
240 -O file                   # you own file 
241 -G file                   # file's group ID matches yours (or one of yours, if you are in multiple groups) 
242 file1 -nt file2           # file1 is newer than file2 
243 file1 -ot file2           # file1 is older than file2 
244 
 
245 # NUMBERS 
246 
 
247 -lt                       # less than 
248 -le                       # less than or equal 
249 -eq                       # equal 
250 -ge                       # greater than or equal 
251 -gt                       # greater than 
252 -ne                       # not equal 
253 
 
254 if condition 
255 then 
256   statements 
257 [elif condition 
258   then statements...] 
259 [else 
260   statements] 
261 fi 
262 
 
263 for x in {1..10} 
264 do 
265   statements 
266 done 
267 
 
268 for name [in list] 
269 do 
270   statements that can use $name 
271 done 
272 
 
273 for (( initialisation ; ending condition ; update )) 
274 do 
275   statements... 
276 done 
277 
 
278 case expression in 
279   pattern1 ) 
280     statements ;; 
281   pattern2 ) 
282     statements ;; 
283 esac 
284 
 
285 select name [in list] 
286 do 
287   statements that can use $name 
288 done 
289 
 
290 while condition; do 
291   statements 
292 done 
293 
 
294 until condition; do 
295   statements 
296 done 
297 
 
298 ############################################################################## 
299 # COMMAND-LINE PROCESSING CYCLE 
300 ############################################################################## 
301 
 
302 
 
303 # The default order for command lookup is functions, followed by built-ins, with scripts and executables last. 
304 # There are three built-ins that you can use to override this order: `command`, `builtin` and `enable`. 
305 
 
306 command  # removes alias and function lookup. Only built-ins and commands found in the search path are executed 
307 builtin  # looks up only built-in commands, ignoring functions and commands found in PATH 
308 enable   # enables and disables shell built-ins 
309 
 
310 eval     # takes arguments and run them through the command-line processing steps all over again 
311 
 
312 
 
313 ############################################################################## 
314 # INPUT/OUTPUT REDIRECTORS 
315 ############################################################################## 
316 
 
317 
 
318 cmd1|cmd2  # pipe; takes standard output of cmd1 as standard input to cmd2 
319 < file     # takes standard input from file 
320 > file     # directs standard output to file 
321 >> file    # directs standard output to file; append to file if it already exists 
322 >|file     # forces standard output to file even if noclobber is set 
323 n>|file    # forces output to file from file descriptor n even if noclobber is set 
324 <> file    # uses file as both standard input and standard output 
325 n<>file    # uses file as both input and output for file descriptor n 
326 n>file     # directs file descriptor n to file 
327 n<file     # takes file descriptor n from file 
328 n>>file    # directs file description n to file; append to file if it already exists 
329 n>&        # duplicates standard output to file descriptor n 
330 n<&        # duplicates standard input from file descriptor n 
331 n>&m       # file descriptor n is made to be a copy of the output file descriptor 
332 n<&m       # file descriptor n is made to be a copy of the input file descriptor 
333 &>file     # directs standard output and standard error to file 
334 <&-        # closes the standard input 
335 >&-        # closes the standard output 
336 n>&-       # closes the ouput from file descriptor n 
337 n<&-       # closes the input from file descripor n 
338 
 
339 
 
340 ############################################################################## 
341 # PROCESS HANDLING 
342 ############################################################################## 
343 
 
344 
 
345 # To suspend a job, type CTRL+Z while it is running. You can also suspend a job with CTRL+Y. 
346 # This is slightly different from CTRL+Z in that the process is only stopped when it attempts to read input from terminal. 
347 # Of course, to interrupt a job, type CTRL+C. 
348 
 
349 myCommand &  # runs job in the background and prompts back the shell 
350 
 
351 jobs         # lists all jobs (use with -l to see associated PID) 
352 
 
353 fg           # brings a background job into the foreground 
354 fg %+        # brings most recently invoked background job 
355 fg %-        # brings second most recently invoked background job 
356 fg %N        # brings job number N 
357 fg %string   # brings job whose command begins with string 
358 fg %?string  # brings job whose command contains string 
359 
 
360 kill -l      # returns a list of all signals on the system, by name and number 
361 kill PID     # terminates process with specified PID 
362 
 
363 ps           # prints a line of information about the current running login shell and any processes running under it 
364 ps -a        # selects all processes with a tty except session leaders 
365 
 
366 trap cmd sig1 sig2  # executes a command when a signal is received by the script 
367 trap "" sig1 sig2   # ignores that signals 
368 trap - sig1 sig2    # resets the action taken when the signal is received to the default 
369 
 
370 disown <PID|JID>    # removes the process from the list of jobs 
371 
 
372 wait                # waits until all background jobs have finished 
373 
 
374 
 
375 ############################################################################## 
376 # TIPS & TRICKS 
377 ############################################################################## 
378 
 
379 
 
380 # set an alias 
381 cd; nano .bash_profile 
382 > alias gentlenode='ssh admin@gentlenode.com -p 3404'  # add your alias in .bash_profile 
383 
 
384 # to quickly go to a specific directory 
385 cd; nano .bashrc 
386 > shopt -s cdable_vars 
387 > export websites="/Users/mac/Documents/websites" 
388 
 
389 source .bashrc 
390 cd $websites 
391 
 
392 
 
393 ############################################################################## 
394 # DEBUGGING SHELL PROGRAMS 
395 ############################################################################## 
396 
 
397 
 
398 bash -n scriptname  # don't run commands; check for syntax errors only 
399 set -o noexec       # alternative (set option in script) 
400 
 
401 bash -v scriptname  # echo commands before running them 
402 set -o verbose      # alternative (set option in script) 
403 
 
404 bash -x scriptname  # echo commands after command-line processing 
405 set -o xtrace       # alternative (set option in script) 
406 
 
407 trap 'echo $varname' EXIT  # useful when you want to print out the values of variables at the point that your script exits 
408 
 
409 function errtrap { 
410   es=$? 
411   echo "ERROR line $1: Command exited with status $es." 
412 } 
413 
 
414 trap 'errtrap $LINENO' ERR  # is run whenever a command in the surrounding script or function exits with non-zero status  
415 
 
416 function dbgtrap { 
417   echo "badvar is $badvar" 
418 } 
419 
 
420 trap dbgtrap DEBUG  # causes the trap code to be executed before every statement in a function or script 
421 # ...section of code in which the problem occurs... 
422 trap - DEBUG  # turn off the DEBUG trap 
423 
 
424 function returntrap { 
425   echo "A return occurred" 
426 } 
427 
 
428 trap returntrap RETURN  # is executed each time a shell function or a script executed with the . or source commands finishes executing 

