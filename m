Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [80.241.59.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3081425C6F1
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Mar 2025 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.59.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805860; cv=none; b=QYxKpnlXM0P6z2Z5Dq9DNlBDiGIFfLyV87VAdxXpiYlnDxyKbrXcg37Y7PqBWLKdfOFcBsb+QVNVI7r/o+keGFMDweHp1ZFAhyMuYFKfxM5bHn17EltfXJ42fvDukgmUyxrQWUl8R35Tx6uaPrbvPLFTGkWgnutP/Y57pqBY0j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805860; c=relaxed/simple;
	bh=VGcFicCNltshZlVe9aWz90uEADmtQJVS8WKJv55Vl68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhoWwLBK5mRUtcdz+2L/fTAA6IimCtp80XrJx+G2WS8QavTzJSngqZysAIPsbfJTdehY4R0s1XX4sK+OlMB4tl5ZF3Xgq3dibIStovwF6FH4cNXPTFl6m/eDQdqEVZ13DZ2Xh0p24zaGi/fRpNUsfsBVeKQLse8BF1mvslkgG30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de; spf=fail smtp.mailfrom=denx.de; arc=none smtp.client-ip=80.241.59.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=denx.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4ZLmf63XwTz9t1R;
	Mon, 24 Mar 2025 09:38:06 +0100 (CET)
Message-ID: <db53fe94-669e-49d0-a1b5-5a77a280ab9a@denx.de>
Date: Mon, 24 Mar 2025 09:38:04 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 19/34] watchdog: sunxi: add A523 support
To: Andre Przywara <andre.przywara@arm.com>, Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-20-andre.przywara@arm.com>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20250323113544.7933-20-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.03.25 12:35, Andre Przywara wrote:
> The Allwinner A523 SoC moved the watchdog into a separate MMIO frame,
> and also shifted the registers a bit: the control, config, and mode
> register are located four bytes earlier.
> 
> Add the new compatible string, and connect it to the new struct
> describing the new register layout.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

> ---
>   drivers/watchdog/sunxi_wdt.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index 8eeac935760..467db5fe9bf 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -153,10 +153,21 @@ static const struct sunxi_wdt_reg sun20i_wdt_reg = {
>   	.wdt_key_val		= 0x16aa0000,
>   };
>   
> +static const struct sunxi_wdt_reg sun55i_wdt_reg = {
> +	.wdt_ctrl		= 0x0c,
> +	.wdt_cfg		= 0x10,
> +	.wdt_mode		= 0x14,
> +	.wdt_timeout_shift	= 4,
> +	.wdt_reset_mask		= 0x03,
> +	.wdt_reset_val		= 0x01,
> +	.wdt_key_val		= 0x16aa0000,
> +};
> +
>   static const struct udevice_id sunxi_wdt_ids[] = {
>   	{ .compatible = "allwinner,sun4i-a10-wdt", .data = (ulong)&sun4i_wdt_reg },
>   	{ .compatible = "allwinner,sun6i-a31-wdt", .data = (ulong)&sun6i_wdt_reg },
>   	{ .compatible = "allwinner,sun20i-d1-wdt", .data = (ulong)&sun20i_wdt_reg },
> +	{ .compatible = "allwinner,sun55i-a523-wdt", .data = (ulong)&sun55i_wdt_reg },
>   	{ /* sentinel */ }
>   };
>   

Viele Grüße,
Stefan Roese

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-51 Fax: (+49)-8142-66989-80 Email: sr@denx.de

