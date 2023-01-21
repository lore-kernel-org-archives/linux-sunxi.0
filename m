Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1643207
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Jan 2023 19:54:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 6F9AB3200708;
	Sat, 21 Jan 2023 14:54:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 21 Jan 2023 14:54:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1674330848; x=
	1674417248; bh=laY8oeCFqcVckQTX05hjbLbF03Ty2mxK/t7iXqoamjU=; b=b
	DbA9k8bDXUFpiBtCuQ+3GP4q7WqrozZh1LoGyeX5FZI76ZwzXEj8Lsma511HC1Cj
	XwJIAK4PLRhgOoPLWE6MWcJo48Ut6v0W3v82LhmpG17qwCDKlYSNAWEcTmcfI33p
	KkLlmvhUMNHTWvQF7zaGzSZQVElk9K6IuWdq9qEcykRT9QuQCEymRpV9h2W/j2W4
	47Zrz228XA5qU7Q6DRo+9jf3NOl/bJFfm06t9MxSc+rrnNDlRSt0mLlyLfoD3lsu
	7YwA2lRAiDCdqbHv2mQymx8xmVwMRRYwSPbFRtBU39+MZlUsoujbn0yfLGlMzmmi
	WnFZdl9SPaSyw2CSL9OXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674330848; x=
	1674417248; bh=laY8oeCFqcVckQTX05hjbLbF03Ty2mxK/t7iXqoamjU=; b=B
	N70bvdNmgPtPPc+bJma3IpxAv1EPiRc4i6Zs0XdPNNeqL+3Zu9qd2N3+Yozf9k4S
	NkaKRNPLpztxrv+6IOxtG7nkO2dgZBANvULJ2XMrsJnrbDtkF+dY7O/ecJ4brX6D
	xgBMCRnrsa9akw3cDsYVXKJxJtF39KWg4nQmj7TG2LnvAjt2Fclg838HTV3+qiqe
	mdSmFAe/sFYNRjRFGcE1B8uLbeTb/Gyea06cqXk2Chqx3Y/5RasswC0C4cJ+/szR
	gEkFVqAwSHZD2tf8vCoTPXI8UpcvblwSsct9Gva/s58IzOK5rp3lKw0rBHHa8egW
	kGukC2tGQu6r4RhGr6Utg==
X-ME-Sender: <xms:30LMY2iK5ImEm2TaG3HAZUyvhuOcHlGmEcXjKxgGQSFbKhndvsEygA>
    <xme:30LMY3B6fhpYe6IkbocJO56Iiq1VsCQ10RaNnGjVAvsESZ3ZYjPsvkTI_FYQyQXHp
    NN7uxJ0618zAP3WWw>
X-ME-Received: <xmr:30LMY-EZe-Bkl3nJTiFqBZCrTHZ2s1tCwqa36AT57bbDY0G5v2VmzGjr3eDOSTGdiL4Zn6v0hVlZWjep58627eq5ULgg3b8Wz0Mv2wEjUoi2-3yFH6nUvsXOMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddugedguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeel
    leeftdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:30LMY_SW-Wvirp9PGdew7iRtXFEhhIjdCmDIsrRh_4FYU_BFJkqY8Q>
    <xmx:30LMYzxCGDR4a1vP595uj74JmUiEQuHQ000649Ya7NvM19IMY8XmBA>
    <xmx:30LMY963DJJ9VePIktuVxryS6Vm_5Yy-OXsWf7eZVj5wxbz1kR_p5g>
    <xmx:4ELMY6lZqS60llaj2QcG4-UaBok-L6NaWkiLAh9LB2AcHf83m5TkdA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Jan 2023 14:54:06 -0500 (EST)
Message-ID: <70948ace-1b75-c639-c2d3-3a4b222afd38@sholland.org>
Date: Sat, 21 Jan 2023 13:54:08 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] ARM: dts: sun8i: a83t: bananapi-m3: describe SATA disk
 regulator
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230120012616.30960-1-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230120012616.30960-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/19/23 19:26, Andre Przywara wrote:
> The Bananapi-M3 has a SATA connector, driven by a USB-to-SATA bridge
> soldered on the board. The power for the SATA device is provided by a
> GPIO controlled regulator. Since the SATA device is behind USB, it has
> no DT node, so we never described this regulator. Instead U-Boot was
> turning this on in a rather hackish way, which we now want to get rid of.
> On top of that it seems fragile to leave this GPIO undescribed, as
> userland could claim it and turn the disk off.
> 
> Add a fixed regulator, controlled by the PD25 GPIO, and mark it as
> always-on. This would mimic the current situation, but in a safer way,
> and would allow U-Boot to drop the CONFIG_SATAPWR enable hack.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Samuel Holland <samuel@sholland.org>

> ---
>  arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> index 5a7e1bd5f8258..8d56b103f0630 100644
> --- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> +++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> @@ -105,6 +105,21 @@ wifi_pwrseq: wifi_pwrseq {
>  		/* enables internal regulator and de-asserts reset */
>  		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 WL-PMU-EN */
>  	};
> +
> +	/*
> +	 * Power supply for the SATA disk, behind a USB-SATA bridge.
> +	 * Since it is a USB device, there is no consumer in the DT, so we
> +	 * have to keep this always on.
> +	 */
> +	regulator-sata-disk-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "sata-disk-pwr";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		enable-active-high;
> +		gpio = <&pio 3 25 GPIO_ACTIVE_HIGH>; /* PD25 */
> +	};
>  };
>  
>  &cpu0 {

