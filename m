Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795275159;
	b=3Ax3gB02y4GZ2mjfIqK0hXv2MsUkwjnGCfWzOXZN0ewbZoJP1V4xmIsijyjkyJ7DmacC
	 vzdTofewdztfNVDpt7Dp7mScHtOBu5fOEb5sdwUIROd5IjK3V34ItHWkoJ867VgkYopMn
	 Uo1GjfXmsLUvKb692qCKZNBdewjrpfrRmpV78jZ2QHwBhWUpO/d5RZWenD5FbF6vL0GuI
	 +dFg8Lu2xynnwtorijPXOaN/qXnbxS34PxDJnjo2cWmBWUXZ/DZ5Iwz+BoTHSXuZqz0gr
	 YISROelwGDHYdbZwQemc2Rq6MqYv0AY4lS9L5FUEqCIegCwMqAapysSPjdSZVPyMEVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275159;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OxeLKH8w6bWJ7DlWw96QFNDxhXNONm3mamP1sCpj5lk=;
	b=wrqcbXz7WMBftYQdz4/kxNaXHL8tG1FNiD1CEOGQf+mSsKWnUZEDnhqBediC/GSfCk8Z
	 9YwOICbpgfN3OLMltMnybeaDnEXLpl2tTs+i8hvWeWWbEKltQJPx58EfPqrFkz/gxn5hT
	 mfFZKP74IlWxb7CX8rraYq5K/CNKduRvsN4UcpWVrqM7Rjftk00GDMM/640EJEOsNtRH6
	 DDGfPUyv5jLX7VMiCawanVPYb2WA3t5kHSjoMPbElx6OZCbf7qEfRUdC0WVFihr4fwb6H
	 ydKYbqjbQB//XWcdG2f61PEsu5YKDrfrE5qqWwjY4l7/wcFdVQiu2oYeO1STQ7LoqJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPGN5GvY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ACD606A32C
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPGN5GvY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A481F000C4;
	Sat, 21 Nov 2026 15:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795275159;
	bh=OxeLKH8w6bWJ7DlWw96QFNDxhXNONm3mamP1sCpj5lk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPGN5GvY29peC2vxA+baw9g38/l+Ik9XTG+1pzwD4ezhYrqc6GFocaOm/wrO5I2o+
	 xNFCpsKt9P0Xo1fqrdYx0uTURscyLX+8Pep4RDc+kf1jtm+Sn4jMPQ8IzRJ9xtWDGa
	 cduDWte/lc5fyDyXGUpfN1SC5IJEj4Oq1jmpnlQ4aftdqVjCDexrclOrGJ7dSxnQLk
	 h4iX1obkqvFzZrumLwXGzMb47M4TDTNai5f4RblxQTXheMYASSBxMMMzzGN5N0QWUl
	 TudYjXb8oX+PLQKs05v4B2KVPPJ93ERzCh/txuBLIF6zNdk9TV4jpQBTGc6nCVCMwG
	 XBImThd7VvZ7A==
Message-ID: <sashiko-outbox-227127@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
 <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 15:32:39 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] net: stmmac: stale priv->sph_active state in
  stmmac_set_features() [1]
--

commit f9a339d9b6caf3c825c74a9901dfe11d7efeed56
Author: James Hilliard <james.hilliard1@gmail.com>

net: stmmac: dwmac-sun8i: support ethtool rx-all

This commit adds opt-in NETIF_F_RXALL support for dwmac-sun8i so frames
with reported wire errors and runts can be delivered to the networking
stack for packet capture without claiming a verified checksum or counting
them in good-packet and good-byte totals.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 2f33fc0126b11..0a893c2cea78b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -6453,6 +6466,11 @@ static int stmmac_set_features(struct net_device *=
netdev,
>  {
>  	struct stmmac_priv *priv =3D netdev_priv(netdev);
> =20
> +	if (((netdev->features ^ features) & NETIF_F_RXALL) &&
> +	    netif_running(netdev) && netif_device_present(netdev) &&
> +	    priv->hw->mac->set_rx_all)
> +		priv->hw->mac->set_rx_all(priv, features & NETIF_F_RXALL);
> +
>  	/* Keep the COE Type in case of csum is supporting */
>  	if (features & NETIF_F_RXCSUM)
>  		priv->hw->rx_csum =3D priv->plat->rx_coe;

[Severity: Critical]
This problem wasn't introduced by this patch, but when NETIF_F_RXCSUM is
disabled in stmmac_set_features(), does leaving priv->sph_active set
[1] corrupt multi-descriptor packets?

Just below this hunk, stmmac_set_features() disables Split Header (SPH) in
hardware when priv->hw->rx_csum is cleared, without updating
priv->sph_active:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_set_features() {
    ...
	if (priv->sph_capable) {
		bool sph_en =3D (priv->hw->rx_csum > 0) && priv->sph_active;
		u8 chan;

		for (chan =3D 0; chan < priv->plat->rx_queues_to_use; chan++)
			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
	}
    ...
}

The hardware then writes payload sequentially into Buffer 1 across all
descriptors, but stmmac_rx_buf1_len() still sees priv->sph_active set and
returns 0 for non-first descriptors (where len > 0), discarding the valid
payload in Buffer 1 and building the SKB from uninitialized memory in
Buffer 2.

[1] https://sashiko.dev/#/bug/linux-c61bc2a2-cd8e-40f1-be85-31573536e5d4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-submit-sun=
8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com?part=3D2
