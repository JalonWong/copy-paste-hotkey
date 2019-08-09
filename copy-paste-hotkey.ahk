Gui, New, +Resize, 一键复制粘贴工具 by Jalon
Gui, Font, S12, Verdana

Gui, Add, Text, section, “复制操作”热键：
Gui, Add, Text, , “粘贴操作”热键：
Gui, Add, Hotkey, ys-3 vCopyHotkey
Gui, Add, Hotkey, vPasteHotkey

Gui, Add, Button, section xs gOnApply vBtApply, 应用热键
Gui, Add, Button, ys gOnCancel vBtCancel, 取消热键
GuiControl, Enable 0, BtCancel

Gui, Show,
Return

GuiClose:
ExitApp

OnApply:
GuiControl, Enable 0, BtApply

Gui, Submit, NoHide
if(CopyHotkey != "")
{
    Hotkey, %CopyHotkey%, OnCopy, on
}

if(PasteHotkey != "")
{
    Hotkey, %PasteHotkey%, OnPaste, on
}

GuiControl, Enable 1, BtCancel
Return

OnCancel:
GuiControl, Enable 0, BtCancel

if(CopyHotkey != "")
{
    Hotkey, %CopyHotkey%, , off
}

if(PasteHotkey != "")
{
    Hotkey, %PasteHotkey%, , off
}

GuiControl, Enable 1, BtApply
Return

OnCopy:
send ^c
Return

OnPaste:
send ^v
Return
