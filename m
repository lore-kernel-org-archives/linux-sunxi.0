Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A413B486624
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045621; cv=none; b=SD+D+DCqxzRKCFO2bFrNy2U7/2pVeof7UJnx3ANYHbhl1qir0l7EALopEEanDDKx46WgjGLKPXotjepqsQEEn/WgQ2Xzll8xL/EvWqhBeEJPWOMXfD04txi39lCmYJSAN3LC/cHefXb8tjeaj/8cxU6hot06XXPTTiBBN7USaug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045621; c=relaxed/simple;
	bh=j++54T3sUZ+8HaFYRaDy0ZlOlzbDf1s23ZOYnPY0yUI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fs0qaNw1GJF8TPzwv8J3ZL1vK2+xohD/ANRycJ7l0SJT9ij+9MI5Z+0RqTNJtNgwA5kWCQAgZLBQQggWCzoSGr9PW1UvsNcoAEu/ClUKKFwivbEgX2R8XmvITQLWP0bE0PDC6gIaht9hWK26yY7Uo9taHRxpPzrBuIM8dtla3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VQeuIVcq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VQeuIVcq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so1262012f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 06:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789045613; x=1789650413; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s417j/ysygJZ4xE0jMBISIxl2zgVW4JEiLwZ40hycxA=;
        b=VQeuIVcqtYcLoyQYMn4Xsv0TSinB+QnShftz9GipH6DCBa5eHigYDmCsjZ0NQY/MmH
         6SWy03OtcXzsFeSOLM/M57LENcxSsgDv92VT614LBv5oOggZaINCQX8geXa5aAmy2c+H
         y79rjEDbUM405M52LsTTus0K3lRLoA+wNuoLKEtmKxahgtP+53llUNLcywcWc9dGDxGs
         3a5i77SwVTywtmZoa5+sWaGJlOsUJ0k7WgweZg5WP/NcweDmx+6Yn2nUKvq7lZi7phh6
         ToVgTg78r/6rMXac8Z3gw/3+EIjVl7VeTp8hK3ywt+7AatXWZN099ipevN0kR+LxkkWg
         Au0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045613; x=1789650413;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s417j/ysygJZ4xE0jMBISIxl2zgVW4JEiLwZ40hycxA=;
        b=k7WCwvGhVX+q+daZtl9nkH2kyN5/zk9u4oCsqWLZFJQDitaJQJumJW1CY1VZBbGjy4
         NuarHnIEC7SGxG3EICC/YcZkeYISMuWp+EzmnqZwmVzll4Ppyp2V3hTfq2BNq+VQGWuk
         GOiWr119etUVMSLNZusgqcsx3m6qSr5F43tTx36Jy+HJ8U62UXVbN52ZIzMEBcMKrpzo
         IaKUsNssyh4lRXKvpcOoROHB6PYdnlH3VSz910wtFsE4fLu6sQVgDTMVPliINUPNv0P8
         iR8BiEy2IRTBX2rBmEHomsnk4rESUvZFgOrc0gANUFd9iHefPc3fCHdfO3TbA3YFJlHB
         mNzg==
X-Forwarded-Encrypted: i=1; AKwUvBx9IQ5qar29ECM3NoJMuiQnLUS600h9nKtJfrDMTENVnJxjbtHHn8o/HKW5JLwnzDg1Ecu9y3ybA+sHcQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mAxw1YxuByYTEIYs8mAmdoHHXmznjUk4G+TOST7/66A/JmpXhN
	F4c4JbgC/8kKpmwmKr6sk8eBMBWq7daPqX54OJFLVzWbayYedzF0QHNs4fJPtIpnhRA=
X-Gm-Gg: AYBFou3cm/Vc2Sm74u3bX8ZWukAJB8NcdU17fEiLKHLeSyQKblfuiYjMN9Bg4V6Leiq
	zMJvbVQR8r0NE22kuJErssneAkhwF42+3+whB51GK7mz/X8c5+Pi4NHESkugxY6wYt5ZR28xrXO
	Tgu0WVnCku5bYI9EIcoyQw6v56+nny4Fbz1CKvsH7m537uDknK2kZVdKcPMihLl8PXaHdhnK+tF
	m5UneeDpaj/MhHBp6JmhH3j33fgCFhY9L+X35XpNir2yENTNMnvOQyAM074P/3IPgd9OOirnu+N
	kjuxTU4gSVGJbjWryDwqGw0urUuGFnkiPz+FR74TuZDIKNJvBaQP1NWsFGyBLdY3L4T932YQrpA
	5PZHMqVGNH5JUHUFhQe5BvvL0Vn8vDy6rHhFt2+QC2QoidZdWiYrwG8+sMF/m1exV5pt83HhxDN
	/fZ1LAfV0Dhs1eIc7MyXqWVbEr8kQ66GxPmiGt7h/TWJcTj+FdVJ8AUio9omfVlp4LNoHAWaXHN
	08ln/5awh6F61vZFJyBgKb1EYKI
X-Received: by 2002:a05:6000:22c8:b0:484:3310:710d with SMTP id ffacd0b85a97d-485aae0e29amr22786196f8f.25.1789045613146;
        Thu, 10 Sep 2026 06:06:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm44969402f8f.2.2026.09.10.06.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:06:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Richard Cochran
 <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
In-Reply-To: <44d7840d-0cde-4022-937c-4c630398c45d@bootlin.com>
References: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
 <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
 <44d7840d-0cde-4022-937c-4c630398c45d@bootlin.com>
Date: Thu, 10 Sep 2026 15:06:51 +0200
Message-ID: <1jqzj16ys4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 10 sept. 2026 at 12:59, Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Hi Jerome,
>
> On 9/10/26 12:25, Jerome Brunet wrote:
>> The A733 GMAC210 is a DesignWare MAC 5.20 using an Allwinner glue close to
>> the A523 GMAC200 already supported by this driver, with the following
>> differences to handle:
>> 
>> * The glue configuration registers are a dedicated MMIO region of the
>>   controller instead of a syscon register. This new register region
>>   appears to be in the reset domain of stmmac's main reset. This requires
>>   the glue driver to handle the reset rather than letting stmmac deal with
>>   it.
>> * The TX clock delay value is 5 bits wide, split over 2 register fields,
>>   allowing delays up to 3100ps.
>> * The DMA channels have their own interrupt lines, so the per-DMA-channel
>>   interrupt mode is enabled, as the vendor SDK does.
>> * TX LPI clock gating is supported, as the vendor SDK indicates. Follow
>>   the PHY capability with STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP rather than
>>   forcing it on with the deprecated 'snps,en-tx-lpi-clockgating' DT
>>   property.
>> 
>> Unlike the A523, both GMAC instances are supported by the same driver.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> [...]
>
>> +
>> +static struct regmap *sun60i_gmac210_get_regmap(struct platform_device *pdev,
>> +						struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	void __iomem *base;
>> +	int ret;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 1);
>> +	if (IS_ERR(base)) {
>> +		dev_err_probe(dev, PTR_ERR(base), "unable to get glue memory region\n");
>> +		return ERR_CAST(base);
>> +	}
>> +
>> +	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {
>
> Why check stmmac_ahb_rst, but not do anything with it ?

Not strictly required, it was cheap to do and catch mis-configuration
since the stmmac treat them as optional. I'll drop it

>
>> +		dev_err(dev, "missing required reset controls\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	/*
>> +	 * The configuration registers are inside the controller
>> +	 * reset domain, so the reset must happen before any write to them
>> +	 * and should not be done again by stmmac or the configuration will
>> +	 * be lost.
>> +	 */
>> +	ret = reset_control_assert(plat->stmmac_rst);
>> +	if (!ret)
>> +		ret = reset_control_deassert(plat->stmmac_rst);
>> +
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "device reset failed\n");
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, sun60i_gmac210_reset_assert,
>> +				       plat->stmmac_rst);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	plat->stmmac_rst = NULL;
>> +
>> +	return devm_regmap_init_mmio(&pdev->dev, base, &sun60i_a733_regmap_cfg);
>
> I wonder if this is the first glue to face this...
>
> If you need further setup to be done after reset has been deasserted, I suggest
> adding a dedicated callback in plat_stmmacenet_data, instead of doing this behind
> the generic code's back.
>
> maybe something like "post_reset_init()", something like that ?
>

I'll check in this direction.

The idea was to do things behind anything's back, more to handle the
specifities of this SoC without polluting the rest. The timing seemed a
bit sensitve. For example touching the other reset in here broke the
link for some reason (recognize as GMII instead of RGMII)

> the ->mac_setup already runs after reset, but isn't really for this type of usecase.
>
> For readability of the patch, maybe you should split this patch to first do the
> a523 rework, then add a733 support.

ok

>
> Thanks !
>
> Maxime

-- 
Jerome
