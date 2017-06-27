#ifdef NOTUSED
*DOC*
REGULAR EXPRESSIONS IN VFP USING GNU REGEX CODE 

This code now includes a find file class that can search a project or 
a file called CFindFile.
 
This program will also remap F4 to open files at the appropriate line for PRGs.

Known problems: '$' matches Linefeed, and not CR so special code to handle this.

Future:
redefining base classes

REPLACE BaseClass WITH lcBaseClass, ;
		Class WITH lcParentClass, ;
		ClassLoc WITH lcClassLoc
		
********************************
Copyright (C) 1998-89  John Lim    jlim@natsoft.com.my
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 
*DOC*
#endif


DECLARE re_debug in regex.dll ;
	integer dbg

DECLARE Integer re_compile IN regex.dll ;
		string apattern,integer casesensitive

DECLARE Integer re_find in regex.dll ;
	integer zre_ptr, string tofindstr,integer	tofindlen,;
		integer @start,integer @rezlen

DECLARE re_cleanup in regex.dll ;
	integer zre_ptr


*dotest()

on key label F4 do doclip in regex

* Copy the clipboard and execute the line 
function doclip()
local zstr
	SYS(1500, '_MED_COPY', '_MEDIT')  
	zstr = _cliptext
	&zstr
endfunc

* Class that does all the work
DEFINE CLASS CFindFiles as custom
	regex = .f.	&& regular expr object
	properties = .f. && search properties also
	findstr = ''
	
* define the search string in zstr
FUNCTION Init(zstr)
public gFindRez && use public as this.property is V-E-R-Y slow
	if !empty(zstr)
		this.Setfind(zstr)
	endif
	gFindRez = '*** Select the line (triple-click) and hit F4' + chr(13) + chr(10)


* Change the search string
Function SetFind(zstr)
	this.regex = createobject("CREGEX",zstr)
	this.findstr = zstr

* Search all files in project
FUNCTION findProject(zproj)
local nFileCount
	modi proj (zproj) nowait
 
	nFileCount = Application.ActiveProject.Files.Count
	FOR i = 1 TO nFileCount
		if escdown()
			exit
		endif
   		zname = Application.ActiveProject.Files.Item(i).Name
   		this.search(zname)
   	endfor
   	
   	* find the line with the procedure declaration in a scx/vcx at zstr[pos]
   	* by backtracking through zstr
   	FUNCTION FindProc(zstr,pos)
 	local start,end,i,j,zupper,zline
		
		zupper = upper(zstr)
		* would RAT() be faster here ?
		for i = pos to 1 step -1
			if substr(zupper,i,10) = 'PROCEDURE '
				zline = this.FindLine(@zstr,i)
				zline = strtran(zline,'	',' ') && replace tabs
				if substr(zline,1,10) = 'PROCEDURE '
					 return substr(zline,11)
				endif
			endif
		endfor
		
		return ''
		   	
   	* extract the line referenced by zstr[pos]
   	FUNCTION FindLine(zstr,pos)
   	local start,end,i,j
   	
   		for i = pos to 1 step - 1
   			if substr(zstr,i,1) = chr(10) 
   				exit
   			endif
   		endfor
   		
    	for j = pos to len(zstr) 
   			if substr(zstr,j,1) = chr(13) 
   				exit
   			endif
   		endfor
   		
   		i = i + 1
   		j = j - 1
   		return substr(zstr,i,j-i+1)
  
  * search a PRG file
   	FUNCTION SearchPrg(zfile)
	local zstr,pos
		pusherr('errhide')
		gErrID = 0
	   	zstr = FileToStr(zfile)
	   	poperr()
	   	if empty(zstr)
	   		if gErrID <> 0
	   			this.addrez("*** Unable to open file " + zfile)
	   			return
	   		endif
	   	endif
	   	pos = 0
	   	do while !empty(this.regex.findstr(@zstr,@pos))
  			this.addrez('MODI COMM "' + zfile + ;
  				'" RANGE ' +  alltrim(str(pos-len(this.findstr))) +','+alltrim(str(pos)) + ' NOWAIT'+;
  						chr(38)+chr(38)+' ' + strtran(alltrim(this.FindLine(@zstr,@pos)),'	'))
	   	enddo
	   	
	* search a SCX/VCX file
   	FUNCTION SearchCX(zfile,isscx)
   	local pos,zproc
   		useclose(zfile)
   		useclose('srchcurs')
   		pusherr('errhide')
   		gErrID = 0
   		use (zfile) in 0 again alias srchcurs
   		poperr()
   		
   		if gErrID <> 0
   			this.addrez("*** Unable to open file " + zfile)
   			return
   		endif
   		select srchcurs
*   		set step on
 		scan
 			scatter memo memvar
 			pos = 0
			do while !empty(this.regex.findstr(@m.Methods,@pos))
 				zproc = this.FindProc(@m.Methods,@pos)
				zclass = alltrim(m.parent)
 				cpos = at('.',zclass)
 				do case
   				case cpos > 0 && and ! isscx
  					zproc = alltrim(m.objname)+'.'+zproc
					zcall = substr(zclass,cpos+1)
 					zclass = substr(zclass,1,cpos-1)
  					zproc = zcall + '.' + zproc	
  				case cpos = 0 and m.objname <> zclass
  					if empty(zclass)
  						zclass = alltrim(m.objname)
  					else
   						zproc = alltrim(m.objname)+'.'+zproc
   					endif
*!*	 				case isscx
*!*						if upper(m.BaseClass) <> 'FORM'
*!*	  						zproc = alltrim(m.objname) + '.'+zproc
*!*	  					endif
				endcase
 				if isscx
 					this.addrez('MODI FORM "' + zfile + ;
  						iif(!empty(zproc),'" METHOD ' + zproc,'') + ' NOWAIT'+;
  						chr(38)+chr(38)+' '+strtran(alltrim(this.FindLine(@m.Methods,@pos)),'	'))
 				else
  					this.addrez('MODI CLASS ' + zclass  + ' OF "' + zfile + ;
  						iif(!empty(zproc),'" METHOD ' + zproc,'"') + ' NOWAIT'+;
  						chr(38)+chr(38)+' '+strtran(alltrim(this.FindLine(@m.Methods,@pos)),'	'))
  				endif
			enddo
			if this.properties && Search properties
			pos = 0
			do while !empty(this.regex.findstr(@m.Properties,@pos))
			local zat
				zclass = alltrim(m.parent)
  				cpos = at('.',zclass)
				if cpos > 0
					zat = substr(zclass,1,cpos-1)
				else
					zat = zclass
				endif
 				if !empty(zclass) 
 					zclass = zclass + '.'
				endif
 				if isscx
 					this.addrez('MODI FORM "' + zfile + '" NOWAIT'+;
  						chr(38)+chr(38)+' Property '+zclass+alltrim(this.FindLine(@m.Properties,@pos)))
 				else
   					if empty(zclass)
  						zclass = alltrim(m.objname) + '.'
  					endif
  					if empty(zat)
  						zat = alltrim(m.objname)
  					endif
   					this.addrez('MODI CLASS ' + zat  + ' OF "' + zfile + '" NOWAIT'+;
  						chr(38)+chr(38)+' Property '+zclass+alltrim(this.FindLine(@m.Properties,@pos)))
  				endif
 	 		enddo
 			endif
 			
 		endscan
   		useclose('srchcurs')
  	
  	* Add a new line to results string
  	FUNCTION AddRez(zstr)
  		gFindRez = gFindRez + zstr + chr(13) + chr(10)
  	
  	* Output results to a file
  	FUNCTION OutRez(zfile)
  		strtofile(gFindRez, zfile)
  		modi comm (zfile) nowait
  	
  	* Search a file. Calls searchcx() or searchprg().
	FUNCTION Search(zfile)
	local zpos,ext

		ext = getext(zfile)
		do case 
		case inlist(ext, 'PRG','H','TXT','MPR')
	   		wait window zfile nowait
			this.searchprg(zfile)
		case ext = 'SCX' 
	   		wait window zfile nowait
			this.searchCX(zfile,.t.)
		case ext = 'VCX'
	   		wait window zfile nowait
			this.searchCX(zfile)
		endcase
	ENDFUNC

ENDDEF

* Test code for Regular Expression class
FUNCTION dotest
local zstart,zlen,zstr

	zstr = "The story of ABC"
	obj = createobject("CREGEX","abc") && Find ABC
	zstart = 1
	zrez = obj.find(zstr,@zstart,@zlen) 
	if !(zrez and zstart = 14 and zlen = 3)
		messageb("Err1")
	endif
	messageb(obj.findstr(zstr))
	
	zstr = "The story of ABCabc and more" 
	obj = createobject("CREGEX","a.*bc") && Find beginning with A and ending in BC
	zstart = 1
	zrez = obj.find(zstr,@zstart,@zlen)
	if !(zrez and zstart = 14 and zlen = 6)
		messageb("Err2")
	endif
	messageb(obj.findstr(zstr))

	obj = createobject("CREGEX","a\(.*bc\)") && Find substring preceded by A and 
											 && ending in BC inclusive
	zstart = 1
	zrez = obj.find(zstr,@zstart,@zlen)
	if !(zrez and zstart = 15 and zlen = 5)
		messageb("Err3")
	endif
	messageb(obj.findstr(zstr))
	
	* convert the all clicks in the code below to "DOFUNC(thisform.object)"
	zstr = "CR" + chr(13) +" thisform.object.click and LF" + chr(10) +  ;
		"  thisform.obj2.click  CRLR" + chr(13) + chr(10) + "Nothing at end"
	
	obj = createobject("CREGEX","\(thisform\..*\)\.click")
	
	local outstr
	zstart = 1
	do while .t.
		outstr = obj.findstr(zstr,@zstart)
		if empty(outstr)
			exit
		endif
		messageb("DOFUNC("+outstr+")")
	enddo
	

	* Now check what is the definition of End of Line
	obj = createobject("CREGEX","^.*$")
	
	* its actually LINEFEED!!!!! CR is ignored. Real UNIX stuff 8-(
	messageb(obj.findstr(zstr))
	* this means that CR has to be stripped
	
	outstr = obj.findstr("ABC"+chr(13) + chr(10) + "Test")
	if at(chr(13),outstr) > 0
		messageb("OH-OH we are not naked: CR in CRLF pair NOT stripped.")
	endif
	
	obj = createobject("CREGEX","\<APPLE\>") && find the word apple
	if !empty(obj.findstr("AppleApple"))
		messageb("Error:Apple 1 found")
	endif

	if empty(obj.findstr("I found an Apple"))
		messageb("Error:Apple 2 not found")
	endif
	
ENDFUNC

*Class that does regular expression searching
define class CREGEX as custom
protected re_ptr

re_ptr = 0  && the regular expression data structure
re_sensitive = .f. && whether to be case-sensitive - default is case-INsensitive
stripcr = .f.

	* zpattern is the regular expression pattern
	* zsensitive is .T. = case sensitive, .F. = case insensitive
	FUNCTION init(zpattern,zsensitive)	
		if parameters() < 1
			return .f.
		endif	
		re_sensitive = zsensitive
			
		this.compile(zpattern)
	ENDFUNC

	* COMPILE THE PATTERN, zpattern
	FUNCTION compile(zpattern)
		if this.re_ptr <> 0
			re_cleanup(this.re_ptr)
		endif
		
		this.re_ptr = re_compile(zpattern,iif(this.re_sensitive,1,0))
		
		if this.re_ptr == 0
			messagebox("Bad Compile:" + zpattern)
		endif
		this.stripcr = substr(zpattern,len(zpattern)) = '$'

		return this.re_ptr <> 0
	ENDFUNC	

	*  -> zstr is the string to search
	* <-> @zpos is the next index posn to search, and is autoincremented by findstr
	* RETURNS: string searched for if found, empty string otherwise
	FUNCTION findstr(zstr,zpos)
	local zlen,apos
		if parameter() = 1
			zpos = 1
		endif
		if this.find(@zstr,@zpos,@zlen)
			apos = zpos
			zpos = zpos + zlen && zpos will point to next index pos to search
			
			if this.stripcr and substr(zstr,apos+zlen-1,1) = chr(13)
				zlen = zlen - 1
			endif
			
			return substr(zstr,apos,zlen)
		else
			zpos = len(zstr) + 1
			return ''
		endif
	endfunc

	* <-> @zpos is the index position of the string to start searching from. On return,
	*		is set to the index where the substring is found.
	* <-  @zlen is the length of the substring on return
	FUNCTION find(zstr,zpos,zlen)
	local rez
		if zpos <= 0
			zpos = 1
		endif
		zlen = 0
		rez = re_find(this.re_ptr,zstr,len(zstr),@zpos,@zlen)<>0
		
		* handle stripping of CR
		if rez and this.stripcr and substr(zstr,zpos+zlen-1,1) = chr(13)
			zlen = zlen - 1
		endif
		return rez
	ENDFUNC


	FUNCTION destroy()
		re_cleanup(this.re_ptr)
	ENDFUNC

enddef


********************************************

#ifdef COMMENT
*DOCRAW*

<b>Examples:</b>
*DOCRAW*
*DOC*

a. Find all functions whose names begin with Get*

	FUNC.*[ \t]+Get  

	FUNC	  	Search for FUNC
	.*			Accept any characters to handle the remaining chars of FUNCTION
	[ \t]+		Match at least one of either space or tab (\t)
	Get			match the GET

b. Find all SQL select statements

	SELE.*;\|SELE.*[ \t]+FROM
	
Very tricky. We have to distinguish between SELECT ALIAS  and SELECT * FROM. We
do it by assuming that that any SELECT with the continuation character is an SQL 
select.

SELE	Search for SELE
.*		Match any character after SELE 
;		Until we hit semi-colon
\|		alternative match...
SELE	as before
.*		as before
[ \t]+	match a space or tab
FROM	match the FROM clause of a select statement

*DOC*
*DOCRAW*
	<b>Syntax of Regular Expressions </b>
	
*DOCRAW*
*DOC*
	Regular expressions have a syntax in which a few characters are special constructs 
	and the rest are ordinary. An ordinary character is a simple regular expression 
	which matches that character and nothing else. The special characters are 
	`$', `^', `.', `*', `+', `?', `[', `]' and `\'. Any other character appearing in 
	a regular expression is ordinary, unless a `\' precedes it. 

	For example, `f' is not a special character, so it is ordinary, and therefore `f' 
	is a regular expression that matches the string `f' and no other string. (It does 
	not match the string `ff'.) Likewise, `o' is a regular expression that matches only 
	`o'. 

	Any two regular expressions a and b can be concatenated. The result is a regular 
	expression which matches a string if a matches some amount of the beginning of that 
	string and b matches the rest of the string. 

	As a simple example, we can concatenate the regular expressions `f' and `o' to get 
	the regular expression `fo', which matches only the string `fo'. Still trivial. 

	Note: for Unix compatibility, special characters are treated as ordinary ones if they 
	are in contexts where their special meanings make no sense. For example, `*foo' 
	treats `*' as ordinary since there is no preceding expression on which the `*' 
	can act. It is poor practice to depend on this behavior; better to quote the 
	special character anyway, regardless of where is appears. 

	`.' 
	is a special character that matches anything except a newline. Using concatenation, 
	we can make regular expressions like `a.b' which matches any three-character string 
	which begins with `a' and ends with `b'. 

	`*' 
	is not a construct by itself; it is a suffix, which means the preceding regular 
	expression is to be repeated as many times as possible. In `fo*', the `*' applies to 
	the `o', so `fo*' matches `f' followed by any number of `o''s. The case of zero `o''s
	is allowed: `fo*' does match `f'. `*' always applies to the smallest possible 
	preceding expression. Thus, `fo*' has a repeating `o', not a repeating `fo'. The 
	matcher processes a `*' construct by matching, immediately, as many repetitions as 
	can be found. Then it continues with the rest of the pattern. If that fails, 
	backtracking occurs, discarding some of the matches of the `*''d construct in case 
	that makes it possible to match the rest of the pattern. For example, matching 
	`c[ad]*ar' against the string `caddaar', the `[ad]*' first matches `addaa', but this 
	does not allow the next `a' in the pattern to match. So the last of the matches of 
	`[ad]' is undone and the following `a' is tried again. Now it succeeds. 

	`+' 
	`+' is like `*' except that at least one match for the preceding pattern is required 
	for `+'. Thus, `c[ad]+r' does not match `cr' but does match anything else that 
	`c[ad]*r' would match. 

	`?' 
	`?' is like `*' except that it allows either zero or one match for the preceding 
	pattern. Thus, `c[ad]?r' matches `cr' or `car' or `cdr', and nothing else. 

	`[ ... ]' 
	`[' begins a character set, which is terminated by a `]'. In the simplest case, the 
	characters between the two form the set. Thus, `[ad]' matches either `a' or `d', and 
	`[ad]*' matches any string of `a''s and `d''s (including the empty string), from 
	which it follows that `c[ad]*r' matches `car', etc. Character ranges can also be 
	included in a character set, by writing two characters with a `-' between them. 
	Thus, `[a-z]' matches any lower-case letter. Ranges may be intermixed freely with 
	individual characters, as in `[a-z$%.]', which matches any lower case letter or 
	`$', `%' or period. Note that the usual special characters are not special any more 
	inside a character set. A completely different set of special characters exists 
	inside character sets: `]', `-' and `^'. To include a `]' in a character set, you 
	must make it the first character. For example, `[]a]' matches `]' or `a'. To include 
	a `-', you must use it in a context where it cannot possibly indicate a range: that 
	is, as the first character, or immediately after a range. 

	`[^ ... ]' 
	`[^' begins a complement character set, which matches any character except the ones 
	specified. Thus, `[^a-z0-9A-Z]' matches all characters except letters and digits. 
	`^' is not special in a character set unless it is the first character. The character
	 following the `^' is treated as if it were first (it may be a `-' or a `]'). 
	 
	`^' 
	is a special character that matches the empty string -- but only if at the beginning 
	of a line in the text being matched. Otherwise it fails to match anything. Thus, 
	`^foo' matches a `foo' which occurs at the beginning of a line. 

	`$' 
	is similar to `^' but matches only at the end of a line. Thus, `xx*$' matches a 
	string of one or more `x''s at the end of a line. 

	`\' 
	has two functions: it quotes the above special characters (including `\'), and it 
	introduces additional special constructs. Because `\' quotes special characters, 
	`\$' is a regular expression which matches only `$', and `\[' is a regular expression 
	which matches only `[', and so on. For the most part, `\' followed by any character 
	matches only that character. However, there are several exceptions: characters which,
	when preceded by `\', are special constructs. Such characters are always ordinary 
	when encountered on their own. No new special characters will ever be defined. 
	 All extensions to the regular expression syntax are made by defining new 
	 two-character constructs that begin with `\'. 
	 
	`\|' 
	specifies an alternative. Two regular expressions a and b with `\|' in between form 
	an expression that matches anything that either a or b will match. Thus, `foo\|bar' 
	matches either `foo' or `bar' but no other string. `\|' applies to the largest 
	possible surrounding expressions. Only a surrounding `\( ... \)' grouping can limit 
	the grouping power of `\|'. Full backtracking capability exists when multiple `\|''s 
	are used. 

	`\( ... \)' 
	is a grouping construct that serves three purposes: 
	(1) To enclose a set of `\|' alternatives for other operations. Thus, `\(foo\|bar\)x' 
	matches either `foox' or `barx'. (2) To enclose a complicated expression for the postfix 
	`*' to operate on. Thus, `ba\(na\)*' matches `bananana', etc., with any (zero or more)
	number of `na''s. 
	
	(3) To mark a matched substring for future reference. 
	This last application is not a consequence of the idea of a parenthetical grouping; 
	it is a separate feature which happens to be assigned as a second meaning to the 
	same `\( ... \)' construct because there is no conflict in practice between the two 
	meanings. Here is an explanation of this feature: 
	`\digit' 
	After the end of a `\( ... \)' construct, the matcher remembers the beginning and 
	end of the text matched by that construct. Then, later on in the regular expression, 
	you can use `\' followed by digit to mean "match the same text matched the digit'th 
	time by the `\( ... \)' construct." The `\( ... \)' constructs are numbered in order 
	of commencement in the regexp. The strings matching the first nine `\( ... \)' 
	constructs appearing in a regular expression are assigned numbers 1 through 9 in 
	order of their beginnings. `\1' through `\9' may be used to refer to the text 
	matched by the corresponding `\( ... \)' construct. For example, `\(.*\)\1' 
	matches any string that is composed of two identical halves. The `\(.*\)' matches 
	the first half, which may be anything, but the `\1' that follows must match the same 
	exact text.

	`\b' 
	matches the empty string, but only if it is at the beginning or end of a word. 
	Thus, `\bfoo\b' matches any occurrence of `foo' as a separate word. 
	`\bball\(s\|\)\b' matches `ball' or `balls' as a separate word. 

	`\B' 
	matches the empty string, provided it is not at the beginning or end of a word. 

	`\<' 
	matches the empty string, but only if it is at the beginning of a word. 

	`\>' 
	matches the empty string, but only if it is at the end of a word. 

	`\w' 
	matches any word-constituent character. 

	`\W' 
	matches any character that is not a word-constituent. 
*DOC*
#endif