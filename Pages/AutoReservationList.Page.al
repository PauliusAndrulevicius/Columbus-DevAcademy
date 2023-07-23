page 50135 "Auto Reservation List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Auto Reservation";
    Caption = 'Auto Reservations';

    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Client No."; Rec."Client No.")
                {
                    ToolTip = 'Specifies the value of the Client No. field.';
                }
                field("Reserved From"; Rec."Reserved From")
                {
                    ToolTip = 'Specifies the value of the Reserved From field.';
                }
                field("Reserved To"; Rec."Reserved To")
                {
                    ToolTip = 'Specifies the value of the Reserved To field.';
                }
            }
        }
    }
}