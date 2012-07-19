; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
;
; This script creates an installable FlightGear package for Win32 using the
; "Inno Setup" package builder.  Inno Setup is free (but probably not open
; source?.)  The official web site for this package building software is:
;
;     http://www.jrsoftware.org/isinfo.php
;
; Note: the files must appear in the X: drive.
; You can do this with the command below:
;
;     subst X: path_to_files
;
; For example:
;
;     C:\> subst X: F:\Path\to\FlightGear\root
;     C:\> subst X: F:\
;

#include "InstallConfig.iss"

#if GetEnv("VSINSTALLDIR") == ""
  #define VSInstallDir "C:\Program Files (x86)\Microsoft Visual Studio 10.0"
#else
  #define VSInstallDir GetEnv("VSINSTALLDIR")
#endif

#define VCInstallDir VSInstallDir + "\VC"
#define OSGInstallDir "X:\install\msvc100\OpenSceneGraph"
#define OSGPluginsDir OSGInstallDir + "\bin\osgPlugins-" + OSGVersion

#define OSG64InstallDir "X:\install\msvc100-64\OpenSceneGraph"
#define OSG64PluginsDir OSG64InstallDir + "\bin\osgPlugins-" + OSGVersion

[Setup]
AppId=FlightGear
AppName=FlightGear
AppPublisher=The FlightGear Team
OutputBaseFilename=fgsetup-{#FGVersion}
AppVerName=FlightGear v{#FGVersion}
AppPublisherURL=http://www.flightgear.org
AppSupportURL=http://www.flightgear.org
AppUpdatesURL=http://www.flightgear.org
DefaultDirName={pf}\FlightGear
DefaultGroupName=FlightGear {#FGVersion}
LicenseFile=X:\flightgear\COPYING
Uninstallable=yes
SetupIconFile=X:\flightgear\package\flightgear.ico
VersionInfoVersion={#FGVersion}.0
WizardImageFile=X:\flightgear\package\Win32-Inno\setupimg.bmp
WizardImageStretch=No
WizardSmallImageFile=X:\flightgear\package\Win32-Inno\setupsmall.bmp
VersionInfoCompany=The FlightGear Team
UninstallDisplayIcon=X:\flightgear\projects\VC90\flightgear.ico
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x86 x64

[Tasks]
; NOTE: The following entry contains English phrases ("Create a desktop icon" and "Additional icons"). You are free to translate them into another language if required.
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"
Name: "insoal"; Description: "Install OpenAL (the sound engine)"
Name: "force32"; Description: "Force 32bit install on 64bit system"; Check: Is64BitInstallMode

[Files]
; NOTE: run subst X: F:\ (or whatever path the expanded tree resides at)
;Source: "X:\*.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\bin\fgfs.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\fgfs.exe"; DestDir: "{app}\bin\Win64"; Flags: ignoreversion skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')

;Unconditional install
Source: "X:\install\msvc100\FlightGear\bin\fgadmin.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\bin\terrasync.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\bin\js_demo.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\bin\fgjs.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\bin\fgpanel.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\bin\GPSsmooth.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\bin\UGsmooth.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\bin\MIDGsmooth.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\bin\metar.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\bin\yasim.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion
Source: "X:\3rdParty\bin\*.dll"; DestDir: "{app}\bin\Win32"

Source: "X:\install\msvc100\FGRun\bin\fgrun.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion ; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FGRun\share\locale\*"; DestDir: "{app}\bin\Win32\locale"; Flags: ignoreversion recursesubdirs; Check: not Is64BitInstallMode or IsTaskSelected('force32')

Source: "X:\install\msvc100-64\FGRun\bin\fgrun.exe"; DestDir: "{app}\bin\Win64"; Flags: ignoreversion skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FGRun\share\locale\*"; DestDir: "{app}\bin\Win64\locale"; Flags: ignoreversion recursesubdirs skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')

Source: "X:\3rdParty.x64\bin\*.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')

Source: "{#VCInstallDir}\redist\x86\Microsoft.VC100.CRT\*.dll"; DestDir:  "{app}\bin\Win32"
Source: "{#VCInstallDir}\redist\x64\Microsoft.VC100.CRT\*.dll"; DestDir:  "{app}\bin\Win64";  Flags: skipifsourcedoesntexist;   Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\3rdParty\bin\vcredist_x86.exe"; DestDir: "{app}\bin\Win32"; Flags: skipifsourcedoesntexist
Source: "X:\3rdParty.x64\bin\vcredist_x64.exe"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')

Source: "X:\3rdParty\bin\oalinst.exe"; DestDir: "{app}\bin\Win32"; Flags: ignoreversion skipifsourcedoesntexist

Source: "X:\data\*.*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs skipifsourcedoesntexist

Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osg.dll"; DestDir: "{app}\bin\Win32"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgDB.dll"; DestDir: "{app}\bin\Win32"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgGA.dll"; DestDir: "{app}\bin\Win32"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgParticle.dll"; DestDir: "{app}\bin\Win32"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgText.dll"; DestDir: "{app}\bin\Win32"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgUtil.dll"; DestDir: "{app}\bin\Win32"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgViewer.dll"; DestDir: "{app}\bin\Win32"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgSim.dll"; DestDir: "{app}\bin\Win32"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgFX.dll"; DestDir: "{app}\bin\Win32"; Check: not Is64BitInstallMode or IsTaskSelected('force32')

Source: "{#OSGInstallDir}\bin\ot12-OpenThreads.dll"; DestDir: "{app}\bin\Win32"; Check: not Is64BitInstallMode or IsTaskSelected('force32')

Source: "{#OSGPluginsDir}\osgdb_ac.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_osg.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_osga.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_3ds.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_mdl.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_jpeg.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_rgb.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_png.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_dds.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_txf.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_freetype.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osg.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osganimation.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgfx.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgmanipulator.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgparticle.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgshadow.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgsim.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgterrain.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgtext.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgvolume.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_deprecated_osg.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_deprecated_osgparticle.dll"; DestDir: "{app}\bin\Win32\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')

Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osg.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgDB.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgGA.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgParticle.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgText.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgUtil.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgViewer.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgSim.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgFX.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')

Source: "{#OSG64InstallDir}\bin\ot12-OpenThreads.dll"; DestDir: "{app}\bin\Win64"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')

Source: "{#OSG64PluginsDir}\osgdb_ac.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_osg.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_osga.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_3ds.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_mdl.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_jpeg.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_rgb.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_png.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_dds.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_txf.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_freetype.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osg.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osganimation.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgfx.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgmanipulator.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgparticle.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgshadow.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgsim.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgterrain.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgtext.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgvolume.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_deprecated_osg.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_deprecated_osgparticle.dll"; DestDir: "{app}\bin\Win64\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')

[Dirs]
; Make the user installable scenery directory
Name: "{app}\scenery"; Permissions: everyone-modify
Name: "{code:TerrasyncDir}"; Permissions: everyone-modify

[Icons]
Name: "{group}\FlightGear Launcher"; Filename: "{app}\bin\Win32\fgrun.exe"; WorkingDir: "{app}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Name: "{group}\FlightGear Launcher"; Filename: "{app}\bin\Win64\fgrun.exe"; WorkingDir: "{app}"; Check: Is64BitInstallMode and not IsTaskSelected('force32')
; Name: "{group}\FlightGear"; Filename: "{app}\bin\Win32\fgfs.exe"; Parameters: "--fg-root=."; WorkingDir: "{app}";
Name: "{group}\FlightGear Manual"; Filename: "{app}\data\Docs\getstart.pdf"
Name: "{group}\FlightGear Documentation"; Filename: "{app}\data\Docs\index.html"
Name: "{group}\Flightgear Wiki"; Filename: "http://wiki.flightgear.org"
Name: "{userdesktop}\FlightGear {#FGVersion}"; Filename: "{app}\bin\Win32\fgrun.exe"; WorkingDir: "{app}"; Tasks: desktopicon; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Name: "{userdesktop}\FlightGear {#FGVersion}"; Filename: "{app}\bin\Win64\fgrun.exe"; WorkingDir: "{app}"; Tasks: desktopicon; Check: Is64BitInstallMode and not IsTaskSelected('force32')

Name: "{group}\Tools\Install & Uninstall Scenery"; Filename: "{app}\bin\Win32\fgadmin.exe"; WorkingDir: "{app}"
Name: "{group}\Tools\TerraSync"; Filename: "{app}\bin\Win32\terrasync.exe"; Parameters: "-S -p 5505 -d ""{app}\terrasync"""; WorkingDir: "{app}"
Name: "{group}\Tools\Uninstall FlightGear"; Filename: "{uninstallexe}"

Name: "{group}\Tools\js_demo"; Filename: "{app}\bin\Win32\js_demo.exe"
Name: "{group}\Tools\fgjs"; Filename: "cmd"; Parameters: "/k fgjs.exe ""--fg-root={app}\data"""; WorkingDir: "{app}\bin\Win32";
Name: "{group}\Tools\GPSsmooth"; Filename: "cmd"; Parameters: "/k ""{app}\bin\Win32\GPSsmooth.exe"" -h"; WorkingDir: "{app}\bin\Win32";
Name: "{group}\Tools\UGsmooth"; Filename: "cmd"; Parameters: "/k ""{app}\bin\Win32\UGsmooth.exe"" -h"; WorkingDir: "{app}\bin\Win32";
Name: "{group}\Tools\MIDGsmooth"; Filename: "cmd"; Parameters: "/k ""{app}\bin\Win32\MIDGsmooth.exe"" -h"; WorkingDir: "{app}\bin\Win32";
Name: "{group}\Tools\metar"; Filename: "cmd"; Parameters: "/k ""{app}\bin\Win32\metar.exe"" -h"; WorkingDir: "{app}\bin\Win32";
Name: "{group}\Tools\yasim"; Filename: "cmd"; Parameters: "/k ""{app}\bin\Win32\yasim.exe"" -h"; WorkingDir: "{app}\bin\Win32";
Name: "{group}\Tools\fgpanel"; Filename: "cmd"; Parameters: "/k ""{app}\bin\Win32\fgpanel.exe"" -h"; WorkingDir: "{app}\bin\Win32";

Name: "{group}\Tools\Explore Documentation Folder"; Filename: "{app}\data\Docs"

; For running flightgear directly
; Name: "{userdesktop}\FlightGear v2.0.0"; Filename: "{app}\bin\Win32\fgfs.exe"; Parameters: "--fg-root=."; WorkingDir: "{app}"; Tasks: desktopicon

[Run]
filename: "cmd.exe"; WorkingDir: "{app}\bin\Win32"; Parameters: "/C del msvc*.dll"; Check: FileExists(ExpandConstant('{app}\bin\Win32\vcredist_x86.exe'))
filename: "cmd.exe"; WorkingDir: "{app}\bin\Win64"; Parameters: "/C del msvc*.dll"; Check: FileExists(ExpandConstant('{app}\bin\Win64\vcredist_x64.exe'))
filename: "{app}\bin\Win32\vcredist_x86.exe"; WorkingDir: "{app}\bin\Win32"; Parameters: "/passive /norestart"; Description: "Installing MS Visual C++ runtime components"; Check: FileExists(ExpandConstant('{app}\bin\Win32\vcredist_x86.exe'))
filename: "{app}\bin\Win64\vcredist_x64.exe"; WorkingDir: "{app}\bin\Win64"; Parameters: "/passive /norestart"; Description: "Installing MS Visual C++ runtime components"; Check: Is64BitInstallMode and not IsTaskSelected('force32') and FileExists(ExpandConstant('{app}\bin\Win64\vcredist_x64.exe'))
filename: "{app}\bin\Win32\oalinst.exe"; WorkingDir: "{app}\bin\Win32"; Description: "Installing OpenAL"; Check: IsTaskSelected('insoal') and FileExists(ExpandConstant('{app}\bin\Win32\oalinst.exe'))

; Put installation directory into the fgrun.prefs
filename: "{app}\bin\Win32\fgrun.exe"; WorkingDir: "{app}\bin\Win32"; Parameters: "--silent ""--fg-exe={app}\bin\Win32\fgfs.exe"" ""--ts-exe={app}\bin\Win32\terrasync.exe"" ""--fg-root={app}\data"" ""--fg-scenery={app}\data\Scenery;{app}\scenery;{code:TerrasyncDir}"" --ts-dir=3 --version={#FGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
filename: "{app}\bin\Win64\fgrun.exe"; WorkingDir: "{app}\bin\Win64"; Parameters: "--silent ""--fg-exe={app}\bin\Win64\fgfs.exe"" ""--ts-exe={app}\bin\Win32\terrasync.exe"" ""--fg-root={app}\data"" ""--fg-scenery={app}\data\Scenery;{app}\scenery;{code:TerrasyncDir}"" --ts-dir=3 --version={#FGVersion}"; Check: Is64BitInstallMode and not IsTaskSelected('force32')

; Put installation and source directories into the fgadmin.prefs
filename: "{app}\bin\Win32\fgadmin.exe"; WorkingDir: "{app}\bin\Win32"; Parameters: "--silent ""--install-source={src}\..\Scenery"" ""--scenery-dest={app}\scenery"""

[Registry]
Root: HKLM; Subkey: "Software\flightgear.org"; ValueType: string; ValueName: "TerrasyncDir"; ValueData: "{code:TerrasyncDir}"

[Code]
var
  TerrasyncDirPage: TInputDirWizardPage;

procedure URLLabelOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExec('open', 'http://www.flightgear.org', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure CreateURLLabel(ParentForm: TSetupForm; CancelButton: TNewButton);
var
  URLLabel: TNewStaticText;
begin
  URLLabel := TNewStaticText.Create(ParentForm);
  URLLabel.Caption := 'www.flightgear.org';
  URLLabel.Cursor := crHand;
  URLLabel.OnClick := @URLLabelOnClick;
  URLLabel.Parent := ParentForm;
  { Alter Font *after* setting Parent so the correct defaults are inherited first }
  URLLabel.Font.Style := URLLabel.Font.Style + [fsUnderline];
  URLLabel.Font.Color := clBlue;
  URLLabel.Top := CancelButton.Top + CancelButton.Height - URLLabel.Height - 2;
  URLLabel.Left := ScaleX(20);
end;

procedure InitializeWizard();
begin
  TerrasyncDirPage := CreateInputDirPage(wpSelectDir,
    'Select Terrasync Directory', 'Where should scenery downloaded by Terrasync be put?',
    'Select the folder in which Terrasync would download additional scenery, then click Next.',
    False, 'Terrasync Folder');
  TerrasyncDirPage.Add('');

  CreateURLLabel(WizardForm, WizardForm.CancelButton);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if CurPageID = wpSelectDir then begin
    TerrasyncDirPage.Values[0] := GetPreviousData( 'TerrasyncDir', ExpandConstant('{reg:HKLM\Software\flightgear.org,TerrasyncDir|{app}\terrasync}') );
  end;
  Result := True;
end;

function TerrasyncDir(Param: String): String;
begin
  Result := TerrasyncDirPage.Values[0];
end;

procedure RegisterPreviousData(PreviousDataKey: Integer);
begin
  { Store the settings so we can restore them next time }
  SetPreviousData(PreviousDataKey, 'TerrasyncDir', TerrasyncDirPage.Values[0]);
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  S := '';
  S := S + MemoDirInfo + NewLine + NewLine;
  S := S + 'Terrasync folder:' + NewLine;
  S := S + Space + TerrasyncDirPage.Values[0] + NewLine + NewLine;
  S := S + MemoGroupInfo + NewLine + NewLine;
  S := S + MemoTasksInfo + NewLine + NewLine;

  Result := S;
end;

