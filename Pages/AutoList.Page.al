page 50133 "Auto List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto";
    Caption = 'Autos';
    Editable = false;
    CardPageID = "Auto Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Make; Rec.Make)
                {
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Year Of Manufacture"; Rec."Year Of Manufacture")
                {
                    ToolTip = 'Specifies the value of the Year Of Manufacture field.';
                }
                field("Insurance Valid Until"; Rec."Insurance Valid Until")
                {
                    ToolTip = 'Specifies the value of the Insurance Valid Until field.';
                }
                field("MOT Valid Until"; Rec."MOT Valid Until")
                {
                    ToolTip = 'Specifies the value of the MOT Valid Until field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Rental Service"; Rec."Rental Service")
                {
                    ToolTip = 'Specifies the value of the Rental Service field.';
                }
                field("Rental Price"; Rec."Rental Price")
                {
                    ToolTip = 'Specifies the value of the Rental Price field.';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(ReservationList)
            {
                Caption = 'Reservations';
                RunObject = page "Auto Reservation List";
                RunPageLink = "Auto No." = field("No.");
            }
            action(ActiveReservationList)
            {
                Caption = 'Active Reservations';
                RunObject = page "Active Auto Reservation List";
                RunPageLink = "Auto No." = field("No.");
            }
            action(AutoDamageList)
            {
                Caption = 'Auto Damage';
                RunObject = page "Auto Damage List";
                RunPageLink = "Auto No." = field("No.");
            }
        }
    }
}