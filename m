Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EE67E
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Mar 2022 01:27:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4B5B65C01D0;
	Thu, 10 Mar 2022 20:27:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 10 Mar 2022 20:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=4Ih4uXPzyKP+jY
	QjXCqJbWucDX42kWEsaEQAwGC1TVw=; b=qFeJ2yoTGtKpTtRJ9DCL4VV/Ht/esn
	LYKk2Ra2F7x9rwR2BakRw+uQllfMS8GGjpPe+e8dMMERKmutJ/kd0qln73H88eiN
	nkBVYFUK0u9xGPKss4f2ctPE6DJsv6Gw+G5T6hBYyRG10gVETA/N9j/t3hmaPRQy
	RAMAFv/execzEGGKFQBKOs8PBStO2zx60PWPACaHpXbmym1m51APirIt8tQRmnnn
	JwLsIzzotM3iugaZJBS3PrtlMIV/ME7CSHWcP3HCpf9BX/Vcili3+8CFsNSIqEAk
	E+fuPCxmxDFuUzYd/qdMtcHrLAUzNKwWquvW+nGXBLriJRucfAlEm7tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=4Ih4uXPzyKP+jYQjXCqJbWucDX42kWEsaEQAwGC1T
	Vw=; b=bnhQ5sPmZCQej4yaoeHKeSaUD2VnIyvCQSvRmm/9as9ZTjAI8OJic5Nv8
	7E7ERSU4jRBKQvmhl13tS8PPMMZrmc3D31TnowB/wKcCc3m6EtOxwwG4Fqggja5C
	nF+ytlLYaQOZHC5Fm1jNx3FVLWcFfP9okJo5wGaWQL7LSyXDOsb/HCNL5kgirfQb
	KTayzjAZGNsdp97l/9Zi9GC3NWk/3vC7Djo9MgXLmUQ7CpNTgCqranpzv9til9h2
	y8D6ECJ0xtVJBfUUL/9BZHTfnhRQfBTwGQvNIyouqHCb2tyOcWGU2Wt95dlhYnM4
	oSBGwVYEqzuW+7XMUyEu8Ujx1s8gQ==
X-ME-Sender: <xms:dKUqYgxixe4uCkyumv7DL_Gncd9rlR7jvy7vzEKnC1Iiqc5goqqpSQ>
    <xme:dKUqYkSjJxPzNW7v4_QDS44zigW0fafxDkdWwmefPCAJt0EV12MJD57_N_vQ50JFP
    TOAN5vGBu_opvX4uw>
X-ME-Received: <xmr:dKUqYiX0nzY1zR4UYkSajvnCmWH_ot22zfOVQbgvtFsoLl3KDiQIrAJKCGJVsNED7VwSxU8xhMHKUqE3GT4RexCKfSrHP_aRNi0Yt8FddBbM8iUwXKxIvps5iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvuddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepieeiueevfedutedugeffiefhjefhveffhfetvdevjeehjeeugfej
    ledvvdeuieelnecuffhomhgrihhnpehlihgthhgvvghpihiivghrohdruhhspdhlihgthh
    gvvgdrphhrohdpshhiphgvvggurdgtohhmpdhgihhthhhusgdrtghomhenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhoh
    hllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:dKUqYuidc2RKJbpUf6NUyyQfgcXEwol5_FBNgWfAfCbheWeE6KDJEQ>
    <xmx:dKUqYiBwPKNkxbKr8u8ewbCyqlFnvSTm38dzHs8Dpowcn5mR7-BXuA>
    <xmx:dKUqYvIZ32ve6klI2hRXf_dwc-icBYFxAupdvrmoNR0GZ0FeRpFrgQ>
    <xmx:daUqYjKNF-Iy-LXGOtWgdP3I9hTsKyZJxG71G94t93hJOGsmPVxyOg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 20:27:16 -0500 (EST)
Subject: Re: [PATCH 03/14] dt-bindings: arm: sunxi: document LicheePi Nano
 name
To: Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-4-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <221ccee8-69d8-0ad7-6f37-ebdaa3169755@sholland.org>
Date: Thu, 10 Mar 2022 19:27:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220307143421.1106209-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/7/22 8:34 AM, Andre Przywara wrote:
> The top level LicheePi Nano compatible name was never documented in the
> bindings, so add the currently used string.
> 
> It looks like the manufacturer might be "sipeed" as well, but I will go
> with the "licheepi" string that is in the actual .dts for years now.

From what  I can tell, "Lichee Pi Nano" [1][2] is the original board, and the
"Sipeed Lichee Nano" [3] is a newer batch by some of the same people [4].

Other than the silkscreen and the addition of the resistive touchscreen IC, the
boards look identical. And in fact I was able to find an intermediate version of
the schematic [5] that uses the old styling but includes the touchscreen IC.

So this looks good to me.

Reviewed-by: Samuel Holland <samuel@sholland.org>

[1]: https://licheepizero.us/
[2]: http://nano.lichee.pro/
[3]: https://wiki.sipeed.com/hardware/en/lichee/Nano/Nano.html
[4]: see e.g. http://bbs.lichee.pro/
[5]:
https://github.com/hongxuyao/F1C100s_with_Keil_RTX4_emWin5/blob/spl-separated/doc/lichee-nano/lichee_nano-Schematic.pdf

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index c8a3102c0fde..a7e7b2e79616 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -391,6 +391,11 @@ properties:
>            - const: libretech,all-h5-cc-h5
>            - const: allwinner,sun50i-h5
>  
> +      - description: Lichee Pi Nano
> +        items:
> +          - const: licheepi,licheepi-nano
> +          - const: allwinner,suniv-f1c100s
> +
>        - description: Lichee Pi One
>          items:
>            - const: licheepi,licheepi-one
> 

