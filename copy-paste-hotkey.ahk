Gui, New, +Resize, һ������ճ������ by Jalon
Gui, Font, S12, Verdana

Gui, Add, Text, section, �����Ʋ������ȼ���
Gui, Add, Text, , ��ճ���������ȼ���
Gui, Add, Hotkey, ys-3 vCopyHotkey
Gui, Add, Hotkey, vPasteHotkey

Gui, Add, Button, section xs gOnApply vBtApply, Ӧ���ȼ�
Gui, Add, Button, ys gOnCancel vBtCancel, ȡ���ȼ�
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
