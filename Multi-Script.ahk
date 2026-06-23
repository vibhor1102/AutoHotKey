#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent()
#Include "UIA.ahk" ; This now works because the file is next to the script

global QuickEmail := ""
global HikvisionPassword := ""
global PramaPassword := ""
#Include *i "LocalConfig.ahk"

; Critical: Ensures coordinates are relative to the entire screen.
CoordMode("Mouse", "Screen")

; Variable to track when the corner was last triggered
global CornerTriggerTime := 0

; Run the check every 100ms
; SetTimer(CheckCorner, 100)

Sleep(10000)
WinWait("ahk_class Shell_TrayWnd", , 10)
Sleep(2000)
A_IconHidden := false

; Spanish characters with AltGr.
>!n::ñ
>!+n::Ñ
>!a::á
>!e::é
>!i::í
>!o::ó
>!u::ú
>!+a::Á
>!+e::É
>!+i::Í
>!+o::Ó
>!+u::Ú
>!y::ü
>!+y::Ü
>!/::¿
>!1::¡

#HotIf !WinActive("Monkeytype")
::->::→    ; Right Arrow
::<-::←    ; Left Arrow
::=>::⇒    ; Thick Right Arrow (Implication)
::<=::≤    ; Less than or equal
::>=::≥    ; Greater than or equal
::!=::≠    ; Not equal
;::approx::≈ ; Approximately
;::deg::°   ; Degree symbol
;::tm::™    ; Trademark
;::(c)::©     ; Copyright
;::(r)::®     ; Registered
::inr::₹          ; Indian Rupee Symbol
;::rs::₹           ; Alternative for Rupee
;::ss::§           ; Section symbol (vital for Law exams/notes)
;::pp::¶           ; Paragraph symbol
::wrt::with respect to
;::tca::The Companies Act, 2013  ; Frequent CA Inter typing
;::itaa::The Income Tax Act, 1961
;::gstt::Goods and Services Tax
;::moa::Memorandum of Association
;::aoa::Articles of Association
;::bod::Board of Directors
;::agm::Annual General Meeting
;::bs::Balance Sheet
;::pl::Profit and Loss Account
;::dr::Debit
;::cr::Credit
;::fy::Financial Year
;::ay::Assessment Year
;::pa::per annum
;::i::I
::dont::don't
::cant::can't
::wont::won't
::isnt::isn't
::arent::aren't
::didnt::didn't
::couldnt::couldn't
::shouldnt::shouldn't
::wouldnt::wouldn't
::wasnt::wasn't
::werent::weren't
::havent::haven't
::hasnt::hasn't
::hadnt::hadn't
::im::I'm
::ive::I've
;::ill::I'll
;::id::I'd
::youre::you're
::youll::you'll
::theyre::they're
;::weve::we've
;::lets::let's
::thats::that's
::whats::what's
::theres::there's
;::its::it's ; Be careful: 'its' (possessive) vs 'it's' (it is). Edit if you prefer possessive default.
::doesnt::doesn't
::mustnt::mustn't
::neednt::needn't
::darent::daren't
::mightnt::mightn't
::shant::shan't
::couldve::could've
::shouldve::should've
::wouldve::would've
::mightve::might've
::mustve::must've
::whos::who's
::wheres::where's
::hows::how's
::whens::when's
::heres::here's
::hes::he's
::shes::she's
:*:eee::
{
    global QuickEmail
    SendText(QuickEmail)
}
::ivms::iVMS
::ip::IP
::wifi::Wi-Fi
::ram::RAM
; F9:: SendInput "123456789012{Enter}"
PgUp::Home
PgDn::End
Home::PgUp
End::PgDn
:*:-=-::—
::ipv4::IPv4
::ipv6::IPv6
::youve::you've
#HotIf

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿

#HotIf WinActive("ahk_exe Code.exe") || WinActive("ahk_exe Antigravity.exe")
F9::Send "+!{Right}"        ; Expand Selection (Shift + Alt + Right)
+F9::Send "+!{Left}"        ; Shrink Selection (Shift + Alt + Left)
#HotIf 

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿

#HotIf WinActive("ahk_exe Antigravity.exe")
:*:@ss::
{
    ; 1. PREVENT STICKING: Wait for you to let go of the Shift key
    ; This ensures your physical state doesn't conflict with the Send commands
    KeyWait "LShift"
    KeyWait "RShift"
    Send "{LShift up}{RShift up}"
    
    ; 2. Use SendText for long strings
    ; SendText treats every character literally (no need to escape + or !)
    SendText("@detailed_implementation_masterplan.strategy.md")
    Sleep(400)
    Send("{Enter}")
    Sleep(100)
    
    SendText("Analyze the complete strategy document first. On the basis of that, start with Phase ")
    
    ; 3. Use InputHook with 'T' (Timeout) or 'M' (Modifier) options if needed
    ; We add a small timeout (5s) so the script doesn't hang forever if you change your mind
    ih := InputHook("L2 V T5") 
    ih.Start()
    ih.Wait()
    
    ; 4. Final block
    SendText(". At the end of each sub-phase, make sure to provide me a walkthrough containing the report of features added, automatic tests ran, and any manual tests I myself need to run through UI due to headless browser limitations for you. Only leave those tests for me that can't be run through commandline tools or shell, and require interacting through browser using UI.")
}
#HotIf

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿

; Right Ctrl + Z hotkey
>^z::
{
    ; Create a new GUI window
    global MyGui := Gui(, "IP Camera Setup")
    MyGui.SetFont("s10", "Segoe UI")

    ; --- Column 1: IP Settings ---
    MyGui.Add("Text", , "Starting IP (Last Octet):")
    global ipEdit := MyGui.Add("Edit", "w200", "101")

    MyGui.Add("Text", , "Number of IP Cameras:")
    global numEdit := MyGui.Add("Edit", "w50", "1")

    ; --- Column 2: Camera Type ---
    MyGui.Add("Text", "ym", "Camera Type:")
    global typeHik := MyGui.Add("Radio", "Group", "Hikvision")
    global typePrama := MyGui.Add("Radio", , "Prama")
    global typeOther := MyGui.Add("Radio", "Checked", "Others")

    ; Bind the event to toggle credential fields
    typeHik.OnEvent("Click", ToggleCreds)
    typePrama.OnEvent("Click", ToggleCreds)
    typeOther.OnEvent("Click", ToggleCreds)

    ; --- Credentials Section (Initially Hidden) ---
    global lblUser := MyGui.Add("Text", "xm Hidden w200", "Username:")
    global txtUser := MyGui.Add("Edit", "Hidden w200", "admin")

    global lblPass := MyGui.Add("Text", "xm Hidden w200", "Password:")
    global txtPass := MyGui.Add("Edit", "Hidden w200", "")

    ; --- OK Button ---
    okButton := MyGui.Add("Button", "xm Default w100", "OK")
    okButton.OnEvent("Click", OkClick)

    ; Show the GUI
    MyGui.Show()
}

; Function to show/hide credential boxes and set defaults
ToggleCreds(*) {
    if (typeHik.Value) {
        lblUser.Visible := true
        txtUser.Visible := true
        lblPass.Visible := true
        txtPass.Visible := true
        global HikvisionPassword
        txtPass.Value := HikvisionPassword
    } else if (typePrama.Value) {
        lblUser.Visible := true
        txtUser.Visible := true
        lblPass.Visible := true
        txtPass.Visible := true
        global PramaPassword
        txtPass.Value := PramaPassword
    } else {
        lblUser.Visible := false
        txtUser.Visible := false
        lblPass.Visible := false
        txtPass.Visible := false
    }
}

; --- GLOBAL STATE FOR CANCELLATION ---
global isRunning := false

; --- OVERLAY FUNCTIONS ---
global ProgressGui := ""
global txtProgress := ""
global txtIP := ""
global txtStatus := ""
global txtSkipped := ""

CreateOverlay(totalCams) {
    global ProgressGui, txtProgress, txtIP, txtStatus, txtSkipped

    ProgressGui := Gui("+AlwaysOnTop +ToolWindow -Caption +E0x08000000 +E0x20")
    ProgressGui.BackColor := "1F1F1F"
    ProgressGui.SetFont("s9", "Segoe UI")

    ProgressGui.SetFont("cff6b6b w700")
    ProgressGui.Add("Text", "w280 Center", "❌ Press ESC to Cancel")

    ProgressGui.SetFont("cGray s8 w400")
    ProgressGui.Add("Text", "w280 Center", "__________________________")

    ProgressGui.SetFont("cWhite s11 w600")
    txtProgress := ProgressGui.Add("Text", "w280 Center", "🎥 Camera: 1 / " . totalCams)

    ; Skipped Counter
    ProgressGui.SetFont("cGray s9 w400")
    txtSkipped := ProgressGui.Add("Text", "w280 Center", "⏭️ Skipped: 0")

    ProgressGui.SetFont("c66d9ef s10 w400")
    txtIP := ProgressGui.Add("Text", "w280 Center", "🌐 IP: Initializing...")

    ProgressGui.SetFont("c00FF00 s10 w400")
    txtStatus := ProgressGui.Add("Text", "w280 Center", "🚀 Starting...")

    ScreenWidth := A_ScreenWidth
    ProgressGui.Show("x" . (ScreenWidth - 300) . " y30 NoActivate")
}

UpdateOverlay(camIndex, totalCams, ip, status, skippedCount) {
    global txtProgress, txtIP, txtStatus, txtSkipped
    if (txtProgress) {
        txtProgress.Value := "🎥 Camera: " . camIndex . " / " . totalCams
        txtSkipped.Value := "⏭️ Skipped: " . skippedCount
        txtIP.Value := "🌐 " . ip
        txtStatus.Value := status

        if InStr(status, "Done") || InStr(status, "Login") || InStr(status, "Logged In")
            txtStatus.Opt("c00FF00") ; Green
        else if InStr(status, "Typing")
            txtStatus.Opt("c00FFFF") ; Cyan
        else if InStr(status, "Offline") || InStr(status, "Timeout")
            txtStatus.Opt("cff6b6b") ; Red
        else
            txtStatus.Opt("cYellow") ; Yellow
    }
}

DestroyOverlay() {
    global ProgressGui
    if (ProgressGui)
        ProgressGui.Destroy()
}

; --- HOTKEY TO CANCEL ---
#HotIf isRunning
Esc::
{
    global isRunning := false
    DestroyOverlay()
    MsgBox("🛑 Automation Cancelled by User.", "Stopped", "T1")
    Reload
}
#HotIf

; --- HELPER: PING FUNCTION ---
PingCheck(ip) {
    try {
        ; -n 1: One ping, -w 200: 200ms timeout
        exitCode := RunWait("ping.exe -n 1 -w 200 " . ip, , "Hide")
        return (exitCode == 0)
    } catch {
        return false
    }
}

; Function to handle the OK button click
OkClick(Control, Info) {
    global isRunning

    startIP := Integer(ipEdit.Value)
    numCameras := Integer(numEdit.Value)
    username := txtUser.Value
    password := txtPass.Value

    isPrama := typePrama.Value
    isHik := typeHik.Value

    Control.Gui.Hide()

    isRunning := true
    CreateOverlay(numCameras)
    skippedCounter := 0

    loop numCameras {
        if (!isRunning)
            break

        currentCamIndex := A_Index
        currentIPOctet := startIP + A_Index - 1
        fullIP := "192.168.1." . currentIPOctet
        targetURL := "http://" . fullIP

        ; 1. PING CHECK
        UpdateOverlay(currentCamIndex, numCameras, fullIP, "📡 Pinging...", skippedCounter)
        if (!PingCheck(fullIP)) {
            skippedCounter++
            UpdateOverlay(currentCamIndex, numCameras, fullIP, "🔴 Offline - Skipping", skippedCounter)
            Sleep(200) ; Short flash so you notice the red status update, then move on instantly
            continue
        }

        ; 2. LAUNCH
        UpdateOverlay(currentCamIndex, numCameras, fullIP, "🚀 Launching Browser...", skippedCounter)

        if (isPrama) {
            ; ================= PRAMA LOGIC =================
            Run(targetURL)
            UpdateOverlay(currentCamIndex, numCameras, fullIP, "⏳ Waiting for Thorium...", skippedCounter)

            if WinWaitActive("ahk_exe thorium.exe", , 5) {

                loopStartTime := A_TickCount
                loop {
                    if (!isRunning)
                        break
                    if (A_TickCount - loopStartTime > 30000) {
                        UpdateOverlay(currentCamIndex, numCameras, fullIP, "⚠️ Timeout.", skippedCounter)
                        Sleep(1000)
                        break
                    }
                    currentTitle := WinGetTitle("A")

                    if InStr(currentTitle, "Privacy error") {
                        UpdateOverlay(currentCamIndex, numCameras, fullIP, "🔓 Bypassing Privacy...", skippedCounter)
                        Send("thisisunsafe")
                        Sleep(800) ; Slightly faster bypass wait
                        continue
                    }
                    if (InStr(currentTitle, "Log In") || InStr(currentTitle, "Login") || InStr(currentTitle, "PRAMA")) {
                        UpdateOverlay(currentCamIndex, numCameras, fullIP, "✅ Login Page Found!", skippedCounter)
                        Sleep(1500) ; REQUIRED DELAY: Ensures page is responsive before typing
                        break
                    }
                    UpdateOverlay(currentCamIndex, numCameras, fullIP, "⏳ Loading... (" . Round((A_TickCount -
                        loopStartTime) / 1000, 1) . "s)", skippedCounter)
                    Sleep(100)
                }

                if (!isRunning)
                    break

                UpdateOverlay(currentCamIndex, numCameras, fullIP, "⌨️ Typing Credentials...", skippedCounter)
                SetKeyDelay(50, 40) ; Safe typing speed maintained

                SendEvent("{Text}" . username)
                Sleep(100) ; Faster
                Send("{Tab}")
                Sleep(100) ; Faster
                SendEvent("{Text}" . password)
                Sleep(100) ; Faster
                Send("{Tab}")
                Sleep(50)
                Send("{Tab}")

                UpdateOverlay(currentCamIndex, numCameras, fullIP, "📝 Done! Solve Captcha.", skippedCounter)
                Sleep(1500) ; Keep this so user sees the "Done" message
            }

        } else if (isHik) {
            ; ================= HIKVISION LOGIC =================
            Run(targetURL)
            UpdateOverlay(currentCamIndex, numCameras, fullIP, "⏳ Waiting for Thorium...", skippedCounter)

            if WinWaitActive("ahk_exe thorium.exe", , 5) {

                loopStartTime := A_TickCount
                loop {
                    if (!isRunning)
                        break
                    if (A_TickCount - loopStartTime > 30000) {
                        UpdateOverlay(currentCamIndex, numCameras, fullIP, "⚠️ Timeout.", skippedCounter)
                        Sleep(1000)
                        break
                    }
                    currentTitle := WinGetTitle("A")

                    if InStr(currentTitle, "Privacy error") {
                        UpdateOverlay(currentCamIndex, numCameras, fullIP, "🔓 Bypassing Privacy...", skippedCounter)
                        Send("thisisunsafe")
                        Sleep(800)
                        continue
                    }
                    if (InStr(currentTitle, "Log In") || InStr(currentTitle, "Login") || InStr(currentTitle, "HIK")) {
                        UpdateOverlay(currentCamIndex, numCameras, fullIP, "✅ Login Page Found!", skippedCounter)
                        Sleep(1500) ; REQUIRED DELAY: Ensures page is responsive before typing
                        break
                    }
                    UpdateOverlay(currentCamIndex, numCameras, fullIP, "⏳ Loading... (" . Round((A_TickCount -
                        loopStartTime) / 1000, 1) . "s)", skippedCounter)
                    Sleep(100)
                }

                if (!isRunning)
                    break

                UpdateOverlay(currentCamIndex, numCameras, fullIP, "⌨️ Logging In...", skippedCounter)
                SetKeyDelay(50, 40) ; Safe typing speed maintained

                SendEvent("{Text}" . username)
                Sleep(100) ; Faster
                Send("{Tab}")
                Sleep(100) ; Faster
                SendEvent("{Text}" . password)
                Sleep(100) ; Faster
                Send("{Tab}")
                Sleep(100) ; Faster
                Send("{Enter}")

                UpdateOverlay(currentCamIndex, numCameras, fullIP, "🎉 Logged In!", skippedCounter)
                Sleep(1500) ; Wait a bit before next camera
            }

        } else {
            ; ================= OTHERS LOGIC =================
            Run(targetURL)
            Sleep(500)
        }
    }

    DestroyOverlay()
    SoundBeep(750, 500)
    MsgBox("✅ Processed: " . (numCameras - skippedCounter) . "`n⏭️ Skipped: " . skippedCounter, "Completed")
    isRunning := false
}

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿

; Set the timer for 2 minutes (120,000 milliseconds)
; SetTimer BlinkReminder, 120000

BlinkReminder() {
    ; Get current mouse position
    ; In v2, we must use & to pass x and y as references to store the output
    MouseGetPos &x, &y

    ; Display the tooltip relative to the mouse cursor
    ToolTip "👁️ Blink Check", x + 20, y - 20

    SoundBeep 2500, 200 ; Optional: Uncomment for sound

    ; Remove the tooltip automatically after 2 seconds (-2000 ms)
    ; We use an Arrow Function (lambda) here for cleaner code
    SetTimer () => ToolTip(), -2000
}

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿

>^v::
{
    ; Check if clipboard contains text data to avoid errors
    if !A_Clipboard
        return

    ; SetKeyDelay controls the speed.
    ; First number (1) is delay in milliseconds between keystrokes.
    ; Second number (0) is the press duration.
    ; Adjust '1' to be higher if the app is still missing characters.
    SetKeyDelay 1, 0

    ; SendEvent is required to respect the SetKeyDelay above.
    ; "{Text}" tells AHK to type the characters literally, ignoring
    ; symbols like !, ^, or + which would otherwise act as Shift/Ctrl modifiers.
    SendEvent "{Text}" A_Clipboard
}

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿


/*
CheckCorner() {
    ; Optional: Uncomment to restrict to Thorium only
    if !WinActive("ahk_exe thorium.exe")
        return

    MouseGetPos(&mouseX, &mouseY)

    ; 2. Check if mouse is within top-left 5x5 pixel area
    if (mouseX < 5 and mouseY < 5) {
        CornerTriggerTime := A_TickCount ; Record the time of trigger
        Send("^1")  ; Send Ctrl + 1
        Sleep(5000) ; Cooldown to prevent spamming
    }
}
*/

; --- SAFETY CATCH MECHANISM ---
; This hotkey becomes active ONLY if the corner was triggered less than 2 seconds ago.
#HotIf (A_TickCount - CornerTriggerTime < 2000) 
$LButton:: {
    MouseGetPos(&clkX, &clkY)
    
    ; Check if the click is in the danger zone: 
    ; Width (X): 0 to 150
    ; Height (Y): 50 to 100
    if (clkX >= 0 && clkX <= 150 && clkY >= 50 && clkY <= 100) {
        ; INTERCEPTED!
        ; 1. Switch back to previous tab (User requested Ctrl + Q)
        Send("^q")
        
        ; 2. Wait briefly for the browser to switch tabs (adjust if too fast)
        Sleep(100)
        
        ; 3. Perform the click at the original location
        Click(clkX, clkY)
        
        ; 4. Reset timer so normal clicking resumes immediately
        global CornerTriggerTime := 0 
    } else {
        ; Pass through the click normally if it's not in the specific region
        Send("{Blind}{LButton Down}")
        KeyWait("LButton")
        Send("{Blind}{LButton Up}")
    }
}
#HotIf

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿

#HotIf WinActive("Multi-Script.ahk")
~^s::
{
    KeyWait "s"          ; Prevent key repeat re-triggering
    ToolTip("Reloading Script...", 0, 0, 9) ; Visual feedback
    SoundPlay "*-1"      ; System "Simple Beep" (more reliable than SoundBeep)
    Sleep 200            ; Allow sound/tooltip to register before killing process
    Reload
}
#Hotif

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿

; --- ALT + ENTER SPAMMER ---

global AltEnterModeActive := false
global AltEnterGui := ""

; Ctrl + Shift + F9 Hotkey
^+F9::
{
    global AltEnterModeActive
    if (AltEnterModeActive)
        return ; Prevent triggering if already running
        
    AltEnterModeActive := true
    
    ; Create Visual Overlay
    CreateAltEnterOverlay()
    
    ; Start loop every 100ms
    SetTimer(SendAltEnterKey, 100)
}

; Function that actually sends the keys
SendAltEnterKey() {
    Send("!{Enter}")
}

; Function to build and show the visual overlay
CreateAltEnterOverlay() {
    global AltEnterGui
    
    ; +AlwaysOnTop keeps it visible. -Caption removes borders.
    ; +E0x08000000 keeps it from stealing focus. +E0x20 makes it click-through.
    AltEnterGui := Gui("+AlwaysOnTop +ToolWindow -Caption +E0x08000000 +E0x20")
    AltEnterGui.BackColor := "1F1F1F" ; Dark background
    
    AltEnterGui.SetFont("s14 cff6b6b w700", "Segoe UI")
    AltEnterGui.Add("Text", "w350 Center", "⚠️ ALT + ENTER SPAM ACTIVE ⚠️")
    
    AltEnterGui.SetFont("s10 cWhite w400", "Segoe UI")
    AltEnterGui.Add("Text", "w350 Center", "Press ESC to Stop")
    
    ; Show the GUI at the top center of the screen without activating it
    AltEnterGui.Show("y50 NoActivate")
}

; Conditional Hotkey: Only runs when the spammer is active
#HotIf AltEnterModeActive
Esc::
{
    global AltEnterModeActive := false
    global AltEnterGui
    
    ; Stop the timer
    SetTimer(SendAltEnterKey, 0)
    
    ; Destroy the visual overlay
    if (AltEnterGui) {
        AltEnterGui.Destroy()
        AltEnterGui := ""
    }
    
    SoundBeep(500, 200) ; Brief audio feedback that it stopped
}
#HotIf

;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿
;⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿

; --- ANTIGRAVITY BACKGROUND ALT+ENTER SPAMMER ---
; F9 toggles spam mode IF Antigravity window exists (even in background).
; Uses ControlSend so keystrokes go directly to Antigravity — foreground is untouched.
; The existing F9 expand-selection hotkey (under WinActive Antigravity) still takes
; priority when Antigravity IS the focused window.

global AgSpamActive  := false
global AgSpamGui     := ""
global AgSpamInterval := 300 ; ms between each Alt+Enter — tune this as needed

F9::
{
    ; Only act if Antigravity is open somewhere (doesn't need to be focused)
    if !WinExist("ahk_exe Antigravity.exe")
        return

    ; If Antigravity IS the active window, let the expand-selection hotkey handle it
    ; (the #HotIf WinActive block above will have already captured it first,
    ;  so this line is a safety valve in case of edge-case ordering)
    if WinActive("ahk_exe Antigravity.exe")
        return

    global AgSpamActive
    AgSpamActive := !AgSpamActive

    if AgSpamActive {
        AgCreateOverlay()
        SetTimer(AgSendKey, AgSpamInterval)
        SoundBeep(900, 150)
    } else {
        AgStopSpam()
        SoundBeep(500, 150)
    }
}

AgSendKey() {
    global AgSpamActive

    ; Safety: stop automatically if Antigravity was closed
    if !WinExist("ahk_exe Antigravity.exe") {
        AgStopSpam()
        return
    }

    ; ControlSend with no ControlName targets the focused control inside the window.
    ; This never steals focus — your foreground app is completely unaffected.
    ControlSend("!{Enter}",, "ahk_exe Antigravity.exe")
}

AgStopSpam() {
    global AgSpamActive, AgSpamGui
    AgSpamActive := false
    SetTimer(AgSendKey, 0)
    if AgSpamGui {
        AgSpamGui.Destroy()
        AgSpamGui := ""
    }
}

AgCreateOverlay() {
    global AgSpamGui

    ; Destroy any existing one first
    if AgSpamGui {
        AgSpamGui.Destroy()
        AgSpamGui := ""
    }

    AgSpamGui := Gui("+AlwaysOnTop +ToolWindow -Caption +E0x08000000 +E0x20")
    AgSpamGui.BackColor := "1A1A1A"
    AgSpamGui.MarginX := 6
    AgSpamGui.MarginY := 4

    AgSpamGui.SetFont("s8 w600 c00FF88", "Segoe UI")
    AgSpamGui.Add("Text",, "⚡ AG Spam ON")

    AgSpamGui.SetFont("s7 w400 cGray", "Segoe UI")
    AgSpamGui.Add("Text", "x+8 yp+1", "F9 = stop")

    ; Position: bottom-left corner, just above taskbar (~40px from bottom)
    AgSpamGui.Show("x4 y" . (A_ScreenHeight - 54) . " NoActivate")
}
