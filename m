Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1A517F3
	for <linux-sunxi@lists.linux.dev>; Sat, 11 May 2024 10:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715422238; cv=none; b=kuh+VGdXPtgcW3wA8ZkBKGSHIuzMuPJgX4VrFSARlTTei1Tkff8Xvy6z4hn7OG6U7VjjE1ZiGDf3IenCJfS8zRfxnQghPBuklFtZYJoG/cJZvVBHbAZzN00ktvwfUs1gdwQ5AI9fXjxhZTmAHVxxVuvYRoncC1APnHa+QCwEnIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715422238; c=relaxed/simple;
	bh=cqlPsPDdamIbREM5jPzEkSGzQ2MLhceoSIfSm/9KW/s=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=RPTQk4HQuhinbqhLNcRY0H8XICzbQXv8E2Rz12kmj9juZ0eY84rrGFqu5biZGD5PNtrWgXM2uuLioAsXsFFhyKrVTjPkag/e5HQO3yEmOgnjGyOBQSsRw5O6WXYO0cE4hMqCkbaZiTJx/9P29l4BR+gJSHzPJ6/E3f5C8W0FLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=rOLrCoke; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kKnodI3t; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="rOLrCoke";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kKnodI3t"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 18AF81C0010A;
	Sat, 11 May 2024 06:10:35 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Sat, 11 May 2024 06:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1715422234; x=
	1715508634; bh=p2IxAeisI4B+HZkJcWJFrEqZri6RVyUriXAsHbPOcCI=; b=r
	OLrCokeeunM32I+z29jw9A8hIpBkTuqNjNFCIWFduTpMCYB0QPem8Qh+5fAZizdd
	KrmsXzZKETpPmw+I9Tg6zwiLIrRqi1Gy9EDlAdXzgM4LC2ww2ukaowMSMMsQETOO
	7lMeetcVgWmKJuE/zKdiAL9RdFfDY5aSalIkMYdDMfjYZRi36to2bs5fuHpsMzAe
	Mw+c4F0Wc/YSD9gc84msf1GOBIJt1nWOmNsnM9kS72buBbBX+DCBoMYD43mO8bsf
	p6qpnndbjLGZckHjMsyUw9bvhjwZ8MuDc8Xmt1UVHXICxEWpwvF5IPZ+ghFlrqBV
	HTHjQooVnZsCKN6qB8wdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715422234; x=1715508634; bh=p2IxAeisI4B+HZkJcWJFrEqZri6R
	VyUriXAsHbPOcCI=; b=kKnodI3tMwST9llnNwba54JzSe3VPABDIhq5E6I/BzZP
	LOwhGCW9qUIeq8gYAKyLqkfblJdvSpXZmASz6G7IOAU5yI82pZlWPfvV8cYkWmZP
	dOsaMAJCS61Sa9rteLy49kSlJRCjuxqynFh3N7MwpQ1ahQsZYPRoPpymJ2c55n/S
	y+AEjX0WEBChNlzCAkenOvB90nf8x78fTVxSCQQ/0/YMOpnF9YbbYoInYN/ZPji/
	AAmJ/Y1ToeK7kajE9ruznHvJim/dV7OY+hWijR1C2lYsR7wrPk8osZJyDxb7xDAA
	hVZJLtNDmT2FJ0RLfiw7lHtMTtfuaGCKlQ9Hqyq4rg==
X-ME-Sender: <xms:GkQ_ZnTBjABr8YKY41zNdNg6HrF58XZzhyDErwviHzWUjKIJB0ifAg>
    <xme:GkQ_ZoyyouhQPWIewxvbM1Kn3fgiI9hna3dexxJl8nCLmQeG6c5K2C5Kqw1tsVKmE
    SZ2IzC5aX-x-qfFrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegtddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
    rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
    ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
    ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:GkQ_Zs0lIDLVbotf-iybj9WSpEQNOhT7Wm_8dh33C8XHlDjKVsukhA>
    <xmx:GkQ_ZnCyhR1jDzCoQscrmMTKQgLT35N5VvFFolN8PuTu7dtiN-34JA>
    <xmx:GkQ_ZghewYsHEutCJnFllV45pUeYAXfAeAx6uRLXJ2lCghexSvOEhg>
    <xmx:GkQ_ZrrVFlz_ktZsesHH77wJ0Net4rYjWCKT8uj9dtnt_13WduS4Jw>
    <xmx:GkQ_Zsj3jbDMjjBSZEfem7ohn-_y0AcoHPa758x6Hzur0hXil-hucA54>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 265D5A60079; Sat, 11 May 2024 06:10:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <ed15f4f9-7afe-478a-9f63-54309cff0c36@app.fastmail.com>
In-Reply-To: <20240509234319.13104-3-andre.przywara@arm.com>
References: <20240509234319.13104-1-andre.przywara@arm.com>
 <20240509234319.13104-3-andre.przywara@arm.com>
Date: Sat, 11 May 2024 22:10:12 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>,
 "Jaehoon Chung" <jh80.chung@samsung.com>,
 "Jagan Teki" <jagan@amarulasolutions.com>
Cc: "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Chris Morgan" <macromorgan@hotmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, "Tom Rini" <trini@konsulko.com>
Subject: Re: [PATCH 2/2] power: regulator: add AXP717 support
Content-Type: text/plain

On Fri, 10 May 2024, at 11:43 AM, Andre Przywara wrote:
> The X-Powers AXP717 is a PMIC with four buck converters and a number
> of LDOs, one of which is actually fixed (so not modelled here).
>
> Add the compatible string and the respective regulator ranges to allow
> drivers to adjust voltages.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/power/pmic/axp.c                |  1 +
>  drivers/power/regulator/axp_regulator.c | 28 +++++++++++++++++++++++++
>  include/axp_pmic.h                      |  1 +
>  3 files changed, 30 insertions(+)
>
> diff --git a/drivers/power/pmic/axp.c b/drivers/power/pmic/axp.c
> index fdf9ff66c29..c300fd2bbc2 100644
> --- a/drivers/power/pmic/axp.c
> +++ b/drivers/power/pmic/axp.c
> @@ -89,6 +89,7 @@ static const struct udevice_id axp_pmic_ids[] = {
>  	{ .compatible = "x-powers,axp221", .data = AXP221_ID },
>  	{ .compatible = "x-powers,axp223", .data = AXP223_ID },
>  	{ .compatible = "x-powers,axp313a", .data = AXP313_ID },
> +	{ .compatible = "x-powers,axp717", .data = AXP717_ID },
>  	{ .compatible = "x-powers,axp803", .data = AXP803_ID },
>  	{ .compatible = "x-powers,axp806", .data = AXP806_ID },
>  	{ .compatible = "x-powers,axp809", .data = AXP809_ID },
> diff --git a/drivers/power/regulator/axp_regulator.c 
> b/drivers/power/regulator/axp_regulator.c
> index d27e09538e0..75cdbca30f6 100644
> --- a/drivers/power/regulator/axp_regulator.c
> +++ b/drivers/power/regulator/axp_regulator.c
> @@ -189,6 +189,33 @@ static const struct axp_regulator_plat 
> axp313_regulators[] = {
>  	{ }
>  };
> 
> +/*
> + * The "dcdc2" regulator has another range, beyond 1.54V up to 3.4V, in
> + * steps of 100mV. We cannot model this easily, but also don't need 
> that,
> + * since it's typically only used for lower voltages anyway, so just 
> ignore it.
> + */
> +static const struct axp_regulator_plat axp717_regulators[] = {
> +	{ "dcdc1", 0x80, BIT(0), 0x83, 0x7f,  500, 1540,  10, 70 },
> +	{ "dcdc2", 0x80, BIT(1), 0x84, 0x7f,  500, 1540,  10, 70 },
> +	{ "dcdc3", 0x80, BIT(2), 0x85, 0x7f,  500, 1840,  10, 70 },
> +	{ "dcdc4", 0x80, BIT(3), 0x86, 0x7f, 1000, 3700, 100, NA },
> +	{ "aldo1", 0x90, BIT(0), 0x93, 0x1f,  500, 3500, 100, NA },
> +	{ "aldo2", 0x90, BIT(1), 0x94, 0x1f,  500, 3500, 100, NA },
> +	{ "aldo3", 0x90, BIT(2), 0x95, 0x1f,  500, 3500, 100, NA },
> +	{ "aldo4", 0x90, BIT(3), 0x96, 0x1f,  500, 3500, 100, NA },
> +	{ "bldo1", 0x90, BIT(4), 0x97, 0x1f,  500, 3500, 100, NA },
> +	{ "bldo2", 0x90, BIT(5), 0x98, 0x1f,  500, 3500, 100, NA },
> +	{ "bldo3", 0x90, BIT(6), 0x99, 0x1f,  500, 3500, 100, NA },
> +	{ "bldo4", 0x90, BIT(7), 0x9a, 0x1f,  500, 3500, 100, NA },
> +	{ "cldo1", 0x91, BIT(0), 0x9b, 0x1f,  500, 3500, 100, NA },
> +	{ "cldo2", 0x91, BIT(1), 0x9c, 0x1f,  500, 3500, 100, NA },
> +	{ "cldo3", 0x91, BIT(2), 0x9d, 0x1f,  500, 3500, 100, NA },
> +	{ "cldo4", 0x91, BIT(3), 0x9e, 0x1f,  500, 3500, 100, NA },
> +	{"cpusldo",0x91, BIT(4), 0x9f, 0x1f,  500, 1400,  50, NA },
> +	{" boost", 0x19, BIT(4), 0x1e, 0xf0, 4550, 5510,  64, NA },
> +	{ }
> +};
> +
>  static const struct axp_regulator_plat axp803_regulators[] = {
>  	{ "dcdc1", 0x10, BIT(0), 0x20, 0x1f, 1600, 3400, 100, NA },
>  	{ "dcdc2", 0x10, BIT(1), 0x21, 0x7f,  500, 1300,  10, 70 },
> @@ -291,6 +318,7 @@ static const struct axp_regulator_plat *const 
> axp_regulators[] = {
>  	[AXP221_ID]	= axp22x_regulators,
>  	[AXP223_ID]	= axp22x_regulators,
>  	[AXP313_ID]	= axp313_regulators,
> +	[AXP717_ID]	= axp717_regulators,
>  	[AXP803_ID]	= axp803_regulators,
>  	[AXP806_ID]	= axp806_regulators,
>  	[AXP809_ID]	= axp809_regulators,
> diff --git a/include/axp_pmic.h b/include/axp_pmic.h
> index aabafc8501b..ae62ef0d76d 100644
> --- a/include/axp_pmic.h
> +++ b/include/axp_pmic.h
> @@ -33,6 +33,7 @@ enum {
>  	AXP221_ID,
>  	AXP223_ID,
>  	AXP313_ID,
> +	AXP717_ID,
>  	AXP803_ID,
>  	AXP806_ID,
>  	AXP809_ID,
> -- 
> 2.35.8


Confirmed working on H700 board with AXP717 PMIC and LPDDR4 DRAM controller (Anbernic RG35XX-H). Registers and voltage ranges confirmed from datasheet.

Reviewed-by: Ryan Walklin <ryan@testtoast.com>

Regards,

Ryan
