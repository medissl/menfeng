extends RefCounted

const DRIVE := [
	"The rain started where the pavement ended. The tires slipped on the red dirt, and I took my foot off the accelerator.",
	"When I was little, Dad would sound the horn at the bend. By the time we pulled up, Ah Ma would be standing under the eaves.",
	"She always checked my feet first. The year I outgrew the slippers by the door, she’d already bought the next size.",
	"I’d told Dad I couldn’t get away from work for the funeral. The truth was, I could have made it if I’d left straight away.",
]

const PHONE_CALL := [
	["Dad", "Are you there yet? It’s nearly dark up there.", "到了沒？山上快天黑了。"],
	["Me", "Almost. I pulled over at the last bend.", "快到了。我在最後一個彎停一下。"],
	["Dad", "There’s a light outside. I left it on for you.", "門口的燈我留著沒關。"],
	["Dad", "When you get inside, go over to the family photos. Ah Ma’s is on the left, beside Pek Kong’s shrine.", "進去先到祖先桌前。阿嬤的照片擺在伯公左邊。"],
	["Dad", "Pay your respects. Tell her you’re sorry you missed the funeral. In your own words, okay?", "去給阿嬤拜一拜。沒來送她，就自己跟她說聲對不起。"],
	["Me", "I know. I’ve been trying to figure out what to say.", "我知道。我一路都在想要怎麼說。"],
	["Dad", "Just start by telling her you’re home.", "先跟她說，你回來了。"],
	["Dad", "Oh, I nearly forgot. Ah Ma made a tape for you before she passed.", "對了，差點忘了。阿嬤走之前留了一卷錄影帶給你。"],
	["Dad", "Your name’s right on the label.", "上面有寫你的名字。"],
	["Me", "She made it for me?", "她特地錄給我的？"],
	["Dad", "I put it in the VCR in the sitting room. Watch it when you’ve settled in.", "我放在客廳的錄影機裡了。等你安頓好再看。"],
	["Dad", "Call me in the morning. It’s all right to stay the night.", "明早再打給我。今晚住那邊就好。"],
]

const AFTER_CALL := [
	"I set the phone face down. When I pulled back onto the road, the first thing I saw was the porch light through the trees.",
	"I tried it out with no one there to hear. Ah Ma, I’m home.",
]

const YARD := [
	"Does nobody take care of this house anymore?",
	"The porch light was still on. In the rain I could see where she’d patched the wire with a strip of tape.",
	"I checked the time in the car before I got out. Six o’clock. Already there was no light between the trees.",
	"I used to know every turn on the way down. Tonight I’d rather stay in my old room and leave when I could see the road.",
]

const HALL := [
	"Pek Kong was in his usual place. On the separate table beside his shrine, a new photograph had been set among the old ones.",
	"It was the one Dad had sent after the funeral. I’d looked at it on my phone. Here I could see the pin holding her collar together.",
	"Ah Ma used to keep a rag folded under the table. She’d wipe the frames while she waited for the kettle.",
	"I stood by the door until the rain thinned to dripping. Then I went to see if she’d kept my room.",
]

const BEDROOM_ARRIVAL := [
	"The bed was still made. The far corner of the blanket sat higher where she used to fold it under twice.",
	"When I was small, she’d tuck me in so tightly I had to work both feet loose before I could get out.",
]

const NIGHT_MEMORY := [
	"I remember working my feet free. My heels stuck to the sheet. It was still summer, then, and Ah Ma was in the doorway.",
	["Ah Ma", "Leave your shoes by the bed. The boards get cold at night.", "鞋子放床邊。晚上地板會冷。"],
	["As a child", "Can you leave the door a little bit open?"],
	["Ah Ma", "I’ll be right outside. Call me if you need me. I’ll hear you.", "阿嬤就在外面。有事叫我，我聽得到。"],
	"She pulled the door to. I waited for the latch to catch. After that, I only remember waking up to a thin red line across the boards.",
	"Then I heard her voice. I waited for her to say my name.",
	"I put my feet down where she’d left my shoes and knelt by the door.",
]

const PEEK := [
	"I could see her slippers at the far end of the gap. I’d worn the same pair that afternoon to carry her washing in.",
	"She stopped in the middle of a phrase. One slipper turned. A second shadow stayed across the boards.",
	"I pulled my hand back from the door. I lay in bed until the window began to get light.",
]

const BREAKFAST := [
	"By breakfast I’d almost worked out how to ask. I waited until she’d scraped the burnt rice from the bottom of the pot.",
	["As a child", "Ah Ma, I heard you outside my room last night. Who were you talking to?"],
	["Ah Ma", "Ah Ma was just praying.", "阿嬤只是在拜拜啦。"],
	["As a child", "I thought someone was standing with you."],
	"She picked a piece of sweet potato out of her own bowl and put it in mine.",
	["Ah Ma", "If you’re still scared in the morning, come get me. Now eat while it’s hot.", "早上還怕的話，就來找阿嬤。先趁熱吃。"],
]

const BACK_IN_ROOM := [
	"I put a hand on the blanket. It was cold under my palm.",
	"I took my hand off the blanket. I heard Dad’s words again. Start by telling her you’re home.",
]

const ANCESTORS := [
	"Ah Ma, I’m home.",
	"I’m sorry I missed your funeral. Dad sent me a picture of the flowers. I looked at it at my desk and went back to work.",
	"I always thought I could come on the next holiday. You never used to ask me when I’d be back. You’d just put the blanket on the bed.",
	"I stood there a little longer. The tape Dad had put aside was still waiting for me in the sitting room.",
]

const SITTING_ARRIVAL := [
	"The lace had slipped down the back of the sofa. When Ah Ma folded the washing here, she’d slide it back up with her elbow.",
	"I used to sit on the floor by her feet. One evening I was sorting socks when I heard her laugh.",
]

const SOFA_MEMORY := [
	"The fan clicked every time it turned. My job was to match the socks, but I’d made a puppet out of one with a hole in the toe.",
	["Ah Ma", "Put that one aside. I’ll mend it later.", "那隻先放旁邊。阿嬤晚一點補。"],
	"She folded a towel over her knees. Then she turned to the other end of the sofa and smiled.",
	["Ah Ma", "You used to do that too. Every time I asked you to help.", "你以前也這樣。每次叫你幫忙就這樣。"],
	"She left the same little pause she always left when someone was about to answer. Then she laughed again.",
	"I looked at the cushion beside her. A loose thread was sticking out of the seam. I could see it perfectly.",
	["As a child", "Ah Ma? Who are you talking to?"],
	"She looked back at me, still smiling. She handed me two socks. One was still warm from her lap.",
	["Ah Ma", "Put these away for me, will you? Then we’ll get you ready for bed.", "幫阿嬤把這個收起來，好不好？等一下就去睡覺。"],
]

const AFTER_SOFA := [
	"The cushion hadn’t moved. The thread had been pulled out or worn away. I had to lean over to see where it used to be.",
	"Dad’s note was on the table beside the couch.",
]

const FATHERS_NOTE := [
	"I left the tape in the player. She had wrapped it in a tea towel before she gave it to me.",
	"I watched a little to make sure it worked. When she started talking to you, I stopped it and wound it back.",
	"In the photo underneath, Dad and his brother are wearing uniforms. Their sister still has on the apron she wore at home.",
	"Ah Ma was thirty when Grandpa died. Dad said she got all three children to school before she went to work.",
	"Some days he came home before she did. Even then, there was always something left for him in the pot.",
]

const TAPE_ONE := [
	["你來啦。阿嬤就想，會不會是你。", "You made it. I thought it might be you."],
	["下雨的話，鞋子放門邊就好。", "If it’s raining, leave your shoes by the door."],
	["你小時候下雨也要跑出去。", "You used to run out in the rain when you were small."],
	["回來兩隻腳都是泥巴，還不肯換鞋。", "You’d come back with mud all over your feet and refuse to change."],
	["你阿公走了以後，我天天煮一大鍋粥。", "After your grandpa died, I made a big pot of porridge every day."],
	["三個孩子吃飽了，我才去上工。", "I went to work once all three children had eaten."],
	["你爸去城裡工作，我還是煮那麼多。", "When your dad left for work in the city, I still made the same amount."],
	["後來只剩我一個人，我就把小鍋找出來。", "When it was just me, I got the little pot out again."],
	["天黑了就住一晚。那條路白天都看不清楚。", "If it’s dark, stay the night. That road’s hard enough to see in daylight."],
	["我房間的梳妝台上有一束香。", "There’s a bundle of incense on the dresser in my room."],
	["拿三支，插在照片前的香爐，點起來。", "Take three sticks and light them in the burner in front of the family photos."],
	["做完了再回來。阿嬤還有話要跟你說。", "Come back when you’re done. Ah Ma has something else to tell you."],
]
const TAPE_GLANCE_BEAT := 7

const TAPE_TWO := [
	["你還記得阿公那張小照片嗎？", "Do you remember that little picture of Grandpa?"],
	["就在客廳的櫃子裡。", "It’s inside the cabinet in the sitting room."],
	["以前你問我，為什麼阿公沒有變老。", "You once asked me why Grandpa never got old."],
	["那時候我說，照片裡的人不會老。", "I told you people don’t get old inside photographs."],
	["幫阿嬤把它擺在照片前的香爐旁邊。", "Could you set it beside the burner at the ancestor altar for me?"],
]

const TAPE_THREE := [
	["你還記得那三個小杯子嗎？", "Do you remember the three little cups?"],
	["杯子、茶和酒都在廚房。", "The cups, the tea, and the wine are in the kitchen."],
	["把三個杯子擺在祖先桌前面。左右倒茶，中間倒酒。", "Set the cups at the front of the ancestor table. Tea on either side, wine in the middle."],
	["櫃子上也有一疊金紙。先拿著，別急著燒。", "There’s joss paper on the shelf. Take it with you and leave it folded."],
	["出去看看金爐。經過浴室的時候，也幫阿嬤看一下水井。", "Check the burner out back. On your way, have a look at the well for me."],
	["阿嬤還有一件事，想慢慢跟你說。", "There’s one more thing I need to tell you. Let me take my time."],
]
const TAPE_FOUR := [
	["你爸去了城裡工作。你姑姑去了新加坡。", "Your dad went to work in the city. Your aunt went to Singapore."],
	["你叔叔也搬走了。四十五歲那年，家裡就剩我一個。", "Then your uncle moved out. By forty-five, I was the only one here."],
	["我把收音機開著。有一天我才發現，我已經好幾天沒開口了。", "I left the radio on. One day I realized I hadn’t spoken a word in days."],
	["那年我四十六歲。我去找了一個人，問他能不能把你阿公請回來。", "I was forty-six. I went to see a man and asked if he could bring your Ah Gong home."],
	["他說，要先讓我看得見。後來，只有我看得見你阿公。", "He said he’d have to let me see first. Afterward, I was the only one who could see your grandfather."],
	["有時候他坐在沙發上，陪我摺衣服。我跟他講你們寄來的信。", "Sometimes he sat beside me while I folded the washing. I’d tell him what was in your letters."],
	["有一回，他笑到咳嗽。我差一點就起來幫他倒水。", "Once he laughed until he coughed. I almost got up to pour him a glass of water."],
	["我房裡的衣櫃，最下面收了一個罐子。你小時候，我把糖藏在同一個地方。", "I put a jar at the bottom of my wardrobe. Remember where I used to hide the sweets?"],
	["把它搬到屋後的金爐旁邊。在屋裡，先別開蓋。", "Take it out to the burner. Keep the lid on while you’re inside."],
]
const TAPE_FIVE := [
	["你小時候問我，半夜在跟誰說話。我說阿嬤只是在拜拜。", "You asked me who I talked to at night. I told you I was just praying."],
	["那個人說，你阿公受的苦已經完了。阿修羅、地獄，他都走過了。", "The man said your grandpa had finished suffering. He’d been through the Asura realm and through hell."],
	["他本來要往天上去，再投胎。我偏要那個人把他叫回來。", "He was on his way to heaven and another life. I asked the man to call him back anyway."],
	["回來的時候，他很餓。我煮的東西，他連碰都碰不到。", "He came back hungry. He couldn’t even touch the food I cooked."],
	["以前我跟你說，我去醫院是去檢查。你還把糖塞進我的包包。", "I used to tell you I was going to the hospital for a checkup. You’d slip a sweet into my bag."],
	["我是去拿那些沒能出生的孩子的遺體。你在罐子裡看到的，就是他們。", "I went for the remains of babies who never got to be born. That’s what you saw in the jar."],
	["我每天晚上燒。有幾年我還在數。後來數到幾千，就不敢再數了。", "I burned them every night. For years I kept count. I’d reached the thousands when I stopped counting."],
	["有時我聽到小孩跑過走廊。你阿公一靠近，聲音就停了。", "Sometimes I heard children running in the hall. Whenever your grandpa came close, it went quiet."],
	["最近，燒了也沒用。昨晚我站在浴室，手抓著井邊。", "Lately it hasn’t been enough. Last night I was in the bathroom with my hands on the well."],
	["我叫自己的手放開。它們反而抓得更緊。", "I told my hands to let go. They held on tighter."],
	["我先叫你點香、倒茶。那些事你都熟。我怕一開始就講，你會直接走。", "I started with incense and tea because you knew how. I thought you’d leave if I told you everything at once."],
	["到浴室去看看水井。你要是還願意留下，去我梳妝台拿那個小鐵盒。", "Look at the well. If you still want to stay, there’s a little tin on my dresser."],
	["在祖先桌前，把裡面的白粉抹一點在眉心。就像那個人當初教我的。", "At the ancestor altar, put a little of the white powder between your eyebrows. That’s how the man taught me to see."],
	["做完了，就把金紙放在罐子旁邊，一起燒掉。火熄了再進來。", "After that, put the paper beside the jar and burn them together. Come in once the fire goes out."],
]

const TAPE_SIX := [
	["火熄了嗎？你可以坐一下了。坐阿嬤平常坐的地方。", "Has the fire gone out? You can sit down now. Where Ah Ma used to sit."],
	["我以前叫你怕就來找我。這一次，換我來找你。", "I used to tell you to come get me if you were scared. This time I’ll come to you."],
	["先把眼睛閉起來。想睜開的時候，再睜開。", "Close your eyes first. Open them when you’re ready."],
	["阿嬤在這裡。", "Ah Ma is here."],
]
const TAPES := [TAPE_ONE, TAPE_TWO, TAPE_THREE, TAPE_FOUR, TAPE_FIVE, TAPE_SIX]
const FINAL_CARD := "阿嬤\n在這裡"
const INSTRUCTIONS := [
	"拿三支香，插在祖先照片前的香爐。\nLight three sticks of incense at the ancestor altar.",
	"把阿公的照片擺在祖先桌的香爐旁邊。\nSet Grandpa’s portrait beside the ancestor incense burner.",
	"祖先桌上擺三個杯子。左右倒茶，中間倒酒。\nSet out three cups at the ancestor altar. Tea on either side, wine in the middle. Take the paper and check the burner and the well.",
	"我房裡的衣櫃，最下面。有個罐子。\nThe jar is where I used to hide the sweets, at the bottom of my wardrobe. Take it to the covered burner.",
	"先去看井。再拿鐵盒，到祖先桌前抹一點白粉。\nCheck the well. Take the tin from my dresser and mark your forehead at the ancestor altar. Then burn the paper and jar together.",
	"坐阿嬤平常坐的地方。先把眼睛閉起來。\nSit where Ah Ma used to sit. Close your eyes. Open them when you’re ready.",
]

const WARDROBE_SHELF := [
	"The lowest shelf barely took up half the depth of the cupboard. The front edge had a narrow seam all the way across.",
	"I used to wait for her to leave the room so I could take a sweet. They were never in any of the tins.",
]
const WARDROBE_TAB := ["The bit of red cloth wasn’t caught in the seam. Someone had nailed it there so it could be pulled."]
const WARDROBE_RAISED := ["A pocket of cold air came out from under the board. Ah Ma had made room for two things."]
const HOSPITAL_SLIPS := [
	"A stack of receipts, the paper thinner toward the bottom. They all had Ah Ma’s name on them in the same careful handwriting.",
	"Some were old enough that the print had gone pale. One had the mark I’d left stamping a wet ring on it with my glass.",
	"She used to slip the receipts into her bag when I asked how the checkup went. She always said the same thing. Everything’s fine.",
]
const VESSEL_FOUND := [
	"I reached down for the clay figure. I could see the seam where its lid fitted into the base.",
]
const VESSEL_PLACED := ["I had to lower it with both hands. The sound it made was heavier than the jar looked."]
const VESSEL_INSIDE := [
	"The lid scraped halfway open. Under it were rolls of cloth, packed tightly enough to hold their shape.",
	"I thought the smallest one was just a corner of the wrapping. When the cloth moved, I let the lid fall back.",
	"From the kitchen I could see the television’s reflection in the hall window. The next part of the tape was still waiting.",
]
const WELL_RECONSTRUCTION := [
	"Dad said they’d found her here. I’d pictured her by the sink with the tap still running.",
	"The rope rubbed a groove in the concrete. From this side, I could see where somebody had tried to hold on.",
	"I thought about her hands moving without her. Then I heard the bucket go down.",
]
const BACK_FROM_WELL := [
	"The rope hung still. When Dad said they’d found her in here, I’d never thought to ask how far down.",
	"I had my keys in my pocket. I held them there for a moment, then went to fetch the tin.",
]
const CHALK_FOUND := ["Most of it had turned to powder. One white corner was left, polished smooth where her thumb used to go."]
const FOREHEAD_MARK := [
	"The powder felt cold between my eyebrows. I could see the white of it on my fingers.",
	"I kept my eyes on the photograph. For a moment, the words from behind my bedroom door sounded close enough to answer.",
	"The smoke was still rising. I set the tin down and went for the burner before I could change my mind.",
]
const FIRE_BEATS := [
	"The edge of the paper caught first. It lifted and curled over the rim of the vessel.",
	"I watched until the paper stopped moving. Usually, when rain stopped out here, the insects started up again.",
	"The fire sank below the opening. The kitchen, the eaves, and the trees beyond them had all gone quiet.",
]
const SIT_DOWN := [
	"I sat where her weight had pressed the cushion flat. The other cushion rose a little against my leg.",
	"I’d spent years thinking the empty seat belonged to someone she missed.",
]
const FINAL_LINE := "Behind him, something held her by the throat. I waited for her to tell me to go back to bed."


const OFFERING_ITEMS := {
	&"cups": ["Three cups", "Three little cups nested together. There’s a chip where Ah Ma used to catch the bottom one with her thumbnail.", "I slipped my fingers between the cups so they wouldn’t knock together."],
	&"tea": ["Tea jar", "A lidded jar of tea. The lid stuck a little where the tea had dried around its lip.", "The old lid shifted when I lifted it. It smelled like the tea she kept warm all day."],
	&"wine": ["Rice wine", "A brown bottle of rice wine, the kind she kept for the altar.", "I put the stopper back in before I took the bottle."],
	&"paper": ["Joss paper", "A stack of folded joss paper. She’d tucked the corners in so the drafts wouldn’t lift them.", "I tucked the packet away, still folded."],
}

const CUPS_PLACED := "Ah Ma used to line the cups up with the front edge of the table. I straightened the middle one."
const TEA_POURED := "I poured tea into the two outer cups. Ah Ma always left a little room at the top."
const WINE_POURED := "A thin line of wine ran down the bottle. I wiped it with my thumb."
const FIRST_BURNER := [
	"The lid had left a black ring on the rim. I could turn it a little before it caught.",
	"Back when I could barely see over it, Ah Ma used to tell me to stand upwind. I couldn’t remember her ever saying what made this one stink.",
]
const FIRST_WELL := [
	"Ah Ma used to lower a bucket here. On hot days the first water out was always cold enough to hurt your teeth.",
	"I rested my hand on the concrete. The rope was pulled tight. I couldn’t see where it ended.",
]

const PORTRAIT_ARRIVAL := "I found him behind the bowls. Looking at him up close, I thought he could have been a man my own age."
const PORTRAIT_NOTE := "Ah Ma had written on the back. “Sick for months. He went peacefully.”"
const PORTRAIT_PLACED := [
	"I opened the stand, and the frame leaned back the way it had on the shelf.",
	"In all the other pictures on the table, there was a wedding or a birthday or a yard full of people. In this one he was alone.",
	"I tried to see Dad in his face. From the side, with the smoke in front of the glass, I could.",
]


const INCENSE_BUNDLE := "The bundle was tied with a bit of cotton thread. Ah Ma always saved the thread from the rice sacks."
const INCENSE_LIT := [
	"I held the match under the sticks until each tip held a little orange light.",
	"The smell took me back to mornings when she’d open the house before anyone else was up.",
	"The sitting room was dark. Ah Ma used to sit at the far end of the couch, with a cushion laid flat beside her.",
	"Once, I asked if I could sit there. She moved the cushion. Then she looked at the empty spot a moment before she let me climb up.",
	"On the tape she’d looked to that same side. I wanted to see the rest.",
]