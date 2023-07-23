table 50138 "Finished Auto Rent Header"
{
    DataClassification = CustomerContent;
    Caption =  'Finished Auto Rent';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No';
            Editable = false;
        }
        field(10; "Client No."; Code[20])
        {
            Caption = 'Client No.';
            TableRelation = Customer;
            Editable = false;
        }
        field(20; "Driver License"; Media)
        {
            Caption = 'Driver License';
            Editable = false;
        }
        field(30; Date; Date)
        {
            Caption = 'Date';
            Editable = false;
        }
        field(40; "Auto No."; Code[20])
        {
            Caption = 'Auto No.';
            TableRelation = Auto;
            Editable = false;
        }
        field(50; "Reserved From"; DateTime)
        {
            Caption = 'Reserved From';
            Editable = false;
        }
        field(60; "Reserved To"; DateTime)
        {
            Caption = 'Reserved To';
            Editable = false;
        }
        field(70; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Finished Auto Rent Line".Amount where("Document No." = field("No.")));

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

}