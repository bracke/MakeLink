#MakeLink
MakeLink creates an 'empty' application which points to another application (the target) of your choice. Double clicking on the new application will run the target application, selecting 'Help' in the filer menu will open the help of the target application.

NOTE: This is a RISC OS app and will not run on other platforms.

That way you can access the target application from several places on the harddisc. The empty link application takes very little space and does not need to be updated when the target application is updated (e.g. a new version).

Only when you move the target application do you need to change the link application. The easiest way to do that is to delete the link applications and recreate them with MakeLink.