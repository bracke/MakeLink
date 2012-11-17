with RASCAL.OS;                  use RASCAL.OS;
with RASCAL.Utility;             use RASCAL.Utility;
with RASCAL.FileName;            use RASCAL.FileName;
with RASCAL.WimpTask;            use RASCAL.WimpTask;
with RASCAL.ToolboxSaveAs;       use RASCAL.ToolboxSaveAs;

with Interfaces.C;               use Interfaces.C;
with Main;                       use Main;

package body Controller_DataLoad is

   --

   package OS            renames RASCAL.OS;
   package Utility       renames RASCAL.Utility;      
   package FileName      renames RASCAL.FileName;     
   package WimpTask      renames RASCAL.WimpTask;     
   package ToolboxSaveAs renames RASCAL.ToolboxSaveAs;

   --

   procedure Handle (The : in MEL_Message_DataLoad) is

      block   : Wimp_Block_Pointer := Get_Wimp_Block(Wimp_Task_Class(Main_Task));
      Name    : String             := To_Ada(The.Event.all.Full_Path);
      FileType: Integer            := Integer(The.Event.all.File_Type);
   begin
      if FileType = 16#2000# then
         source := U(Name);
         ToolboxSaveAs.Set_FileName(SaveAs_ObjectId,FileName.Get_Leaf(Name));
         Show_Object(Object => SaveAs_ObjectId,Show => AtPointer);
      end if;
   end Handle;

   --

end Controller_DataLoad;
