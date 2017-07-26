# About utid
utid is a command-line utility capable of setting default applications for various document types on macOS, using Apple's Uniform Type Identifiers. A UTI is a unique string describing the format of a file's content. For instance, a Microsoft Word document has a UTI of com.microsoft.word.doc. Using utid, the user can change which application acts as the default handler for a given UTI.


# Compiling
    make
    sudo make install

# Usage

utid can read settings from four different sources:

1) standard input

2) a settings file

3) a MacOS XML property list (plist)

4) command-line arguments.

A settings line, as read in cases 1 and 2, consists of an application's bundle ID, a UTI, and a string describing what role the application handles for the given UTI. The process is similar when utid processes a plist. If the path given to utid on the command-line is a directory, utid will apply settings from all valid settings files in that directory, excluding files whose names begin with '.'.

utid can also print out the default application information for a given extension (-x). This feature is based on public domain source code posted by Keith Alperin on the heliumfoot.com blog.

See the man page for additional usage details.

# Examples
Set Safari as the default handler for HTML documents:

	% utid -s com.apple.Safari public.html all

Set TextEdit as the default handler for Word documents:

	% utid com.apple.TextEdit	com.microsoft.word.doc	all

Set Finder as the default handler for ftp:// URLs:

	% utid -s com.apple.Finder ftp

Get default application information for .jpg files:

	% utid -x jpg
	Preview
	/Applications/Preview.app
	com.apple.Preview

# Support
utid is best-effort support. You can submit bug reports and feature requests for this version of the software at the utid GitHub project page:

    https://github.com/jovi/utid/

# Thanks to
[Andrew Mortensen](https://github.com/moretension) for creating utid  
[Russel Hancox](https://github.com/russellhancox) for maintaining utid  
[Nivekkagicom](https://github.com/nivekkagicom) for expanding utid
