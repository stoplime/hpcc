Import $, Std;

Layout_Persons_UID := RECORD
    UNSIGNED4 UID := 0;
    File PersonsFile;
END;

PersonsTbl := TABLE($.File_persons.File, Layout_Persons_UID);

Layout_Persons_UID IDRecs(Layout_Persons_UID L,
                          Layout_Persons_UID R} := TRANSFORM
    SELF.UID := IF(L.UID=0, Std.system.thorlib.node()+1, L.UID+CLUSTERSIZE);
    SELF := R;
END;
