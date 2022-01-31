Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914052CA5
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 14:12:28 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
	by Aruba Outgoing Smtp  with ESMTPSA
	id EXPrnZx5B0FuyEXPsnVICx; Mon, 31 Jan 2022 15:12:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1643638347; bh=sDyaq/0B4ALOLPOG/uYOlFCRl7Zioylqs/GxdL3J+hQ=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=PDzu8KW0miLjcQQRX+sK/cbuodLlboZcC0OQLgmaTTywDYXCOeylTwx5it5MhT/20
	 Ca2sVeUudKDfaO9fAjPlkhV7mrUsmmHG5PTlngQQp28hR/DwhnBt/wmajPbw7p0fE3
	 c2hwzPi3e9R+iUCaIfTMnFF8WuSJzIukvKRqtiOvAj+H6W4maKmMPBqEaci28pj1BR
	 SuPHzVvWldifmjZGFj528FxPW/MkZVJjm36k8c/RrnGkUQFl5C/k9F9posMSXhOIsf
	 hPjEc4Yc7AxcQCDTXAefkhm0GdkXIqzTkwrsg3QJg/rL79OkS1zTNBwSO9bgUynkJq
	 CFvitpLb4qugA==
Message-ID: <3a3971a7-daa8-3984-637d-a0e052c34b4a@benettiengineering.com>
Date: Mon, 31 Jan 2022 15:12:23 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Please test U-Boot Allwinner F1C100s support
Content-Language: en-US
To: Andre Przywara <andre.przywara@foss.arm.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 George Hilliard <thirtythreeforty@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
References: <20220131125746.4702fac0@donnerap.cambridge.arm.com>
 <813A2F53-7592-4DDF-86B6-993BFB1A6819@benettiengineering.com>
 <20220131135749.4d9f9a14@donnerap.cambridge.arm.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220131135749.4d9f9a14@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIRyW4Lu2F0AW6YULZZ4FrEsoHl0QbkbifpjAgakpDjk/4z7GThVuU1CFSo9fs7/zLIbfqWr5wuFhXNaPUHZejlsVke4X9j6z9tAVcFuL9K3mr0wAHVo
 A9kbJcVi7AxSI1JQOMLubos3yo+Lql56RQa+557Ey0Q9QFBc4E6tav7XfPaBXLrwhwjahScdyrP73iBEwl9i7TtiGJyuoIk/E7YE5Hg4iJWr+1gGtp/FY61N
 +ifF7TMqs5WQKdacrMP2P7QhFR+2t0Qw5/0WYg/X7vgzg0qQML9t1QMZA/sbIYyEAzlLhaqS/YdhMyM6OeeGZsbbOkrQ0TTpz2H6RqBsKfFsm/NccQA3blo9
 ur30hsmN5FAQR6bY6exP31VBLphhVC33AZMoXJXaVxpSUyVPhkP5J4KY+JbiVkTi3N+7Fnyk

Hi Andre,

On 31/01/22 14:57, Andre Przywara wrote:
> On Mon, 31 Jan 2022 14:07:54 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
> Hi Giulio,
> 
>>> Il giorno 31 gen 2022, alle ore 13:57, Andre Przywara <andre.przywara@foss.arm.com> ha scritto:
>>>
>>> ﻿On Mon, 31 Jan 2022 13:17:52 +0100
>>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>>    
>>>> Hi All,
>>>>
>>>> I've tried several times on both F1C100s and F1C200s, maybe I'm doing
>>>> something wrong but it doesn't work :-/
>>>>
>>>> I burn sd-card with:
>>>> # sudo dd if=u-boot-sunxi-with-spl.bin of=/dev/sdb bs=1k seek=8
>>>>
>>>> I've triple-checked that the file has been written there by dumping the
>>>> sd-card and I see it's written at 0x2000, so 8K offset, like the mangoPI
>>>> image for example. But no uart output.
>>>
>>> I haven't looked in detail what would be needed for the SPL part of the
>>> MMC driver to really work, I just checked that the base addresses are
>>> correct, the pinmux looked alright as well.
>>> The DT nodes are not needed for the SPL, and I don't see other changes
>>> related to MMC in the original series?
>>
>> Yes that’s true.
>>
>>> Do you see UART output from the SPL, or nothing at all?
>>
>> Unfortunately nothing either with SPL
> 
> That is interesting. If there would be a problem with the MMC code, you
> should at least see the SPL banner, and then see it failing loading U-Boot
> proper. 

Yes

> I take it FEL boot works? 

Yes, it does work on both F1C100s and 200s boards :-/

> Maybe we miss something with the clock
> setup that the BROM does for us during FEL operation?

Yes, it sounds like that, it's a classic

> Can you try to clear the area between the end of the SPL and the beginning
> of the U-Boot proper image (dd if=/dev/zero of=/dev/sdX bs=1k seek=32
> count=8)?

I've zeroed the first 32MB of sd-card now, so we're sure nothing can 
interfere.

# sudo dd if=/dev/zero of=/dev/sda bs=1M count=32
# sync
# sudo dd if=u-boot-sunxi-with-spl.bin of=/dev/sda bs=1k seek=8
# sync

(/dev/sda is my sd-card for real since I have m.2 ssd)

> Does any other branch work with SD card booting? Can you check the SPL
> size in there (with hexdump -C u-boot-sunxi-with-spl.bin | head, check for
> the halfword at 0x10)?

This is the result of the command:
```
00000000  16 00 00 ea 65 47 4f 4e  2e 42 54 30 64 04 71 7c 
|....eGON.BT0d.q||
00000010  00 60 00 00 53 50 4c 02  00 00 00 00 00 00 00 00 
|.`..SPL.........|
00000020  2c 00 00 00 00 00 00 00  00 00 00 00 73 75 6e 69 
|,...........suni|
00000030  76 2d 66 31 63 31 30 30  73 2d 6c 69 63 68 65 65 
|v-f1c100s-lichee|
00000040  70 69 2d 6e 61 6e 6f 00  00 00 00 00 00 00 00 00 
|pi-nano.........|
00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 
|................|
00000060  0f 00 00 ea 14 f0 9f e5  14 f0 9f e5 14 f0 9f e5 
|................|
00000070  14 f0 9f e5 14 f0 9f e5  14 f0 9f e5 14 f0 9f e5 
|................|
00000080  a0 00 00 00 a0 00 00 00  a0 00 00 00 a0 00 00 00 
|................|
00000090  a0 00 00 00 a0 00 00 00  a0 00 00 00 ef be ad de 
|................|
```

>>> And you are not using UART0 on the PortF pins, so multiplexed with the
>>> MMC, I guess?
>>
>> I use PE0 and PE1 Uart0 according to dts.
>>
>> Have you got such board to test it?
> 
> That's the problem: I am driving blindfolded, because I don't have
> hardware :-(

Yeah, but I've read you've ordered it! :-)

Jesse has it working so maybe he can check how clocks are setup after 
BROM using u-boot itself. I've never understood why Allwinner/Rockchip 
place jtag on the sd-card pins. I really hate it, it would take so few 
with free jtag pins to check this :-/

Ciao :-)
-- 
Giulio Benetti
Benetti Engineering sas

> Cheers,
> Andre
> 
>> Or we can wait for Jesse or George.
>>
>> I’ve used the git you’ve pointed.
>>
>> Anyway I think we’re very close to have it working.
>>
>> At least my work “behind the scenes” will be worth, right Jesse :-)?
>>
>> Best regards
>> —-
>> Giulio Benetti
>> Benetti Engineering sas
>>
>>>
>>> Cheers,
>>> Andre
>>>
>>>
>>>    
>>>>
>>>> Am I doing something wrong?
>>>>
>>>> Best regards
>>>    
>>
>>
> 

