table 50134 "Auto Reservation"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Reservation';

    fields
    {
        field(1; "Auto No."; Code[20])
        {
            Caption = 'Auto No.';
            TableRelation = Auto;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(10; "Client No."; Code[20])
        {
            Caption = 'Client No.';
            TableRelation = Customer;
        }
        field(20; "Reserved From"; DateTime)
        {
            Caption = 'Reserved From';
        }
        field(30; "Reserved To"; DateTime)
        {
            Caption = 'Reserved To';
        }
    }

    keys
    {
        key(Key1; "Auto No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        AutoReservation: Record "Auto Reservation";
    begin
        CheckMandatoryFields();
        AutoReservation.SetRange("Auto No.", "Auto No.");
        if AutoReservation.FindLast() then;
        "Line No." := AutoReservation."Line No." + 1;
        CheckIfReservationExist();
    end;

    trigger OnModify()
    begin
        CheckMandatoryFields();
        CheckIfReservationExist();
    end;
    local procedure CheckIfReservationExist()
    var
        AutoReservation: Record "Auto Reservation";
        CarRentedErr: Label 'Car already rented';
    begin
        AutoReservation.SetRange("Auto No.", "Auto No.");
        AutoReservation.SetRange("Reserved From", "Reserved From", "Reserved To");
        if not AutoReservation.IsEmpty then
            Error(CarRentedErr);
        AutoReservation.SetRange("Reserved To", "Reserved From", "Reserved To");
        if not AutoReservation.IsEmpty then
            Error(CarRentedErr);
    end;
    local procedure CheckMandatoryFields()
    begin
        TestField("Client No.");
        TestField("Reserved From");
        TestField("Reserved To");
    end;
}