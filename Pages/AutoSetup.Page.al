page 50130 "Auto Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Auto Setup";
    Caption = 'Auto Setup';
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Cars Nos."; Rec."Cars Nos.")
                {
                    ToolTip = 'Specifies the value of the Cars Nos. field.';
                }
                field("Rent Nos."; Rec."Rent Nos.")
                {
                    ToolTip = 'Specifies the value of the Rent Nos. field.';
                }
                field("Attachment Location"; Rec."Attachment Location")
                {
                    ToolTip = 'Specifies the value of the Attachment Location field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}