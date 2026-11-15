extends RefCounted

const DRIVE := [
	"The tires slipped as soon as I hit the dirt road.",
	"Dad used to honk at this bend. Ah Ma would be out front by the time we got there.",
	"She always kept slippers by the door for me. Somehow they still fit every year.",
	"I told Dad I had to work through the funeral. I could’ve left early.",
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
	"There’s the porch light. Almost there.",
	"Ah Ma, I’m home. I could start with that.",
]

const YARD := [
	"Does nobody take care of this house anymore?",
	"She’d fixed the porch light with tape again.",
	"It was only six. I could barely see where I’d parked.",
	"I’ll sleep here. I can drive back in the morning.",
]

const HALL := [
	"Pek Kong was right where I remembered him.",
	"Dad had put Ah Ma’s picture with the family photos beside the shrine.",
	"She used to wipe those frames while the kettle boiled.",
	"I should say hello before I do anything else.",
]

const BEDROOM_ARRIVAL := [
	"She still had my blanket from the summer holidays.",
	"I’ll put my bag here if I stay.",
]

const NIGHT_MEMORY := [
	"I remembered the light under my door. I was small enough to get down flat on the floor.",
	["Ah Ma", "Keep your slippers by the bed. The floor gets cold.", "拖鞋放床邊。晚上地板會冷。"],
	["You, as a child", "Can you leave it open a bit?", "門可以留一點縫嗎？"],
	["Ah Ma", "I’ll be right outside. Just call me.", "阿嬤就在外面。有事就叫我。"],
	"I fell asleep. When I woke up, there was red light under the door.",
	"I could hear Ah Ma talking.",
	"I got out of bed to see who was there.",
]

const PEEK := [
	"I could see Ah Ma’s slippers.",
	"She stopped talking. Her feet turned. The other shadow stayed put.",
	"I went back to bed. I didn’t sleep.",
]

const BREAKFAST := [
	"I waited until breakfast to ask her.",
	["You, as a child", "Ah Ma, who were you talking to last night?", "阿嬤，你昨晚在跟誰講話？"],
	["Ah Ma", "Just praying.", "拜拜啦。"],
	["You, as a child", "But I saw somebody.", "可是我有看到別人啊。"],
	"She gave me the sweet potato from her bowl.",
	["Ah Ma", "Next time you get scared, come get me. Eat before it gets cold.", "下次會怕就來找阿嬤。快吃，等一下就涼了。"],
]

const ANCESTORS := [
	"Ah Ma, I’m home.",
	"I’m sorry I missed your funeral.",
	"I saw Dad’s name on my phone that last week. I thought I’d call him back after dinner.",
	"I wish I’d heard you pick up one more time.",
	"I wiped my eyes on my sleeve. Dad said she’d left me something in the sitting room.",
]

const SITTING_ARRIVAL := [
	"She used to fold the washing here.",
	"I’d sit on the floor and pair up her socks.",
]

const SOFA_MEMORY := [
	"I’d stuck my finger through a hole in one of her socks.",
	["Ah Ma", "Give me that one. I’ll fix it later.", "那隻給阿嬤，晚點再補。"],
	"She turned to the other end of the couch.",
	["Ah Ma", "You used to do that too. Remember?", "你以前也會這樣。還記得嗎？"],
	"She waited a second. Then she laughed.",
	"The seat beside her was empty.",
	["You, as a child", "Ah Ma? Who’s there?", "阿嬤？誰在那裡？"],
	"She handed me a pair of socks.",
	["Ah Ma", "Put these away for me. It’s almost bedtime.", "幫阿嬤把襪子收起來。等一下要睡覺了。"],
]

const FATHERS_NOTE := [
	"‘The tape’s in the player. Ah Ma asked me to have you come today if you could.’",
	"‘I watched enough to check it worked. The rest is for you. —Dad’",
	"That’s Dad in the photo. His brother’s next to him. Their sister’s still in her apron.",
	"Grandpa got sick and died when Ah Ma was thirty. She raised all three on her own.",
	"Dad says there was always something for him to eat when he got home.",
]

const TAPE_ONE := [
	["你來啦。食飽未？", "You made it. Have you eaten?"],
	["阿嬤不知道你什麼時候會看到這卷。", "I don’t know when you’ll see this."],
	["廚房那個小鍋還在。你回來餓了，可以自己煮。", "The little pot’s still in the kitchen. Make something if you’re hungry."],
	["我有件事拜託你。你阿公生日那天，我都會給他上香。", "Will you do something for me? I always light incense on Grandpa’s birthday."],
	["今天要是他生日，就替阿嬤拜一下，好不好？", "If that’s today, would you do it for me?"],
	["", "Dad asked me to come today. Is it Grandpa’s birthday?"],
	["你阿公走了以後，你爸他們每天早上都吃稀飯。", "After Grandpa died, your dad and the others had rice porridge every morning."],
	["三個都吃飽了，我才去上工。", "I’d feed all three kids, then go to work."],
	["你爸搬出去了，我早上還是煮一大鍋。", "Your dad moved out and I still made a whole pot every morning."],
	["我一個人哪吃得完？後來就換小鍋了。", "How was I meant to finish all that? I got the little pot out in the end."],
	["天黑了就別下山，住一晚。", "Stay over if it’s dark. Don’t drive back down."],
	["我梳妝台上有香。火柴在布袋裡。", "There’s incense on my dresser. Matches are in my market bag."],
	["拿三支，到祖先桌前點。", "Light three sticks at the ancestor altar."],
	["點完再回來。我還有話跟你說。", "Come back after. I’ve got more to tell you."],
]
const TAPE_GLANCE_BEAT := 8
const TAPE_ONE_REWATCH := TAPE_ONE + [
	["倒帶的聲音，我聽得到。", "I can hear you rewinding."],
]

const TAPE_TWO := [
	["你還記得阿公那張小照片嗎？", "Remember that little photo of Grandpa?"],
	["在客廳櫃子裡。", "It’s in the cabinet in the sitting room."],
	["你以前問我，阿公怎麼都沒變老。", "You used to ask why Grandpa never got old."],
	["我說照片裡的人不會老。", "I said people don’t get old in photos."],
	["幫我放在祖先桌上，香爐旁邊。", "Put it beside the incense burner at the ancestor altar."],
]

const TAPE_THREE := [
	["廚房有三個小杯子。你爸小時候老問，為什麼還要擺三杯。", "There are three cups in the kitchen. Your dad used to ask why we still set out three."],
	["茶跟米酒也在那裡。", "The tea and rice wine are there too."],
	["杯子擺祖先桌上。你阿公喝米酒，我們喝茶。", "Set the cups at the ancestor altar. Grandpa drank rice wine. The rest of us had tea."],
	["我把他那杯缺口朝前。你一看就知道是哪杯。", "I turn the chipped side of his cup toward us. You’ll know the one."],
	["架上的金紙先拿著，別燒。", "Take the joss paper off the shelf. Don’t burn it yet."],
	["去屋後看看金爐。浴室裡的井也看一下。", "Check the burner out back. Take a look at the well in the bathroom too."],
	["都看過了，再回來找我。", "Come back when you’re done."],
]
const TAPE_FOUR := [
	["你爸去城裡找工作，你姑姑去新加坡。", "Your dad went to the city for work. Your aunt went to Singapore."],
	["你叔叔也搬了。我四十五歲那年，只剩我一個。", "Your uncle moved out too. I was forty-five, living here on my own."],
	["有一天我把收音機關掉，才發現我好幾天沒跟人說話了。", "One day I turned off the radio. I hadn’t talked to anyone in days."],
	["你阿公以前就坐你旁邊那個位子。", "That seat next to you used to be Grandpa’s."],
	["我那時還是不愛坐那邊。坐下去總覺得有人會回來。", "I still left it free. I kept thinking someone would come home."],
	["你們過年回來，我老是拉著你多住幾天。記得嗎？", "I used to ask you to stay a few more days at New Year. Remember?"],
	["你小時候嫌我煮太多。走了又叫你爸把菜帶回去。", "You’d say I cooked too much. Then you’d get Dad to take the leftovers home."],
	["我衣櫃最下面有個罐子。以前糖就藏那裡。", "There’s a jar at the bottom of my wardrobe. Where I used to hide the sweets."],
	["搬到屋後金爐旁邊。別在屋裡打開。", "Take it out to the burner. Don’t open it in the house."],
]
const TAPE_FIVE := [
	["我跟你爸說，叫你挑今天來。阿嬤知道你會幫我。", "I asked your dad to bring you here today. I knew you’d help me."],
	["等一下。阿嬤要跟你說實話。", "Wait. I need to tell you the truth."],
	["你小時候問我，半夜在跟誰說話。我騙你說我在拜拜。", "You asked who I was talking to that night. I said I was praying."],
	["我四十六歲那年，去找了個師公。我求他把阿公叫回來。", "When I was forty-six I went to a medium. I begged him to bring Grandpa back."],
	["師公說，阿修羅、地獄，你阿公都熬過去了。", "The master said Grandpa had already made it through the Asura realm and hell."],
	["他本來要上天，再去投胎。是我硬把他叫了回來。", "He was meant to go on to heaven and be reborn. I made him come back."],
	["他們教我開眼。後來只要我摺衣服，阿公就會坐在我旁邊。", "They taught me to see him. After that, Grandpa used to sit with me while I folded the washing."],
	["可是他變成餓鬼了。我煮的飯，他一口也吃不了。", "But he’d come back a hungry ghost. He couldn’t eat a bite of my cooking."],
	["你還記得我說要去醫院檢查嗎？", "Remember when I said I was going to the hospital for checkups?"],
	["罐子裡是那些沒能出生的孩子。我是去帶他們回來。", "The jar has the babies who died before they were born. That’s what I went to the hospital for."],
	["我每晚都燒。後來幾千個了，我就不敢數了。", "I burned them every night. I stopped counting after a few thousand."],
	["火一熄，他就吃他們的魂。跑掉的還躲在屋裡。", "When the fire went out, he ate their souls. The ones that got away still hide in the house."],
	["他一過來，走廊裡那些小孩就不敢出聲。", "Whenever he came close, the children in the hall went quiet."],
	["有一次我聽到小孩在叫我。回頭一看，是你阿公。", "Once I heard a child call me. I turned around. It was Grandpa."],
	["這三十多年，我以為火還壓得住他。現在我怕的那個，已經不像你阿公了。", "For thirty years I thought the fire would keep him down. What’s here now hardly acts like Grandpa."],
	["昨晚我去關水，手一直去碰井邊。我知道總有一天會下去。", "Last night I went to turn off the tap. My hands kept reaching for the well. I know where I’ll end up."],
	["我先叫你點香、倒茶。我怕你一聽完，就不肯留下。", "I asked you to light incense and pour tea first. I thought you’d leave if I told you."],
	["", "She looked at the empty seat."],
	["我沒別的辦法了。你去看一下井邊，然後去梳妝台找鐵盒。", "I don’t know what else to do. Look at the well, then take the tin from my dresser."],
	["在祖先桌前，抹一點白粉在眉心。師公那時就是這樣教我的。", "At the ancestor altar, put a little white powder between your eyebrows. That’s how he taught me to see."],
	["再把金紙跟罐子一起燒。等火熄了再進來。", "Burn the joss paper with the jar. Come in when the fire goes out."],
]

const CONFESSION_MEMORY_BEAT := 2
const RITUAL_MEMORY := [
	"I slipped outside one afternoon. I could hear the drum from my room.",
	["Ah Ma", "Please. I just want to talk to him.", "拜託。我只是想跟他講講話。"],
	"There were four of them. I couldn’t understand what they were saying.",
	"I couldn’t see what was under the cloth. I remember Ah Ma holding out both hands.",
]

const TAPE_SIX := [
	["你回來看到這裡，先坐好。", "If you’re back and you’re seeing this, just stay seated."],
	["你爸不知道。他問過，我都跟他說沒事。", "Your dad used to ask if I was all right. I always said yes."],
	["以前你怕了，就來找我。這次換我來找你。", "You used to come get me when you were scared. I’ll come to you this time."],
	["阿嬤只想再見他一面。怎麼會變成這樣。", "I only wanted to see him again. It wasn’t supposed to turn out like this."],
	["歹勢，我的乖孫。", "I’m sorry, sweetheart."],
]
const TAPES := [TAPE_ONE, TAPE_TWO, TAPE_THREE, TAPE_FOUR, TAPE_FIVE, TAPE_SIX]
const FINAL_CARD := "歹勢\n我的乖孫"
const INSTRUCTIONS := [
	"拿三支香，插在祖先照片前的香爐。\nLight three sticks of incense at the ancestor altar.",
	"把阿公的照片擺在祖先桌的香爐旁邊。\nSet Grandpa’s portrait beside the ancestor incense burner.",
	"祖先桌上擺三個杯子。阿公那杯有缺口，倒米酒。\nSet out the three cups at the ancestor altar. Grandpa drank rice wine. Look for his chipped cup. Take the paper and check the burner and the well.",
	"我房裡的衣櫃，最下面。有個罐子。\nThe jar is where I used to hide the sweets, at the bottom of my wardrobe. Take it to the covered burner.",
	"先去看井。再拿鐵盒，到祖先桌前抹一點白粉。\nCheck the well. Take the tin from my dresser and mark your forehead at the ancestor altar. Then burn the paper and jar together.",
	"看到這裡，先坐好。\nStay seated and watch the last recording.",
]

const WARDROBE_SHELF := [
	"The shelf’s too shallow. There’s a seam along the front.",
	"I never could find where she hid the sweets.",
]
const WARDROBE_TAB := ["The red cloth is nailed in. It’s a pull tab."]
const WARDROBE_RAISED := ["There’s a space under the shelf."]
const HOSPITAL_SLIPS := [
	"Ah Ma’s name is on all these hospital slips.",
	"This one’s from when I was little.",
	"She always said the checkup went fine.",
]
const VESSEL_FOUND := [
	"It’s shaped like a baby. The seam goes all the way around.",
]
const VESSEL_PLACED := ["God, that smells."]
const VESSEL_INSIDE := [
	"There’s something wrapped up inside.",
	"One of them moved.",
	"I need to see what’s on the rest of the tape.",
]
const WELL_TRACE := [
	"Dad said they found her in the well. I’d never come in here to look.",
	"There are two fresh scrapes on the inside of the rim. One stops where the concrete broke off.",
	"I wish I knew who’d taken her hands off it.",
]

const CHALK_FOUND := ["There’s a little piece of chalk left under all that powder."]

const FOREHEAD_MARK := [
	"Cold. I can still feel it between my eyes.",
	"For a second, I heard the chanting from when I was a kid.",
	"I should get back to the burner.",
]

const FIRE_BEATS := [
	"The paper caught first.",
	"I stood back and waited.",
	"The rain had stopped. Where were the insects?",
]

const HALL_AFTER_BURN := [
	"The incense was still lit.",
	"I thought it had worked.",
]

const BEDROOM_ECHO := [
	"I left that door open.",
	"That’s the same red light.",
	"The footsteps were on my side this time.",
	"I stayed very still.",
]

const RECEIPT_BACK := [
	"Ah Ma wrote something on the back.",
	"‘You called me from the bedroom again. You were already in my arms.’",
	"I don’t remember calling her.",
]

const AFTERMATH := [
	"Dad said to call him in the morning. What am I supposed to tell him?",
]

const FINAL_LINE := "Ah Ma?"

const OFFERING_ITEMS := {
	&"cups": ["Three cups", "Three small cups. One has a chipped rim.", "I took all three."],
	&"tea": ["Tea jar", "The jar Ah Ma used for tea.", "It still smells like her tea."],
	&"wine": ["Rice wine", "Ah Ma kept it for the altar.", "I put the stopper back in."],
	&"paper": ["Joss paper", "A stack of folded joss paper.", "I’ll need this at the burner."],
}

const CUPS_PLACED := "Three cups. Just like she showed me."
const FIRST_BURNER := [
	"There’s a black ring under the lid.",
	"She used to tell me to stand upwind.",
]
const FIRST_WELL := [
	"Ah Ma used to bring up cold water on hot days.",
	"The rope’s tight. I can’t see the bucket.",
]

const PORTRAIT_ARRIVAL := "He looks about my age."
const PORTRAIT_NOTE := "Ah Ma wrote ‘Sick for months. He went peacefully.’"
const PORTRAIT_PLACED := [
	"There he is.",
	"I don’t think I’ve ever seen a picture of him with Dad.",
	"He looks a bit like Dad from this side.",
]


const INCENSE_BUNDLE := "She tied the incense with thread from the rice bag."
const INCENSE_LIT := [
	"The sticks caught.",
	"The house used to smell like this in the morning.",
	"Ah Ma always told me to stand back so I wouldn’t get ash on my shirt.",
	"I’d forgotten that.",
	"Something creaked at the other end of the hall.",
]
