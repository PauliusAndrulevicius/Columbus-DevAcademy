table 50131 "Auto Make"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Make';
    LookupPageId = "Auto Make List";
    DrillDownPageId = "Auto Make List";

    fields
    {
        field(1; Code; Code[10])
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
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        AutoModel: Record "Auto Model";
    begin
        AutoModel.SetRange("Make Code",Code);
        AutoModel.DeleteAll();
    end;
}