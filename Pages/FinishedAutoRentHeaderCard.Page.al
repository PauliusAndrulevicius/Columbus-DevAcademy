page 50144 "Finished Auto Rent Header Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Finished Auto Rent Header";
    Caption = 'Finished Auto Rent';
    Editable = false;
    
  layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = Rec.State = Rec.State::Open;

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
                field(State; Rec.State)
                {
                    ToolTip = 'Specifies the value of the State field.';
                }
            }
            part(Line; "Finished Auto Rent Line List")
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
                Editable = Rec.State = Rec.State::Open;
            }
        }
    }
   
}