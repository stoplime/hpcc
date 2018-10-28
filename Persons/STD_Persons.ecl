IMPORT $, Std;

EXPORT STD_Persons := MODULE
    EXPORT Layout := RECORD
        $.UID_PersonsAlt.UID;
        $.UID_PersonsAlt.RecID;
        STRING15 FirstName  := Std.Str.ToUpperCase($.UID_PersonsAlt.FirstName);
        STRING25 LastName   := Std.Str.ToUpperCase($.UID_PersonsAlt.LastName);
        STRING1 MiddleName  := Std.Str.ToUpperCase($.UID_PersonsAlt.MiddleName);
        STRING2 NameSuffix  := Std.Str.ToUpperCase($.UID_PersonsAlt.NameSuffix);
        UNSIGNED4 FileDate  := (UNSIGNED4)$.UID_PersonsAlt.FileDate;
        $.UID_PersonsAlt.BureauCode;
        $.UID_PersonsAlt.MaritalStatus;
        $.UID_PersonsAlt.Gender;
        $.UID_PersonsAlt.DependentCount;
        UNSIGNED4 BirthDate := (UNSIGNED4)$.UID_PersonsAlt.BirthDate;
        $.UID_PersonsAlt.StreetAddress;
        $.UID_PersonsAlt.City;
        $.UID_PersonsAlt.State;
        UNSIGNED3 ZipCode := (UNSIGNED3)$.UID_PersonsAlt.ZipCode;
    END;
    EXPORT File := TABLE($.UID_PersonsAlt, Layout): PERSIST('~CLASS::SL::PERSIST::STD_Persons');
END;
