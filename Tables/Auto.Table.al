table 50133 Auto
{
    DataClassification = CustomerContent;
    Caption = 'Auto';
    LookupPageId = "Auto List";
    DrillDownPageId = "Auto List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(10; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(20; Make; Code[10])
        {
            Caption = 'Make';
            TableRelation = "Auto Make";
        }
        field(30; Model; Code[10])
        {
            Caption = 'Model';
            TableRelation = "Auto Model".Code where("Make Code" = field(Make));
        }
        field(40; "Year Of Manufacture"; Integer)
        {
            Caption = 'Year Of Manufacture';
        }
        field(50; "Insurance Valid Until"; Date)
        {
            Caption = 'Insurance Valid Until';
        }
        field(60; "MOT Valid Until"; Date)
        {
            Caption = 'MOT Valid Until';
        }
        field(70; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(80; "Rental Service"; Code[20])
        {
            Caption = 'Rental Service';
            TableRelation = Resource;
        }
        field(90; "Rental Price"; Decimal)
        {
            Caption = 'Rental Price';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Resource."Unit Price" where("No." = field("Rental Service")));

        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            AutoSetup.Get();
            AutoSetup.TestField("Cars Nos.");
            "No." := NoSeriesManagement.GetNextNo(AutoSetup."Cars Nos.", WorkDate(), true);
        end;
    end;
}