table 50139 "Finished Auto Rent Line"
{
    DataClassification = CustomerContent;
    Caption = 'Finished Auto Rent Line';

    fields
    {
        field(1; "Document No."; code[20])
        {
            Caption = 'Document No';
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(10; Type; Enum "Auto Rent Line Type")
        {
            Caption = 'Type';
            Editable = false;
        }
        field(20; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
            TableRelation = if (Type = const(Item)) Item
            else
            if (Type = const(Resource)) Resource;
        }
        field(30; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(40; Quantity; Integer)
        {
            Caption = 'Quantity';
            Editable = false;
        }
        field(50; Price; Decimal)
        {
            Caption = 'Price';
            Editable = false;
        }
        field(60; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}