parent_table={{118, "a"}, {255, "n"}, {1, "m"}, {186, "l"}, {149, "l"}, {135, "v"}, {164, "t"}, {95, "t"}, {85, "a"}, {105, "w"}, {8, "l"}, {119, "q"}, {141, "y"}, {158, "v"}, {215, "r"}, {165, "p"}, {45, "v"}, {247, "d"}, {249, "l"}, {160, "i"}, {148, "a"}, {261, "l"}, {96, "a"}, {140, "e"}, {64, "c"}, {65, "t"}, {166, "a"}, {217, "g"}, {49, "g"}, {266, "q"}, {277, "e"}, {38, "k"}, {268, "t"}, {27, "i"}, {92, "s"}, {120, "g"}, {121, "i"}, {63, "l"}, {174, "w"}, {13, "a"}, {195, "d"}, {196, "g"}, {248, "q"}, {251, "t"}, {18, "d"}, {176, "s"}, {230, "y"}, {264, "l"}, {238, "s"}, {20, "r"}, {216, "v"}, {183, "s"}, {197, "d"}, {113, "p"}, {179, "p"}, {28, "g"}, {111, "g"}, {132, "a"}, {108, "f"}, {9, "g"}, {162, "l"}, {204, "n"}, {252, "l"}, {167, "d"}, {273, "d"}, {54, "l"}, {267, "q"}, {271, "d"}, {270, "g"}, {5, "v"}, {97, "i"}, {214, "s"}, {253, "i"}, {53, "s"}, {74, "l"}, {10, "e"}, {224, "g"}, {138, "p"}, {207, "s"}, {52, "l"}, {185, "a"}, {7, "g"}, {129, "f"}, {209, "g"}, {62, "f"}, {136, "l"}, {153, "l"}, {231, "n"}, {260, "e"}, {11, "i"}, {272, "r"}, {94, "k"}, {170, "q"}, {228, "a"}, {43, "q"}, {89, "d"}, {130, "v"}, {131, "n"}, {134, "y"}, {137, "t"}, {173, "a"}, {237, "k"}, {184, "a"}, {245, "h"}, {87, "v"}, {234, "a"}, {124, "a"}, {199, "l"}, {144, "p"}, {269, "n"}, {100, "p"}, {246, "l"}, {29, "v"}, {114, "g"}, {84, "t"}, {227, "m"}, {239, "l"}, {23, "g"}, {157, "g"}, {2, "k"}, {44, "l"}, {202, "a"}, {206, "a"}, {66, "p"}, {17, "g"}, {46, "d"}, {109, "i"}, {222, "e"}, {47, "e"}, {180, "v"}, {77, "l"}, {154, "e"}, {275, "y"}, {169, "d"}, {82, "s"}, {156, "l"}, {250, "i"}, {57, "t"}, {139, "t"}, {90, "v"}, {126, "e"}, {127, "n"}, {263, "r"}, {203, "q"}, {190, "c"}, {78, "i"}, {122, "d"}, {218, "g"}, {50, "q"}, {70, "i"}, {81, "l"}, {106, "s"}, {112, "h"}, {142, "t"}, {258, "w"}, {191, "a"}, {19, "l"}, {240, "q"}, {233, "r"}, {103, "q"}, {6, "v"}, {36, "c"}, {60, "i"}, {69, "l"}, {168, "h"}, {117, "a"}, {274, "k"}, {221, "p"}, {98, "a"}, {71, "l"}, {22, "r"}, {223, "l"}, {235, "l"}, {145, "e"}, {175, "i"}, {33, "q"}, {4, "g"}, {80, "h"}, {213, "t"}, {236, "l"}, {259, "p"}, {76, "k"}, {242, "y"}, {110, "g"}, {72, "p"}, {12, "g"}, {88, "t"}, {244, "q"}, {37, "e"}, {55, "l"}, {42, "r"}, {56, "q"}, {91, "a"}, {34, "s"}, {201, "l"}, {257, "q"}, {107, "g"}, {265, "l"}, {163, "c"}, {16, "a"}, {35, "t"}, {205, "l"}, {30, "s"}, {232, "q"}, {171, "a"}, {133, "p"}, {59, "k"}, {189, "a"}, {254, "s"}, {211, "r"}, {152, "v"}, {241, "d"}, {116, "h"}, {178, "l"}, {210, "f"}, {101, "a"}, {177, "h"}, {225, "t"}, {73, "t"}, {123, "g"}, {32, "q"}, {262, "h"}, {226, "m"}, {143, "d"}, {51, "d"}, {93, "v"}, {104, "l"}, {172, "v"}, {198, "i"}, {86, "i"}, {79, "p"}, {187, "i"}, {75, "e"}, {276, "v"}, {150, "r"}, {68, "q"}, {151, "s"}, {194, "k"}, {193, "e"}, {256, "q"}, {39, "a"}, {99, "e"}, {31, "r"}, {200, "k"}, {15, "l"}, {182, "v"}, {3, "i"}, {48, "a"}, {25, "y"}, {155, "p"}, {243, "r"}, {40, "v"}, {188, "q"}, {58, "a"}, {219, "g"}, {102, "s"}, {115, "g"}, {212, "d"}, {41, "e"}, {125, "e"}, {159, "k"}, {67, "i"}, {192, "g"}, {229, "t"}, {14, "s"}, {83, "p"}, {61, "i"}, {181, "m"}, {128, "l"}, {146, "q"}, {220, "n"}, {21, "r"}, {26, "l"}, {208, "s"}, {147, "l"}, {161, "y"}, {24, "h"}}


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

