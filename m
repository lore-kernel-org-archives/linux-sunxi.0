Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E892FB2
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Jun 2021 05:38:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 667A65C00BE;
	Mon, 14 Jun 2021 01:38:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 14 Jun 2021 01:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	to:cc:references:from:subject:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=p
	+ks3sYZi4Pc8xu7aA604SAGbRXgMQ8k2IgAJxTuZrE=; b=FHVmbqFIe9sd7aa16
	/fEPM6JEvfnKBfu/b/iAH2N2xSSl9paBYlm388Nd67YeyUkSFFUZ5rcQT/PV/CA4
	sz4fSb1Ek9enmlhHppz2LkqvZo4pLd+pbjWnfSzSdkBgGLMCmh3JyDCuCv6kro/Z
	Ilwyf6frpiAh5rqaoYdA4pYvdoK1neu5LZSenUi21TxnvOgCbhKRxmpirehocgOK
	nfgOeAMeObYDkXsXD7A9R4W1MnDJje8MWJF6OS5OO2iPJ+ETVeiTZv2wq8K2zYDq
	iLT/zEH/GgAnNTUMHpx+csNffqgXnoivRaMrmafTObxfdu6kVHygqZ78qHbz8gIM
	vEqug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=p+ks3sYZi4Pc8xu7aA604SAGbRXgMQ8k2IgAJxTuZ
	rE=; b=A5pJNQvP2Z2o3Kvvxa6pe4E47UhZQoPZ4LhgyQZlC9/8AlVRTMJOZv00Z
	4bDpj7yyu3nbtUYvjH2GWhlnQe5VaFkAP9jV7zXFmeAC2KQiFG3Yy/SsaLSt/Lov
	nrehoY+T6UkOdyrQTM0UR6q+yHrvQS8GIEbGZ+q7hEpNq8NrxpTN30KJPvn+icdu
	Cld33NorbBHrt6dT4KEktdAp+tZFNFRVSefkNZ+uVw2p18Bt2JjCFPL57I+sgnWn
	+ilW/nemozHsSjDEeePj84bWqAo0c8OCbh7ldk3+w2kn0UlSmG830Dk3/Dk4hs6M
	CnzRqu/kxTHxCYDQ0W+BsYuMASdSg==
X-ME-Sender: <xms:N-vGYNS_KBP7z7TO2sFelCBpCvQtxQ3-whkAm9qVzX6CFVcRPl0Hpw>
    <xme:N-vGYGxBGLz41fjPD8j0htjjMqoetsgyolP4TygViYUvW7Wu9cVhnZ-3l1dBWUCM0
    16vafi_-pcvqUbYFQ>
X-ME-Received: <xmr:N-vGYC07C9CaXjH-2iNW60a7TGHA5zY8u0g6RX_ztye4Nq3rEKezTqDo0zLG-50S2B1P-OKxPs3RAeX_FiCiJUsUnyYLZBhgqKryoawPuSFFPmVbsqwQisskug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepvddvtddtfeehgfeikedtuedvudfhieelveeiueejheeugfegvdeu
    iedtudelffeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:N-vGYFAMUoTedZ1mINmUW8sS9uEntD-RdtdCAjKKrYwezeg4yActfw>
    <xmx:N-vGYGjiAgSNu5QXyQkBBD4-jVUWeKHEh5UmVWP7Z-HWLnKRnMvfcA>
    <xmx:N-vGYJpyarVN9i-uGrVTOsrNURAwaFctXrSnU1HBBn5kQ2ksVGPYyg>
    <xmx:OOvGYOdSFZTUTjvcyUt5Mhi6JiTIc9-NrYIArrIA09cErmWxTBXZGQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 01:37:59 -0400 (EDT)
To: Suniel Mahesh <sunil@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, U-Boot-Denx <u-boot@lists.denx.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <CAM+7aWu45dOEKzdEAW3bSFC7OvWy69Ye6R6qpw-jvefeS=mGow@mail.gmail.com>
 <20210613231411.7d4fb5db@slackpad.fritz.box>
 <CAM+7aWs8rA0mrCjqpurMQgNZAZE7CE_HtuPv-XKy4mTQ8110TQ@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: Reset cause register for Allwinner H3/R16 SOC's
Message-ID: <05d446af-318c-4830-d388-84f1537f4e1c@sholland.org>
Date: Mon, 14 Jun 2021 00:37:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAM+7aWs8rA0mrCjqpurMQgNZAZE7CE_HtuPv-XKy4mTQ8110TQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/13/21 11:37 PM, Suniel Mahesh wrote:
> Hi Andre,
> 
> On Mon, Jun 14, 2021 at 3:44 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> On Sat, 12 Jun 2021 10:17:08 +0530
>> Suniel Mahesh <sunil@amarulasolutions.com> wrote:
>>
>>> Hi All,
>>>
>>> I am working on an Allwinner R16 and H3 based targets and I am implementing
>>> system update.
>>>
>>> Is there any way(or a register) on Allwinner R16/H3 which can tell
>>> what is the cause
>>> of the reset(whether the reset is triggered by a watchdog or thermal
>>> or reset or a POR).
>>
>> I don't think anybody found such an explicit gadget in Allwinner
>> chips before.
>> Besides, what would be the difference between watchdog, thermal and
>> reset? AFAIK those are all the same watchdog triggered reset, in the
>> last two cases deliberately triggered.
>> If you want to convey information across a reset, you can use the RTC
>> data registers: they survive a reset. So you can explicitly write some
>> reset cause indicator value into one of the registers, then read that
>> back after the reset.
> 
> Thanks for the insight.
> 
> My basic use case is the update mechanism on the target. The update mechanism
> is implemented as follows:
> 
> 1.
> Assigned bootcounter to RTC GPR register. Boot count limit is 3.
> If for some reason the device doesn't boot, then the WDOG waits for
> specific period of time and triggers a reset.
> For every WDOG reset bootcounter increments and if exceeds 3,
> altbootcmd is triggered and the device boots recovery mode.
> 
> 2.
> The problem I am facing now is, I need to differentiate WDOG reset and a
> normal reset.
> If the user does a normal reset the bootcounter value should not be incremented
> (as of now bootcounter value is incrementing for both WDOG reset and a
> normal reset
> which is obvious).
> This is where I got stuck.

It sounds like you want to reset the boot counter to zero from either
the kernel or userspace once the device boots successfully. Then it will
be zero after the next reset. You can accomplish that by using this
patch[1] plus the nvmem-reboot-mode driver, or the nvmem sysfs.

Cheers,
Samuel

[1]:
https://lore.kernel.org/linux-sunxi/20210419014549.26900-1-samuel@sholland.org/

> any more insight would be appreciated.
> Suniel
> 
>  > For power-on-reset there might be some heuristics to tell it apart from
>> a mere reset (temperature, PMIC state, DRAM content?), but in
>> general the RTC register method should also work here.
>> So if you are happy to hack some board specifics into your firmware, it
>> should be doable, but there does not seem to be a generic mechanism
>> implemented into the SoC.
>>
>> Cheers,
>> Andre
>>
>>
>>
>>

