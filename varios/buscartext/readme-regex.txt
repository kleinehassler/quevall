REGEX    Author: John Lim 

This program allows you to search a project or a directory for a
string or command embedded in PRG/SCX/VCX files. Search is 
case-insensitive and uses regular expressions. 

Very simple install:
1. Copy file regex.dll to c:\windows\system or somewhere in your VFP path
2. Run REGEX.APP.

Included is a library for regular expressions (GNU style).

HISTORY
 1.06 14 June 99
 Fixed more bugs in VCX searching reported by Milan Kosina <kosina@vol.cz>

 1.05 4 June 99
 Fixed bugs in VCX searching for properties. Changed file names to 
 prevent name clashes.
 
 1.04 31 May 99
 Search properties also implemented. Some bugs in searching VCX fixed.
 
 1.03 27 May 99
 TmpDir() now finds the correct directory. A last search button has been
 added.
 
 1.02 26 May 99
 Changed functions to call by reference(@) to speed up function calls.
 Removed the pesky Close Data All in the form.
 Added support for ESC cancelling.

 1.01 25 May 99
 There are always bugs in a first release. Fixed some bugs in SCX/VCX handling.
 
 1.00 25 May 99
 First release.

TODO
	Search and replace.
	Put found lines in a grid and allow double-click to open file.

CONTACT INFO
John Lim  jlim@natsoft.com.my		Send me email if you like this program.

This program can be obtained from http://www.natsoft.com.my/natsoft/vfp.
Source for regex.dll can also be obtained from the above address. 


LICENSING
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
 

