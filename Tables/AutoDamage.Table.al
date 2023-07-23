table 50135 "Auto Damage"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Damage';

    fields
    {
        field(1; "Auto No."; Code[20])
        {
            Caption = 'Auto No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(10; Date; Date)
        {
            Caption = 'Date';
        }
        field(20; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(30; Status; Enum "Auto Damage Status")
        {
            Caption = 'Status';
        }

    }

    keys
    {
        key(Key1; "Auto No.", "Line No.", "Document No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        AutoDamage: Record "Auto Damage";
    begin

        AutoDamage.SetRange("Auto No.", "Auto No.");
        AutoDamage.SetRange("Document No.", "Document No.");
        if AutoDamage.FindLast() then;
        "Line No." := AutoDamage."Line No." + 1;

    end;
}