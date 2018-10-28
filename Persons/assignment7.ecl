Persons_Layout := RECORD
    INTEGER4 RECID;
    STRING15 FirstName;
    STRING25 LastName;
    STRING15 MiddleName;
    STRING2 NameSuffix;
    STRING8 FileDate;
    UNSIGNED2 BureauCode;
    STRING1 MaritalStatus;
    STRING1 Gender;
    UNSIGNED1 DependentCount;
    STRING8 BirthDate;
    STRING42 StreetAddress;
    STRING20 City;
    STRING2 State;
    STRING5 ZipCode;
END;

Persons := DATASET(
    '~online::sl::intro::persons',
    Persons_Layout,
    THOR
);

// Remove Duplicates
SortedPersons := SORT(Persons, LastName, FirstName);
RmDuplicate := DEDUP(SortedPersons, LastName, FirstName);
// OUTPUT(SortedPersons);
// OUTPUT(RmDuplicate);

// Remove Records with no birth dates
EXPORT assignment7 := RmDuplicate(BirthDate != ''):PERSIST('CLASS::SL::PERSIST::PREPROCESSED');
// OUTPUT(RmBirthDateless);

// Output all male persons who live in us states beginning with 'M' and who were born after 1979
// Selection := RmBirthDateless(Gender = 'M', State >= 'M', State < 'N', BirthDate > '1979');
// OUTPUT(Selection);

// Ratio of males before 1980 who lives in a state startnig with M
// AllBefore1980 := RmBirthDateless(Gender = 'M', BirthDate < '1980');
// StartWithM := AllBefore1980(State >= 'M', State < 'N');
// OUTPUT(COUNT(StartWithM)/COUNT(AllBefore1980));