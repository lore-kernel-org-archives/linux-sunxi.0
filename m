Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795275159;
	b=jwyTodgunCiniWAk4254kbWw/dLQy95BMwLe5IZOsVDgZqh6U+7SkDmyDL6s2Bd1UCBa
	 wiWH7Ag4O9L3gd/KaP+MXWHUOtwtI/yoTaBOD2okq6wrXmbRf52tImeJQ4a6UbcSXJvf4
	 NwHjfptoL91f0f1EYUp67VsHLBnQt4YOC9bVlMLWTUFIrqapbHqNsbyHxCYHyjWCL5ZqW
	 wJND7mBXENbf9CW7rPg4xCpW4yQd8hsavTT58iBciAvKXPav6ctEFC6rn5HmINnTnmpbC
	 XZ93voqtKSLdeywz3nAb7PfcVCX7esvtJAB5SHWzJ/Q/PuLkNLFKMigHhbY6lIU0vGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275159;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7rfzVAhH4pXdUdp2dtFKVt/tNARV6Ks/8lNNCchE9is=;
	b=ty/RSFxbbhdNOXhs3zkoqhX7mta1wksp3Z7TL8QttForLVKlFPBFQeaFe5lmsLvOiVwq
	 a5wuDGsgTqADbSE/XmKIyGnk6NHz3xq8JRwjRKPL4lywap4wOlEFCzfH3Y4rIeY/wW1qo
	 BRAoQzM3mgVWT+0CdRzY+5Ie2pwjEM2P8m/zOxg2JkSFM67VeShrz8gW3EcJTJLGxuJBH
	 8RB8RlCEQJgQTcoHS9bsPZFQGRttHTd1oA5OHZgAWmERoTwbdDdASjg23UQSQfKrs3L5U
	 E92ybyyULj4Er6pnAFZEDdLD3LfMpu3/Ud+MYWcWRSHhRd+Csft+Gh8Nd/Cr5IOk7eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EwEIN0Nn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E80606A320
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EwEIN0Nn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EF21F000D0;
	Sat, 21 Nov 2026 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795275158;
	bh=7rfzVAhH4pXdUdp2dtFKVt/tNARV6Ks/8lNNCchE9is=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EwEIN0NnBA8jQGG9BPmOoFjmpf5C6/NVd+ckC0LsL55h3EWkPFFQpUlLKsQ/E85db
	 iKZ6Fe2DXM+lWudp46xYe3rMk+uYEjxFW+XNnxUTqNmNgxhKbaq7oi2nGqU6oFpj9Q
	 JymJR6o/8SJ2IWVsiGZRssG4CUDXSkoyoZVNNz1nvsCj4eeDQ/zjZ2Ztgshfmes4qZ
	 n9MdR3joRMXlBMX+mkS0GpokvcTgOmJ8dq+LSvAS9S7id7cmlfD2116CZ884yRGQrq
	 wB6Ndezc+9WRyqWVi2buPcXxxxvuUszOGGA8TbGb5B9ldS6I3bQWeYKlntW/03REom
	 znQLb9NYgmIEg==
Message-ID: <sashiko-outbox-227126@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac-sun8i: deliver RX
 checksum errors to the stack
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-1-5058fecba6b3@gmail.com>
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
 <20261120-submit-sun8i-rx-features-v1-v1-1-5058fecba6b3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 15:32:38 +0000
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
- [Critical] net: stmmac: missing dma_rmb() in stmmac_rx() and
  stmmac_rx_zc() [1]
--

commit 25a23f84c6a85e201c0ec27b3c3dd900c3d4ad68
Author: James Hilliard <james.hilliard1@gmail.com>

net: stmmac: dwmac-sun8i: deliver RX checksum errors to the stack

This commit enables error-frame forwarding on the sun8i MAC and adds a
custom RX status decoder so packets with IP or transport checksum failures
are delivered to the stack with CHECKSUM_NONE instead of being dropped.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index f256244ce0d11..2f33fc0126b11 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5775,7 +5775,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, i=
nt limit, u32 queue)
>  		p =3D stmmac_get_rx_desc(priv, rx_q, entry);
> =20
>  		/* read the status of the incoming frame */
> -		status =3D stmmac_rx_status(priv, &priv->xstats, p);
> +		status =3D priv->hw->rx_status(&priv->xstats, p);
>  		/* check if managed by the DMA otherwise go ahead */
>  		if (unlikely(status & dma_own))
>  			break;
> @@ -5978,7 +5978,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int =
limit, u32 queue)
>  		p =3D stmmac_get_rx_desc(priv, rx_q, entry);
> =20
>  		/* read the status of the incoming frame */
> -		status =3D stmmac_rx_status(priv, &priv->xstats, p);
> +		status =3D priv->hw->rx_status(&priv->xstats, p);
>  		/* check if managed by the DMA otherwise go ahead */
>  		if (unlikely(status & dma_own))
>  			break;

[Severity: Critical]
This problem wasn't introduced by this patch, but is a dma_rmb() missing
after the dma_own check in stmmac_rx() and stmmac_rx_zc() [1]?

Without a read barrier after observing that hardware cleared the ownership
bit, the CPU can speculatively read subsequent descriptor fields (such as
frame length via stmmac_rx_buf1_len()) before the ownership read retires,
operating on stale descriptor data and causing corrupted frames or
out-of-bounds accesses.

[1] https://sashiko.dev/#/bug/linux-fe348d69-cee9-4f10-9fbc-4d4c90731942

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-submit-sun=
8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com?part=3D1
