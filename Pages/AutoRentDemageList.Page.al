page 50142 "Auto Rent Damage List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Auto Damage";
    Caption = 'Auto Rent Damages';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Date; Rec.Date)
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}