Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F762C82
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 20:44:28 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
	by Aruba Outgoing Smtp  with ESMTPSA
	id EdXFnjmqU0FuyEdXFnZVC2; Mon, 31 Jan 2022 21:44:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1643661866; bh=UdyG2CnzjVbzPIXbqDDxYY4YAys0tsdEZeCtrvEgwbE=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=bvM+o6jv6fqlXpjrEM4F2jOz2GFtJocHaPCWHAhhP/5ojeyVq4cxlePJoRmCMSszG
	 hLl7vv/cwrEDFLnI+tvDkqA/LCZT05aCLqlFG0U42UENX3JR14E/CrKFPnBbBp5Hwz
	 vKTunW2wk/hKeKPtgA7lEJ4ijmIYgmmZ/3kh115va8Wi4dSkbH9tBDLWA7gnfIN9Wp
	 25nAfJ2Pmy3QmbnzC48nOZX+gQjHzONqjhz+thCCK+1s2gL3W8ZDKf/1jTYDdVswNs
	 xN446O11cZHutQYMbZSuiaWiHCHYE8uAvGwcc1BLAdM8/VK7VtIiYm13fVUmSFhDmy
	 0zg8Zw0ABxKqA==
Message-ID: <cfc51626-83b1-a235-c23d-a348f7df0d48@benettiengineering.com>
Date: Mon, 31 Jan 2022 21:44:25 +0100
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
To: Jesse Taube <mr.bossman075@gmail.com>,
 Andre Przywara <andre.przywara@foss.arm.com>
Cc: Samuel Holland <samuel@sholland.org>,
 George Hilliard <thirtythreeforty@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
References: <20220131125746.4702fac0@donnerap.cambridge.arm.com>
 <813A2F53-7592-4DDF-86B6-993BFB1A6819@benettiengineering.com>
 <38e0aba2-78e4-d3fd-1c03-d0382eefde77@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <38e0aba2-78e4-d3fd-1c03-d0382eefde77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGpj7F1r7foT94hlNsMOwD6TRDh4hlV0oeIYE/yxk6yi5F+eFxVhddhe8eYE9RqL3jGVcSzsjhOVydKvoML2wasLU/c980LlkVXi5um0qkxYcDcQ627G
 wUyLODB0XYJeVJfQpGupS6fN3vhRFroE8YJ0w6ceJKAxj1q8xs/0X9TIPr674eToeuH7WpJ/q8cAsqAlstIR5EjV3ADPkBtzByoVzba+tr2sLdd7jELD8Q0y
 O0sHZUubQGlEQBNIx7RRQto5G3D36My90C3bLnpGvTuSPfcoYUCyBYX1OvdXqqkvnWYD3wky59KIOs3TlAEVHgFM/Rdu78LgtexW550x/YzyJUTYT+A5WB25
 nDGH39gaRQscIipn9uySG22mG+UuZeNz5leIfAW4OjIYIcFlot01k9gYXeFbHnyVa21NdMOT

Hi Andre, Jesse, All,

On 31/01/22 19:13, Jesse Taube wrote:
> 
> 
> On 1/31/22 08:07, Giulio Benetti wrote:
>> Hi Andre,
>>
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
>>
>>> And you are not using UART0 on the PortF pins, so multiplexed with the
>>> MMC, I guess?
>>
>> I use PE0 and PE1 Uart0 according to dts.
>>
>> Have you got such board to test it?
>> Or we can wait for Jesse or George.
>>
>> I’ve used the git you’ve pointed.
>>
>> Anyway I think we’re very close to have it working.
>>
>> At least my work “behind the scenes” will be worth, right Jesse :-)?
> Yes, I'm sorry there wasn't much mention of you on this patch.
> I Just woke up, sorry i couldn't be here earlier, I'll take a look with
> Giulio.

I've tested succesfully on both F1C100s and 200s boards!
https://source.denx.de/u-boot/custodians/u-boot-sunxi/-/tree/f1c100s

I've realized with Jesse that here with me I have 3 USB->Serial 
converter broken!!! With the 4th it worked and I've checked with scope 
that was hidden by garbage on my desk :-)

So it works! Sorry for the noise

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
