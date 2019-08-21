with Ada.Text_IO;
with Ada.Command_Line;
with Ada.Strings;
with Ada.Strings.Fixed;

procedure Bubble_Sort is
    use Ada.Text_IO;
    use Ada.Command_Line;
    use Ada.Strings;
    use Ada.Strings.Fixed;

    type Integer_Array is array (0 .. Argument_Count - 1) of Integer;

    procedure Read_Command_Line_To_Integer_Array(Arr: out Integer_Array) is
    begin
        for I in Integer range 1 .. Argument_Count loop
            begin
                Arr(I - 1) := Integer'Value(Argument(I));
            exception
                when CONSTRAINT_ERROR =>
                    Put_Line("Invalid Arguments: Needs to all be Integers");
                    Set_Exit_Status(1);
                    return;
            end;
        end loop;
    end Read_Command_Line_To_Integer_Array;


    procedure Swap_Elements(
        I, J : Integer;
        Arr  : out Integer_Array)
    is
        Temp : Integer;
    begin
        Temp := Arr(I);
        Arr(I) := Arr(J);
        Arr(J) := Temp;
    end Swap_Elements;


    procedure Sort(Arr: out Integer_Array) is
        Swapped : Boolean;
    begin
        loop
            Swapped := False;
            for I in Integer range 1 .. Arr'Length - 1 loop
                if Arr(I - 1) > Arr(I) then
                    Swap_Elements(I, I - 1, Arr);
                    Swapped := True;
                end if;
            end loop;
            exit when not Swapped;
        end loop;
    end Sort;


    procedure Print_Integer_Array(Arr: in Integer_Array) is
    begin
        for I in Arr'Range loop
            Put_Line(Trim(Arr(I)'Image, Left));
        end loop;
    end Print_Integer_Array;


    procedure Main is
        Arr  : Integer_Array;
    begin
        Read_Command_Line_To_Integer_Array(Arr);
        Sort(Arr);
        Print_Integer_Array(Arr);
    end Main;


begin
    Main;
end Bubble_Sort;
