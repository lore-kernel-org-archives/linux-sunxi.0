Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3298670
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 13:48:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4FAF55C0163;
	Tue, 30 Mar 2021 09:48:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 30 Mar 2021 09:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=6
	lbH9vqnNV2lk39BoAgyJUy7EEks4GGmsf7tTW7Vjvg=; b=Eyf1PPjPg4PfT1DyY
	HgbIwY+ojJCZm8Aj7p5+cJajp82cljj/ohcqEVu9Do3TOFO1wULYwx29L0UKF4Yz
	FQiLncekrW6bnUL7c06H9uMo62/nw2xcG7MhYHobEGdN6ka4V5C3DEvy53qvjIb7
	p25MxVQXKPXCtjxnitLyySq7vfa03Xolr4pc6sGly7M7gyMheHteHrXizaflywuM
	+HKk0a6NjjuXVeMltdy3BCU+pImrCjvdumHOtSMhlKKagBfM+8SXQs1YOqoVIxVx
	qdULvb2Rt25n1HtfiiZK6dtK6WfMWyjbicGY5doao+kBoQT7DR+UksbqdHcOxxTx
	SbLww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=6lbH9vqnNV2lk39BoAgyJUy7EEks4GGmsf7tTW7Vj
	vg=; b=db04lXFbgxQDkdmPsgQc91dFsWMbQ2jpW4phnl4lvmDkOnJqzI+a6aGpE
	dGyXt+VK0SawsXId3hlC67ftsCv+U8u+JUlEJa73K/ipcebLjI2p/g1dWQAIHmY1
	2iubBQNPm6XAM+RMEesOAp4TzaA7y6AdD1kHm2CLLYa8eI3WDHeX5gywbsUQV4kS
	nW2nBpg7B0Xn5MAJjn4ulhFk5YGdDkYt2STMrvEwKy1DhZ/lJCg1UHhR6HCRKZTE
	VD8wPF5H6cZmEFYFwDmwVPfshfvlLqHrkjQ2mqH6lPBf5KIuKDgrjNIhATcUIWJo
	VqCXfFNqO4Kaf2J3wdwlDqfvn68fw==
X-ME-Sender: <xms:ICxjYM-qfqNGtpXGARw9zEv7SfqxC8SD98F2x0eqjAgH9iDPWca3SQ>
    <xme:ICxjYFYi6PGKEC6396eWxvp0P_abC1rt9MVjab434Bgc-nVcd3wmmz-quAAyOTyt3
    ljfoagqB49hp12B0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:ICxjYAO3rBHPeCbP8Z2_iFCOqPO-l7RaN25fmOz4VACrLVjE67Kbdw>
    <xmx:ICxjYBD-B1a26aL4WVOit1_k5yYuq4vtgM4tyWlWSTl_Pel-0UI5Lw>
    <xmx:ICxjYHLoQ1oHTZsLcWMF7tVKM_MPMS7aGiT3cag7Gmrgqh5WHdc9cw>
    <xmx:IixjYJgBSEHkMlXwiqipey9073-p3rH03Kq6QabqmHjQExlJolMvlA>
Received: from [192.168.50.169] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
	by mail.messagingengine.com (Postfix) with ESMTPA id 10DB6240065;
	Tue, 30 Mar 2021 09:48:16 -0400 (EDT)
Subject: Re: [PATCH 1/2] sunxi: H616: Change TF-A load address to beginning of
 DRAM
To: Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>,
 u-boot@lists.denx.de, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev
References: <20210330130122.3915-1-andre.przywara@arm.com>
 <20210330130122.3915-2-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <cb8f6c4d-6a1f-d3ca-ae96-af96ece58889@sholland.org>
Date: Tue, 30 Mar 2021 08:48:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210330130122.3915-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/30/21 8:01 AM, Andre Przywara wrote:
> Loading Trusted-Firmware's BL31 at 16KB into DRAM was originally a hack
> to allow sharing more code with the other SoCs (which use this offset
> in SRAM). However there is no longer a reason for that, as the
> problematic macros have been properly separated there.
> 
> The latest (and hopefully final) TF-A code drop now changes the load
> address to the beginning of DRAM, which is also more easily protected
> by the Trustzone memory controller (code to be done).
> 
> Adjust the load address of BL31 now, to avoid any issues with
> incompatible versions later on (the TF-A patches are about to be merged).
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>

> ---
>  arch/arm/dts/sunxi-u-boot.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/dts/sunxi-u-boot.dtsi b/arch/arm/dts/sunxi-u-boot.dtsi
> index abe629c55e5..cd096bf2a06 100644
> --- a/arch/arm/dts/sunxi-u-boot.dtsi
> +++ b/arch/arm/dts/sunxi-u-boot.dtsi
> @@ -4,7 +4,7 @@
>  #define BL31_ADDR 0x104000
>  #define  SCP_ADDR 0x114000
>  #elif defined(CONFIG_MACH_SUN50I_H616)
> -#define BL31_ADDR 0x40004000
> +#define BL31_ADDR 0x40000000
>  #else
>  #define BL31_ADDR  0x44000
>  #define  SCP_ADDR  0x50000
> 

