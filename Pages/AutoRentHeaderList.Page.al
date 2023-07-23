page 50138 "Auto Rent Header List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Rent Header";
    Caption = 'Auto Rents';
    Editable = false;
    CardPageId = "Auto Rent Header Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Client No."; Rec."Client No.")
                {
                    ToolTip = 'Specifies the value of the Client No. field.';
                }

                field(Date; Rec.Date)
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Auto No."; Rec."Auto No.")
                {
                    ToolTip = 'Specifies the value of the Auto No. field.';
                }
                field("Reserved From"; Rec."Reserved From")
                {
                    ToolTip = 'Specifies the value of the Reserved From field.';
                }
                field("Reserved To"; Rec."Reserved To")
                {
                    ToolTip = 'Specifies the value of the Reserved To field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
}