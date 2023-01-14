Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609F4BA41
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Jan 2023 20:29:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 626265C00C5;
	Sat, 14 Jan 2023 15:29:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 14 Jan 2023 15:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1673728189; x=
	1673814589; bh=Fqp7Jud/9UiflLvDreeqx0ZjBhhN3hvcjYSLQCbOlIQ=; b=l
	+oCJVUO84sQJpeM6jsNVSHcTVcF26MyPeqswEUCN2GtD3ZqADI63fCEL/3Msk1mI
	1uo5TNlbAAMvNc5PbQrYdDHg9PLM8/O6zaEklJJbpera6zYcJOTslXixF8JRcjrH
	xJrRv799k1x6eye/lDj98CLYc4jfwp7tLbzECaqiUCPXOM1zefnDchyTo0WDMjhn
	hSAz70GEauzbbTqDikpipO6jzLR4LH+8iI/6rukMN2zWQf5uSOK4/ZWWG2V+z3ab
	3hKo88QrBPL64cL9Bzv5k8hoj+HzOX44AeIK0e2iMGEepY+6f4F23xmZyokSfMFC
	ENknlN39RYapi4MwHxSDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673728189; x=
	1673814589; bh=Fqp7Jud/9UiflLvDreeqx0ZjBhhN3hvcjYSLQCbOlIQ=; b=L
	CJXhmhG7kPafuaFgPe+OoF35HW/GawIvw1COwIdAKOXMUL7n7ia+BPNcHhF8AU1d
	ZeglTfyhzwN3DbMIcCAmQ+MCsC9Rz8rKr3q+9f/aTZteu0PinHxyChmj1bs8RiN0
	f7hr5uo/p4lCAkZCTPqxPOBdD2rII296w5T8RfKch5kw0j+5BshYgPt1h3VIp+6f
	TTo/usBRwiRihtVztuOmxth8Ydl8x4pWF9exOeysIfajiL4xy3YBrvEWo+M1VEnJ
	nMBhioyzNpRn4/KsOiyKOX4R8JyOJHFYwGXUdQJykulsYaaZ+UVjjg/vk6bg4S9s
	8QMZexUuREH2MCAOVunjw==
X-ME-Sender: <xms:vBDDY8Wme7amJB0xwV5uTp09BgjNdRWZm9IMFMvGT1VL8GGBfnSidA>
    <xme:vBDDYwkcDaatLxDa2EN1VhfAjIgnpiExpUqBE9A8mMR0ZDg9V2V1094T-lQgH1Uqn
    mrFco-QYYAkJ5T4Xw>
X-ME-Received: <xmr:vBDDYwZecRgatRpwA7UXkj6JixUFvg_sqL84kXWmolmNPzmWFT-xaenJDZ48vPzf6uKsMUOdUr-uU_fWaeCI3xCA2B0Cby2_FgwPrOQcXSfku8o-sbBxFXe_Hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeel
    leeftdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:vBDDY7XYKWk2k1IzwqwxX1PWhU00iXvhJnLIN-Sc475ByvYSsW8auQ>
    <xmx:vBDDY2mno1im5htsUzolQzFL9t1SV8jyr7qIqpZ0c2sFkO2UgeVSyA>
    <xmx:vBDDYwc6yakw6UoF-3QnW7h3S-sJrdtXQi08dbcN56X79-6EWBCxyQ>
    <xmx:vRDDY9v7RBp7cJlRluJLJTLhhTiUUnUWFqksV_HhHErovWqB7RbqTA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 15:29:48 -0500 (EST)
Message-ID: <37132ffe-f248-7fc8-7123-2b09a812f06e@sholland.org>
Date: Sat, 14 Jan 2023 14:29:49 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] sunxi: f1c100s: Drop no-MMC hack
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, Icenowy Zheng <uwu@icenowy.me>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Taube <mr.bossman075@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230105020908.19534-1-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230105020908.19534-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/4/23 20:09, Andre Przywara wrote:
> When support for the Allwinner F1C100s SoC was originally introduced,
> its DT lacked any MMC nodes, which upset our sunxi-u-boot.dtsi overlay,
> when it tried to add an alias to the SD card.  To quickly fix this back
> then, we guarded that alias with a preprocessor macro.
> 
> Now the F1C100s family has gained MMC nodes, so we don't need the
> special treatment anymore. Just remove this guard.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/dts/sunxi-u-boot.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>

