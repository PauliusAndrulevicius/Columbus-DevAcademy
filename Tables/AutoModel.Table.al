table 50132 "Auto Model"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Model';
    LookupPageId = "Auto Model List";
    DrillDownPageId = "Auto Model List";

    fields
    {
        field(1; "Make Code"; Code[10])
        {
            Caption = 'Make Code';
            TableRelation = "Auto Make";
        }
        field(2; Code; Code[10])
        {
            Caption = 'Code';
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }

    }

    keys
    {
        key(Key1; "Make Code", Code)
        {
            Clustered = true;
        }
    }
}