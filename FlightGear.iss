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
DefaultDirName={pf}\FlightGear {#FGVersion}
DefaultGroupName=FlightGear {#FGVersion}
LicenseFile=X:\flightgear\COPYING
Uninstallable=yes
SetupIconFile=X:\flightgear\package\flightgear.ico
VersionInfoVersion={#FGVersion}.0
InfoBeforeFile=X:\flightgear\package\Win32-Inno\infobefore.txt
WizardImageFile=X:\flightgear\package\Win32-Inno\setupimg.bmp
WizardImageStretch=No
WizardSmallImageFile=X:\flightgear\package\Win32-Inno\setupsmall.bmp
VersionInfoCompany=The FlightGear Team
UninstallDisplayIcon={app}\bin\fgfs.exe
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x86 x64
InfoBeforeFile=X:\flightgear\package\Win32-Inno\infobefore.txt


[Tasks]
; NOTE: The following entry contains English phrases ("Create a desktop icon" and "Additional icons"). You are free to translate them into another language if required.
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"
Name: "insoal"; Description: "Install OpenAL (the sound engine)"
Name: "force32"; Description: "Force 32bit install on 64bit system"; Check: Is64BitInstallMode; Flags: unchecked

[Files]
; NOTE: run subst X: F:\ (or whatever path the expanded tree resides at)
;Source: "X:\*.txt"; DestDir: "{app}"; Flags: ignoreversion
; 32 bits install
Source: "X:\install\msvc100\FlightGear\bin\fgfs.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FlightGear\bin\fgadmin.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FlightGear\bin\terrasync.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FlightGear\bin\js_demo.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FlightGear\bin\fgjs.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FlightGear\bin\GPSsmooth.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FlightGear\bin\UGsmooth.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FlightGear\bin\MIDGsmooth.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FlightGear\bin\metar.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FlightGear\bin\yasim.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FlightGear\bin\fgcom.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FGRun\bin\fgrun.exe"; DestDir: "{app}\bin"; Flags: ignoreversion ; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\install\msvc100\FGRun\share\locale\*"; DestDir: "{app}\bin\locale"; Flags: ignoreversion recursesubdirs; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\3rdParty\bin\*.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#VCInstallDir}\redist\x86\Microsoft.VC100.CRT\*.dll"; DestDir:  "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "X:\3rdParty\bin\vcredist_x86.exe"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: not Is64BitInstallMode or IsTaskSelected('force32')

; 64 bits install
Source: "X:\install\msvc100-64\FlightGear\bin\fgfs.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\fgfs.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\fgadmin.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\terrasync.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\js_demo.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\fgjs.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\GPSsmooth.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\UGsmooth.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\MIDGsmooth.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\metar.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\yasim.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FlightGear\bin\fgcom.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FGRun\bin\fgrun.exe"; DestDir: "{app}\bin"; Flags: ignoreversion; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\install\msvc100-64\FGRun\share\locale\*"; DestDir: "{app}\bin\locale"; Flags: ignoreversion recursesubdirs; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\3rdParty.x64\bin\*.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "X:\3rdParty.x64\bin\vcredist_x64.exe"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#VCInstallDir}\redist\x64\Microsoft.VC100.CRT\*.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode and not IsTaskSelected('force32')

; 32/64 bits install
;NOTE: FGPanel has no 64 bits equivalent, so we are using the 32 bits binary for 32&64 bits OS
Source: "X:\install\msvc100\FlightGear\bin\fgpanel.exe"; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "X:\install\msvc100\FlightGear\share\flightgear\positions.txt"; DestDir: "{app}\share\flightgear"
Source: "X:\install\msvc100\FlightGear\share\flightgear\special_frequencies.txt"; DestDir: "{app}\share\flightgear"
Source: "X:\3rdParty\bin\oalinst.exe"; DestDir: "{app}\bin"; Flags: ignoreversion skipifsourcedoesntexist

; NOTE: tar.gz file uses name 'fgdata', to avoid renaming it, look for both names.
; assuming no setup has both names and hence we don't package twice :)
Source: "X:\data\*.*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs skipifsourcedoesntexist
Source: "X:\fgdata\*.*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs skipifsourcedoesntexist

; 32 bits install
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osg.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgDB.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgGA.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgParticle.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgText.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgUtil.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgViewer.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgSim.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgFX.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGInstallDir}\bin\ot{#OTSoNumber}-OpenThreads.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_ac.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_osga.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_3ds.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_mdl.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_jpeg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_rgb.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_png.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_dds.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_txf.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_freetype.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osganimation.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgfx.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgmanipulator.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgparticle.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgshadow.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgsim.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgterrain.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgtext.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_serializers_osgvolume.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_deprecated_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Source: "{#OSGPluginsDir}\osgdb_deprecated_osgparticle.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode or IsTaskSelected('force32')

; 64 bits install
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osg.dll"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgDB.dll"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgGA.dll"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgParticle.dll"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgText.dll"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgUtil.dll"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgViewer.dll"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgSim.dll"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgFX.dll"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64InstallDir}\bin\ot{#OTSoNumber}-OpenThreads.dll"; DestDir: "{app}\bin"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_ac.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_osga.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_3ds.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_mdl.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_jpeg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_rgb.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_png.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_dds.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_txf.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_freetype.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osganimation.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgfx.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgmanipulator.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgparticle.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgshadow.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgsim.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgterrain.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgtext.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_serializers_osgvolume.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_deprecated_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')
Source: "{#OSG64PluginsDir}\osgdb_deprecated_osgparticle.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode and not IsTaskSelected('force32')

[Dirs]
; Make the user installable scenery directory
Name: "{userdocs}\FlightGear\Aircraft"; Permissions: everyone-modify; Check: not DirExists(ExpandConstant('{userdocs}\FlightGear\Aircraft'))
Name: "{userdocs}\FlightGear\TerraSync"; Permissions: everyone-modify; Check: not DirExists(ExpandConstant('{userdocs}\FlightGear\TerraSync'))
Name: "{userdocs}\FlightGear\Custom Scenery"; Permissions: everyone-modify; Check: not DirExists(ExpandConstant('{userdocs}\FlightGear\Custom Scenery'))

[Icons]
Name: "{userdesktop}\FlightGear {#FGVersion}"; Filename: "{app}\bin\fgrun.exe"; WorkingDir: "{app}"; Tasks: desktopicon;
Name: "{group}\FlightGear Launcher"; Filename: "{app}\bin\fgrun.exe"; WorkingDir: "{app}";
Name: "{group}\FlightGear Manual"; Filename: "{app}\data\Docs\getstart.pdf"
Name: "{group}\FlightGear Documentation"; Filename: "{app}\data\Docs\index.html"
Name: "{group}\Flightgear Wiki"; Filename: "http://wiki.flightgear.org"
Name: "{group}\Tools\Install & Uninstall Scenery"; Filename: "{app}\bin\fgadmin.exe"; WorkingDir: "{app}"
Name: "{group}\Tools\TerraSync"; Filename: "{app}\bin\terrasync.exe"; Parameters: "-S -p 5505 -d ""{userdocs}\FlightGear\TerraSync"""; WorkingDir: "{app}"
Name: "{group}\Tools\Uninstall FlightGear"; Filename: "{uninstallexe}"
Name: "{group}\Tools\js_demo"; Filename: "{app}\bin\js_demo.exe"
Name: "{group}\Tools\fgjs"; Filename: "cmd"; Parameters: "/k fgjs.exe ""--fg-root={app}\data"""; WorkingDir: "{app}\bin"
Name: "{group}\Tools\GPSsmooth"; Filename: "cmd"; Parameters: "/k ""{app}\bin\GPSsmooth.exe"" -h"; WorkingDir: "{app}\bin"
Name: "{group}\Tools\UGsmooth"; Filename: "cmd"; Parameters: "/k ""{app}\bin\UGsmooth.exe"" -h"; WorkingDir: "{app}\bin"
Name: "{group}\Tools\MIDGsmooth"; Filename: "cmd"; Parameters: "/k ""{app}\bin\MIDGsmooth.exe"" -h"; WorkingDir: "{app}\bin"
Name: "{group}\Tools\metar"; Filename: "cmd"; Parameters: "/k ""{app}\bin\metar.exe"" -h"; WorkingDir: "{app}\bin"
Name: "{group}\Tools\yasim"; Filename: "cmd"; Parameters: "/k ""{app}\bin\yasim.exe"" -h"; WorkingDir: "{app}\bin"
Name: "{group}\Tools\fgpanel"; Filename: "cmd"; Parameters: "/k ""{app}\bin\fgpanel.exe"" -h"; WorkingDir: "{app}\bin"; Check: not Is64BitInstallMode or IsTaskSelected('force32')
Name: "{group}\Tools\FGCom"; Filename: "{app}\bin\fgcom.exe"; WorkingDir: "{app}\bin"
Name: "{group}\Tools\FGCom-testing"; Filename: "{app}\bin\fgcom.exe"; Parameters: "-f910"; WorkingDir: "{app}\bin"
Name: "{group}\Tools\Explore Documentation Folder"; Filename: "{app}\data\Docs"

[Run]
filename: "cmd.exe"; WorkingDir: "{app}\bin"; Parameters: "/C del msvc*.dll"; Check: FileExists(ExpandConstant('{app}\bin\vcredist_x86.exe'))
filename: "cmd.exe"; WorkingDir: "{app}\bin"; Parameters: "/C del msvc*.dll"; Check: FileExists(ExpandConstant('{app}\bin\vcredist_x64.exe'))
filename: "{app}\bin\vcredist_x86.exe"; WorkingDir: "{app}\bin"; Parameters: "/passive /norestart"; Description: "Installing MS Visual C++ runtime components"; Check: FileExists(ExpandConstant('{app}\bin\vcredist_x86.exe'))
filename: "{app}\bin\vcredist_x64.exe"; WorkingDir: "{app}\bin"; Parameters: "/passive /norestart"; Description: "Installing MS Visual C++ runtime components"; Check: Is64BitInstallMode and not IsTaskSelected('force32') and FileExists(ExpandConstant('{app}\bin\vcredist_x64.exe'))
filename: "{app}\bin\oalinst.exe"; WorkingDir: "{app}\bin"; Description: "Installing OpenAL"; Check: IsTaskSelected('insoal') and FileExists(ExpandConstant('{app}\bin\oalinst.exe'))
; Put installation directory into the fgrun.prefs
filename: "{app}\bin\fgrun.exe"; WorkingDir: "{app}\bin"; Parameters: "--silent ""--fg-exe={app}\bin\fgfs.exe"" ""--fg-root={app}\data"" ""--fg-scenery={userdocs}\FlightGear\Custom Scenery;{app}\data\Scenery"" ""--fg-aircraft={userdocs}\FlightGear\Aircraft"" ""--terrasync-dir={userdocs}\FlightGear\TerraSync"" --version={#FGVersion}"
; Put installation and source directories into the fgadmin.prefs
filename: "{app}\bin\fgadmin.exe"; WorkingDir: "{app}\bin"; Parameters: "--silent ""--install-source={src}\..\Scenery"" ""--scenery-dest={userdocs}\FlightGear\Custom Scenery"""

[Code]
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

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  S := '';
  S := S + MemoDirInfo + NewLine + NewLine;
  S := S + MemoGroupInfo + NewLine + NewLine;
  S := S + MemoTasksInfo + NewLine + NewLine;

  Result := S;
end;

