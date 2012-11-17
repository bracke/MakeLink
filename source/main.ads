with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;

with RASCAL.WimpTask;            use RASCAL.WimpTask;
with RASCAL.Utility;             use RASCAL.Utility;
with RASCAL.Toolbox;             use RASCAL.Toolbox;
with RASCAL.OS;                  use RASCAL.OS;

package Main is   

   app_name       : constant String := "MakeLink";

   Main_Task      : ToolBox_Task_Class;
   main_objectid  : Object_ID             := -1;
   main_winid     : Wimp_Handle_Type      := -1;
   SaveAs_ObjectId: Object_ID;
   source         : ustring;

   Untitled_String : Unbounded_String;

   --

   procedure Report_Error (Token : in String;
                           Info  : in String);
                           
   --

   procedure Main;

   --

 end Main;


