parent_table={{237, "a"}, {86, "p"}, {217, "l"}, {194, "s"}, {142, "q"}, {143, "d"}, {84, "e"}, {6, "c"}, {182, "v"}, {190, "v"}, {242, "g"}, {22, "l"}, {28, "r"}, {43, "e"}, {173, "k"}, {72, "e"}, {140, "a"}, {169, "y"}, {141, "f"}, {127, "l"}, {196, "a"}, {251, "s"}, {95, "l"}, {120, "n"}, {4, "l"}, {195, "y"}, {58, "p"}, {66, "a"}, {139, "n"}, {216, "e"}, {186, "e"}, {105, "d"}, {2, "d"}, {222, "q"}, {259, "d"}, {45, "m"}, {91, "l"}, {246, "k"}, {199, "p"}, {75, "v"}, {24, "p"}, {163, "y"}, {99, "n"}, {53, "l"}, {121, "n"}, {171, "a"}, {51, "e"}, {224, "l"}, {123, "w"}, {96, "l"}, {133, "l"}, {159, "a"}, {236, "s"}, {107, "s"}, {134, "t"}, {253, "a"}, {93, "r"}, {175, "a"}, {118, "e"}, {35, "v"}, {201, "d"}, {34, "s"}, {174, "a"}, {230, "l"}, {15, "s"}, {74, "g"}, {114, "n"}, {87, "r"}, {10, "v"}, {193, "l"}, {63, "v"}, {125, "l"}, {11, "l"}, {184, "a"}, {49, "l"}, {238, "q"}, {98, "n"}, {177, "d"}, {117, "a"}, {228, "g"}, {115, "d"}, {23, "a"}, {207, "l"}, {89, "e"}, {106, "v"}, {157, "h"}, {50, "k"}, {54, "g"}, {198, "g"}, {168, "l"}, {108, "k"}, {42, "s"}, {137, "t"}, {215, "p"}, {164, "k"}, {185, "a"}, {214, "d"}, {154, "i"}, {151, "v"}, {181, "q"}, {146, "g"}, {116, "l"}, {180, "y"}, {1, "a"}, {255, "v"}, {220, "k"}, {30, "l"}, {136, "g"}, {41, "r"}, {104, "g"}, {192, "v"}, {232, "d"}, {126, "n"}, {44, "s"}, {145, "p"}, {211, "t"}, {240, "l"}, {25, "q"}, {39, "s"}, {48, "q"}, {73, "a"}, {258, "y"}, {138, "l"}, {81, "a"}, {202, "n"}, {103, "l"}, {47, "r"}, {203, "d"}, {18, "f"}, {26, "l"}, {56, "q"}, {97, "i"}, {14, "a"}, {31, "s"}, {131, "l"}, {172, "g"}, {82, "v"}, {226, "s"}, {21, "a"}, {167, "g"}, {212, "s"}, {244, "l"}, {79, "l"}, {69, "l"}, {100, "a"}, {170, "c"}, {77, "r"}, {187, "e"}, {206, "q"}, {243, "l"}, {109, "g"}, {20, "r"}, {111, "l"}, {245, "q"}, {46, "l"}, {80, "s"}, {27, "a"}, {239, "k"}, {128, "t"}, {153, "n"}, {234, "g"}, {132, "c"}, {256, "r"}, {227, "d"}, {60, "l"}, {148, "s"}, {223, "k"}, {241, "l"}, {160, "l"}, {85, "l"}, {129, "s"}, {150, "t"}, {70, "g"}, {249, "f"}, {252, "g"}, {250, "q"}, {92, "q"}, {183, "l"}, {38, "v"}, {155, "s"}, {210, "e"}, {254, "h"}, {197, "p"}, {162, "p"}, {110, "f"}, {156, "s"}, {225, "k"}, {165, "g"}, {19, "g"}, {52, "e"}, {7, "a"}, {176, "r"}, {231, "v"}, {248, "t"}, {213, "k"}, {57, "q"}, {13, "g"}, {94, "l"}, {71, "t"}, {5, "g"}, {8, "v"}, {17, "g"}, {119, "v"}, {200, "l"}, {188, "p"}, {113, "v"}, {32, "p"}, {76, "q"}, {83, "r"}, {191, "r"}, {62, "v"}, {16, "r"}, {9, "c"}, {33, "g"}, {101, "a"}, {178, "m"}, {209, "r"}, {29, "l"}, {122, "y"}, {88, "p"}, {233, "c"}, {229, "a"}, {221, "l"}, {147, "l"}, {112, "n"}, {152, "v"}, {204, "m"}, {247, "d"}, {257, "f"}, {90, "g"}, {67, "a"}, {144, "s"}, {205, "q"}, {208, "a"}, {61, "k"}, {166, "w"}, {3, "g"}, {161, "q"}, {219, "s"}, {124, "a"}, {189, "s"}, {40, "a"}, {64, "l"}, {149, "k"}, {78, "l"}, {55, "a"}, {68, "d"}, {130, "m"}, {179, "l"}, {65, "a"}, {235, "t"}, {37, "l"}, {218, "r"}, {158, "c"}, {59, "d"}, {135, "s"}, {36, "m"}, {12, "t"}, {102, "t"}}


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

