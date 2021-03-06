parent_table={{226, "a"}, {244, "l"}, {86, "a"}, {35, "i"}, {193, "q"}, {220, "a"}, {164, "w"}, {128, "d"}, {20, "l"}, {48, "a"}, {169, "k"}, {185, "t"}, {26, "f"}, {247, "v"}, {122, "a"}, {150, "y"}, {7, "k"}, {224, "f"}, {53, "n"}, {65, "e"}, {136, "s"}, {238, "l"}, {162, "r"}, {51, "g"}, {153, "a"}, {195, "e"}, {229, "d"}, {158, "r"}, {138, "v"}, {94, "k"}, {111, "n"}, {192, "t"}, {132, "v"}, {87, "n"}, {242, "g"}, {21, "a"}, {202, "k"}, {230, "s"}, {142, "l"}, {61, "v"}, {52, "r"}, {188, "i"}, {40, "r"}, {145, "q"}, {241, "d"}, {85, "f"}, {97, "e"}, {184, "d"}, {103, "h"}, {222, "v"}, {82, "d"}, {163, "t"}, {198, "e"}, {211, "r"}, {210, "g"}, {173, "i"}, {4, "l"}, {221, "a"}, {31, "a"}, {110, "v"}, {38, "r"}, {135, "t"}, {118, "t"}, {71, "y"}, {55, "t"}, {151, "s"}, {186, "p"}, {104, "y"}, {69, "r"}, {130, "g"}, {245, "t"}, {67, "l"}, {73, "i"}, {179, "s"}, {212, "v"}, {243, "g"}, {180, "p"}, {18, "i"}, {223, "l"}, {182, "a"}, {91, "i"}, {84, "l"}, {9, "a"}, {232, "y"}, {137, "s"}, {112, "v"}, {24, "k"}, {22, "t"}, {146, "a"}, {140, "g"}, {201, "a"}, {25, "r"}, {23, "a"}, {131, "s"}, {60, "d"}, {30, "g"}, {75, "r"}, {208, "p"}, {98, "e"}, {236, "i"}, {13, "g"}, {43, "l"}, {76, "e"}, {80, "s"}, {154, "k"}, {42, "e"}, {231, "s"}, {196, "a"}, {99, "i"}, {156, "a"}, {209, "l"}, {121, "k"}, {240, "v"}, {95, "t"}, {77, "q"}, {44, "e"}, {79, "g"}, {29, "e"}, {32, "y"}, {206, "a"}, {147, "h"}, {174, "r"}, {165, "t"}, {62, "t"}, {148, "d"}, {49, "e"}, {106, "r"}, {170, "g"}, {214, "r"}, {175, "v"}, {197, "d"}, {11, "i"}, {171, "r"}, {189, "e"}, {108, "f"}, {56, "a"}, {160, "l"}, {10, "v"}, {63, "k"}, {54, "v"}, {176, "n"}, {117, "f"}, {37, "g"}, {1, "m"}, {219, "a"}, {28, "a"}, {157, "v"}, {33, "v"}, {178, "v"}, {134, "l"}, {96, "l"}, {88, "s"}, {123, "l"}, {167, "e"}, {183, "i"}, {190, "n"}, {216, "e"}, {237, "e"}, {2, "y"}, {126, "l"}, {72, "a"}, {19, "g"}, {101, "p"}, {8, "t"}, {168, "l"}, {159, "s"}, {45, "q"}, {200, "r"}, {235, "g"}, {172, "s"}, {228, "d"}, {92, "e"}, {58, "k"}, {207, "t"}, {109, "d"}, {116, "i"}, {36, "v"}, {66, "d"}, {68, "d"}, {70, "l"}, {155, "a"}, {102, "e"}, {47, "a"}, {127, "r"}, {199, "l"}, {81, "i"}, {213, "g"}, {246, "q"}, {74, "v"}, {93, "q"}, {113, "r"}, {217, "e"}, {17, "g"}, {194, "e"}, {16, "s"}, {144, "q"}, {3, "r"}, {239, "f"}, {215, "p"}, {6, "n"}, {100, "t"}, {27, "v"}, {152, "a"}, {14, "g"}, {181, "g"}, {218, "l"}, {225, "l"}, {177, "a"}, {129, "g"}, {89, "g"}, {78, "r"}, {59, "a"}, {133, "i"}, {166, "t"}, {227, "s"}, {64, "l"}, {205, "a"}, {124, "p"}, {139, "h"}, {34, "f"}, {12, "t"}, {57, "v"}, {234, "a"}, {204, "a"}, {115, "l"}, {83, "v"}, {90, "a"}, {107, "t"}, {39, "r"}, {125, "l"}, {149, "t"}, {233, "v"}, {119, "v"}, {5, "l"}, {50, "i"}, {120, "q"}, {187, "i"}, {41, "k"}, {161, "a"}, {191, "q"}, {114, "g"}, {15, "n"}, {46, "a"}, {105, "d"}, {203, "f"}, {141, "v"}, {143, "g"}}


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

