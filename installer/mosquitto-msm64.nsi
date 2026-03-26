; NSIS installer script for mosquitto - Windows x64 MSI Merge Module
; Produces a headless merge-module style package (no UI, no uninstaller,
; no service section) intended to be embedded into a parent installer.
Unicode True
SetCompressor /SOLID lzma

!include "x64.nsh"
!include "WinMessages.nsh"

!define env_hklm 'HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"'

Name "Eclipse Mosquitto"
!define VERSION 2.1.2
OutFile "mosquitto-${VERSION}-x64.msm"

InstallDir "$PROGRAMFILES64\Mosquitto"

; No installer UI pages - merge module runs silently
SilentInstall silent

;--------------------------------
; Installer section

Section "Files" SecInstall
	SectionIn RO

	SetOutPath "$INSTDIR"
	File "..\logo\mosquitto.ico"
	File "..\build64\src\Release\mosquitto.exe"
	File "..\build64\apps\db_dump\Release\mosquitto_db_dump.exe"
	File "..\build64\apps\mosquitto_ctrl\Release\mosquitto_ctrl.exe"
	File "..\build64\apps\mosquitto_passwd\Release\mosquitto_passwd.exe"
	File "..\build64\apps\mosquitto_signal\Release\mosquitto_signal.exe"
	File "..\build64\client\Release\mosquitto_pub.exe"
	File "..\build64\client\Release\mosquitto_sub.exe"
	File "..\build64\client\Release\mosquitto_rr.exe"
	File "..\build64\libcommon\Release\mosquitto_common.dll"
	File "..\build64\lib\Release\mosquitto.dll"
	File "..\build64\lib\cpp\Release\mosquittopp.dll"
	File "..\build64\plugins\acl-file\Release\mosquitto_acl_file.dll"
	File "..\build64\plugins\dynamic-security\Release\mosquitto_dynamic_security.dll"
	File "..\build64\plugins\password-file\Release\mosquitto_password_file.dll"
	File "..\build64\plugins\persist-sqlite\Release\mosquitto_persist_sqlite.dll"
	File "..\build64\plugins\sparkplug-aware\Release\mosquitto_sparkplug_aware.dll"
	File "..\aclfile.example"
	File "..\ChangeLog.txt"
	File "..\NOTICE.md"
	File "..\pskfile.example"
	File "..\pwfile.example"
	File "..\README.md"
	File "..\README-windows.txt"
	File "..\README-letsencrypt.md"
	File "..\SECURITY.md"
	File "..\edl-v10"
	File "..\epl-v20"

	SetOverwrite off
	File "..\mosquitto.conf"
	SetOverwrite on

	File "..\build64\vcpkg_installed\x64-windows-release\bin\cjson.dll"
	File "..\build64\vcpkg_installed\x64-windows-release\bin\libcrypto-3-x64.dll"
	File "..\build64\vcpkg_installed\x64-windows-release\bin\libmicrohttpd-dll.dll"
	File "..\build64\vcpkg_installed\x64-windows-release\bin\libssl-3-x64.dll"
	File "..\build64\vcpkg_installed\x64-windows-release\bin\pthreadVC3.dll"
	File "..\build64\vcpkg_installed\x64-windows-release\bin\sqlite3.dll"

	SetOutPath "$INSTDIR\devel"
	File "..\build64\lib\Release\mosquitto.lib"
	File "..\build64\lib\cpp\Release\mosquittopp.lib"
	File "..\build64\src\Release\mosquitto_broker.lib"
	File "..\include\mosquitto.h"
	File "..\include\mosquitto_broker.h"
	File "..\include\mosquitto_plugin.h"
	File "..\include\mosquittopp.h"
	File "..\include\mqtt_protocol.h"

	SetOutPath "$INSTDIR\devel\mosquitto"
	File "..\include\mosquitto\broker.h"
	File "..\include\mosquitto\broker_control.h"
	File "..\include\mosquitto\broker_plugin.h"
	File "..\include\mosquitto\defs.h"
	File "..\include\mosquitto\libcommon.h"
	File "..\include\mosquitto\libcommon_base64.h"
	File "..\include\mosquitto\libcommon_cjson.h"
	File "..\include\mosquitto\libcommon_file.h"
	File "..\include\mosquitto\libcommon_memory.h"
	File "..\include\mosquitto\libcommon_password.h"
	File "..\include\mosquitto\libcommon_properties.h"
	File "..\include\mosquitto\libcommon_random.h"
	File "..\include\mosquitto\libcommon_string.h"
	File "..\include\mosquitto\libcommon_time.h"
	File "..\include\mosquitto\libcommon_topic.h"
	File "..\include\mosquitto\libcommon_utf8.h"
	File "..\include\mosquitto\libmosquitto.h"
	File "..\include\mosquitto\libmosquitto_auth.h"
	File "..\include\mosquitto\libmosquitto_callbacks.h"
	File "..\include\mosquitto\libmosquitto_connect.h"
	File "..\include\mosquitto\libmosquitto_create_delete.h"
	File "..\include\mosquitto\libmosquitto_helpers.h"
	File "..\include\mosquitto\libmosquitto_loop.h"
	File "..\include\mosquitto\libmosquitto_message.h"
	File "..\include\mosquitto\libmosquitto_options.h"
	File "..\include\mosquitto\libmosquitto_publish.h"
	File "..\include\mosquitto\libmosquitto_socks.h"
	File "..\include\mosquitto\libmosquitto_subscribe.h"
	File "..\include\mosquitto\libmosquitto_tls.h"
	File "..\include\mosquitto\libmosquitto_unsubscribe.h"
	File "..\include\mosquitto\libmosquitto_will.h"
	File "..\include\mosquittopp.h"
	File "..\include\mosquitto\mqtt_protocol.h"

	SetOutPath "$INSTDIR\dashboard"
	File "..\dashboard\src\index.html"
	File "..\dashboard\src\listeners.html"

	SetOutPath "$INSTDIR\dashboard\app"
	File "..\dashboard\src\app\consts.js"
	File "..\dashboard\src\app\dashboard.js"
	File "..\dashboard\src\app\index.js"
	File "..\dashboard\src\app\listeners.js"
	File "..\dashboard\src\app\sidebar.js"

	SetOutPath "$INSTDIR\dashboard\css"
	File "..\dashboard\src\css\styles.css"

	SetOutPath "$INSTDIR\dashboard\lib"
	File "..\dashboard\src\lib\chart.umd.js"
	File "..\dashboard\src\lib\chartjs-plugin-zoom.min.js"
	File "..\dashboard\src\lib\hammer.min.js"

	SetOutPath "$INSTDIR\dashboard\media"
	File "..\dashboard\src\media\banner.svg"
	File "..\dashboard\src\media\favicon-16x16.png"
	File "..\dashboard\src\media\favicon-32x32.png"
	File "..\dashboard\src\media\mosquitto-logo.png"

	SetOutPath "$INSTDIR\dashboard\tailwind"
	File "..\dashboard\src\tailwind.config.js"
	File "..\dashboard\src\tailwind\styles.css"

	SetOutPath "$INSTDIR\dashboard\utils"
	File "..\dashboard\src\utils\assert.js"
	File "..\dashboard\src\utils\queue.js"
	File "..\dashboard\src\utils\utils.js"

	WriteRegExpandStr ${env_hklm} MOSQUITTO_DIR $INSTDIR
	SendMessage ${HWND_BROADCAST} ${WM_WININICHANGE} 0 "STR:Environment" /TIMEOUT=5000
SectionEnd
