parent_table={{160, "t"}, {118, "e"}, {18, "t"}, {113, "f"}, {120, "g"}, {100, "t"}, {216, "s"}, {236, "l"}, {261, "a"}, {180, "v"}, {185, "r"}, {277, "e"}, {191, "i"}, {190, "v"}, {241, "r"}, {92, "v"}, {158, "l"}, {82, "v"}, {45, "a"}, {204, "g"}, {71, "y"}, {150, "v"}, {188, "e"}, {199, "n"}, {75, "v"}, {175, "g"}, {247, "t"}, {70, "p"}, {12, "g"}, {240, "a"}, {183, "d"}, {197, "v"}, {16, "s"}, {232, "i"}, {258, "a"}, {253, "m"}, {146, "v"}, {147, "t"}, {31, "r"}, {14, "d"}, {72, "k"}, {238, "k"}, {170, "i"}, {41, "l"}, {44, "r"}, {95, "v"}, {107, "n"}, {115, "r"}, {257, "q"}, {102, "h"}, {244, "g"}, {148, "h"}, {217, "c"}, {128, "s"}, {91, "a"}, {1, "n"}, {223, "w"}, {225, "g"}, {78, "l"}, {62, "f"}, {152, "k"}, {251, "t"}, {8, "l"}, {161, "s"}, {52, "t"}, {130, "v"}, {214, "d"}, {4, "i"}, {68, "t"}, {101, "g"}, {274, "r"}, {125, "k"}, {151, "q"}, {105, "g"}, {243, "l"}, {35, "y"}, {3, "s"}, {37, "r"}, {108, "t"}, {252, "e"}, {116, "g"}, {270, "p"}, {226, "d"}, {159, "d"}, {173, "a"}, {196, "g"}, {200, "a"}, {63, "n"}, {46, "s"}, {189, "d"}, {207, "a"}, {246, "e"}, {255, "i"}, {209, "p"}, {163, "a"}, {201, "t"}, {2, "d"}, {171, "n"}, {57, "a"}, {167, "a"}, {231, "p"}, {103, "t"}, {69, "h"}, {264, "l"}, {267, "g"}, {65, "l"}, {239, "a"}, {33, "t"}, {28, "a"}, {181, "g"}, {90, "g"}, {230, "m"}, {144, "a"}, {210, "g"}, {248, "l"}, {272, "v"}, {50, "l"}, {25, "e"}, {7, "g"}, {43, "s"}, {22, "h"}, {83, "s"}, {145, "l"}, {126, "l"}, {124, "a"}, {193, "a"}, {212, "a"}, {149, "g"}, {182, "v"}, {265, "f"}, {275, "m"}, {32, "a"}, {13, "l"}, {136, "g"}, {10, "g"}, {135, "g"}, {162, "r"}, {186, "g"}, {132, "v"}, {262, "f"}, {271, "d"}, {278, "t"}, {89, "l"}, {166, "l"}, {222, "h"}, {93, "n"}, {269, "e"}, {17, "r"}, {11, "q"}, {138, "g"}, {34, "v"}, {21, "m"}, {36, "r"}, {228, "v"}, {9, "i"}, {67, "i"}, {215, "v"}, {184, "a"}, {142, "a"}, {229, "y"}, {79, "l"}, {273, "s"}, {48, "q"}, {30, "g"}, {266, "t"}, {53, "l"}, {155, "v"}, {192, "a"}, {27, "l"}, {66, "n"}, {109, "d"}, {121, "l"}, {195, "d"}, {112, "g"}, {235, "e"}, {106, "h"}, {58, "l"}, {221, "d"}, {88, "q"}, {87, "t"}, {64, "g"}, {178, "a"}, {141, "v"}, {55, "d"}, {49, "d"}, {224, "v"}, {245, "c"}, {279, "f"}, {237, "l"}, {54, "l"}, {140, "a"}, {38, "i"}, {281, "s"}, {168, "d"}, {131, "q"}, {39, "d"}, {73, "q"}, {15, "l"}, {85, "q"}, {127, "d"}, {129, "v"}, {187, "i"}, {259, "v"}, {276, "r"}, {242, "a"}, {282, "l"}, {164, "q"}, {254, "h"}, {114, "g"}, {220, "k"}, {260, "d"}, {80, "d"}, {84, "e"}, {98, "d"}, {249, "d"}, {139, "n"}, {205, "m"}, {137, "v"}, {61, "g"}, {94, "t"}, {40, "t"}, {133, "g"}, {157, "d"}, {134, "a"}, {122, "p"}, {74, "a"}, {97, "i"}, {29, "q"}, {179, "v"}, {5, "l"}, {202, "p"}, {123, "n"}, {56, "a"}, {117, "m"}, {6, "l"}, {153, "l"}, {206, "p"}, {211, "t"}, {81, "e"}, {233, "e"}, {23, "e"}, {280, "l"}, {256, "h"}, {51, "k"}, {26, "g"}, {60, "l"}, {208, "h"}, {143, "y"}, {156, "a"}, {172, "n"}, {268, "l"}, {110, "v"}, {104, "t"}, {111, "s"}, {213, "f"}, {59, "y"}, {198, "v"}, {99, "a"}, {219, "t"}, {96, "v"}, {177, "e"}, {42, "g"}, {227, "v"}, {174, "v"}, {250, "g"}, {77, "p"}, {176, "r"}, {24, "a"}, {194, "a"}, {165, "a"}, {234, "t"}, {169, "v"}, {263, "r"}, {154, "q"}, {76, "l"}, {20, "a"}, {203, "m"}, {119, "e"}, {86, "a"}, {47, "g"}, {19, "p"}, {218, "l"}}

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

