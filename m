Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4201FAF
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Dec 2022 17:29:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id CA7F532008FF;
	Thu, 29 Dec 2022 12:29:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 29 Dec 2022 12:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672334983; x=
	1672421383; bh=0e4DePwZp/OZK1miM4fOgkh2eKBoExeCNfuF/NWb/6I=; b=H
	NH4ZI2yCw4TAcBndn4WliXlRiU3uXZYkAD5yywT5wV/ZSyF7QyJrg01+2C79n8xv
	FCVkBb7uFvgQxx4st0qovftjM9iZRpLBmRvJdv+N4H4SpkX9/xQlZkmXjt5FhEjq
	Q/bMGQa/iC9luk52d62wjP7FqWVGi8IofWHPOG9eGFtVtq4gmm2z/Daij5evA/MA
	I6UN53VOUB5rs/HyR5rhyJplSsia1BTvKvVhL8/90B1BjCjFIMV65aT85bvvs6fI
	CutRCNjbsjvpLwuKKkyiJkOu8BANO3nFKHlFC1CAbXIj57XLxTm4mMo2QexPlLBA
	ai7+aXRQZph9lCgrlW2pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672334983; x=
	1672421383; bh=0e4DePwZp/OZK1miM4fOgkh2eKBoExeCNfuF/NWb/6I=; b=d
	DzgZHcd6wuPVXIMQAe5zuH6gaBkwOnLCB3at6SXnyForbKS9taH1T+lNbnohDkrf
	Ayt5piGNsCdtWbXMUt1YYoAENX7+79NrqBs0W70yp+aauOQ96BiEu3V0IRybAD7x
	1XEIepsdJ4wAQHR4VU648tnULnjZ11poD6clpXZtKcLu2Puemw8Ug64kaMpO6ibH
	vCNZkg0lIOQJ/EsVI8SihIYGZjgoUrhoFNFqZphjLNkgC/zHZrej0xBtho9UNncX
	xwwU47ip4NSzgNZiveovULGpIA4EZ4aLPQKKHw5dcO0eohm96dfij+HeiK7vmJ5K
	NFAIIAcNKod59XLAy+LEA==
X-ME-Sender: <xms:h86tY1V5EY8kSLVBHVT3T7RSDZCYMs7qIe_yDPiVHvhp93sa898tPA>
    <xme:h86tY1kjxXVfQD9EmW7GXdCbWNONQQi1xkbY-Bqx4NWwAL6sCwx8pN64chY-mTjUw
    ZL8Z1AdQKW9VxUObg>
X-ME-Received: <xmr:h86tYxZbHv7JQIGvAwhtTqJVTNXBgBvF6071gO9Sr4nHwWMwCsoyZhOCL0sbBmWY3tYjgVBuhGhSsuNMIpI4Td4TdHUa2Xs3Wzu9vZoAcflRfkTu9v834HFUbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddutdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvfhevhffujggtgfesth
    ekredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghl
    sehshhholhhlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepvefhieejtdfhieeigf
    elveevleelieeiudffvefghfekueduudektdevveeukefhnecuffhomhgrihhnpehgihht
    hhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:h86tY4X47clGeb8Y8qWiIhaVbalrsluj6-LWhn5fZ7NjYgHIndSFWA>
    <xmx:h86tY_kSenS8xuNFM5S-tXfCXhQ2dEeSHAZc6IjUevUp6N1Le9S2gg>
    <xmx:h86tY1dmeDF7T6tiMpZcXt3FRhCUM7Q-7biGTxwq-QM0SE7yGeO3GA>
    <xmx:h86tY-uE95jZ-UqDcEX5WOuN7AUPX5RQiqjXC7cU9geJdhZhPCNa0w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 12:29:42 -0500 (EST)
Message-ID: <d49cb79d-1405-c2cc-0c33-a768c5bbde91@sholland.org>
Date: Thu, 29 Dec 2022 11:29:42 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: linux-sunxi@lists.linux.dev
References: <CAKAF0m9DqPjB6C39ZbrRHFrJOodm7WQGTL0x1jduQjNU=JpQ2g@mail.gmail.com>
Cc: Kirill <kirill.zhumarin@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: ddr devfreq on H3 - possible?
In-Reply-To: <CAKAF0m9DqPjB6C39ZbrRHFrJOodm7WQGTL0x1jduQjNU=JpQ2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kirill,

On 12/28/22 07:10, Kirill wrote:
> I'm trying to use your driver with h3, but have this result:
> ```
> [  387.306429] sun8i-h3-mbus 1c62000.dram-controller: Detected 32-bit
> DDRx with ODT
> [  388.450262] sun8i-h3-mbus 1c62000.dram-controller: Using 15554/243750
> (6%) at 1248 MHz
> [  389.906319] sun8i-h3-mbus 1c62000.dram-controller: Using 1079/243750
> (0%) at 1248 MHz
> [  389.914314] sun8i-h3-mbus 1c62000.dram-controller: Setting DRAM to
> 156 MHz, tREFI=19, tRFC=28, ODT=disabled
> ```
> 
> After this CPU hangs and not responding.
> Is possible (at least theoretically) to use this driver with H3?

Yes, although it will need some help from firmware. If you look at the
vendor driver[1] (pick any random Allwinner 4.9 tree), you will see
there is no mdfs_dfs() implementation for CONFIG_ARCH_SUN8IW7P1 (H3).
The driver always calls mdfs_main(), which is a standalone program
loaded to SRAM. The reason seems to be that the MDFS hardware is broken,
as you found out.

Something like this standalone MDFS application is not upstreamable, but
conveniently we already have some firmware running from SRAM, namely
U-Boot's PSCI/secure monitor implementation. And Allwinner already has
some chips where they call a SMC to do this MDFS procedure[2]. So we can
reuse that SMC function ID, and put the code in in the secure monitor.
I've thrown together U-Boot[3] and Linux[4] patches as a proof of concept.

It works, though it did lock up once after playing with the devfreq
sysfs for several minutes. The contents of sunxi_dram_dvfs_req() are
just copied from the vendor driver; they could surely be improved.

The U-Boot patch is based on my series adding Crust support for H3, so I
could have interactive peek/poke from the AR100 even when the DRAM
controller is dead. It shouldn't be too hard to rebase that out and move
the code to psci.c.

I'm not sure the best way to upstream the changes to psci.S. Probably we
need some platform callback to handle unknown function IDs.

Regards,
Samuel

[1]:
https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1411
[2]:
https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/drivers/devfreq/sunxi-mdfs.h#L38
[3]: https://github.com/smaeul/u-boot/commits/patch/h3-dram-devfreq
[4]: https://github.com/smaeul/linux/commits/wip/devfreq-a83t

