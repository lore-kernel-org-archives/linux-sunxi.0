Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD12E134CF
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520389; cv=none; b=kgueVUGA8Fw9t0OaHfKWtJ1Swr7ZZRyS4B/G7zYwcE25vsVHFcEJorKh5VnM09qdPAopBLRjMxmQ3EX+eVpHJH77d9T+MnfwbIn5hKMEmf/5vbOr/I/MTiQYp8MsHTrnDp0Tzp3HS4Xdr9TkKyg4fZnAO11sgnTvMznFmwWYWsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520389; c=relaxed/simple;
	bh=9Pp7heGkXikwR2MPYols4zVYj6+2UgirrkiY2EqqbtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuhxmLAk3JveO9ZSR6U5RECOwELpVRpQWOeifMQ4FPJZRLVGNKo4WtR6XfrIUi5IdOGTkAxhhfza1pqg4Mx5YfZUudsQ1Y96XktE9XVrXllmBo76Y4+qS1Ca2x2hQoYJWHqjhtonMP4vUGlm9VdDfSYUsxIlvkgQXNmJuKK+iqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWnwXyOz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWnwXyOz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso967889f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 11:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745520386; x=1746125186; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gr4+hHg1s1Vz8KykcZu6ckFDaY1sUleQ98tYZ6fqHeM=;
        b=EWnwXyOzaWMxuvR8FCl69UbuKTp9CLS6B+VluECdH6/k7B6gopmsHGz/QANdieFHu2
         Z0Gk3oCxEfgWqyfUpxtoeLnW5nLiPTz2Py76kKxIQW+tLD3JJF+E8ABzSaG1TMD7K92P
         AelYXj9oMq0yuwRcdx9duQdBIAGUwCmn3OwiFHv1sqagNV7cTi+fuDIopA52fkUfZeC1
         OEEc37l+hsx6CT5cNalVyaO/D9Gm6aCiKu/pxI/8MciOolKEmIhFLBbO3ZaaF07eGKpn
         N83CSiwd0+xTuZAUYYmdBi96bSwdQSarCQl4So3Azix0C2NmyN2zn1BbXsujXq2KrDDt
         C/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520386; x=1746125186;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gr4+hHg1s1Vz8KykcZu6ckFDaY1sUleQ98tYZ6fqHeM=;
        b=vIJUApjy6OqBbH90mhEEeqK3LVafelhQQZ9jgfvcwQbkLlBiN7ENtkGR2ANX3Tq+mh
         kNX6M0bKemtV8DNMh+pupdwM+9VqlqwuYVfbu4SM9B6xX31lBrnjMXXEqV2FU/hTQB73
         hzrREIlzLm1F8aW3bAROUNtz2HEfc5RLknYJOKrrAFCSC5SIR4+VvfDvD2xqoVLEEtgJ
         +vP51p51m5sssFosGNd2bVSVvW6MNyH6p51+0OyYnFmkl9wrOk6FeJ0POOrbvZHlFmSL
         aW0YWI0a60smLFWtKCgfd0XxyVWQ1YnFBMmnbBiSYGP+g86Z4ZG3AfaJGM6szTP8U5j6
         ftXw==
X-Forwarded-Encrypted: i=1; AJvYcCWfqSH4bJLvJbIvD2CQ0C9hpUgbm3xitXwgZEglea+IJs3GfNxeLMFqOVk9qyvokGvhofNd7HwZ8tMhzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhzqbXfYqCJ9VDyLEMcOKQTZ73/IEwqOoAmAOfK9xTUl0HVS/+
	GxXXrYJwZ2i0OkVAnz6ni5rBO2Zb3XgceeFleRNxR9pdNO6Pkgem
X-Gm-Gg: ASbGncskCDdkDwRePKzWfdnY1AaW9BlWplVV5sqtoW1epZN4X1wiov43W9cc7B/GMRw
	c1cx5G2zt1hP4Dutvfk5auuJGGPhnemt/FHWGBQ7XM/FFHv6pn2EO+dUweQz+tUHrEU8r6FfG4S
	B3y77Nvy22wqi81Y8KdNs1+vmqBCu8/vuXkzJ6f4swo6tIGlinT2XpTuz2WEDR6Fuu7DygC55ye
	KI7lpxiR8t0r/kD0BaEDpPch7+kTt3QXksk55I/263yPbfaRkB8r8xnyN+gMw2HQf8MpJtu/zeB
	rmrR1dn07KKi9LWkT7hX62vWxZoyQWIyIp45au1SIw==
X-Google-Smtp-Source: AGHT+IFBb87/U8U0Xr7SSs5IWrJkILsDxmsFWmACShVus3a+np0ZWwlOZBX6Q4SqRZjC+PW/UiyftA==
X-Received: by 2002:a05:6000:22c2:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-3a06d5ec30emr3136847f8f.0.1745520385685;
        Thu, 24 Apr 2025 11:46:25 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e5e345sm48557f8f.94.2025.04.24.11.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:46:25 -0700 (PDT)
Date: Thu, 24 Apr 2025 20:46:23 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Yixun Lan <dlan@gentoo.org>,
	Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH net-next] net: stmmac: sun8i: drop unneeded default
 syscon value
Message-ID: <aAqG_83YL0drm6sd@Red>
References: <20250423095222.1517507-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423095222.1517507-1-andre.przywara@arm.com>

Le Wed, Apr 23, 2025 at 10:52:22AM +0100, Andre Przywara a écrit :
> For some odd reason we are very picky about the value of the EMAC clock
> register from the syscon block, insisting on a certain reset value and
> only doing read-modify-write operations on that register, even though we
> pretty much know the register layout.
> This already led to a basically redundant variant entry for the H6, which
> only differs by that value. We will have the same situation with the new
> A523 SoC, which again is compatible to the A64, but has a different syscon
> reset value.
> 
> Drop any assumptions about that value, and set or clear the bits that we
> want to program, from scratch (starting with a value of 0). For the
> remove() implementation, we just turn on the POWERDOWN bit, and deselect
> the internal PHY, which mimics the existing code.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
> 
> if anyone can shed some light on why we had this value and its handling
> in the first place, I would be grateful. I don't really get its purpose,
> and especially the warning message about the reset value seems odd.
> I briefly tested this on A523, H3, H6, but would be glad to see more
> testing on this.
> 
> Cheers,
> Andre
> 

Hello

I tested this patch on:
sun20i-d1-nezha
sun50i-a64-bananapi-m64
sun8i-a83t-bananapi-m3
sun50i-h6-orangepi-one-plus
sun8i-h3-orangepi-pc
sun50i-h6-pine-h64
sun8i-h2-plus-orangepi-r1
sun8i-h2-plus-orangepi-zero
sun8i-r40-bananapi-m2-ultra

and didnt see any regression.

So you have:
Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks

>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 47 ++-----------------
>  1 file changed, 4 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 85723a78793ab..0f8d29763a909 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -31,10 +31,6 @@
>   */
>  
>  /* struct emac_variant - Describe dwmac-sun8i hardware variant
> - * @default_syscon_value:	The default value of the EMAC register in syscon
> - *				This value is used for disabling properly EMAC
> - *				and used as a good starting value in case of the
> - *				boot process(uboot) leave some stuff.
>   * @syscon_field		reg_field for the syscon's gmac register
>   * @soc_has_internal_phy:	Does the MAC embed an internal PHY
>   * @support_mii:		Does the MAC handle MII
> @@ -48,7 +44,6 @@
>   *				value of zero indicates this is not supported.
>   */
>  struct emac_variant {
> -	u32 default_syscon_value;
>  	const struct reg_field *syscon_field;
>  	bool soc_has_internal_phy;
>  	bool support_mii;
> @@ -94,7 +89,6 @@ static const struct reg_field sun8i_ccu_reg_field = {
>  };
>  
>  static const struct emac_variant emac_variant_h3 = {
> -	.default_syscon_value = 0x58000,
>  	.syscon_field = &sun8i_syscon_reg_field,
>  	.soc_has_internal_phy = true,
>  	.support_mii = true,
> @@ -105,14 +99,12 @@ static const struct emac_variant emac_variant_h3 = {
>  };
>  
>  static const struct emac_variant emac_variant_v3s = {
> -	.default_syscon_value = 0x38000,
>  	.syscon_field = &sun8i_syscon_reg_field,
>  	.soc_has_internal_phy = true,
>  	.support_mii = true
>  };
>  
>  static const struct emac_variant emac_variant_a83t = {
> -	.default_syscon_value = 0,
>  	.syscon_field = &sun8i_syscon_reg_field,
>  	.soc_has_internal_phy = false,
>  	.support_mii = true,
> @@ -122,7 +114,6 @@ static const struct emac_variant emac_variant_a83t = {
>  };
>  
>  static const struct emac_variant emac_variant_r40 = {
> -	.default_syscon_value = 0,
>  	.syscon_field = &sun8i_ccu_reg_field,
>  	.support_mii = true,
>  	.support_rgmii = true,
> @@ -130,7 +121,6 @@ static const struct emac_variant emac_variant_r40 = {
>  };
>  
>  static const struct emac_variant emac_variant_a64 = {
> -	.default_syscon_value = 0,
>  	.syscon_field = &sun8i_syscon_reg_field,
>  	.soc_has_internal_phy = false,
>  	.support_mii = true,
> @@ -141,7 +131,6 @@ static const struct emac_variant emac_variant_a64 = {
>  };
>  
>  static const struct emac_variant emac_variant_h6 = {
> -	.default_syscon_value = 0x50000,
>  	.syscon_field = &sun8i_syscon_reg_field,
>  	/* The "Internal PHY" of H6 is not on the die. It's on the
>  	 * co-packaged AC200 chip instead.
> @@ -933,25 +922,11 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
>  	struct sunxi_priv_data *gmac = plat->bsp_priv;
>  	struct device_node *node = dev->of_node;
>  	int ret;
> -	u32 reg, val;
> -
> -	ret = regmap_field_read(gmac->regmap_field, &val);
> -	if (ret) {
> -		dev_err(dev, "Fail to read from regmap field.\n");
> -		return ret;
> -	}
> -
> -	reg = gmac->variant->default_syscon_value;
> -	if (reg != val)
> -		dev_warn(dev,
> -			 "Current syscon value is not the default %x (expect %x)\n",
> -			 val, reg);
> +	u32 reg = 0, val;
>  
>  	if (gmac->variant->soc_has_internal_phy) {
>  		if (of_property_read_bool(node, "allwinner,leds-active-low"))
>  			reg |= H3_EPHY_LED_POL;
> -		else
> -			reg &= ~H3_EPHY_LED_POL;
>  
>  		/* Force EPHY xtal frequency to 24MHz. */
>  		reg |= H3_EPHY_CLK_SEL;
> @@ -965,11 +940,6 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
>  		 * address. No need to mask it again.
>  		 */
>  		reg |= 1 << H3_EPHY_ADDR_SHIFT;
> -	} else {
> -		/* For SoCs without internal PHY the PHY selection bit should be
> -		 * set to 0 (external PHY).
> -		 */
> -		reg &= ~H3_EPHY_SELECT;
>  	}
>  
>  	if (!of_property_read_u32(node, "allwinner,tx-delay-ps", &val)) {
> @@ -980,8 +950,6 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
>  		val /= 100;
>  		dev_dbg(dev, "set tx-delay to %x\n", val);
>  		if (val <= gmac->variant->tx_delay_max) {
> -			reg &= ~(gmac->variant->tx_delay_max <<
> -				 SYSCON_ETXDC_SHIFT);
>  			reg |= (val << SYSCON_ETXDC_SHIFT);
>  		} else {
>  			dev_err(dev, "Invalid TX clock delay: %d\n",
> @@ -998,8 +966,6 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
>  		val /= 100;
>  		dev_dbg(dev, "set rx-delay to %x\n", val);
>  		if (val <= gmac->variant->rx_delay_max) {
> -			reg &= ~(gmac->variant->rx_delay_max <<
> -				 SYSCON_ERXDC_SHIFT);
>  			reg |= (val << SYSCON_ERXDC_SHIFT);
>  		} else {
>  			dev_err(dev, "Invalid RX clock delay: %d\n",
> @@ -1008,11 +974,6 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
>  		}
>  	}
>  
> -	/* Clear interface mode bits */
> -	reg &= ~(SYSCON_ETCS_MASK | SYSCON_EPIT);
> -	if (gmac->variant->support_rmii)
> -		reg &= ~SYSCON_RMII_EN;
> -
>  	switch (plat->mac_interface) {
>  	case PHY_INTERFACE_MODE_MII:
>  		/* default */
> @@ -1039,9 +1000,9 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
>  
>  static void sun8i_dwmac_unset_syscon(struct sunxi_priv_data *gmac)
>  {
> -	u32 reg = gmac->variant->default_syscon_value;
> -
> -	regmap_field_write(gmac->regmap_field, reg);
> +	if (gmac->variant->soc_has_internal_phy)
> +		regmap_field_write(gmac->regmap_field,
> +				   (H3_EPHY_SHUTDOWN | H3_EPHY_SELECT));
>  }
>  
>  static void sun8i_dwmac_exit(struct platform_device *pdev, void *priv)
> -- 
> 2.25.1
> 
