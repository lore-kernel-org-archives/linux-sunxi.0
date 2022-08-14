Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAB12573
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 17:56:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 5DB11320046F;
	Sun, 14 Aug 2022 13:56:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 14 Aug 2022 13:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1660499817; x=
	1660586217; bh=+e13GbezqOI4ArqJrTYXTju73ASowLwd6TUNF4QfnPQ=; b=B
	PkH8n1qtJvm7VBJNwGkObUaA3PFcMM77RrZ6op6aSV9KOPeqJC+Sb21geMOM2Boc
	K2Dl0bTkg9V/UcugvwnVvEUna+DZZIqZwJ/BYlw5zBHciLkVTp6mzmcJrkLRThSW
	eZmGPLO5FhU8gNSf0kzZruQR0wxQpo/MEoxSo9JnXkTlCBDAsNngCz/q7uatpsg3
	frwPBrU6dmJ4aBNggKdqnYZQ8DZvkiGh0JJWKvLqVSRek9RGygPGmLRbaMcnWM7J
	aVV1rZAORqO9IK1fgSBMF1Ftfu8YsPCyJLp6728AvtlCvfg5p+4R12ldHUpX3bMf
	+H9qImtd7ZvnZNXlNfFkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660499817; x=
	1660586217; bh=+e13GbezqOI4ArqJrTYXTju73ASowLwd6TUNF4QfnPQ=; b=l
	zNvG/n0ryQT6vV6bSKCVKUem94QzKI42QIDJP2oprfcWgKtncyFIsgh7giDPZ3fR
	x9A7P43CzW+PuFTMi5Bj8pZDefIe1/jh4Mriax3Y7fptDSgOYICaguovNKVzxovg
	aEd6nH1gFC+kDQjOufxnhgYkcSWaR0g7pXWEazevuAtcs8TuEwuN17hu0ulg0bKy
	X5rcmGWe9dauHT+yPNclsFMVd85+mjwCgdv0XOSjeQb1255njOa2N2s7AEIIonF6
	5WwB+ir/4jZ+OVTTuGgW4mZFko/BmagNaiEEb/o+6s4uVUxwUbrtrgPVuis+wGfD
	lzhb+VLOY1GE/CTY5BX7Q==
X-ME-Sender: <xms:aTf5YlCceVzlG7Nsk3WXMAxncTsmZ5nnp2cr3aPYEJHoM2cF8tw4MQ>
    <xme:aTf5YjiK7WNM82edrYeZjYOGp6OHeIDFUUFc8xrzlK7Keu4oOB0BzhM3RpgnrJsJV
    99W6y-YmVbHd86Hyw>
X-ME-Received: <xmr:aTf5YgmCUunsdngiZ6q6abdz_ok4WmLUvNlTsYJnRb-AXVtBblFPskVcmV05Nqm7AC2n5AE1MvaURhUa6i0ucIsuIj-61Fq40LeX1XJgHytE-B7gDIIW6MpzNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehtddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfevfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnheptdevhfehhefgvdekteffleduueduheduuedvtdevleelkeev
    vdeuvdeihfekueehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:aTf5YvzfJGxuCJA4a2WtKkdP2053pbcegSjLphhVa4R6Iu3NeDG0Fw>
    <xmx:aTf5YqSKg20QO7BF5XZZk9-Jz_a1oUcoTAiFNOK_MQzo_7B-OLUXDQ>
    <xmx:aTf5Yib8p1fq5fQiH91wUNBgWm2HQDbobr2Wbkg7-l87JOKTCGtOBg>
    <xmx:aTf5YtH-uWbo2IIzOcNmFwo5jSdo9i2BLK8319d0Sa76gsy6EYlKNw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Aug 2022 13:56:57 -0400 (EDT)
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix clock refcount imbalance during
 unbind
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Maxime Ripard
 <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20220810022509.43743-1-samuel@sholland.org>
 <21565294.EfDdHjke4D@jernej-laptop>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <0f40b1cf-1f5d-41b6-04bb-0566f18cd91e@sholland.org>
Date: Sun, 14 Aug 2022 12:56:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <21565294.EfDdHjke4D@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/14/22 3:22 AM, Jernej Škrabec wrote:
> Dne sreda, 10. avgust 2022 ob 04:25:09 CEST je Samuel Holland napisal(a):
>> If the controller is suspended by runtime PM, the clock is already
>> disabled, so do not try to disable it again during removal. Use
>> pm_runtime_disable() to flush any pending runtime PM transitions.
>>
>> Fixes: 9a8e1e8cc2c0 ("mmc: sunxi: Add runtime_pm support")
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> Did you get any warnings for unbalanced disable calls?

Yes, I got warnings while I was doing unbind/bind cycles to force the SDIO WiFi
driver to reload.

Regards,
Samuel

> Anyway:
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Best regards,
> Jernej
> 
> 

