parent_table={{51, "g"}, {225, "p"}, {38, "r"}, {253, "a"}, {206, "d"}, {16, "a"}, {216, "f"}, {247, "i"}, {87, "a"}, {93, "g"}, {249, "q"}, {124, "r"}, {175, "y"}, {180, "l"}, {184, "t"}, {165, "l"}, {35, "d"}, {154, "t"}, {189, "w"}, {39, "l"}, {20, "e"}, {60, "d"}, {9, "g"}, {117, "l"}, {95, "f"}, {34, "r"}, {141, "g"}, {136, "i"}, {3, "p"}, {40, "d"}, {59, "a"}, {36, "k"}, {8, "t"}, {61, "l"}, {207, "e"}, {226, "p"}, {227, "l"}, {186, "t"}, {156, "a"}, {137, "g"}, {23, "a"}, {127, "q"}, {130, "t"}, {151, "y"}, {177, "q"}, {244, "m"}, {6, "l"}, {163, "q"}, {196, "v"}, {174, "i"}, {32, "v"}, {26, "g"}, {94, "g"}, {217, "d"}, {205, "v"}, {48, "d"}, {33, "a"}, {251, "q"}, {105, "r"}, {58, "q"}, {212, "a"}, {190, "g"}, {68, "a"}, {248, "r"}, {90, "a"}, {28, "d"}, {101, "e"}, {242, "g"}, {42, "l"}, {44, "a"}, {145, "e"}, {133, "i"}, {150, "i"}, {128, "s"}, {4, "t"}, {245, "s"}, {208, "l"}, {218, "r"}, {171, "p"}, {45, "r"}, {56, "a"}, {178, "a"}, {187, "e"}, {75, "r"}, {79, "r"}, {209, "v"}, {219, "r"}, {176, "v"}, {123, "p"}, {152, "g"}, {132, "a"}, {241, "q"}, {155, "k"}, {222, "v"}, {82, "i"}, {131, "g"}, {164, "g"}, {246, "d"}, {202, "v"}, {250, "a"}, {7, "i"}, {71, "e"}, {5, "v"}, {77, "d"}, {170, "s"}, {55, "e"}, {182, "a"}, {43, "a"}, {100, "a"}, {215, "g"}, {232, "r"}, {181, "p"}, {255, "r"}, {74, "l"}, {230, "a"}, {62, "t"}, {49, "e"}, {102, "g"}, {195, "d"}, {17, "t"}, {25, "r"}, {158, "v"}, {235, "a"}, {185, "r"}, {76, "e"}, {115, "t"}, {46, "l"}, {139, "v"}, {148, "m"}, {47, "r"}, {97, "q"}, {153, "a"}, {108, "t"}, {118, "a"}, {19, "a"}, {119, "a"}, {37, "v"}, {254, "d"}, {114, "l"}, {233, "w"}, {223, "t"}, {229, "v"}, {92, "s"}, {29, "l"}, {240, "r"}, {50, "s"}, {109, "l"}, {30, "v"}, {121, "v"}, {140, "h"}, {146, "g"}, {204, "e"}, {67, "l"}, {110, "n"}, {1, "t"}, {120, "a"}, {201, "e"}, {73, "r"}, {70, "v"}, {107, "i"}, {27, "h"}, {41, "a"}, {234, "d"}, {81, "g"}, {91, "q"}, {199, "l"}, {22, "f"}, {228, "h"}, {203, "m"}, {166, "n"}, {243, "l"}, {135, "n"}, {210, "d"}, {129, "g"}, {168, "e"}, {138, "s"}, {256, "y"}, {125, "f"}, {98, "q"}, {147, "g"}, {194, "i"}, {112, "t"}, {237, "d"}, {134, "v"}, {15, "g"}, {149, "s"}, {214, "v"}, {83, "l"}, {85, "n"}, {11, "s"}, {66, "d"}, {86, "n"}, {144, "p"}, {197, "n"}, {111, "t"}, {238, "g"}, {64, "p"}, {183, "a"}, {191, "r"}, {54, "v"}, {160, "f"}, {2, "l"}, {13, "g"}, {12, "s"}, {103, "i"}, {99, "t"}, {143, "a"}, {193, "g"}, {211, "a"}, {14, "i"}, {89, "m"}, {198, "t"}, {157, "f"}, {24, "r"}, {169, "l"}, {18, "y"}, {84, "i"}, {21, "r"}, {69, "a"}, {122, "a"}, {113, "a"}, {236, "l"}, {167, "l"}, {65, "a"}, {106, "l"}, {126, "v"}, {172, "s"}, {10, "a"}, {104, "e"}, {53, "a"}, {162, "s"}, {78, "a"}, {231, "a"}, {63, "r"}, {116, "r"}, {200, "p"}, {96, "v"}, {159, "l"}, {80, "i"}, {88, "g"}, {142, "f"}, {239, "a"}, {252, "a"}, {52, "v"}, {161, "l"}, {173, "g"}, {213, "l"}, {72, "i"}, {57, "l"}, {31, "l"}, {179, "v"}, {188, "i"}, {220, "e"}, {221, "l"}, {224, "i"}, {192, "a"}}

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

