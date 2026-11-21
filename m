Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287285;
	b=ugwa+yu5FZLPJTMbRaHUBTeOVnzCQMmhseKq5asm+EB0r/AnNryq7hM0a9DrwXkWR5H5
	 7SdM6s3pN95tRsKN7RJXNzqQVjAKCqWKbVwRo0bpTmlSMRVFer9aMICLGvR5S65STqYVb
	 xl/Hiq4ABU53Jik1hcmxUo+B1rdFDp06d3+baCIEiaXriyssve3uLc0DQLR1lcYiB1k9p
	 OZRNw3xKMQ2ZJlYn78RohEgtTUkrMAbttMaOGEqc8+eBiZX74GWvF0iAuoGmkObOg7CQG
	 dEGSQhQn8GsbEnSsPiNWq3zWgx28s7ukrWi9hFLmMxafmQyHvJ5F2Qh5H5q8CswnrYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rOsjq9WZvuCHvq4RVsYAQKDzGsMKcpaGLrQYwYNorGM=;
	b=yTQA31tNfBAbTHADmakgdBHW1kLWPGV5eSZFt71/mCxgYaKkK/TCM1D5JTQLq/xg7Ggb
	 zjMQUFeIiZNt6MZmjl0x6RxWvYIPhS9HVESaRoqyH2tLzYMowVWwsEUKgIbolwojE1eXM
	 m+WaHPdU/DZ4bquV4O73oSICq3TBv3KJ3CzXB8dYaVNP1QCb2nzqK9UnPemrID3G8RcTF
	 yw9ZblUItSLwCccNplnnzPpJLccqUfgVCL0Nvz13HYmhw5NJBZRQYDyVCjGcxHaSu5MQe
	 mjfRkQJLQpY9z8NK+n/8v4VMeYBhKP9ZkBnNJxyR/0hP2kJ02mMdqP/5x6+btTKUdZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9J5Apvl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C701606A320
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9J5Apvl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA15D1F000C0;
	Sat, 21 Nov 2026 18:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795287284;
	bh=rOsjq9WZvuCHvq4RVsYAQKDzGsMKcpaGLrQYwYNorGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n9J5Apvlyd0jtXsXe314JZQaYrCmGI2Mkz6y3vQ0UDcwx/JStnig1n1ESd1PUahYB
	 eQvSv9HFoNPMaRWIUbJHq8FzzG3TuiS5MuKVoaESQr3qn2Ls5yoRqixhe5uWSIUzyS
	 QnZQTtMR8g3bxpGCkKt2E0GTjj9PBCT1+rWx+ijNpBjyz3tfjH92ckuptcpyhi1zEE
	 U8khmWxHeXGqnttKJrPf+JTCpZxkVrMKf6NQmZBCABXh8w2cfPukPObLf7r7wZYQhA
	 2g2bD8xrFs9XjWAR8w5aD5ZMHbUASAZo2lTnY+rD/8sQpYAPOgsBkZTwL+0WoAcfWA
	 soRouf/yTD9tg==
Message-ID: <sashiko-outbox-227278@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3] net: stmmac: preserve RX checksum capability
 when offload is disabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261120-submit-stmmac-rx-checksum-capability-v1-v3-1-e9e1fd85f380@gmail.com>
References: <20261120-submit-stmmac-rx-checksum-capability-v1-v3-1-e9e1fd85f380@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 18:54:44 +0000
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
- [Medium] net: stmmac: stmmac_init_rx_csum() checks dev->features
  instead of wanted
--

commit 71e6607bc9a26db47d719c3ea93eefca52be2961
Author: James Hilliard <james.hilliard1@gmail.com>

net: stmmac: preserve RX checksum capability when offload is disabled

This commit passes the requested RX checksum offload state directly to the
MAC and masks NETIF_F_RXCSUM when enabling the hardware checker fails,
reconciling features on open and resume instead of discarding the detected
checksum capability.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index a685ce4638f61..786eb089dc2b8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3675,25 +3675,51 @@ static bool stmmac_tso_channel_permitted(struct s=
tmmac_priv *priv,
>  	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);
>  }
> =20
> +static int stmmac_set_rx_csum(struct stmmac_priv *priv, unsigned int rx_=
csum)
> +{
> +	int ret;
> +
> +	if (!rx_csum) {
> +		WRITE_ONCE(priv->hw->rx_csum, 0);
> +		stmmac_rx_ipc(priv, priv->hw, false);
> +		return 0;
> +	}
> +
> +	ret =3D stmmac_rx_ipc(priv, priv->hw, true);
> +	if (ret <=3D 0) {
> +		WRITE_ONCE(priv->hw->rx_csum, 0);
> +		priv->rx_csum_failed =3D true;
> +		return ret ?: -EIO;
> +	}
> +
> +	WRITE_ONCE(priv->hw->rx_csum, rx_csum);
> +	return 0;
> +}
> +
> +/* Recheck the wanted features if this reset clears or uncovers a failur=
e. */
> +static bool stmmac_init_rx_csum(struct net_device *dev)
> +{
> +	struct stmmac_priv *priv =3D netdev_priv(dev);
> +	bool was_failed =3D priv->rx_csum_failed;
> +	unsigned int rx_csum;
> +
> +	priv->rx_csum_failed =3D false;
> +	rx_csum =3D dev->features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
> +	if (stmmac_set_rx_csum(priv, rx_csum))
> +		netdev_warn(dev, "RX IPC Checksum Offload disabled\n");
> +
> +	return was_failed || priv->rx_csum_failed;
> +}

[Severity: Medium]
Should stmmac_init_rx_csum() test dev->wanted_features instead of
dev->features?

After a previous enable failure sets priv->rx_csum_failed, NETIF_F_RXCSUM
is cleared in dev->features while remaining set in dev->wanted_features.
On the next open or resume, checking dev->features gives rx_csum =3D=3D 0, =
so
stmmac_init_rx_csum() clears priv->rx_csum_failed without retesting
stmmac_rx_ipc(priv, priv->hw, true) and returns true (was_failed).  The
caller's netdev_update_features() then leaves NETIF_F_RXCSUM unmasked in
stmmac_fix_features() and invokes stmmac_set_features() with
NETIF_F_RXCSUM set, which fails again with -EIO and aborts
__netdev_update_features() before applying other feature updates.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-submit-stm=
mac-rx-checksum-capability-v1-v3-1-e9e1fd85f380@gmail.com?part=3D1
