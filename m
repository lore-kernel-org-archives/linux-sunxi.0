Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364A83222
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 21:00:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 3523F3200908;
	Sun,  8 Jan 2023 16:00:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 08 Jan 2023 16:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1673211630; x=
	1673298030; bh=ySOiPdhl0qgV4b2YEVovm0B9e02rcCMg3tw1EVzav+w=; b=n
	Qj3gdG2smRcguKY5yFn9MEKmqJN3CH3LhESaMd3x3aBOYXwmG6Z9Za4nqbcCrcMs
	cf4Up6eta7+dU/piFChMUhpuEqi9WxBsa2nFNXCJCIi2z+kfsCN9F8ZpttbM6Sfd
	H3o9fwMtYjO+9MCxD6gaGnsc7RQ4uMRFCtMxi51rn2zbY/eWKyjUCt4BzcSAQMCv
	yUV+MoUHyg9KiIjtUFpgqjGfdquQjnYQJfxBuUZwXO39iynM8KIVhOaY1FBU5aHV
	rpujy4C/r8Z2J0QO4SCHOnc6loBMYOo19ILWs4IldRHsFpJcbVRxFT2tETzOdvUM
	VBTJ8Xj1o5DvENLvc0T5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673211630; x=
	1673298030; bh=ySOiPdhl0qgV4b2YEVovm0B9e02rcCMg3tw1EVzav+w=; b=X
	RFccNBPKGcSBhxW9LjV/mXqnzJegtGWRP3SDOja7ILA79R1NuOyh/jZwt0R/s6aY
	4VbNv6KrsSlrUtlcr473p1hPtz30KePaqocvbz2bXbEW1G+yN0LOGWOZpU0XfGaw
	MFd12KlYKJkhg8O4+swkaQhC9WIoWbqB8XosB8e0/a/H9rU9chatju+vea60YFUL
	TdFYP5d/sQ534Jev4lmfdGS3p49RfAoHoHes3iDnRLf5DjB5V2k0HXbCsQUjXrrt
	frRr0BBSx1sVmxNW0qiGEwR1Vkxk86LuaSgWsxUeXq1YidWz9zWTdrYlf19QRXHh
	Ui2ktnEGGcxpQkgEnmTrw==
X-ME-Sender: <xms:7i67Y2Hbq-G47MeoEmCsmFMo8pgvhNtRMJ2snEo9zkIGHlffl6j2gA>
    <xme:7i67Y3WqpyAZxko82oQmrNTa0_RzFasoWXV3DNgNT3u_FNefnr1yPrivPdfKHuTQf
    L0V0DwY8oyiu1Wc6A>
X-ME-Received: <xmr:7i67YwIKxRuKqgCNdXkaK3LfuSmgirSHUv4Hz8SMwY_ccfO8ghYezVrMM_SMCtBq9EPJov4tAhUDzjSNABWPnrZQK6lvIbk1sE8dnqELQ2QCDdfgGpfda9SG1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggddugeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeejgfffhfdujeeftdeuudeguedttefgieetffffheejuefguedv
    heejteeftdfftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:7i67YwF7nhRwC4r1FOa08DFlduMl8GKUPPmnenF4BGD68M9jxh3RZw>
    <xmx:7i67Y8UJLamB6Gm9op9oDG0B5Khnhy9k5tWlJCaaGokL66e2y3_kgw>
    <xmx:7i67YzPDdterOcXOlYu2MbSTmzFQW6tXvv5yozwgceglRi6A0k2fsQ>
    <xmx:7i67YzQ8k1Lqk46rEnw-mHGPVbZZtmzQqv5wp0_C0X72qkoe-R4SoQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jan 2023 16:00:30 -0500 (EST)
Message-ID: <426c7518-04cf-8cd7-597a-bfa2d24863d0@sholland.org>
Date: Sun, 8 Jan 2023 15:00:29 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20220713162145.95744-1-andre.przywara@arm.com>
 <20220713162145.95744-2-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/3] sunxi: mmc: ignore card detect in SPL
In-Reply-To: <20220713162145.95744-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andre,

Thanks for helping to get rid of sunxi_name_to_gpio().

On 7/13/22 11:21, Andre Przywara wrote:
> The sunxi MMC code does not use the DM in the SPL, as we don't have a
> device tree available that early, also no space for it.
> This also means we cannot access the card-detect GPIO information from
> there, so we have Kconfig symbols called CONFIG_MMCx_CD_PIN, which each
> board has to define. This is a burden, also requires extra GPIO code in
> the SPL.
> As the SPL is the natural successor of the BootROM (from which we are
> loaded), we can actually ignore the CD pin completely, as this is what
> the BootROM does as well: CD GPIOs are board specific, but the BootROM
> is not, so accesses the MMC devices anyway.

The card detection logic is useless for an even simpler reason: because
of our spl_boot_device() implementation, SPL only accesses the MMC
interface where SPL itself was originally read from. Therefore, it must
have a card inserted.

> Remove the card detect code from the non-DM implementation of the sunxi
> MMC driver, to get rid of this unneeded code.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/mmc/sunxi_mmc.c | 37 ++-----------------------------------
>  1 file changed, 2 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index 1bb7b6d0e9..b2f7e2d142 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -44,22 +44,10 @@ struct sunxi_mmc_priv {
>  /* support 4 mmc hosts */
>  struct sunxi_mmc_priv mmc_host[4];
>  
> -static int sunxi_mmc_getcd_gpio(int sdc_no)
> -{
> -	switch (sdc_no) {
> -	case 0: return sunxi_name_to_gpio(CONFIG_MMC0_CD_PIN);
> -	case 1: return sunxi_name_to_gpio(CONFIG_MMC1_CD_PIN);
> -	case 2: return sunxi_name_to_gpio(CONFIG_MMC2_CD_PIN);
> -	case 3: return sunxi_name_to_gpio(CONFIG_MMC3_CD_PIN);
> -	}
> -	return -EINVAL;
> -}
> -
>  static int mmc_resource_init(int sdc_no)
>  {
>  	struct sunxi_mmc_priv *priv = &mmc_host[sdc_no];
>  	struct sunxi_ccm_reg *ccm = (struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
> -	int cd_pin, ret = 0;
>  
>  	debug("init mmc %d resource\n", sdc_no);
>  
> @@ -90,16 +78,7 @@ static int mmc_resource_init(int sdc_no)
>  	}
>  	priv->mmc_no = sdc_no;
>  
> -	cd_pin = sunxi_mmc_getcd_gpio(sdc_no);
> -	if (cd_pin >= 0) {
> -		ret = gpio_request(cd_pin, "mmc_cd");
> -		if (!ret) {
> -			sunxi_gpio_set_pull(cd_pin, SUNXI_GPIO_PULL_UP);
> -			ret = gpio_direction_input(cd_pin);
> -		}
> -	}
> -
> -	return ret;
> +	return 0;
>  }
>  #endif
>  
> @@ -523,23 +502,11 @@ static int sunxi_mmc_send_cmd_legacy(struct mmc *mmc, struct mmc_cmd *cmd,
>  	return sunxi_mmc_send_cmd_common(priv, mmc, cmd, data);
>  }
>  
> -static int sunxi_mmc_getcd_legacy(struct mmc *mmc)
> -{
> -	struct sunxi_mmc_priv *priv = mmc->priv;
> -	int cd_pin;
> -
> -	cd_pin = sunxi_mmc_getcd_gpio(priv->mmc_no);
> -	if (cd_pin < 0)
> -		return 1;
> -
> -	return !gpio_get_value(cd_pin);
> -}
> -
> +/* .get_cd is not needed by the SPL */

nit: s/get_cd/getcd/

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

>  static const struct mmc_ops sunxi_mmc_ops = {
>  	.send_cmd	= sunxi_mmc_send_cmd_legacy,
>  	.set_ios	= sunxi_mmc_set_ios_legacy,
>  	.init		= sunxi_mmc_core_init,
> -	.getcd		= sunxi_mmc_getcd_legacy,
>  };
>  
>  struct mmc *sunxi_mmc_init(int sdc_no)

