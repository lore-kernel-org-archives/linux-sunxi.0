Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A676729CA
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 12:33:04 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
	by Aruba Outgoing Smtp  with ESMTPSA
	id EVd2nWpuL0FuyEVd3nTbEg; Mon, 31 Jan 2022 13:17:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1643631476; bh=mWOxGmMoZAJal/z/CNPd5NgpF9uKB1CZ+zLdcHpvB9k=;
	h=Date:MIME-Version:Subject:From:To:Content-Type;
	b=JWnyEsYtL+/j6249V8HKQG4VlAbEnFkdQ5aV2JG3SwjHovik5/mPIFYa0U/zXTIrs
	 CGJrPu9VjZnFD7pceKFDxaZx2cmiGZCiGTBBv0IxOl9hppgVTNMQq9oXZY2CO3os+F
	 ujxik7nuftqrLeljknQq4sEGn+T5pVpSgBjSOVKP9AzCe8YQ/BJBnPzjzpgsNUYTbk
	 NmLi8uoF4WtiEqPXYqqpZpAxBAJ1WYlQmKTr6GtcDzWl87s38PbTryQznsKx9Bc2pg
	 6buTcUHkIzOrctwhyQEwKkMbHkJacG4TGPCX7PvKrhVe1BlihzQQBe9YSdR3jLHhWi
	 /QUWgspobW3RQ==
Message-ID: <4e706b47-f3df-9a1d-60ba-c072a05e0fa0@benettiengineering.com>
Date: Mon, 31 Jan 2022 13:17:52 +0100
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
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 George Hilliard <thirtythreeforty@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
References: <2ba1e2bb-e65d-8b79-dad9-1698b2dc6d12@gmail.com>
 <05FF11BA-A37F-4A89-A30B-96EDA15DD469@benettiengineering.com>
In-Reply-To: <05FF11BA-A37F-4A89-A30B-96EDA15DD469@benettiengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLHsCoCMG57t2s+zJwWpF1x+jXarL1OCcpBFyGKEelR3HGLtUpQS5TCg1ohuFtT5MLF5R3rKEICckpA1nJEQ4zrMsVMVkNnXy/TDOGjO8OcYnhb37W7S
 sgD14HgtMKb613s85E2lnvNpsuFXD5Zh2dkFDMSeno78HVQR4r5dkV7lxrwyL6HQ1Rs02lwfd0mpwQ2IFw5aT3dT3LPG6Hu4WtLqcMsj0nXWTY6P90kV18I0
 iF9SUwUmAOQOcNeIFGZLPfnjrIzPtZPTe4P0EKlCDNps+GcrliUoXKLCQAS52OYV9XIkRkSwNaem9cToJkPgDBTMtA4SDnEZGIHsM48pWYe3piglNrRwe5Rr
 L+bGe4fSoWLuzy7oncM5tm97eI27zUql8ftz/gfrg/Rd0sjVNEIFbbEPmWzlZqquVycYvXrz

Hi All,

I've tried several times on both F1C100s and F1C200s, maybe I'm doing 
something wrong but it doesn't work :-/

I burn sd-card with:
# sudo dd if=u-boot-sunxi-with-spl.bin of=/dev/sdb bs=1k seek=8

I've triple-checked that the file has been written there by dumping the 
sd-card and I see it's written at 0x2000, so 8K offset, like the mangoPI 
image for example. But no uart output.

Am I doing something wrong?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 31/01/22 11:47, Giulio Benetti wrote:
> Hi Andre and Jesse,
> 
> I test it today on both F1C100s and F1C200s!
> Lichee Pi Nano and the Jesse’s board with F1C200s.
> 
> Best regards
> —-
> Giulio Benetti
> Benetti Engineering sas
> 
>> Il giorno 31 gen 2022, alle ore 03:12, Jesse Taube <mr.bossman075@gmail.com> ha scritto:
>>
>> ﻿
>>
>>> On 1/30/22 21:04, Andre Przywara wrote:
>>> Hi,
>>> thanks to the tireless work of Jesse, I think the basic Allwinner
>>> F1C100s support for mainline U-Boot is now ready to be merged. Since I
>>> don't have the hardware, can any of you who have boards please give it a
>>> try on their hardware? I would really love to see some confirmations
>>> before I merge it.
>>
>> I really have to thank you for reviewing!
>>
>>> I put a branch here:
>>> https://source.denx.de/u-boot/custodians/u-boot-sunxi/-/tree/f1c100s
>>> This should probably work on any F1C100s board, using the LicheePi Nano
>>> defconfig. Also curious about the F1C200s (looking at you, George ;-)
>>
>> I have tested on both. Giulio has them aswell now.
>>
>>> This is very basic support at this point, there is no USB or SPI
>>> support, and even the SD card is not usable from U-Boot proper.
>>
>> Sd card will work if we add it to the dts.
>>
>>> I am hopeful we can add MMC and SPI support still in this cycle, but I don't
>>> want to hold back this series any longer, and it should be relatively
>>> simple support patches.
>>
>> I have patches for both spi-boot and U-Boot proper spi suport.
>> I did manage to get it to find the boot device with:
>> `u32 brom_call = *(u32*)(fel_stash.sp-4);` in mach-sunxi/board.c with the suggestion that Stephen said. Should I submit after it gets into master or is tomorrow fine.
>>
>> Many thanks,
>>     Jesse Taube
>>> What should work though is booting via FEL and from SD card (the SPL
>>> MMC code is in place, if I am not mistaken). Just booting it to a U-Boot
>>> prompt via both methods would be a great test already. Maybe you can
>>> even upload a kernel and initrd via FEL and boot it from there, using
>>> $fdtcontroladdr for the DT address, for instance.
>>> Any replies would be highly appreciated!
>>> Many thanks,
>>> Andre
> 

