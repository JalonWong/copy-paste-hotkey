#Requires AutoHotkey v2.0

my_gui := Gui("+Resize", "一键复制粘贴工具（Jalon）")
my_gui.SetFont("s12", "Verdana")

my_gui.AddText("section", "复制操作，热键：")
my_gui.AddText(, "粘贴操作，热键：")
hotkey_copy := my_gui.AddHotkey("ys-3")
hotkey_paste := my_gui.AddHotkey()

bt_apply := my_gui.AddButton("section xs", "应用热键")
bt_apply.OnEvent("Click", OnApply)
bt_cancel := my_gui.AddButton("ys", "取消热键")
bt_cancel.OnEvent("Click", OnCancel)
bt_cancel.Enabled := false

my_gui.Show()

OnApply(*) {
    global g_copy
    global g_paste

    bt_apply.Enabled := false

    g_copy := hotkey_copy.value
    g_paste := hotkey_paste.value
    if(g_copy != "") {
        Hotkey(g_copy, OnCopy, "On")
    }

    if(g_paste != "") {
        Hotkey(g_paste, OnPaste, "On")
    }

    bt_cancel.Enabled := true
}

OnCancel(*) {
    global g_copy
    global g_paste

    bt_cancel.Enabled := false

    try
        Hotkey(g_copy,, "Off")
    catch TargetError {
        ; do nothing
    }

    try
        Hotkey(g_paste,, "Off")
    catch TargetError {
        ; do nothing
    }

    bt_apply.Enabled := true
}

OnCopy(*) {
    send("^c")
}

OnPaste(*) {
    send("^v")
}
