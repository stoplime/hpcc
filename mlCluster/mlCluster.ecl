IMPORT * FROM ML;

IMPORT * FROM ML.Cluster;

IMPORT * FROM ML.Types;

x2 := DATASET(
    [
        {1, 1, 1}, {1, 2, 5},
        {2, 1, 5}, {2, 2, 7},
        {3, 1, 8}, {3, 2, 1}
        
    ], NumericField
);

c := DATASET(
    [
        {1, 1, 1}, {1, 2, 5},
        {2, 1, 5}, {2, 2, 7},
        {3, 1, 9}, {3, 2, 4}
        
    ], NumericField
);

x3 := Kmeans(x2, c);

OUTPUT(x3);