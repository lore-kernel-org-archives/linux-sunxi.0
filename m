Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425236;
	b=b5U7QzbLWPzhofGZSgPbLMOenvbJzPvh3nYcp5YfgN73N3lc0tkRssOv9iiJhqn0Qwoc
	 5lMtYFkan2jsN/fLmegLLbwj0tXiKJbNBn1vzYo9Ys5CU1Tia1m/DdM+6+c0TutzfpNzk
	 1sw441Ve3uD0TO9NPrNYTyog7S4WjDJeJGDjUlsIQsuegKxSm93b7GZeGUpdc1gD7sQXi
	 ZeJslDKs4mwLEPRj/XUY2cEmkEUdsFC5mMLEgh0n+rcSIWjjMhHRIVQcUnovlkV8ARfXF
	 1iYE0nA60NBFg6u83rkk7rA9c/vcjdIYCgjuliVQ5bbN+u+zKAVL6sYwBY2RxQz8Jfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425236;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q56cWya7mHF4XUuBUi0BFBKcvg627SUSNIn9X0dz36k=;
	b=RYCIYJT59ftScihEMZEedKG6rRYn7Q7im5g0LgQGEH05u5H70NeeAw0442hNajDapl9b
	 A/pTFGIYXjFQ/2xCngALwFqPvftpi8PIm/TGo6AAK0ANkJFszkcad3OaIRukOFaccf8pX
	 8c4NsmIyQh/hzwuU1kdD1CXP6RLryCWo1CnHvQ3upXeSs0k6bssQ5iAITy3r75eovhZvV
	 F2tCby8E7IWAAS9Sl3rMwji3S86BcEz5l0dC1MpUoOTw5gJx6x+QiqIs6dSuPJWql1MaT
	 pIxJ9FLA4Gw+wEwPwUA8H8yF6RTcP/HfvrIkTCYBIVWnUeWuABgCL/LwnFmBMd4i9/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nxkab7wS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A79606A31E
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nxkab7wS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBAB1F000CF;
	Mon, 23 Nov 2026 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425235;
	bh=Q56cWya7mHF4XUuBUi0BFBKcvg627SUSNIn9X0dz36k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nxkab7wSALSQN6xY4xUaYbUWZ9ZO8glfm3/0qW/DAFhrWAyasgkzMIHyimiVpGxB1
	 CXvNG3rmcqCRO0KLlSjoUx9T4EPgS3KP3tb9ZMEI3BZa2NkKy+bAxl/64NGoGFMSGT
	 0DANgcgjBePMmCTb1HxVkH6zQja+0zGoYT9VsgrBGfefvhgN60rdfpS/w1tgN5BqRi
	 T8p9GYHMAZ4tDIktzVEvx5FuBNM0IvAcANAI3JNlG8GAuLV4P9CPlqJeX75X9+/0DL
	 k1aQKqqkXIxDX+pNCksbiQW3FbfLfA2Rz+BLPhpx1QuC/nD0/NAXasFTWP3PnvurD5
	 xBi97LeGg8N1g==
Message-ID: <sashiko-outbox-228951@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 1/2] net: stmmac: Limit the MTU of normal
 descriptors to one buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261122-sun8i-emac-mtu-limit-v2-1-c4081e5b83cf@gmail.com>
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
 <20261122-sun8i-emac-mtu-limit-v2-1-c4081e5b83cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 09:13:54 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: stmmac: unaligned 2047-byte RX buffer limit in
  __stmmac_dvr_probe()
--

commit 1afb1c292cbb61be8075f08aa85d66c725abdea3
Author: Arun Iyengar <aiyengar1990@gmail.com>

net: stmmac: Limit the MTU of normal descriptors to one buffer

This commit limits ndev->max_mtu for normal descriptors (ndesc_ops) so
that an Ethernet frame with two VLAN tags and the FCS fits within a
single 2047-byte buffer.

Link: https://lore.kernel.org/r/E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.or=
g.uk [1]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index a685ce4638f61..2a27e1e7f9b9f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8247,6 +8247,9 @@ static int __stmmac_dvr_probe(struct device *device,
>  		ndev->max_mtu =3D XGMAC_JUMBO_LEN;
>  	else if (priv->plat->enh_desc || priv->synopsys_id >=3D DWMAC_CORE_4_00)
>  		ndev->max_mtu =3D JUMBO_LEN;
> +	else if (priv->hw->desc =3D=3D &ndesc_ops)
> +		ndev->max_mtu =3D BUF_SIZE_2KiB - 1 - ETH_HLEN - 2 * VLAN_HLEN -
> +				ETH_FCS_LEN;
>  	else
>  		ndev->max_mtu =3D SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);

[Severity: Medium]
Can RX DMA fill all 2047 bytes (BUF_SIZE_2KiB - 1) of a normal descriptor
buffer when ndev->max_mtu is set to 2021?

As noted in common.h ("RX Buffer size must be multiple of 4/8/16 bytes"),
DWMAC RX DMA transfers bus-width words, so a buffer programmed to
BUF_SIZE_2KiB - 1 in ndesc_init_rx_desc() can hold at most 2044, 2040, or
2032 bytes depending on the 32/64/128-bit DMA bus width.  When a frame of
2045..2047 bytes arrives, Buffer 1 fills without setting
RDES0_LAST_DESCRIPTOR, causing the frame to be dropped in chain mode or
to spill into Buffer 2 in ring mode (where ndesc_rx_set_on_ring() sets
RBS2 to 1 while p->des3 is 0).

Also, allowing an MTU in 2001..2021 causes dwmac1000_core_init() to set
GMAC_CONTROL_JE (mtu > 2000), enabling reception of 9018-byte jumbo
frames that cannot fit in a single normal descriptor buffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-sun8i-emac=
-mtu-limit-v2-0-c4081e5b83cf@gmail.com?part=3D1
