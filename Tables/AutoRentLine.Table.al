table 50137 "Auto Rent Line"
{
    DataClassification = CustomerContent;
    Caption = ' Auto Rent Line';

    fields
    {
        field(1; "Document No."; code[20])
        {
            Caption = 'Document No';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(10; Type; Enum "Auto Rent Line Type")
        {
            Caption = 'Type';
        }
        field(20; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation =
                if (Type = const(Item)) Item
            else
            if (Type = const(Resource)) Resource;

            trigger OnValidate()
            var
                Item: Record Item;
                Resource: Record Resource;
            begin
                case Type of
                    Type::Item:
                        begin
                            Item.Get("No.");
                            Description := Item.Description;
                            Validate(Price, Item."Unit Price");
                        end;
                    Type::Resource:
                        begin
                            Resource.Get("No.");
                            Description := Resource.Name;
                            Validate(Price, Resource."Unit Price");
                        end;
                end;
            end;
        }
        field(30; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(40; Quantity; Integer)
        {
            Caption = 'Quantity';

            trigger OnValidate()
            begin
                Amount := Quantity * Price;
            end;

        }
        field(50; Price; Decimal)
        {
            Caption = 'Price';

            trigger OnValidate()
            begin
                Amount := Quantity * Price;
            end;
        }
        field(60; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        PreventDelete: Label 'Cannot delete';
    begin
        if "Line No." = 0 then
            Error(PreventDelete);
    end;
}