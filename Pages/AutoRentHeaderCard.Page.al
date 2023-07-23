page 50139 "Auto Rent Header Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Auto Rent Header";
    Caption = 'Auto Rent';


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
            part(Line; "Auto Rent SubPage")
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
                Editable = Rec.State = Rec.State::Open;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ChangeStatusIssue)
            {
                Caption = 'Issue';
                trigger OnAction()
                begin
                    Rec.State := Rec.State::Issued;
                end;
            }
            action(ChangeStatusOpen)
            {
                Caption = 'Open';
                trigger OnAction()
                begin
                    Rec.State := Rec.State::Open;
                end;
            }
            action(ReturnCar)
            {
                Caption = 'Return car';
                trigger OnAction()
                begin
                    Rec.ReturnCar();
                end;

            }
        }
        area(Navigation)
        {
            action(Damage)
            {
                Caption = 'Damages';
                RunObject = page "Auto Damage List";
                RunPageLink = "Document No." = field("No."), "Auto No." = field("Auto No.");
            }
        }
    }


}