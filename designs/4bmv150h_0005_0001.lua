parent_table={{242, "g"}, {256, "y"}, {252, "a"}, {148, "h"}, {235, "a"}, {255, "r"}, {208, "l"}, {233, "w"}, {22, "f"}, {248, "r"}, {153, "a"}, {151, "y"}, {81, "g"}, {250, "a"}, {35, "d"}, {121, "v"}, {161, "l"}, {83, "l"}, {48, "d"}, {56, "a"}, {92, "s"}, {112, "t"}, {138, "s"}, {145, "e"}, {213, "l"}, {105, "r"}, {217, "d"}, {168, "e"}, {100, "a"}, {23, "a"}, {54, "v"}, {20, "e"}, {191, "r"}, {43, "a"}, {231, "a"}, {219, "r"}, {27, "h"}, {159, "l"}, {156, "a"}, {98, "q"}, {11, "s"}, {104, "e"}, {162, "s"}, {180, "l"}, {103, "i"}, {209, "v"}, {251, "q"}, {115, "t"}, {179, "v"}, {185, "r"}, {96, "v"}, {86, "n"}, {47, "r"}, {204, "e"}, {184, "t"}, {207, "e"}, {130, "t"}, {5, "v"}, {221, "l"}, {72, "i"}, {132, "a"}, {37, "v"}, {24, "r"}, {199, "l"}, {18, "y"}, {205, "v"}, {224, "i"}, {247, "i"}, {126, "v"}, {166, "n"}, {19, "a"}, {142, "f"}, {7, "i"}, {50, "s"}, {82, "i"}, {89, "m"}, {124, "r"}, {109, "l"}, {133, "i"}, {234, "d"}, {101, "e"}, {114, "l"}, {171, "p"}, {245, "s"}, {84, "i"}, {131, "g"}, {128, "s"}, {99, "t"}, {170, "s"}, {202, "v"}, {220, "e"}, {38, "r"}, {177, "q"}, {198, "t"}, {44, "a"}, {87, "a"}, {29, "l"}, {31, "l"}, {214, "v"}, {237, "d"}, {139, "v"}, {108, "t"}, {212, "a"}, {71, "e"}, {127, "q"}, {154, "t"}, {174, "i"}, {119, "a"}, {157, "f"}, {93, "g"}, {6, "l"}, {15, "g"}, {169, "l"}, {42, "l"}, {141, "g"}, {13, "g"}, {175, "y"}, {1, "t"}, {53, "a"}, {173, "g"}, {216, "f"}, {76, "e"}, {107, "i"}, {17, "t"}, {123, "p"}, {149, "s"}, {176, "v"}, {67, "l"}, {244, "m"}, {40, "d"}, {34, "r"}, {226, "p"}, {116, "r"}, {106, "l"}, {240, "r"}, {218, "r"}, {102, "g"}, {195, "d"}, {249, "q"}, {164, "g"}, {241, "q"}, {253, "a"}, {136, "i"}, {182, "a"}, {79, "r"}, {211, "a"}, {222, "v"}, {21, "r"}, {232, "r"}, {137, "g"}, {187, "e"}, {95, "f"}, {223, "t"}, {45, "r"}, {147, "g"}, {160, "f"}, {60, "d"}, {28, "d"}, {225, "p"}, {39, "l"}, {14, "i"}, {74, "l"}, {8, "t"}, {51, "g"}, {52, "v"}, {183, "a"}, {203, "m"}, {94, "g"}, {80, "i"}, {91, "q"}, {206, "d"}, {125, "f"}, {30, "v"}, {196, "v"}, {4, "t"}, {189, "w"}, {190, "g"}, {64, "p"}, {140, "v"}, {210, "d"}, {78, "a"}, {239, "a"}, {58, "q"}, {77, "d"}, {238, "g"}, {41, "a"}, {73, "r"}, {181, "p"}, {246, "d"}, {2, "l"}, {152, "g"}, {254, "d"}, {229, "v"}, {36, "k"}, {88, "g"}, {12, "s"}, {188, "i"}, {158, "v"}, {194, "i"}, {49, "e"}, {172, "s"}, {90, "a"}, {117, "l"}, {163, "q"}, {165, "l"}, {10, "a"}, {59, "a"}, {113, "a"}, {63, "r"}, {62, "t"}, {192, "a"}, {16, "a"}, {135, "n"}, {32, "v"}, {68, "a"}, {143, "a"}, {228, "h"}, {122, "a"}, {178, "a"}, {46, "l"}, {155, "k"}, {55, "e"}, {215, "g"}, {57, "l"}, {3, "p"}, {146, "s"}, {61, "l"}, {85, "n"}, {25, "r"}, {129, "g"}, {200, "p"}, {70, "v"}, {120, "a"}, {227, "l"}, {230, "a"}, {26, "g"}, {69, "a"}, {97, "q"}, {186, "t"}, {150, "i"}, {197, "n"}, {111, "t"}, {144, "p"}, {243, "l"}, {75, "r"}, {118, "a"}, {65, "a"}, {201, "e"}, {66, "d"}, {9, "g"}, {33, "a"}, {110, "n"}, {134, "v"}, {193, "g"}, {167, "l"}, {236, "l"}}


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

