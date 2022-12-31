Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FF22564
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Dec 2022 20:45:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C613C5C00B4;
	Sat, 31 Dec 2022 15:45:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 31 Dec 2022 15:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672519525; x=
	1672605925; bh=KSQhhfa4ltEVN9bAaz22ufN9Fuz0Kj7qE9JQMHsf0Tg=; b=U
	6gjZ6UU9r2GV36KM+sFTiTWpqME9R+czDANz4AnjZXoBctXB65h+aAj2mpEbbeI5
	KHt0mkEojhDjybFvwflSr7I6f2UQlOxbyzOzdjzNh0p8CWho3P6i2max6Y3/7MG/
	2bKdb0m/pLUtBZUxKyRGhDx3KbG1izgmTDWyd/clXxpctObhcEo9Ci8k5ZAddubr
	MSzn44OU8i32ucTfI+DmmgUY3vQyhrpG6ZbhHmTLIFHHm6HuZTX6HLzt3y0dfLh2
	6wm0Tn/wQYI+mYecawpnIo50OSI7ljltvZ0GuaZqhVgSI50b90bKXROkd+Ug7F9P
	TjF8v+1PbB0cxJND7RLcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672519525; x=
	1672605925; bh=KSQhhfa4ltEVN9bAaz22ufN9Fuz0Kj7qE9JQMHsf0Tg=; b=r
	1BdRAnS7vWwAY38osBUMfByofgVZO/O10H04ppPubkAyCOZHa7073k1kG4pBZ2S/
	Jh3ShLOJcvsYeOTKjlD+L6b4X4JeSSag213Ul9XGtexD8dHeQ61AvFl14I7+Vngg
	Ou7RUUT7JM+heqKQUqibl/Tk/JmgSm+cEaanzys9ugQILxAScKffSoIobwuyLxOj
	sPlElZYnwasw8PdvqK4CJ5w8rDg4nM6j9iQ8K7hc/iLzRPj3FGe3B+ANj+cknCIr
	jcD0naJawTabkpBay5JiVg5VqyoWDVbUeN1Kpbh18ESGPZ8nBiseJyA3jhXzvvC5
	dfWi2xOfZ+LLesMZVji/w==
X-ME-Sender: <xms:ZZ-wYzXFO3E65Ju2aTYEDxpMy82nU05TcRQFf1H9-ytNG2UCGynpig>
    <xme:ZZ-wY7mxcvRIAgefGeF6Y70pkwLm38tJG2qf3pCVqP-l2rEKgZ8ugt8is0LmXY4Ou
    xhJV7GElKfItEZ4qw>
X-ME-Received: <xmr:ZZ-wY_Y5blzTgZRy6mFdkI0rMGw2RywPWotk2_6cXhmtq6YFGcRn9c7KEQAQhN6rWwteREAVfe1avv1d2NOd9rGzwFmv061sKhmcba4g8mEJMp_K0M5lhDsBjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgddugeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvvehfhffujggtgfesth
    ekredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghl
    sehshhholhhlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepjeeftddtvdegvdevke
    dvvdejledvieeuffekvedtiefggfekudehvedukeeluddvnecuffhomhgrihhnpehgihht
    hhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ZZ-wY-UdrWou_TIfUASQLliAeJ--rPeyExd2CalaGJYOU1gxqRW-Rw>
    <xmx:ZZ-wY9k88VUkBxzmLLDUhKL8vTufE-JepPukCVZTuXIh9rnnAlFzCw>
    <xmx:ZZ-wY7d6VBuQVepozmHCkuUm-m9jm-NUgK03QHkLWZ963lE2n9Y-pQ>
    <xmx:ZZ-wY8tfELMOIsNk-jg_t8ZbAh23NRK7LwSJb49sXIygOqygtBgEhg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 15:45:25 -0500 (EST)
Message-ID: <8e7e9d95-a3c1-059d-1e13-20e69c23da46@sholland.org>
Date: Sat, 31 Dec 2022 14:45:24 -0600
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
From: Samuel Holland <samuel@sholland.org>
Subject: Re: ddr devfreq on H3 - possible?
In-Reply-To: <CAKAF0m984-tY+r+NXdND5hTHAQ55mk_XLjr2y+OBjKMNhS+e1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kirill,

On 12/31/22 05:15, Kirill wrote:
> Hi!
> 
> I ported your patches for armbian kernel 6.1 / u-boot and it works!
> 
>> It works, though it did lock up once after playing with the devfreq
>> sysfs for several minutes
> 
> Yes, I have hangs too. And the main reason for this problem - SMP. :(
> 
> By calling SMC we put only one CPU into SRAM. But other CPUs still
> work and use DRAM!
> I don't see any hangs, if I disable all other CPUs:
> ```
> echo 0 > /sys/devices/system/cpu/cpu1/online
> echo 0 > /sys/devices/system/cpu/cpu2/online
> echo 0 > /sys/devices/system/cpu/cpu3/online
> ```

Thanks for investigating. That's good information.

> Original sunxi 3.4 kernel uses some dirty hack[2] to get around this problem.
> 
> They call mdfs_pause_cpu[1] for each CPU core (except current)
> This function located in the SRAM and locks CPU in infinity loop,
> until `set_paused(false)` called on CPU0
> Also, legacy rockchip kernels use same hack[3].
> 
> But this method is not ideal...
> Before changing DDR freq we must make sure which each kernel is stuck
> on the SRAM function. But this is a very long process.
> In my proof-of-concept implementation sometimes elapses *few seconds*
> between I call smp_call_function and all cores stucking in SRAM
> function.
> This method may be suitable for manual freq change. But not for
> automatic governor mode. No chance to change frequency on heavy loaded
> CPUs.
> 
> We need another way.
> 
> I think, code on PSCI must stop/suspend any other working cpu cores
> before update freq. This is possible?

It _shouldn't_ be necessary. Setting bit 8 in PWRCTL blocks the DRAM
controller's host interface, which should cause the L2 cache subsystem
(and thus the other CPUs) to stall when trying to access DRAM. This is
what the MDFS hardware does on A64/H5, and I have seen no hangs there.

Possibly the issue is that such a stall sometimes affects the CPU that
is running from SRAM, even though it should not. (On the other hand,
when using the MDFS hardware, it is okay if all four CPUs temporarily
stall at the same time.)

One thing to check is if sunxi_dram_dvfs_req() completes successfully.
That function contains some unbounded loops, so it is possible to get
stuck. You could toggle a GPIO or something at the end of the function.
That would distinguish between "the secure monitor hung" and "we left
the DRAM controller in a bad state and hung when switching back to code
in DRAM" or even "we trashed the contents of DRAM".

We do use the architectural timer inside sunxi_dram_dvfs_req(), but
those registers are banked between secure/non-secure states, so that
should not interfere with Linux's use of the timer.

However, your test with offlining the other CPUs suggests we may really
need some synchronization. I would suggest doing this inside U-Boot as
well. You can send a SGI IPI to the other three CPUs and force them to
trap into the secure monitor. Not only will this be immediate, but it
will also ensure the other CPUs are running from SRAM during the
reclocking. You can take inspiration from the existing IPI code in psci.c.

It is quite convenient to be truly in control, so you can do things
behind the OS's back, and keep it blissfully unaware. :)

Regards,
Samuel

> [1] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L638
> [2] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1088
> [3] https://github.com/bbelos/rk3188-kernel/blob/master/arch/arm/plat-rk/ddr_freq.c#L168
> 
> P.S. sorry for duplicate, previous message declined by mlmmj
> 
> 
> чт, 29 дек. 2022 г. в 19:29, Samuel Holland <samuel@sholland.org>:
>>
>> Hi Kirill,
>>
>> On 12/28/22 07:10, Kirill wrote:
>>> I'm trying to use your driver with h3, but have this result:
>>> ```
>>> [  387.306429] sun8i-h3-mbus 1c62000.dram-controller: Detected 32-bit
>>> DDRx with ODT
>>> [  388.450262] sun8i-h3-mbus 1c62000.dram-controller: Using 15554/243750
>>> (6%) at 1248 MHz
>>> [  389.906319] sun8i-h3-mbus 1c62000.dram-controller: Using 1079/243750
>>> (0%) at 1248 MHz
>>> [  389.914314] sun8i-h3-mbus 1c62000.dram-controller: Setting DRAM to
>>> 156 MHz, tREFI=19, tRFC=28, ODT=disabled
>>> ```
>>>
>>> After this CPU hangs and not responding.
>>> Is possible (at least theoretically) to use this driver with H3?
>>
>> Yes, although it will need some help from firmware. If you look at the
>> vendor driver[1] (pick any random Allwinner 4.9 tree), you will see
>> there is no mdfs_dfs() implementation for CONFIG_ARCH_SUN8IW7P1 (H3).
>> The driver always calls mdfs_main(), which is a standalone program
>> loaded to SRAM. The reason seems to be that the MDFS hardware is broken,
>> as you found out.
>>
>> Something like this standalone MDFS application is not upstreamable, but
>> conveniently we already have some firmware running from SRAM, namely
>> U-Boot's PSCI/secure monitor implementation. And Allwinner already has
>> some chips where they call a SMC to do this MDFS procedure[2]. So we can
>> reuse that SMC function ID, and put the code in in the secure monitor.
>> I've thrown together U-Boot[3] and Linux[4] patches as a proof of concept.
>>
>> It works, though it did lock up once after playing with the devfreq
>> sysfs for several minutes. The contents of sunxi_dram_dvfs_req() are
>> just copied from the vendor driver; they could surely be improved.
>>
>> The U-Boot patch is based on my series adding Crust support for H3, so I
>> could have interactive peek/poke from the AR100 even when the DRAM
>> controller is dead. It shouldn't be too hard to rebase that out and move
>> the code to psci.c.
>>
>> I'm not sure the best way to upstream the changes to psci.S. Probably we
>> need some platform callback to handle unknown function IDs.
>>
>> Regards,
>> Samuel
>>
>> [1]:
>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1411
>> [2]:
>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/drivers/devfreq/sunxi-mdfs.h#L38
>> [3]: https://github.com/smaeul/u-boot/commits/patch/h3-dram-devfreq
>> [4]: https://github.com/smaeul/linux/commits/wip/devfreq-a83t
>>

