Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CADC320D
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Jan 2023 20:30:56 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id A64725C0087;
	Sat, 14 Jan 2023 15:30:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 14 Jan 2023 15:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1673728255; x=
	1673814655; bh=CwS+QhT9MTVqBPxPDdg6JDPQMctaqINqFNqZ3wOt1Lo=; b=J
	4Q0D9rV3yxElL1YK1LcIkVauwkR8yRnxu/0qF8xnKk9S0ZTJGI7g4K+eKtnCUSTQ
	Rj15xSnUADEBwe8wYQe1PRFZSTl7j1Eo2vPoDLdtQJpn0w9wuZK480D2/a61GEaX
	bTBW6/mtfyVPhbe22Bd8DakK3dEb78Kl7r35exCArtb12cJBBnxRHIamY+tR8GLU
	K+lY9KGChtquiKIRGleBXmDsGX6pcPdYKQzMbFBavcT/IwoPQnbYMkENKTPAMrsy
	vujUVEzNhLFLhveOCuKZaIifOJIxFADcY3m66T2gww6o0F9jRCEPHp8dVn5UUoBH
	MPznyBh75zAzi1UNRtP1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673728255; x=
	1673814655; bh=CwS+QhT9MTVqBPxPDdg6JDPQMctaqINqFNqZ3wOt1Lo=; b=d
	aZVSfC8OSuG8/6Zid+lppaPXSMIeiHFIuplVWOSmOvpt1/pztT1IwpG5XUceg/Yw
	O/LiL2iWmwYnXyG+h0yrjLEXlWderKstIZxg/SyRqL+WIQbx5XUSyWOdEfIirNo/
	833EG+q7UjHI7sgw1AQqNyFF1ClMBGRpmNsUo73anvTjOVW9Tm9HHs7gnUULVAHU
	bnRcenN9WeIwsB/1KCJofX2Y05qvSMZ5VdIOeHV/wD1pmOuuddZtr8Xr5g1uqMTR
	RU7jLysDryk08z4w3y2n9GEUWA7+qnhcT3guJb+zxRnOEw7XdwiPleBU1CK/i4ab
	tahQSBT9NnXdsvje5UYgg==
X-ME-Sender: <xms:_xDDY1rWo5Wv9srCm3evyPNz5HUjYTaKnSxhsg8VD4ooDLAOUcrPDw>
    <xme:_xDDY3o8RdgVujMjfbg_cFfij7kQGFWa92aP44BwI_FiZt5Cvxy361OozpV11Mc4g
    aAc7nQGT1pw3TFC4w>
X-ME-Received: <xmr:_xDDYyO0qM1482aeMsi5GQE1CIUKAQlFD58up4f0z927PjmLqufRNInLXdNiPbU4iCm_GnaU_WYLZhUl5Eb8Mh03mPyquHhqB4WHdvmJCdhZipkrVmBopvPFWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeel
    leeftdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:_xDDYw6R09EJbAE2G0Y00tSukg4RW0JwYfrnmjf9rRY62GOPkcHnMg>
    <xmx:_xDDY04bk4QsjD6TG5Jmj_15gMfB3H8VE4GnbAbjkMtuGZLWDrhAKw>
    <xmx:_xDDY4hQ-e17cmL1FB_Cae_8oLJ6XUCT-a6vSU2MIqaaWT1PcSNnQw>
    <xmx:_xDDYxuGe9J4BenbiV30xan9C8LlMG5PUB7xMJjMBlnqayCiNCRwvA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 15:30:54 -0500 (EST)
Message-ID: <d7df09c2-408b-e14e-a5d8-072fd71b3ae9@sholland.org>
Date: Sat, 14 Jan 2023 14:30:55 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] sunxi: f1c100s: re-enable SYSRESET
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
 Icenowy Zheng <uwu@icenowy.me>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Taube <mr.bossman075@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230105020451.19256-1-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230105020451.19256-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/4/23 20:04, Andre Przywara wrote:
> The SoC .dtsi originally submitted for the Allwinner F1C100s had the
> wrong compatible string for the watchdog, which broke U-Boot's reset
> functionality. To quickly fix this, we disable CONFIG_SYSRESET in
> cfcf1952c11e6ffcbbf88 ("sunxi: f1c100s: Drop SYSRESET to enable reset
> functionality"), so that U-Boot's hardcoded reset driver could take over.
> 
> After this was properly fixed in the devicetree, we reverted that patch
> in 92373de041ea ("Revert "sunxi: f1c100s: Drop SYSRESET to enable reset
> functionality"), however this line sneaked back in with d0ee7f295d74
> ("Convert CONFIG_SYS_PBSIZE to Kconfig"), so during a Kconfig update.
> 
> Remove this line (again), to use the proper reset driver.
> 
> Fixes: d0ee7f295d74 ("Convert CONFIG_SYS_PBSIZE to Kconfig")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
> 
> this is not critical (so nothing for 2023.01), reset works either way.
> But we should fix it anyway.
> 
> Cheers,
> Andre
> 
>  configs/licheepi_nano_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>

