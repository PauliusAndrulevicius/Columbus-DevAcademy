table 50136 "Auto Rent Header"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Rent Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No';
        }
        field(10; "Client No."; Code[20])
        {
            Caption = 'Client No.';
            TableRelation = Customer;
        }
        field(20; "Driver License"; Media)
        {
            Caption = 'Driver License';
        }
        field(30; Date; Date)
        {
            Caption = 'Date';
        }
        field(40; "Auto No."; Code[20])
        {
            Caption = 'Auto No.';
            TableRelation = Auto;

            trigger OnValidate()
            var
                AutoRentLine: Record "Auto Rent Line";
                Auto: Record Auto;
            begin
                if "Auto No." = '' then
                    exit;
                if AutoRentLine.Get("No.", 0) then
                    AutoRentLine.Delete();

                Auto.Get("Auto No.");
                AutoRentLine."Document No." := "No.";
                AutoRentLine.Type := AutoRentLine.Type::Resource;
                AutoRentLine."No." := Auto."Rental Service";
                AutoRentLine.Insert();
            end;
        }
        field(50; "Reserved From"; DateTime)
        {
            Caption = 'Reserved From';
            trigger OnValidate()
            begin
                CheckReservationDate();
            end;
        }
        field(60; "Reserved To"; DateTime)
        {
            Caption = 'Reserved To';
            trigger OnValidate()
            begin
                CheckReservationDate();
            end;
        }
        field(70; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Auto Rent Line".Amount where("Document No." = field("No.")));
        }
        field(80; State; enum "Auto Rent Header State")
        {
            Caption = 'State';
            Editable = false;
        }
    }
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            AutoSetup.Get();
            AutoSetup.TestField("Rent Nos.");
            "No." := NoSeriesManagement.GetNextNo(AutoSetup."Rent Nos.", WorkDate(), true);
        end;
    end;

    procedure ReturnCar()
    var
        AutoRentLine: Record "Auto Rent Line";
        FinishedAutoRentHeader: Record "Finished Auto Rent Header";
        FinishedAutoRentLine: Record "Finished Auto Rent Line";
        ConfirmReturn: Label 'Do you really want to return the car?';
    begin
        if not Confirm(ConfirmReturn) then
            exit;
        FinishedAutoRentHeader.TransferFields(Rec);
        FinishedAutoRentHeader.Insert(true);
        AutoRentLine.SetRange("Document No.", "No.");
        if AutoRentLine.FindSet() then
            repeat
                FinishedAutoRentLine.TransferFields(AutoRentLine);
                FinishedAutoRentLine.Insert(true);
            until AutoRentLine.Next() = 0;
        AutoRentLine.DeleteAll();
        Delete(true);
    end;

    local procedure CheckReservationDate()
    var
        AutoReservation: Record "Auto Reservation";
        Message: Label 'There is no reservation for that date';
    begin
        if ("Reserved From" <> 0DT) and ("Reserved To" <> 0DT) then begin
            AutoReservation.SetRange("Auto No.", "Auto No.");
            AutoReservation.SetRange("Reserved From", "Reserved From");
            AutoReservation.SetRange("Reserved To", "Reserved To");
            AutoReservation.SetRange("Client No.", "Client No.");
            if AutoReservation.IsEmpty() then
                Error(Message);
        end;

    end;

    trigger OnDelete()
    var
        AutoRentLine: Record "Auto Rent Line";
    begin
        AutoRentLine.SetRange("Document No.", "No.");
        AutoRentLine.DeleteAll();
    end;
}