parent_table={{84, "e"}, {224, "v"}, {170, "i"}, {234, "t"}, {69, "h"}, {267, "g"}, {177, "e"}, {52, "t"}, {109, "d"}, {245, "c"}, {271, "d"}, {16, "s"}, {268, "l"}, {73, "q"}, {240, "a"}, {133, "g"}, {119, "e"}, {269, "e"}, {280, "l"}, {50, "l"}, {11, "q"}, {2, "d"}, {57, "a"}, {102, "h"}, {161, "s"}, {157, "d"}, {121, "l"}, {199, "n"}, {252, "e"}, {266, "t"}, {44, "r"}, {95, "v"}, {140, "a"}, {227, "v"}, {48, "q"}, {260, "d"}, {146, "v"}, {87, "t"}, {178, "a"}, {20, "a"}, {72, "k"}, {27, "l"}, {150, "v"}, {76, "l"}, {154, "q"}, {183, "d"}, {246, "e"}, {38, "i"}, {190, "v"}, {217, "c"}, {239, "a"}, {249, "d"}, {241, "r"}, {208, "h"}, {250, "g"}, {4, "i"}, {78, "l"}, {83, "s"}, {104, "t"}, {165, "a"}, {116, "g"}, {184, "a"}, {258, "a"}, {212, "a"}, {12, "g"}, {111, "s"}, {10, "g"}, {101, "g"}, {45, "a"}, {117, "m"}, {138, "g"}, {216, "s"}, {103, "t"}, {28, "a"}, {56, "a"}, {54, "l"}, {205, "m"}, {153, "l"}, {231, "p"}, {167, "a"}, {147, "t"}, {40, "t"}, {21, "m"}, {59, "y"}, {63, "n"}, {126, "l"}, {191, "i"}, {55, "d"}, {62, "f"}, {214, "d"}, {100, "t"}, {263, "r"}, {97, "i"}, {49, "d"}, {192, "a"}, {218, "l"}, {264, "l"}, {127, "d"}, {142, "a"}, {19, "p"}, {23, "e"}, {145, "l"}, {114, "g"}, {168, "d"}, {58, "l"}, {108, "t"}, {77, "p"}, {213, "f"}, {60, "l"}, {229, "y"}, {143, "y"}, {222, "h"}, {203, "m"}, {90, "g"}, {65, "l"}, {98, "d"}, {185, "r"}, {41, "l"}, {94, "t"}, {188, "e"}, {254, "h"}, {35, "y"}, {46, "s"}, {71, "y"}, {233, "e"}, {42, "g"}, {201, "t"}, {211, "t"}, {51, "k"}, {43, "s"}, {122, "p"}, {152, "k"}, {204, "g"}, {236, "l"}, {220, "k"}, {120, "g"}, {156, "a"}, {279, "f"}, {175, "g"}, {106, "h"}, {158, "l"}, {262, "f"}, {144, "a"}, {278, "t"}, {3, "s"}, {92, "v"}, {186, "g"}, {26, "g"}, {259, "v"}, {96, "v"}, {113, "f"}, {182, "v"}, {181, "g"}, {118, "e"}, {277, "e"}, {265, "f"}, {88, "q"}, {17, "r"}, {223, "w"}, {9, "i"}, {232, "i"}, {1, "n"}, {115, "r"}, {31, "r"}, {163, "a"}, {244, "g"}, {47, "g"}, {206, "p"}, {86, "a"}, {282, "l"}, {255, "i"}, {172, "n"}, {276, "r"}, {235, "e"}, {193, "a"}, {130, "v"}, {132, "v"}, {275, "m"}, {123, "n"}, {124, "a"}, {159, "d"}, {225, "g"}, {242, "a"}, {272, "v"}, {137, "v"}, {79, "l"}, {141, "v"}, {228, "v"}, {207, "a"}, {135, "g"}, {200, "a"}, {66, "n"}, {210, "g"}, {134, "a"}, {160, "t"}, {169, "v"}, {198, "v"}, {202, "p"}, {196, "g"}, {251, "t"}, {194, "a"}, {61, "g"}, {149, "g"}, {247, "t"}, {36, "r"}, {173, "a"}, {195, "d"}, {107, "n"}, {33, "t"}, {39, "d"}, {221, "d"}, {261, "a"}, {110, "v"}, {22, "h"}, {176, "r"}, {230, "m"}, {187, "i"}, {257, "q"}, {15, "l"}, {82, "v"}, {68, "t"}, {34, "v"}, {70, "p"}, {166, "l"}, {215, "v"}, {6, "l"}, {80, "d"}, {139, "n"}, {32, "a"}, {180, "v"}, {105, "g"}, {91, "a"}, {129, "v"}, {243, "l"}, {248, "l"}, {29, "q"}, {197, "v"}, {179, "v"}, {219, "t"}, {209, "p"}, {125, "k"}, {226, "d"}, {151, "q"}, {270, "p"}, {99, "a"}, {14, "d"}, {171, "n"}, {18, "t"}, {30, "g"}, {37, "r"}, {13, "l"}, {128, "s"}, {74, "a"}, {7, "g"}, {24, "a"}, {131, "q"}, {53, "l"}, {89, "l"}, {112, "g"}, {136, "g"}, {237, "l"}, {64, "g"}, {281, "s"}, {75, "v"}, {81, "e"}, {174, "v"}, {164, "q"}, {25, "e"}, {85, "q"}, {189, "d"}, {162, "r"}, {273, "s"}, {8, "l"}, {93, "n"}, {253, "m"}, {67, "i"}, {256, "h"}, {274, "r"}, {148, "h"}, {155, "v"}, {238, "k"}, {5, "l"}}


count = 0
for throwaway, pair in pairs(parent_table) do
  print("Looking at position", pair[1])
  print("Wild type has", pair[2])
  print("Current pose has", cur) 

  cur = structure.GetAminoAcid(pair[1]) 
  if cur == pair[2] then
    -- lua comment
  else
    print("Mutating ", pair[2], "to", cur, "at", pair[1])
    structure.SetAminoAcid(pair[1], pair[2])
    count = count + 1 
  end
end
print("Displaying native residues as", count, "mutations to this design")

