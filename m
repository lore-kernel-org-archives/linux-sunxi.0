Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710558;
	b=FQgaMces8SsrPCidnLx/49a/48q6xLPJX7xfxaE0ibvFiV5Eg0JWI1CRx4wq4jUnQzez
	 bZEViUxmbuXB0bIfg2pP7JBAGaaM9z1WrlKB6gYOIU0Qydr79kcyjYdmWzjIPZSSJLH0f
	 1I4h70UkkjFZKZtkJO8jie3SaKWZ0pY9zdPAoOGwqgol7yxBZT1xCfzE5Rgw8ilixNI1d
	 cPth86IKDBkbTivTleAFDRrAH7bjH6oTUNLyfIxLio45DtBeEybn4ZwtepgjC/XmPh5Cl
	 BcEzBoTnwkN31CVxZPVqqd4O3+qSGH/nrhuvD0YfNbrPfXyK8fi5HyqCHYJtiSIB7Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710558;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=lfG40Px3f0wAIOWW8djRVGmO0yACnjIcUJ7Zj45snZo=;
	b=smAZplg3EHV+dZBeEHRysRgGRWudF/VcycQ/GcEMeeXUjWHgNWBFm1XDEpymjbc6lOK5
	 2JMI4trRYors6HiV4xQtVLvYC3vm0zB0Ddvc9EV1zdXvKTtz5dVdNK+nGySbDkMxo64Ei
	 ME30U3jwFGtqQx06jx7hxCLh+4kvFA5YX0mjfNKsjw7BQtTAgtYyz4bFISOMLxFBX5/se
	 cLD49i0/HBTafi8tb5DBg8GXi2sAYLnBiUDbT0VQlyacu3KHsJlog8YAL192aqGMu6Nmj
	 99Dbu44iH+UuhCMPwCmtjhS2kh2pc8n7HOByT+09nXLz0sAQUTr3H8FN4FUnsVSLeOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=LYmfBdNO;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DF4606A323;
	Thu, 26 Nov 2026 16:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43DF4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=LYmfBdNO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lfG40Px3f0wAIOWW8djRVGmO0yACnjIcUJ7Zj45snZo=; b=LYmfBdNOXxbyCXJ1iJyh/XcZyc
	8WuTgb4nu0D2J/ZCXrB1GXrksJILw8hOymhL4Yxm10LN8Gb7Tg3hHNyXwe0Unh8LAiAVBb7RzdX6c
	TCYZ56b/QkcjEIkvOOG0O5oyNXzL524ZyiqYb8mqJAHA2K1bshqYalBBVGDuhDgG+zc8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWcLI-001cI2-6A; Thu, 26 Nov 2026 17:29:04 +0100
Date: Thu, 26 Nov 2026 17:29:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Drop received MAC control
 frames
Message-ID: <befa099f-c18d-4eca-be4c-23883b30b111@lunn.ch>
References: <20261126-sun8i-emac-ctl-frames-v1-1-e90ac94bc8c7@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126-sun8i-emac-ctl-frames-v1-1-e90ac94bc8c7@gmail.com>

On Thu, Nov 26, 2026 at 09:56:52AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> sun8i_dwmac_set_filter() sets CTL_FRM_FILTER to "receive all control
> frames", so every PAUSE frame reaches the stack and is counted in
> rx_dropped. Leave it at 0, "drop", as the Allwinner BSP does; the MAC
> still obeys PAUSE.
> 
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Tested on an Orange Pi Zero2 (H616), net/main, MAC loopback: TX still
> waits 32.6 ms per PAUSE; rx_dropped per 20 PAUSE frames 20 -> 0.
> Claude (AI) helped find the cause and write the patch; I reviewed and
> tested it.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..f669bf22b7dc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -192,7 +192,6 @@ static const struct emac_variant emac_variant_h616_emac1 = {
>  
>  /* Used in EMAC_RX_FRM_FLT */
>  #define EMAC_FRM_FLT_RXALL              BIT(0)
> -#define EMAC_FRM_FLT_CTL                BIT(13)

Even if it is not used, i would leave this in place. It acts as
documentation of what the bit does.

	Andrew
