Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E55A2C
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Oct 2023 03:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sholland.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sholland.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="BjLbszlg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="deQLEVzl"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id CD6245C0285;
	Sat, 21 Oct 2023 23:44:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 21 Oct 2023 23:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1697946252; x=1698032652; bh=96PhR3qhYokr5/qh6BcPOwDQknYyN+6jKQF
	xQpwfMDw=; b=BjLbszlgvGcdnX5leVZoipG08VPjNb0yydM7jA7kFCSUT5id2w1
	+JfbrGG7vVnKYiQgROAJWzlXFEUGU67bzr22PQkuzC35a4sX2BenB6XQ8B4BMb1x
	iE0ikifxHit/7fcY0JjI0RVvWnCYHFICRP4Q2irh/9qXIbDm8ALcXbP1gafBH1lT
	slJyUdm0Ic2bHWvZ4tGt+1RuYeOquDSvbEgohSbas6N/R2O05AxAlZy8NqkYOKV0
	Hw6yOdpMlFuS9Mcw/GZfJTIFhjb8nnahomHnkm6XBu3NyySOs18Eb/IHRICGLT4w
	qDG9raFF9arAyC1oAz6L1ejiazZTwhFovBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1697946252; x=1698032652; bh=96PhR3qhYokr5/qh6BcPOwDQknYyN+6jKQF
	xQpwfMDw=; b=deQLEVzl5W07wK7yRUSBXr9AmG/KVrL93ThtPa2ZSX9zYVZdNCl
	QiYxHC8oTdWePas+/nVnvztV0HGvcxiWWwftD4ISXhlDvcreze+s2VoTyhTvX9PW
	TW98QWCqbVvngXBsSev1QVVPUBfi6kZ+3jRQ2KG3zIFHW5SSYi0t9+d0hIW0jRyy
	v4GAkeAyeL5k6fOhlz4cSNDWmrglwo9ch4kjGz+vRJY+XjEgy+MOxK9OaLaFmO4t
	9lo1d0iPZcrPOW+aEb7u21AU1Ghyb2yQF0MGiJSJXjzDMc8vjbn3atjTFnQIuH7F
	jhbGW623KSE3PcQqKBndbJcVRoloS3FhvgA==
X-ME-Sender: <xms:jJo0ZYJ_h0EjezaIxek6b-84QD1m5BeUriiKhsFwa9ErEOKzBnxXaA>
    <xme:jJo0ZYIyDjP0I7WiqpsQcppBDBE-oPhMkSbkjttiKE8Rwwke_Htja4ebaW97Ohgoo
    Aey7G2CgozbHSNXZQ>
X-ME-Received: <xmr:jJo0ZYulpMFTe7lkEWZjvvuoaIdOodtPY1ZCBITGTPPL6Py6YeMezNUpQWSxfn_R6sdM1J28HqT0tG_DBqvaUQUZIGo3RAm29Dxj-eXRLJ_rw1pekHKWLjbE5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkedugdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeelleef
    tdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:jJo0ZVbK3MoaBCi_B7lBdgyBTuzazyQxau_8gpwRB1zBr5evv8Cmdw>
    <xmx:jJo0ZfYuVxWa9VV77Be6EkVBuAJKOb1YOKpVBtLrZDtXOpRDDrNfTw>
    <xmx:jJo0ZRCf_omxyE2SEzikQm2OAJHlGvSIUuHuU9WsnDJt_OVtwhYKnQ>
    <xmx:jJo0ZdMGxM4feZqytKckyVm_P45lWWXRxKEL1Sd73Q0_bblTZ__btg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Oct 2023 23:44:12 -0400 (EDT)
Message-ID: <19518251-d5fc-676f-6161-3dd5db54553f@sholland.org>
Date: Sat, 21 Oct 2023 22:44:11 -0500
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 15/22] Kconfig: sunxi: prepare for using
 drivers/ram/sunxi
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng
 <uwu@icenowy.me>, Maxim Kiselev <bigunclemax@gmail.com>,
 Sam Edwards <cfsworks@gmail.com>, Okhunjon Sobirjonov
 <okhunjon72@gmail.com>, linux-sunxi@lists.linux.dev,
 andre.przywara@foss.arm.com, Jagan Teki <jagan@amarulasolutions.com>,
 u-boot@lists.denx.de
References: <20230928215455.28094-1-andre.przywara@arm.com>
 <20230928215455.28094-16-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230928215455.28094-16-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andre,

On 9/28/23 16:54, Andre Przywara wrote:
> At the moment all Allwinner DRAM initialisation routines are stored in
> arch/arm/mach-sunxi, even though those "drivers" are just a giant
> collection of writel's, without any architectural dependency.
> 
> The R528/T113-s SoC (with ARM cores) and the D1/D1s Soc (with RISC-V
> cores) share the same die, so should share the same DRAM init routines as
> well.
> 
> To prepare for this, add a new sunxi directory inside drivers/ram, and
> add some stub entries to prepare for the addition of the share DRAM code
> for those SoCs.
> 
> The RISC-V D1(s) SoCs will probably use SPL_DM, so make this entry
> depend on that already.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/ram/Kconfig       |  3 ++-
>  drivers/ram/sunxi/Kconfig | 14 ++++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/ram/sunxi/Kconfig
> 
> diff --git a/drivers/ram/Kconfig b/drivers/ram/Kconfig
> index bf999645774..5b07e920301 100644
> --- a/drivers/ram/Kconfig
> +++ b/drivers/ram/Kconfig
> @@ -109,8 +109,9 @@ config IMXRT_SDRAM
>  
>  source "drivers/ram/aspeed/Kconfig"
>  source "drivers/ram/cadence/Kconfig"
> +source "drivers/ram/octeon/Kconfig"
>  source "drivers/ram/rockchip/Kconfig"
>  source "drivers/ram/sifive/Kconfig"
>  source "drivers/ram/stm32mp1/Kconfig"
> -source "drivers/ram/octeon/Kconfig"
>  source "drivers/ram/starfive/Kconfig"
> +source "drivers/ram/sunxi/Kconfig"
> diff --git a/drivers/ram/sunxi/Kconfig b/drivers/ram/sunxi/Kconfig
> new file mode 100644
> index 00000000000..261d7f57409
> --- /dev/null
> +++ b/drivers/ram/sunxi/Kconfig
> @@ -0,0 +1,14 @@
> +config DRAM_SUN20I_D1
> +	bool "DM DRAM driver support for Allwinner D1"
> +	depends on RAM && ARCH_SUNXI
> +	default y
> +	help
> +	  This enables support for DRAM drivers using the driver model
> +	  for Allwinner SoCs.
> +
> +config DRAM_SUN8I_R528
> +	bool "DRAM driver support for Allwinner R528/T113s"
> +	depends on ARCH_SUNXI
> +	default y if MACH_SUN8I_R528
> +	help
> +	  Select this DRAM controller driver for the R528/T113s SoCs.

Please use a single Kconfig symbol for enabling the driver, whichever
name you choose. It doesn't need to depend on RAM -- you've already
#ifdef'd out the RAM parts. See my comments on the next patch.

Regards,
Samuel

