parent_table={{133, "g"}, {36, "r"}, {201, "t"}, {125, "k"}, {248, "l"}, {73, "q"}, {249, "d"}, {104, "t"}, {195, "d"}, {57, "a"}, {96, "v"}, {269, "e"}, {47, "g"}, {28, "a"}, {100, "t"}, {214, "d"}, {87, "t"}, {32, "a"}, {10, "g"}, {178, "a"}, {264, "l"}, {172, "n"}, {81, "e"}, {16, "s"}, {131, "q"}, {109, "d"}, {86, "a"}, {222, "h"}, {274, "r"}, {98, "d"}, {114, "g"}, {171, "n"}, {25, "e"}, {227, "v"}, {239, "a"}, {17, "r"}, {265, "f"}, {19, "p"}, {144, "a"}, {206, "p"}, {126, "l"}, {12, "g"}, {261, "a"}, {82, "v"}, {111, "s"}, {213, "f"}, {277, "e"}, {6, "l"}, {83, "s"}, {282, "l"}, {99, "a"}, {15, "l"}, {116, "g"}, {210, "g"}, {102, "h"}, {212, "a"}, {180, "v"}, {182, "v"}, {196, "g"}, {168, "d"}, {266, "t"}, {202, "p"}, {52, "t"}, {150, "v"}, {189, "d"}, {136, "g"}, {234, "t"}, {240, "a"}, {154, "q"}, {7, "g"}, {224, "v"}, {253, "m"}, {62, "f"}, {89, "l"}, {24, "a"}, {235, "e"}, {90, "g"}, {273, "s"}, {208, "h"}, {129, "v"}, {157, "d"}, {232, "i"}, {146, "v"}, {173, "a"}, {44, "r"}, {88, "q"}, {119, "e"}, {199, "n"}, {27, "l"}, {245, "c"}, {75, "v"}, {63, "n"}, {280, "l"}, {174, "v"}, {276, "r"}, {230, "m"}, {72, "k"}, {110, "v"}, {187, "i"}, {211, "t"}, {113, "f"}, {115, "r"}, {64, "g"}, {197, "v"}, {56, "a"}, {238, "k"}, {270, "p"}, {120, "g"}, {255, "i"}, {160, "t"}, {226, "d"}, {221, "d"}, {191, "i"}, {147, "t"}, {194, "a"}, {190, "v"}, {217, "c"}, {220, "k"}, {251, "t"}, {121, "l"}, {106, "h"}, {45, "a"}, {161, "s"}, {225, "g"}, {149, "g"}, {140, "a"}, {46, "s"}, {74, "a"}, {207, "a"}, {193, "a"}, {1, "n"}, {51, "k"}, {20, "a"}, {130, "v"}, {166, "l"}, {242, "a"}, {137, "v"}, {260, "d"}, {183, "d"}, {122, "p"}, {252, "e"}, {223, "w"}, {48, "q"}, {30, "g"}, {148, "h"}, {250, "g"}, {205, "m"}, {117, "m"}, {236, "l"}, {43, "s"}, {159, "d"}, {163, "a"}, {18, "t"}, {50, "l"}, {55, "d"}, {67, "i"}, {94, "t"}, {151, "q"}, {58, "l"}, {176, "r"}, {179, "v"}, {165, "a"}, {35, "y"}, {37, "r"}, {139, "n"}, {118, "e"}, {169, "v"}, {254, "a"}, {170, "i"}, {124, "a"}, {108, "t"}, {271, "d"}, {49, "d"}, {53, "l"}, {65, "l"}, {69, "h"}, {181, "g"}, {185, "r"}, {11, "q"}, {127, "d"}, {138, "g"}, {112, "g"}, {200, "a"}, {107, "n"}, {13, "l"}, {243, "l"}, {92, "v"}, {184, "a"}, {188, "e"}, {263, "r"}, {203, "m"}, {204, "g"}, {9, "i"}, {34, "v"}, {22, "h"}, {162, "r"}, {2, "d"}, {76, "l"}, {103, "t"}, {91, "a"}, {152, "k"}, {281, "s"}, {135, "g"}, {42, "g"}, {80, "d"}, {153, "l"}, {155, "v"}, {267, "g"}, {5, "l"}, {23, "e"}, {31, "r"}, {156, "a"}, {71, "y"}, {231, "p"}, {246, "e"}, {21, "m"}, {78, "l"}, {59, "y"}, {105, "g"}, {257, "q"}, {128, "s"}, {268, "l"}, {142, "a"}, {279, "f"}, {219, "t"}, {8, "l"}, {192, "a"}, {95, "v"}, {134, "a"}, {132, "v"}, {237, "l"}, {272, "v"}, {262, "f"}, {186, "g"}, {61, "g"}, {143, "y"}, {229, "h"}, {233, "e"}, {39, "d"}, {70, "p"}, {158, "l"}, {29, "q"}, {26, "g"}, {60, "l"}, {40, "t"}, {275, "m"}, {145, "l"}, {228, "v"}, {41, "l"}, {84, "e"}, {278, "t"}, {258, "a"}, {33, "t"}, {14, "d"}, {164, "q"}, {198, "v"}, {215, "v"}, {241, "r"}, {123, "n"}, {167, "a"}, {209, "p"}, {79, "l"}, {3, "s"}, {141, "v"}, {218, "l"}, {68, "t"}, {247, "t"}, {259, "v"}, {4, "i"}, {216, "s"}, {101, "g"}, {85, "q"}, {175, "g"}, {77, "p"}, {177, "e"}, {38, "i"}, {244, "g"}, {256, "h"}, {54, "l"}, {97, "i"}, {93, "n"}, {66, "n"}}

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

