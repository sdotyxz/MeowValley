pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include main.lua
#include player.lua
#include map_collision.lua
#include animator.lua
#include scene.lua
#include math.lua
#include smoke.lua
#include slash.lua
#include emoji.lua
#include slime.lua
#include npc.lua
#include fsm.lua
#include house.lua
__gfx__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888808880888888888888888888888888880888088888888888808880888888888888888888888888888888888888
8888888888888888888888880888088888888809080f088888888888888888888888809080f0888888888809080f088888888888888888888888888888888888
8888888808880888888888809080f0888888809e90fe088888888888088808888888809e00fe088888888809e00fe08888888888888888888888888888888888
888888809080f08888888809e90fe0888088809fff550888888888809080f0888888809fff55088888888809fff5508888888888888888888888888888888888
88888809e90fe08888888809fff5508809080ff90f50508880888809e90fe08888880ff90f505088888880ff90f5050888888888088808888888888808880888
88888809fff55088888880ff90f505080f080ff90ff0508809088809fff5508888880ff90ff05088888880ff90ff0508888888809080f088888888809080f088
888800ff90f50508888880ff90ff050880f000ffffff088880f000ff90f505088880ffffffff088888880ffffffff08888888809e90fe08888888809e90fe088
888090ff90ff05088888880ffffff088880ffffffff08888880fffff90ff05088880fffffff0888888880fffffff088888888809fff5508888808809fff55088
880f000ffffff0888088880fffff08888880ffffff08888888800ffffffff0888880ffffff0888888880ffffffff0888800000ff90f50508880900ff90f50508
880f00ffffff0888090000fffff08888880ffffffff088888880ffffffff0888800ffff000888888880fffff0000888809ffffff90ff050880f000ff90ff0508
8880fffffff0888880fffffffff0888888800000000888888888000ffff0888809ff0fff0888888880f0fff08888888880000ffffffff088880ffffffffff088
88880ffff0f0888888000ffff0f08888888888888888888888888880f0f0888880000f0f088888880900f0f08888888888880fffffff088888800fffffff0888
88888888888888888888888888888888888888111188888888888888888888888888888888888888888888888888888888888888888888888888888888888888
8888811111188888888888888888888888888177cc18888888888888888888888888888888888888888888888888888888888888888888888888888888888888
888817777cc188888888111111118888888817ccccc1888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88817ccccccc18888811777777cc1188888817cc1c11888888880000000888888888888888888888888880000000888888888888888888888888800000008888
8817c77cc1c1c18881c777cccccccc1888817c771c1c18888880fffffff08888888800000008888888880fffffff0888888880000000888888880fffffff0888
881c27722121c18881c2772222121c188881cc77222c18888880fffffff088888880fffffff0888888880fffffff088888880fffffff088888880fffffff0888
881cc222222cc18881cc222222121c188881cc2222cc18888880fffffff088888880fffffff0888888880fffffff088888880fffffff088888880fffffff0888
8881cccccccc1888881cccccccccc18888881cccccc188888880ff71f71088888880fffffff0888888880fff71f7088888880fffffff088888880fff71f70888
8888888888888888888888888888888888888888888888888880ff71f71088888880ff71f710888888880fff71f7088888880ffff71f088888880fff71f70888
8888118888118888888888888888888888888888888888888880fffffff088888880ff71f710888888880fffffff088888880ffff71f088888880fffffff0888
88817c18817c18888888888888888888888888888888888888880fffff0888888880fffffff08888888880fffff0888888880fffffff0888888880fffff08888
8817ccc1817cc1888811188888811118888888888888888888800fffff00888888880fffff08888888888000fff08888888880fffff0888888888000fff08888
8817c771176c6c188177c188881cccc18888888888888888880ff0ffff0f088888800fffff008888888880ff0ff08888888880f00ff08888888880ff0ff08888
817c2772226c6c18817cc7188816c6c18888888888888888880ff0ffff0f0888880ff0ffff0f0888888880ff0ff088888888800ff0f08888888880ff0ff08888
81ccc222222ccc1881cc2771112626c1881118888881111188800fffff008888880ff0ffff0f088888880f00fff088888888800ff0f0888888888000fff08888
881ccccccccc1188881cc2222222c11881c77188881cccc188880f080f08888888800f080f0088888888888880f088888888888000f08888888888880f088888
88888888888888887770000000000000001111000011118000111100001111000000000000000000000000000000000000000000000000000000000000000000
88000000088888880777700000000000019aaa10019aaa88019aaa10019aaa100000000000000000000000000000000000000000000000000000000000000000
80000000008888880077770000000000198aa8a1191aa1a1197aa7a1191aa1a10000000000000000000000000000000000000000000000000000000000000000
88000000088888880077777000000700188aa88119aaaaa1191aa1a119caaca10000000000000000000000000000000000000000000000000000000000000000
88888888888888880007777000000770191aa1a1191aa1a1eeaaaaee19caaca10000000000000000000000000000000000000000000000000000000000000000
8888888888888888000777700000077019a11aa118a11aa1eea11aee19c11ca10000000000000000000000000000000000000000000000000000000000000000
88888888888888880077777000007770019aaa10889aa810019aaa1001caac100000000000000000000000000000000000000000000000000000000000000000
88888888888888880777770000007700001111000011188000111100001111000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01777777777777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777777777777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777777777777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777777777777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777777777777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777777777777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777777777777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777777777777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777777777777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777777777777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01777777777777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111777111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccc666666666666666666cccbbbbbbbbb3bbbbbbbbb111111111111111111bbbbbb1ddddddddddddddd71bbb6111111111111116000000000000000000000000
cc64444444444444444446ccbbbbbbbbb23bb3abbb17777777777777777771bbbbb1d6666666666666671bbb1ffffffffffffff1000001111110000000000000
c644aaaaaaaaaaaaaaaa446cbabbbabbbb2b32bbb1aaaaaaaaaaaaaaaaaaaa1bbbb1d6666666666666671bbb1e111111111111f100011bbbbbb1100000000000
c64abbbbbbbbbbbbbbbba46cbb3b32bb3bbbbbbbb1111111111111111111111bbbb1d6666666666666671bbb1e1eeeeeeeeee2f1001bbaaaaaabb10000000000
564abbbbbbbbbbbbbbbba467bb332bbb23bbbbbb177777777777777777777771bbb1d6666666666666671bbb1e1eee2222eee2f101bbaaaaaaaabb1000000000
564abbbbbbbbbbbbbbbba467bbb2bbbbbbbb32bb1aaaaaaaaaaaaaaaaaaaaaa1bbb1d6666666666666671bbb1e1eef7cdd2ee2f101baaaaaaaaaab1000000000
564abbbbbbbbbbbbbbbba467bbbbbbbbbbb32bbb1aaaaaaaaaaaaaaaaaaaaaa1bbb1d6666666666666671bbb1e1eefcdd72ee2f113baabaaaaaaab3100000000
564abbbbbbbbbbbbbbbba467bbbbbbbbbbbbbbbb1aaaaaaaaaaaaaaaaaaaaaa1bbb1d6666666666666671bbb1e1eefddcc2ee2f113bbbbaabbaabb3100000000
564abbbbbbbbbbbbbbbba467bbbbbbbbbbbbbbbb199999999999999999999991bbb1d6666666666666671bbb1e1eefdccd2ee2f111bbbbbbbbbbbbb100000000
564abbbbbbbbbbbbbbbba467a2bbbabbabbbbbbb199999999999999999999991bbb1d6666666666666671bbb1e1eefccdd11e2f11333bbbbbbbb33b100000000
564abbbbbbbbbbbbbbbba467bb2b3bbbb3bb3bbbb1111111111111111111111bbbb1d6666666666666671bbb1e1ee2fff19712f11333bb33bbbb333100000000
564abbbbbbbbbbbbbbbba467bbbbbbbbb3b3bbbbb19999999999999999999a1bbbb1d6666666666666671bbb1e1eefeee19912f1113bbb33b33bb33100000000
564abbbbbbbbbbbbbbbba46733bb3bb3b3232bb3b19999999999999999999a1bbbb1d6666666666666671bbb1e1eefeeee11e2f101133333333b331000000000
564abbbbbbbbbbbbbbbba467b22b2b2bb2b2bbb2b19999999999999999999a1bbbb1d6666666666666671bbb1e1eefeeee2ee2f1011313333333311000000000
564abbbbbbbbbbbbbbbba467bbbbbbbbbbbbbbbbb19999999999999999999a1bbbb1d6666666666666671bbb1e111111111112f1001113333131110000000000
564abbbbbbbbbbbbbbbba467bbbbbbbbbbbbbbbbb19999999999999999999a1bbbb1d6666666666666671bbb1113333333333111000001111110000000000000
564abbbbbbbbbbbbbbbba467bbbbbbbbbbbbbbbbb19999999999999999999a1bbbb1d6666666666666671bbb6666661111666666000000000000000000000000
564abbbbbbbbbbbbbbbba467bbb77bbbbb777bbbb19999999999999999999a1bbbb1d6666666666666671bbb666611eeee116666000000000000000000000000
564abbbbbbbbbbbbbbbba467bbb77bbbb7a997bbb19999999999999999999a1bbbb1d6666666666666671bbb6661ee1111ee1666000000000000000000000000
564abbbbbbbbbbbbbbbba467b779977bb7aa97bbb19999999999999999999a1bbbb1d6666666666666671bbb661e21dddc12e166000000000000000000000000
564abbbbbbbbbbbbbbbba467b77a977bb7aaa7bbb19999999999999999999a1bbbb1d6666666666666671bbb61e2121dc1e12e16000000000000000000000000
564abbbbbbbbbbbbbbbba467b117711bb17771bbb19999999999999999999a1bbbb311111111111111113bbb61e1d1211e1c1e16000000000000000000000000
5644aaaaaaaaaaaaaaaa4467bb1771bbbb111bbbb19999999999999999999a1bbbbb3333333333333333bbbb1ee11112e1111ee1000000000000000000000000
5d64444444444444444446d7bbb11bbbbbbbbbbbb19999999999999999999a1bbbbbbbbbbbbbbbbbbbbbbbbb1eeeeeeeeeeeeee1000000000000000000000000
5dd666666666666666666dd7bbbbbbbbccccccccb19999999999999999999a1b0011110000000a92000008000000000000000000000000000000000000000000
5dddddddddddddddddddddd7bbbbbbbbccccccccb19999999999999999999a1b01efff1002a020a200082a200000000000000000000000000000000000000000
57dddddddddddddddddddd7cbbb77bbbccccccccb19999999999999999999a1b1eed6ff12a93a229008a82800008800000000000000000000000000000000000
57dddddddddddddddddddd7cbb7a97bbccccccccb11aaaaaaaaaaaaaaaaaa11b1edcddf12a22aa19003808a80022280000000000000000000000000000000000
c17dddddddddddddddddd71cbb7aa7bbccccccccb1911111111111111111191b127ddcf1029a292901b003800016710000000000000000000000000000000000
cc17777777777777777771ccbb1771bbccccccccb1999999999999999999991b12edcfe102a33233121b1100012d641000000000000000000000000000000000
ccc111111111111111111cccbbb11bbbccccccccbb19999999999999999991bb012eee100323333312ddd100014fff1000000000000000000000000000000000
ccccccccccccccccccccccccbbbbbbbbccccccccbbb111111111111111111bbb00111100011111111122d1000014f10000000000000000000000000000000000
07070770000070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77070700077777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070700077070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07077070077777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00707000077707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70700070000777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70777070000777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07007777007070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700007007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07007007070070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07777777007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07077707000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07707077000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07007007077777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888ffffff882222228888888888888888888888888888888888888888888888888888888888888888228228888ff88ff888222822888888822888888228888
88888f8888f882888828888888888888888888888888888888888888888888888888888888888888882288822888ffffff888222822888882282888888222888
88888ffffff882888828888888888888888888888888888888888888888888888888888888888888882288822888f8ff8f888222888888228882888888288888
88888888888882888828888888888888888888888888888888888888888888888888888888888888882288822888ffffff888888222888228882888822288888
88888f8f8f88828888288888888888888888888888888888888888888888888888888888888888888822888228888ffff8888228222888882282888222288888
888888f8f8f8822222288888888888888888888888888888888888888888888888888888888888888882282288888f88f8888228222888888822888222888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000000000000000000000000000000000005555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111177777777777733333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550444444444455555555570000000000777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550444444444455555555570666666660777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550444444444455555555570666666660777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550444444444455555555570666666660777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550444444444455555555570666666660777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550444444444455555555570666666660777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550444444444455555555570666666660777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550444444444455555555570666666660777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550444444444455555555570000000000777777777705555555
555555500000000000000000000000000000000000000000000000000000000000000000055555508888888888999999999777777777777bbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000000000000000000000000000000000005555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000555556667655555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000555555666555555555555555555555555555555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555000000055555556dddddddddddddddddddddddd5555555555
555555500000000000000000000000000000000000000000000000000000000000000000055555500060005555555655555555555555555555555d5555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000555555576666666d6666666d666666655555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555556665666555555555555566676555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555556555556555555555555556665555555555555555555555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555555555555555555ddddddd6dddddddddddddddd5555555555
555555500000000000000000000000000000000000000000000000000000000000000000055555565555565555555655555556555555555555555d5555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555556665666555555576666666d6666666d666666655555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550005550005550005550005550005550005550005550005555
555555500000000000000000000000000000000000000000000000000000000000000000055555011d05011d05011d05011d05011d05011d05011d05011d0555
55555550000000000000000000000000000000000000000000000000000000000000000005555501110501110501110501110501110501110501110501110555
55555550000000000000000000000000000000000000000000000000000000000000000005555501110501110501110501110501110501110501110501110555
55555550000000000000000000000000000000000000000000000000000000000000000005555550005550005550005550005550005550005550005550005555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
555555555555575555555ddd55555d5d5d5d55555d5d555555555d5555555ddd5555550000000055555555555555555555555555555555555555555555555555
555555555555777555555ddd55555555555555555d5d5d55555555d55555d555d555550000000056666666666666555557777755555555555555555555555555
555555555557777755555ddd55555d55555d55555d5d5d555555555d555d55555d55550000000056ddd6ddd6dd66555577ddd775566666555666665556666655
555555555577777555555ddd55555555555555555ddddd5555ddddddd55d55555d55550000000056d6d6d6d66d66555577d7d77566dd666566ddd66566ddd665
5555555557577755555ddddddd555d55555d555d5ddddd555d5ddddd555d55555d55550000000056d6d6d6d66d66555577d7d775666d66656666d665666dd665
5555555557557555555d55555d55555555555555dddddd555d55ddd55555d555d555550000000056d6d6d6d66d66555577ddd775666d666566d666656666d665
5555555557775555555ddddddd555d5d5d5d555555ddd5555d555d5555555ddd5555550000000056ddd6ddd6ddd655557777777566ddd66566ddd66566ddd665
55555555555555555555555555555555555555555555555555555555555555555555550000000056666666666666555577777775666666656666666566666665
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555566666665ddddddd5ddddddd5ddddddd5
00000007777777777777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700707000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700707000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007777777777777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000010101010101010100000000000000000101010101010101000000000000000001010101010100000000000101010000010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4b4
b4808181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818181818182b4
b490919191919191919191919191919191919191919191919191919191919191919191a391919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191849192b4
b49091919191939191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919194919191919191919191919191919191919191919191919191919191919191a3919191919191919184919191919191919184919191919191919192b4
b490919191919191919191919191919191919191919191839191919191918586868686868687919191939191919191919191919191919191b3919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191a391919191919191a391919192b4
b490919193919191919191919191919191a39191839191919191919191919596969696969697919191919191919191919191919191919191919191919191b391919191919191919191919191919191919191919191839191919191849191919191918491919191919191919191919191919191919191919191919191919192b4
b49091919191919191839191919191919191919191919191919191919191a5a6a6a6a6a6a6a7919191919191919191919191939191919191919191919191919191919191919191919191a3839191919191919191919191919191919191919191919191919191919191a3919191919191919191919191919191849191919192b4
b490919191919191919191919191919191919191919191a3919191918391a5a6a6a6a6a6a6a79191919191919191919191919191919191919391919191919191919191919191919191919191919191919183919191919191919191919191a39191919191919191919191919191919191919191919191919191919191919192b4
b49091919191919491919191919191919191919191919191919191919191b5b6b6b6b6b6b6b791919191919191919191919191919191919191919191919191919191a39191919191919191919191919191919191a3919191919191919191919191919191919191919191919191919191918491919191919191919191919192b4
b49091919191919191919191919191919191919191919191919191919191888989898989898a91b39191919191919191b3919191919191919191919191919191919191919191919191919191919191919191919191919191919191919491919191919191919191919191919191919191919191919191849191919191919192b4
b49091919191919191919191919191918391919191919191919191919191989999999999999a9191919183919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919194919191919191919191849191919191919191919191919191919192b4
b490919191a3919191918391919191919183919191919183919191919191a8a9a9a9a9a9a9aa9191919191919191919191919191939191919191919191919191919391919191919191919191919191919191919191919183919191919191919191919191919191919191919191919191919191919191919191919191919192b4
b4909191919191919191919191919191919183919191918391919191839191919191919191919183919191919191919191919191919191b391919191919191919191919191919191919191919191919191918391919191919191919191919191919191919191919191a39191919191919191919191919191a3919191919192b4
b490919191919191919191919191919191918391919191919191919191919191b391919191919191919191919191919191919191919191919191919191919191919191919191919183919191919191a39191919191919191919191919191919191918491919191919191919191919191919191919191919191919191919192b4
b4909191919191919191919191a3919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191b391919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191949191919191919191919192b4
b4909191919491919191919191919191919191919191919191919191919191919191919191919191919191919191839191919191919391919191919191b39191919191919191919191919191919191919191919191919191919191919191919191919191919191919184919191919191919191919191919194919191919192b4
b4909191919191919191919191919191919191a39191919191919191839191919191919191919191918391919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191918491919191919191919191919191919191919191919191919191919191919192b4
b490919191919191919183919191919191839191919191918391919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919183919191919191919191919191919191a391919191919191919191919191919191919191919191919192b4
b4909191919191919191919191919191919191919191919191919183919191919183919191919191919191918391919191919191919191919191939191919191919191919191919191919191919183919191919191919183919191918391919191919191919191919191919191919191919191919191919191919191919192b4
b4909191a391919191919191919191919191919191919191919191919191919191919191839191919191919191919191919191b39191919191919191919191919191919191919183919191a3919191919191919191919191919191919191919191919191919191919191919191919191919191919491919191919191919192b4
b4909191919191919191919191919191919191919191919191919191919191919191919191b3919191919191919191919191919183919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191a391919191919191919191919194919191919191919191919191919192b4
b49091919191919191918391919191919191919191919191919191918391919191919191919191919191919191918391919191919191919191919191919191919191919191919191919191919191919191919183919191919191919191919191919191919191919184919191919191919191919191a3919191919191919192b4
b490919194919191a491919191919191839191919191918391919191919191918391919191919191919191919191919191919191919191919191839191919191919191919191919191919191919191919191919191919191a39191919191839191919191919191919191919191919191a39191919191919191919491919192b4
b49091919191919191919191919191919191919191919191919191919191919191919191919191b39191919191919191b391919191919191919191919191919191a391919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919192b4
b4909191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919191919192b4
b4a0a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a2b4
b4b0b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b2b4
0000000000000000000000000000000000000000000000000000000000000087000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000087000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
