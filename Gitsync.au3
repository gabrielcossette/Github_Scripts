#include <File.au3>

Dim $dir
Dim $drive
Dim $path
Dim $name
Dim $ext
Dim $button
Dim $git

$git = "C:\""Program Files (x86)""\Git\bin\git.exe"

If StringInStr($CmdLine[1], ".au3") <> 0 Then
	$button = MsgBox(0, "Update GitHub?", "Update GitHub?")
	If $button = 1 Then
		_PathSplit($CmdLine[1], $drive, $dir, $name, $ext)
		RunWait(@ComSpec & " /c " & $git & " add .", $drive & $dir, @SW_HIDE)
		RunWait(@ComSpec & " /c " & $git & " commit -a --allow-empty-message -m """"", $drive & $dir, @SW_HIDE)
		RunWait(@ComSpec & " /c " & $git & " pull origin master", $drive & $dir, @SW_HIDE)
		RunWait(@ComSpec & " /c " & $git & " push origin master", $drive & $dir, @SW_HIDE)
	EndIf
EndIf