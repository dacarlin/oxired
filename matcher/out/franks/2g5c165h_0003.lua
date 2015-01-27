parent_table={{146, "k"}, {172, "p"}, {249, "k"}, {24, "f"}, {257, "l"}, {202, "t"}, {19, "l"}, {169, "y"}, {94, "q"}, {77, "i"}, {262, "a"}, {15, "f"}, {261, "e"}, {52, "t"}, {180, "g"}, {113, "f"}, {259, "v"}, {35, "p"}, {137, "g"}, {74, "f"}, {37, "s"}, {105, "l"}, {104, "d"}, {117, "h"}, {162, "d"}, {45, "g"}, {103, "y"}, {195, "d"}, {57, "v"}, {108, "i"}, {210, "y"}, {231, "d"}, {185, "l"}, {40, "k"}, {62, "p"}, {196, "t"}, {1, "q"}, {227, "i"}, {127, "v"}, {90, "t"}, {206, "d"}, {251, "l"}, {224, "s"}, {246, "g"}, {164, "g"}, {28, "i"}, {50, "g"}, {126, "g"}, {159, "v"}, {234, "l"}, {138, "k"}, {109, "l"}, {23, "g"}, {73, "t"}, {9, "g"}, {135, "h"}, {39, "s"}, {2, "n"}, {233, "f"}, {44, "l"}, {21, "r"}, {131, "l"}, {142, "l"}, {178, "v"}, {226, "p"}, {91, "v"}, {183, "s"}, {96, "s"}, {239, "n"}, {110, "g"}, {64, "f"}, {247, "f"}, {95, "g"}, {211, "p"}, {67, "l"}, {139, "k"}, {118, "p"}, {99, "g"}, {92, "t"}, {49, "e"}, {121, "g"}, {187, "h"}, {13, "g"}, {59, "d"}, {190, "a"}, {88, "d"}, {60, "f"}, {158, "r"}, {124, "k"}, {3, "v"}, {149, "d"}, {157, "k"}, {102, "v"}, {145, "t"}, {269, "y"}, {217, "d"}, {272, "e"}, {34, "n"}, {175, "h"}, {275, "i"}, {265, "e"}, {165, "g"}, {270, "l"}, {54, "i"}, {120, "a"}, {167, "v"}, {232, "i"}, {41, "a"}, {132, "d"}, {256, "e"}, {31, "y"}, {140, "v"}, {161, "e"}, {55, "a"}, {199, "h"}, {222, "a"}, {85, "l"}, {86, "s"}, {153, "l"}, {25, "k"}, {264, "e"}, {107, "n"}, {89, "a"}, {213, "g"}, {216, "k"}, {229, "w"}, {114, "v"}, {5, "i"}, {134, "l"}, {81, "l"}, {253, "h"}, {201, "s"}, {174, "l"}, {198, "i"}, {204, "e"}, {72, "r"}, {156, "v"}, {184, "h"}, {279, "e"}, {98, "k"}, {252, "n"}, {209, "k"}, {160, "w"}, {76, "e"}, {166, "v"}, {254, "l"}, {12, "g"}, {188, "a"}, {186, "p"}, {238, "e"}, {38, "i"}, {130, "s"}, {122, "t"}, {214, "g"}, {237, "k"}, {36, "e"}, {22, "s"}, {115, "g"}, {84, "i"}, {20, "r"}, {29, "y"}, {182, "v"}, {75, "r"}, {80, "k"}, {125, "s"}, {242, "k"}, {129, "y"}, {273, "v"}, {58, "e"}, {87, "e"}, {78, "a"}, {14, "s"}, {128, "e"}, {223, "k"}, {112, "r"}, {32, "d"}, {68, "s"}, {6, "v"}, {70, "p"}, {268, "e"}, {173, "e"}, {280, "i"}, {207, "l"}, {65, "v"}, {147, "k"}, {150, "k"}, {141, "i"}, {205, "v"}, {123, "e"}, {93, "d"}, {192, "a"}, {119, "i"}, {16, "a"}, {17, "k"}, {163, "v"}, {148, "t"}, {10, "f"}, {116, "g"}, {82, "s"}, {33, "i"}, {144, "p"}, {106, "e"}, {255, "k"}, {277, "r"}, {56, "k"}, {133, "n"}, {48, "d"}, {111, "k"}, {193, "l"}, {171, "s"}, {8, "v"}, {243, "a"}, {51, "t"}, {71, "v"}, {215, "f"}, {266, "l"}, {42, "v"}, {248, "e"}, {179, "f"}, {240, "v"}, {154, "k"}, {245, "e"}, {260, "r"}, {274, "k"}, {203, "p"}, {4, "l"}, {30, "g"}, {100, "k"}, {191, "f"}, {18, "s"}, {177, "y"}, {181, "v"}, {225, "d"}, {258, "i"}, {194, "v"}, {176, "d"}, {7, "g"}, {197, "l"}, {47, "i"}, {43, "d"}, {152, "r"}, {53, "s"}, {136, "e"}, {212, "g"}, {155, "l"}, {276, "k"}, {189, "v"}, {208, "f"}, {250, "s"}, {267, "v"}, {46, "i"}, {83, "y"}, {63, "d"}, {97, "v"}, {235, "e"}, {263, "e"}, {271, "k"}, {26, "g"}, {230, "r"}, {218, "f"}, {236, "n"}, {69, "s"}, {151, "k"}, {79, "k"}, {143, "t"}, {101, "l"}, {244, "i"}, {61, "s"}, {27, "k"}, {168, "e"}}

count = 0
for throwaway, pair in pairs(parent_table) do
cur = structure.GetAminoAcid(pair[1]) 
  if cur == pair[2] then
    --
  else
    print("Looking at position", pair[1])
    print("Wild type has", pair[2])
    print("Current pose has", cur) 
    print("Mutation: ", pair[2], "to", cur, "at", pair[1])
    structure.SetAminoAcid(pair[1], pair[2])
    count = count + 1 
  end
end
print("Displaying native residues as", count, "mutations to this design")

