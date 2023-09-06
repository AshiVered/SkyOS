
![logo](https://raw.githubusercontent.com/AshiVered/SkyOS/main/res/logo.png)
# SkyOS
SkyOS is a custom ROM for Nokia 800 Tough. The ROM is designed to improve speed and user experience. It's based on v40 firmware and
it is now in the public alpha phase (0.1).




![screenshot1](https://raw.githubusercontent.com/AshiVered/SkyOS/main/res/2022-12-26-08-00-15.png)
![screenshot2](https://raw.githubusercontent.com/AshiVered/SkyOS/main/res/2022-12-26-08-00-24.png)





Changes from original ROM (KaiOS):
- debloated
- replace stock contacts app with [SkyOS contacts](https://gitlab.com/AshiVered/skyos-contacts)
- replace stock camera app with [SkyOS camera](https://gitlab.com/AshiVered/SkyOS-Camera)
- replace stock music player app with [K-music](https://github.com/arma7x/kaimusic)
- replace stock files app with [GerdaOS files](https://gitlab.com/project-pris/system/-/tree/master/src/system/b2g/webapps/files.gerda.tech/src)
- ADblock
- LineageOS theme
- disable lowmemorykiller deamon (LMK)
- root
- some fast patches

To-do list:

- Replacing stock apps with faster alternative apps.
- add some functions (for example, task manager, like Android or GerdaOS).
- add virtual RAM memory (swap file)
- replacing boot logo


Known bugs:
(thanks [@Cobeta-beta](https://github.com/Cobeta-beta) )
- For a while after the OS boots, you can't change settings in "quick settings"
- Some applications doesnt open if it binded on the hotkey button. (Notes, Music, Browser, E-Mail, Camera. Everything else works fine.)

  
Install:
- download boot.img&system.img from realeses page
- flash with [edl](https://wiki.bananahackers.net/development/edl)

Contact us:
our [slack room](https://skyosdevelopers.slack.com/)

Thanks to all the developers of the KaiOS community, especially those whose guides and resources I used!
