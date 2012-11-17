with RASCAL.OS;                  use RASCAL.OS;
with RASCAL.Utility;             use RASCAL.Utility;
with RASCAL.FileExternal;        use RASCAL.FileExternal;
with RASCAL.WimpTask;            use RASCAL.WimpTask;
with RASCAL.FileInternal;        use RASCAL.FileInternal;
with RASCAL.FileName;

with Main;                       use Main;
with Interfaces.C;               use Interfaces.C;

package body Controller_SaveAs is

   --

   package OS           renames RASCAL.OS;
   package Utility      renames RASCAL.Utility;     
   package FileExternal renames RASCAL.FileExternal;
   package WimpTask     renames RASCAL.WimpTask;    
   package FileInternal renames RASCAL.FileInternal;
   package FileName     renames RASCAL.FileName;

   --

   procedure Handle (The : in TEL_SaveAs_SaveToFile) is

      Object : Object_ID := Get_Self_Id(Main_Task);
      Name   : String    := To_Ada(The.Event.all.Filename);

   begin

      Hide_Object(Object);
      
      if Exists(Name) then
         Report_Error("EXISTS","");
      else
         Create_Directory(Name);
         if Exists(S(source) & ".!Boot") then
            Create_File(Name & ".!Boot",0,16#feb#);

            declare
               t : FileHandle_Type(new UString'(U(Name & ".!Boot")),Write);
            begin
               Put_String(t,"Filer_Run " & S(source) & ".!Boot");
            end;
         end if;

         if Exists(S(source) & ".!Run") then
            Create_File(Name & ".!Run",0,16#feb#);

            declare
               t : FileHandle_Type(new UString'(U(Name & ".!Run")),Write);
            begin
               Put_String(t,"Filer_Run " & S(source) & ".!Run");
            end;
         end if;

         if Exists(S(source) & ".!Help") then
            Create_File(Name & ".!Help",0,16#feb#);

            declare
               t : FileHandle_Type(new UString'(U(Name & ".!Help")),Write);
            begin
               Put_String(t,"Filer_Run " & S(source) & ".!Help");
            end;
         end if;

         if Exists(S(source) & ".!Configure") then
            Create_File(Name & ".!Configure",0,16#feb#);

            declare
               t : FileHandle_Type(new UString'(U(Name & ".!Configure")),Write);
            begin
               Put_String(t,"Filer_Run " & S(source) & ".!Configure");
            end;
         end if;
      end if;
   end Handle;

   --

end Controller_SaveAs;
