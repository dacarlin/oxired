parent_table={{118, "h"}, {36, "p"}, {159, "i"}, {8, "g"}, {174, "s"}, {161, "k"}, {92, "n"}, {24, "s"}, {117, "v"}, {41, "i"}, {96, "n"}, {203, "l"}, {133, "t"}, {95, "q"}, {210, "r"}, {3, "i"}, {27, "n"}, {74, "s"}, {111, "g"}, {148, "s"}, {122, "n"}, {66, "l"}, {97, "y"}, {29, "k"}, {196, "t"}, {12, "t"}, {181, "a"}, {197, "r"}, {218, "p"}, {60, "d"}, {87, "n"}, {67, "d"}, {108, "q"}, {40, "n"}, {5, "f"}, {169, "l"}, {1, "e"}, {85, "t"}, {89, "k"}, {91, "y"}, {228, "n"}, {14, "g"}, {164, "s"}, {229, "k"}, {2, "d"}, {33, "g"}, {182, "g"}, {11, "d"}, {82, "d"}, {145, "s"}, {138, "y"}, {214, "i"}, {44, "k"}, {61, "k"}, {153, "c"}, {32, "f"}, {113, "i"}, {190, "a"}, {59, "k"}, {64, "n"}, {121, "a"}, {192, "l"}, {205, "r"}, {219, "l"}, {194, "s"}, {71, "f"}, {185, "m"}, {73, "a"}, {28, "v"}, {103, "a"}, {149, "l"}, {25, "k"}, {37, "p"}, {69, "l"}, {107, "h"}, {215, "s"}, {216, "a"}, {123, "a"}, {77, "t"}, {106, "i"}, {171, "a"}, {81, "i"}, {90, "r"}, {204, "g"}, {213, "t"}, {222, "r"}, {9, "i"}, {38, "v"}, {120, "l"}, {191, "a"}, {22, "e"}, {130, "l"}, {224, "a"}, {23, "l"}, {162, "p"}, {165, "s"}, {125, "e"}, {75, "f"}, {58, "d"}, {124, "k"}, {20, "a"}, {168, "s"}, {131, "l"}, {13, "n"}, {72, "d"}, {151, "s"}, {201, "y"}, {150, "i"}, {6, "i"}, {115, "m"}, {99, "i"}, {119, "s"}, {183, "g"}, {144, "k"}, {195, "d"}, {68, "m"}, {105, "l"}, {48, "n"}, {42, "f"}, {102, "v"}, {49, "g"}, {220, "k"}, {226, "a"}, {52, "d"}, {158, "n"}, {43, "m"}, {176, "k"}, {227, "i"}, {155, "y"}, {56, "i"}, {7, "a"}, {178, "v"}, {186, "s"}, {209, "i"}, {31, "i"}, {223, "a"}, {47, "k"}, {57, "i"}, {156, "f"}, {16, "g"}, {62, "k"}, {78, "a"}, {199, "l"}, {136, "k"}, {126, "v"}, {137, "g"}, {173, "h"}, {179, "p"}, {180, "g"}, {4, "c"}, {21, "k"}, {202, "h"}, {198, "v"}, {163, "q"}, {167, "i"}, {17, "w"}, {110, "y"}, {54, "d"}, {146, "s"}, {221, "s"}, {170, "t"}, {109, "k"}, {152, "l"}, {142, "l"}, {160, "m"}, {104, "n"}, {127, "q"}, {132, "n"}, {154, "k"}, {166, "i"}, {46, "y"}, {212, "n"}, {101, "d"}, {200, "a"}, {26, "r"}, {128, "k"}, {18, "g"}, {172, "h"}, {187, "s"}, {157, "v"}, {55, "m"}, {39, "y"}, {94, "l"}, {207, "y"}, {147, "y"}, {93, "m"}, {211, "i"}, {65, "i"}, {208, "n"}, {63, "m"}, {193, "e"}, {88, "n"}, {177, "v"}, {141, "a"}, {34, "i"}, {70, "p"}, {83, "e"}, {15, "y"}, {112, "k"}, {225, "t"}, {189, "k"}, {129, "d"}, {98, "t"}, {51, "f"}, {184, "g"}, {134, "s"}, {76, "d"}, {217, "g"}, {175, "q"}, {140, "d"}, {53, "n"}, {84, "e"}, {143, "s"}, {19, "i"}, {80, "d"}, {45, "n"}, {188, "a"}, {50, "k"}, {206, "n"}, {114, "n"}, {79, "n"}, {86, "k"}, {116, "l"}, {135, "r"}, {35, "w"}, {30, "i"}, {10, "g"}, {100, "e"}, {139, "l"}}


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

