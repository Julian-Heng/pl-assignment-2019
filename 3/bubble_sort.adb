with Ada.Text_IO;
with Ada.Command_Line;
with Ada.Strings;
with Ada.Strings.Fixed;

procedure Bubble_Sort is
    use Ada.Text_IO;
    use Ada.Command_Line;
    use Ada.Strings;
    use Ada.Strings.Fixed;

    Values  : array (0 .. Argument_Count - 1) of Integer;
    Swapped : Boolean;
    Temp    : Integer;
begin
    for I in Integer range 1 .. Argument_Count loop
        begin
            Values(I - 1) := Integer'Value(Argument(I));
        exception
            when CONSTRAINT_ERROR =>
                Put_Line("Invalid Arguments: Needs to all be Integers");
                Set_Exit_Status(1);
                return;
        end;
    end loop;

    loop
        Swapped := False;

        for I in Integer range 1 .. Values'Length - 1 loop
            if Values(I - 1) > Values(I) then
                Temp := Values(I);
                Values(I) := Values(I - 1);
                Values(I - 1) := Temp;
                Swapped := True;
            end if;
        end loop;

        exit when not Swapped;
    end loop;

    for I in Values'Range loop
        Put_Line(Trim(Values(I)'Image, Left));
    end loop;
end Bubble_Sort;
