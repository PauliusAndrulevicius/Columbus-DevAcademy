page 50131 "Auto Make List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Make";
    Caption = 'Auto Makes';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Models)
            {
                Caption = 'Models';
                RunObject = page "Auto Model List";
                RunPageLink = "Make Code" = field(Code);
            }
        }
    }
}