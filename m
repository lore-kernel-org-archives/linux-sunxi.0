Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694584;
	b=2NsG5S3hDW8qo0r6kNgicvGK4w5Ypqh6xWLyeK4TnWJqfkR6ITdE23QuQ54+hUAo8jd/
	 E61pTbOqDHoBSG3G/0x+YAraU45tBfioKjpF1gVGSVvODB4uRrAVQSTuvzu+KSCL4gPO0
	 tqdaO78xtuiLt7jhsSd42cUzuElZFwb+YL4bnI02AdbmErvAvF1pd0o8dnC8iKoG7ylH3
	 ll4MHBKZ6Sto1cb13sitwabQ0lvC5jIc9VwIaeAUzX6gmblus+MuM1Q3XVsWRd4cughjO
	 LvYCPYUSomO7k5CKooihoC+UhUIJsCmdZSaMVQzjJhMzCJFjEwmGApHacqS5MAsyYrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694584;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tjY4VMD6ur+YRo7kgQD4h9llvSvso8DB1Z7wgH/PMD0=;
	b=AosXSUbTNmWc6YbP6Brllbp+wdJzq34SeEFtn+XllXMVVQA9V9q/mzfSdoQJpz7TDkAV
	 8v8e1h6NavHEOmKCRRx7zwauXBfdg1T0MEWPQeYIUiL72UAf5JSNb4HtLaPboB/dAFoqK
	 X0u5q7i1D9wkvDOa+wmLiXUEwJ0JueEpy59aZNUEBYjkAg/7QPvVl8lNMSdB078USViAd
	 2W0wOxvQ1u0Q9ZjScpQ6r4r839kbfB9vwt09Ikxa7pfeO+e5rMp9aifZgSxkoBIKikIV1
	 zReaOcNEI7Q0DIYelxcK2dI26ZOjLIq8AKYxYmhT04Dz8eiyDODxHH4svKOruna0Nfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gxFYgeqM;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D60606A321
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 12:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D60606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gxFYgeqM
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 430FE1C2B;
	Thu, 26 Nov 2026 04:03:00 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 477EB3F632;
	Thu, 26 Nov 2026 04:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795694583; bh=wDze3qxmOarI0bATetDdRV05lJwHBeC8KZ+rhYNobCs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gxFYgeqMsEQCEYXUnpXyvqF3H5CqESiwrz1XbWaMwrXgkYEkwx6q2vf42m9fJidEf
	 zhzN3l0m//JFQ+vACJEA/pAJXjxlz9mItF/RTVvIpxypGdMNgWEnvgpBGZeMv0ZuBo
	 gW97HbZ7ITAkpXb+YYF/3hgVxAKbNiOMqumd3qP8=
Message-ID: <0defdc40-a96c-4df3-aadf-3c3db3c48b7d@arm.com>
Date: Thu, 26 Nov 2026 12:02:59 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sunxi: Drop unused parameter from
 sunxi_grp_config_reg()
To: Alastair D'Silva <alastair@d-silva.org>, Linus Walleij
 <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261126104954.441427-1-alastair@d-silva.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261126104954.441427-1-alastair@d-silva.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/26/26 11:49, Alastair D'Silva wrote:
> sunxi_grp_config_reg() takes a pctl parameter that is never used.
> Drop it to match the original signature.

Ah yeah, looks like a development artefact. It's indeed not needed, so 
changing it back to where it was makes complete sense.

> Fixes: 8b367fc08be4 ("pinctrl: sunxi: refactor IRQ register accessors")
> Assisted-by: LLM
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 5 ++---
>   drivers/pinctrl/sunxi/pinctrl-sunxi.h | 3 +--
>   2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index bf4ec4665e2b..d30a562315aa 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -763,10 +763,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
>   		else
>   			val = 0xD; /* 3.3V */
>   
> -		reg = readl(pctl->membase + sunxi_grp_config_reg(pctl, pin));
> +		reg = readl(pctl->membase + sunxi_grp_config_reg(pin));
>   		reg &= ~IO_BIAS_MASK;
> -		writel(reg | val, pctl->membase +
> -		       sunxi_grp_config_reg(pctl, pin));
> +		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
>   		return 0;
>   	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
>   		inverted = true;
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index 7c2f29e75519..3060cef3705d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -328,8 +328,7 @@ static inline u32 sunxi_irq_status_offset(u16 irq)
>   	return irq_num * IRQ_STATUS_IRQ_BITS;
>   }
>   
> -static inline u32 sunxi_grp_config_reg(const struct sunxi_pinctrl *pctl,
> -				       u16 pin)
> +static inline u32 sunxi_grp_config_reg(u16 pin)
>   {
>   	u8 bank = pin / PINS_PER_BANK;
>   

