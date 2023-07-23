table 50130 "Auto Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(10; "Cars Nos."; Code[20])
        {
            Caption = 'Cars Nos.';
            TableRelation = "No. Series";
        }
        field(20; "Rent Nos."; Code[20])
        {
            Caption = 'Rent Nos.';
            TableRelation = "No. Series";
        }
        field(30; "Attachment Location"; Code[10])
        {
            Caption = 'Attachment Location';
            TableRelation = Location;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}