Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106DC7484
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jan 2023 22:20:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id EDA95320051E;
	Sun,  1 Jan 2023 17:20:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 01 Jan 2023 17:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672611653; x=
	1672698053; bh=fiktFDuLuJG/KmJD5p2qyeyQA2O/h0oiP2+8nYPzgG8=; b=M
	JgKG8oBg92/jLGvm0eWUqs5EkD4OIfV/UrI+zr9vvMG8PraPbutQeIcHPwO/aTSc
	qkj4JmF+PX14ciBOltCFVSFelRbZ1wvb1crD+U7EVEZSkIO/eG8nfyx1VihRguel
	/I8jGNJI0UgLulpPg3BLKZldMUna6sR2Z62P6+7nygUcLjBHI+BPHFN7oFQaX79J
	lO6k1apXSnFUqydRwphyzIN5wX7gQwdAbnhjgMRn1Y3ut2a0/XFUxdyJ5OCb7Wfo
	El8LRaL8f8ekxBX+GMhZlCbQoYDdqn6lBZ59uuz+wvfw58cqslnNIHnHJxSHbtIu
	JdgyBSMMorwHaPgjp8S3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672611653; x=
	1672698053; bh=fiktFDuLuJG/KmJD5p2qyeyQA2O/h0oiP2+8nYPzgG8=; b=v
	NrT7lGjwY2rC607yzcuqLjSLS312Xdj2qyA0IlKdhm17/Rr3PO5+kFZcmTOL3qJ9
	trXFuDKE8BuMQdc+fcelsKabod2w0HWnZxU4yYoVpPhfsihcalxpulRI/mlO71hb
	e0sIw+5zOc6+/4mbHMrejYXKiwvFVHhLNYdtKU/Y8j73zZ3vIcONO8Lu2GM5jN+w
	oTPliC6ycmsL+uSWDYXdQwZdBDJed655qUIYakrjmuDW717hW3nUWB78Poj8HUhI
	w1tdc3PgQIPjDK7NyNqW86CV6sFtxFWp3vh+KtKuy3DysCf+zAJfRK1SlG68mS/1
	bWRbLse5IySZdC9P5g1HQ==
X-ME-Sender: <xms:RQeyY4qHpb5fbJzHIgzPHucBRMYWLEGovNPTdlFWB-VdbnP7s2bjVA>
    <xme:RQeyY-rNbsvFYjNitm3F0d0frd4DiQc6QCu7e70CAwENQLphSuZU0ueM2JoI8-qC7
    N9CNSOncwZwZk2uyw>
X-ME-Received: <xmr:RQeyY9NARuJnz4EMqK2fIm4eIx9hJSz_4V3jydZ0nDjXONzlIXbmybB7Fe6mtFpvxw-mi_QIR6DBmfc5-mKwjnOfI_b7wnk1jCWeAq_AIjBwmo4gPYN7t1gZzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedtgdduheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvvehfhffujggtgfesth
    ekredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghl
    sehshhholhhlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepjeeftddtvdegvdevke
    dvvdejledvieeuffekvedtiefggfekudehvedukeeluddvnecuffhomhgrihhnpehgihht
    hhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:RQeyY_6XjnckO1xvECfhfMlyJmB-45pS7iXGI5dpyfyoYBVV8x-xQg>
    <xmx:RQeyY36vsKJXJ3P8vx1SM03M9Ry9MYSDqF6j47tN6v48oSk8ZbccbQ>
    <xmx:RQeyY_iI9I9vUI5WziCTo51j7DixaVlpUKK27z98DWqwY72K9bwMIQ>
    <xmx:RQeyY0iFHWFw5yCMNPzy-gWbKZ03Uicg-tc4ykw5VlAG3D7KSKv2Cg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Jan 2023 17:20:53 -0500 (EST)
Message-ID: <6cffb621-8ba2-957e-9cbb-3b139448fd12@sholland.org>
Date: Sun, 1 Jan 2023 16:20:52 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Kirill <kirill.zhumarin@gmail.com>
Cc: linux-sunxi@lists.linux.dev
References: <CAKAF0m9DqPjB6C39ZbrRHFrJOodm7WQGTL0x1jduQjNU=JpQ2g@mail.gmail.com>
 <d49cb79d-1405-c2cc-0c33-a768c5bbde91@sholland.org>
 <CAKAF0m984-tY+r+NXdND5hTHAQ55mk_XLjr2y+OBjKMNhS+e1g@mail.gmail.com>
 <8e7e9d95-a3c1-059d-1e13-20e69c23da46@sholland.org>
 <CAKAF0m-DQKBc-mfDsQESAA1NvZ1bAWfo-sp4tWqfWWaGhKUwww@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: ddr devfreq on H3 - possible?
In-Reply-To: <CAKAF0m-DQKBc-mfDsQESAA1NvZ1bAWfo-sp4tWqfWWaGhKUwww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/1/23 15:40, Kirill wrote:
> I did a little debugging.
> When hangs happens, CPU is always stuck on `writel(reg_val, PWRCTL);`
> 
> Example of my debug:
> ```
> /* 1. enter self-refresh and disable all master access */
> reg_val = readl(PWRCTL);
> reg_val |= (0x1<<0);
> reg_val |= (0x1<<8);
> __gpio_debug(2);
> writel(reg_val, PWRCTL);
> __gpio_debug(3);
> __udelay(1);
> __gpio_debug(4);
> ```
> __gpio_debug should not take any effect on the process, just switching GPIO's.

Just to make sure -- is __gpio_debug declared with __secure?

> Before hanging it can be worked for a few minutes. Hangs occur at
> random manners.
> Also hangs not depend on count of freq change.

Hmm, the CPU hanging right when blocking access to DRAM suggests there
is some asynchronous cache operation (prefetch or writeback) that is
causes some DRAM traffic.

I checked the U-Boot source code, and it disables both caches in the
secure copy of SCTLR before setting up PSCI*. So there should not be any
prefetching occurring while you are in monitor mode. But maybe there is
some writeback from cache lines dirtied in non-secure state. You could
try calling psci_v7_flush_dcache_all() before setting PWRCTL.

If that does not help, I am not sure what else could be happening.

Regards,
Samuel

* boot_jump_linux() -> announce_and_cleanup() -> cleanup_before_linux()
-> cleanup_before_linux_select()

> I tried something like this for fastest bug reproduction:
> ```
> while true
> do
>   echo "simple_ondemand" >
> /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-controller/governor
>   sleep 5
>   echo "performance" >
> /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-controller/governor
>   sleep 5
> done
> ```
> 
> No effect, it still happens randomly :)
> 
>> You can send a SGI IPI to the other three CPUs and force them to
>> trap into the secure monitor.
> 
> Thanks, I will try this later.
> 
> P.S. Sorry for the duplicate, I forgot "Answer to All" in gmail :(
> 
> сб, 31 дек. 2022 г. в 22:45, Samuel Holland <samuel@sholland.org>:
>>
>> Hi Kirill,
>>
>> On 12/31/22 05:15, Kirill wrote:
>>> Hi!
>>>
>>> I ported your patches for armbian kernel 6.1 / u-boot and it works!
>>>
>>>> It works, though it did lock up once after playing with the devfreq
>>>> sysfs for several minutes
>>>
>>> Yes, I have hangs too. And the main reason for this problem - SMP. :(
>>>
>>> By calling SMC we put only one CPU into SRAM. But other CPUs still
>>> work and use DRAM!
>>> I don't see any hangs, if I disable all other CPUs:
>>> ```
>>> echo 0 > /sys/devices/system/cpu/cpu1/online
>>> echo 0 > /sys/devices/system/cpu/cpu2/online
>>> echo 0 > /sys/devices/system/cpu/cpu3/online
>>> ```
>>
>> Thanks for investigating. That's good information.
>>
>>> Original sunxi 3.4 kernel uses some dirty hack[2] to get around this problem.
>>>
>>> They call mdfs_pause_cpu[1] for each CPU core (except current)
>>> This function located in the SRAM and locks CPU in infinity loop,
>>> until `set_paused(false)` called on CPU0
>>> Also, legacy rockchip kernels use same hack[3].
>>>
>>> But this method is not ideal...
>>> Before changing DDR freq we must make sure which each kernel is stuck
>>> on the SRAM function. But this is a very long process.
>>> In my proof-of-concept implementation sometimes elapses *few seconds*
>>> between I call smp_call_function and all cores stucking in SRAM
>>> function.
>>> This method may be suitable for manual freq change. But not for
>>> automatic governor mode. No chance to change frequency on heavy loaded
>>> CPUs.
>>>
>>> We need another way.
>>>
>>> I think, code on PSCI must stop/suspend any other working cpu cores
>>> before update freq. This is possible?
>>
>> It _shouldn't_ be necessary. Setting bit 8 in PWRCTL blocks the DRAM
>> controller's host interface, which should cause the L2 cache subsystem
>> (and thus the other CPUs) to stall when trying to access DRAM. This is
>> what the MDFS hardware does on A64/H5, and I have seen no hangs there.
>>
>> Possibly the issue is that such a stall sometimes affects the CPU that
>> is running from SRAM, even though it should not. (On the other hand,
>> when using the MDFS hardware, it is okay if all four CPUs temporarily
>> stall at the same time.)
>>
>> One thing to check is if sunxi_dram_dvfs_req() completes successfully.
>> That function contains some unbounded loops, so it is possible to get
>> stuck. You could toggle a GPIO or something at the end of the function.
>> That would distinguish between "the secure monitor hung" and "we left
>> the DRAM controller in a bad state and hung when switching back to code
>> in DRAM" or even "we trashed the contents of DRAM".
>>
>> We do use the architectural timer inside sunxi_dram_dvfs_req(), but
>> those registers are banked between secure/non-secure states, so that
>> should not interfere with Linux's use of the timer.
>>
>> However, your test with offlining the other CPUs suggests we may really
>> need some synchronization. I would suggest doing this inside U-Boot as
>> well. You can send a SGI IPI to the other three CPUs and force them to
>> trap into the secure monitor. Not only will this be immediate, but it
>> will also ensure the other CPUs are running from SRAM during the
>> reclocking. You can take inspiration from the existing IPI code in psci.c.
>>
>> It is quite convenient to be truly in control, so you can do things
>> behind the OS's back, and keep it blissfully unaware. :)
>>
>> Regards,
>> Samuel
>>
>>> [1] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L638
>>> [2] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1088
>>> [3] https://github.com/bbelos/rk3188-kernel/blob/master/arch/arm/plat-rk/ddr_freq.c#L168
>>>
>>> P.S. sorry for duplicate, previous message declined by mlmmj
>>>
>>>
>>> чт, 29 дек. 2022 г. в 19:29, Samuel Holland <samuel@sholland.org>:
>>>>
>>>> Hi Kirill,
>>>>
>>>> On 12/28/22 07:10, Kirill wrote:
>>>>> I'm trying to use your driver with h3, but have this result:
>>>>> ```
>>>>> [  387.306429] sun8i-h3-mbus 1c62000.dram-controller: Detected 32-bit
>>>>> DDRx with ODT
>>>>> [  388.450262] sun8i-h3-mbus 1c62000.dram-controller: Using 15554/243750
>>>>> (6%) at 1248 MHz
>>>>> [  389.906319] sun8i-h3-mbus 1c62000.dram-controller: Using 1079/243750
>>>>> (0%) at 1248 MHz
>>>>> [  389.914314] sun8i-h3-mbus 1c62000.dram-controller: Setting DRAM to
>>>>> 156 MHz, tREFI=19, tRFC=28, ODT=disabled
>>>>> ```
>>>>>
>>>>> After this CPU hangs and not responding.
>>>>> Is possible (at least theoretically) to use this driver with H3?
>>>>
>>>> Yes, although it will need some help from firmware. If you look at the
>>>> vendor driver[1] (pick any random Allwinner 4.9 tree), you will see
>>>> there is no mdfs_dfs() implementation for CONFIG_ARCH_SUN8IW7P1 (H3).
>>>> The driver always calls mdfs_main(), which is a standalone program
>>>> loaded to SRAM. The reason seems to be that the MDFS hardware is broken,
>>>> as you found out.
>>>>
>>>> Something like this standalone MDFS application is not upstreamable, but
>>>> conveniently we already have some firmware running from SRAM, namely
>>>> U-Boot's PSCI/secure monitor implementation. And Allwinner already has
>>>> some chips where they call a SMC to do this MDFS procedure[2]. So we can
>>>> reuse that SMC function ID, and put the code in in the secure monitor.
>>>> I've thrown together U-Boot[3] and Linux[4] patches as a proof of concept.
>>>>
>>>> It works, though it did lock up once after playing with the devfreq
>>>> sysfs for several minutes. The contents of sunxi_dram_dvfs_req() are
>>>> just copied from the vendor driver; they could surely be improved.
>>>>
>>>> The U-Boot patch is based on my series adding Crust support for H3, so I
>>>> could have interactive peek/poke from the AR100 even when the DRAM
>>>> controller is dead. It shouldn't be too hard to rebase that out and move
>>>> the code to psci.c.
>>>>
>>>> I'm not sure the best way to upstream the changes to psci.S. Probably we
>>>> need some platform callback to handle unknown function IDs.
>>>>
>>>> Regards,
>>>> Samuel
>>>>
>>>> [1]:
>>>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1411
>>>> [2]:
>>>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/drivers/devfreq/sunxi-mdfs.h#L38
>>>> [3]: https://github.com/smaeul/u-boot/commits/patch/h3-dram-devfreq
>>>> [4]: https://github.com/smaeul/linux/commits/wip/devfreq-a83t
>>>>
>>

