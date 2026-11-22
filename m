Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377962;
	b=PaESFOkU34uKVCjkZpqKC0bEWZfi7DVYfPG5+nNySoWDcf6m4+JfuFYv2waoQrLo+1O3
	 UbB6P+WzfrDEBkNbSkFfMgw9n41BMlEPMB1ZFdsQdC9YBp9S/Fk3LgCPLRPuYFr+RudfL
	 8XD1G1qCZszF348TW1Kg1M6qeHTBP+Rb0yxiO7uTw2mK2dsWjLiNVPqnXN2BpPLStem/Z
	 ne/o0B01Mk3FkWJJSONCkSCFDNevz4cMBoXW7usUu9r/4T96xBRQYnZpdIhoNtE4e+hrY
	 ehurqDi4IXxIGwCPtu7kuaxpZBWXEyQaLZ7QGm+Qlm0tdODO+Q3fyRAd1s/284qFWDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
	b=QY4cUHaDtVWgOAQUs29XT7igofj7zSE0YzFidVbctNuZ4hbpEaNB3koYk6CqiQLgzTV5
	 3Ge+DZlR1Irixa3f8ItGvJjh7tXx51kQTIRnAa0iVD9SPHoHnpG3uY0AxYIdTXJqs3UXP
	 vjEKKzNRCFUeKzsRII4YQTa9eiJ6ASwxbMdtgJtDSG797t5o0Lj+OiyhQxKl5LIFL0cck
	 /AvHrSgsBcLT+9iizTfp7ry3d/bzJiGWUXO5uxlznbo1ZqB08VrsyQb+LH1OTLJy2mWU6
	 IWM7v07UfmIqQhc0H3z4iNjj85S9EtlUeLPadCJ+9YrIae56S+ilOmK2RnhcKSDYoRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0FP98n/t";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD62606A31D
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 20:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD62606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FP98n/t
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so768288137.0
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 12:06:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377960; cv=none;
        d=google.com; s=arc-20260327;
        b=JVuZ1w9Kl1o008q6nnqgogADBOy9yEfnQ4n2QKoiN8G/bhXVtn4tNSxTXrGO4tDXV+
         JVy3Gprki0GIZDR5opx157KJQLhUdS6nzJeKVQtoq+em9515OKMAm/btnArA04FIsjrI
         9uH+14cYZcALPKNCWUJp87tbl/WMkECDFRc/brrn6HFybGKwX193l++tnlXFAbLM9lnJ
         PUoGgBk8Rd5GcuXTD/T/EYpXTrwoag52WS4sBdWW15Tc7dmEEKQtnICf4GodrPrSA6N/
         KpNgdWJBCaJDJWHJWP9FiST5Q8JP1uBWA03pVCcW4AR1ly3mR6E95+rCi47jWTDA3SmG
         qSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
        fh=qlfqYg0N1duEbtA92W5MMrQamaIH7xFpcsxlvuJCTDU=;
        b=oth+jfrTNWW5AIruXof7LYcKb4blZwjRyjOq6CzEs6VjCdM/LciOEM4wviqgd7uhAO
         q4X7D62LUOjQ9Gl7AekDQWGz6mHHdK/SHNqerMPwtMQwEN5qW66cqtnB7N7b+U5nt73L
         7vUNMQ+7OdhADQc9LL7EKPmXS1+eth2ymPqU3XHe9obzb46SPlhVnz5+p0zr8lDEJfJT
         RPXsuM+TMl6qNpdw5BzV6o+iSgFz87R7p/8V3Ebc0dZbJX67moGapW5zQws8+WjSWDfT
         Eq1BKWhINLu3zBpjqRLjI3PALwKxtPDaEz/aGYYPvdylQkm27J4LWXMtkLxWR5j7PR1+
         lJZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795377960; x=1795982760; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
        b=0FP98n/tC77K37m3V7yGO+sKB11+tRjRrgVje6kPqtW5ge7a7rxMLDUVgK9B2hrlMJ
         WJNH7FkKf9Kr30QfnvHzli9UQKK53J6pIA631XAjzlMSv5melSR/bnPvhjs403IpPNMl
         kwXyyPqsVcBhiLcD872Q8vcMsdoxR1GmZO/xKrntBSehIzajX9A3W2BaKqJhcIUvL1Pa
         pTOE2SSpPV8kFkbfTGwahmdaF9Gnhu2ccDdLpLoupOh6P8rFn9DZItnxvW53zD6lBoUc
         aIOmO7H6QyWyrDHx3oU6Bs5ge+L3Tnwr2v6NVDdWXUNGkDJKr2lb1WYsG1YuJ2QkgBeB
         fbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377960; x=1795982760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
        b=0658wyPV2fFOewcgmiuf2XHghkn4aiigA5RnFKiIeZazTrf4yj9YYoQiQx8gchjqlj
         M763M4GQkwN3X6kfFK+QK2emvxO0AioZMa+Hd6WohvnnTKf0ksGmt5XdEi5yIOVoUQnH
         bm9cfDAx7KeTgvvPirtMoQK6MJVyE/wLeooSn27YGygr6yxxgAnxYOURQ1WCudSmMkxI
         VaodjyT4bffN69nfu8Nw4LDmIRev4v1R7nPLKNqwMZgNu5lrt2VJ3FeCjquVigo+VsGg
         BHVRkleSHDz0piTGauOPPZRTX+HPkkjF3mfKLuRfZbJXF5vL597/sdVAdFtQKE4oIaq2
         rIAQ==
X-Forwarded-Encrypted: i=1; AL+hErEYV7xOojwlD649zHzNorDfzcVyzWhCPhqzka/n93KdQ52zSanWOxt1E7y9HPFuaUA2Kei5Pj6uKvjXhA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9AcroUd+gOtbnacMtwj5IVLqfK9BSGF4ZagrYxeWO3htLz5GAz
	I0HYrgCg0SVU9xUDBhjSrHCWbyWay5heU2XK6E9wFYoOXUTpV8mFmr+oH0GXkTUxuk48QSO8LmR
	YnhYRNW2ibr8rPA7ju0N33IMFh7KlvyM=
X-Gm-Gg: AZFdTZfz7w2KPzwohwe8TmvV1vsfSVhOaE0hL59JL5NaIa75Vzjd8QLbgFCa8ZhOlfn
	2T5iPTdSMWBUCMh1vHsx5P7lWzXWP7qjz/wOFgvowAd6ipgNsOe7nc8fNDt/3h7pr2FyK4Dn1Dh
	QM1SlfvhJrUBXmmZyn9GLVJDOGtJOp9fFv8MRFb9S+6twFn9I3x1iZmAieeSjqarL+vdjOKhdVd
	qQYBEK6Fu8k3mWp3SCidEbP0H42Okf50oYDfDk2r8FbVs9kltHUcAf/FLKB2fG9AfG/40zOOiVS
	qXSbeOV83ZMUpIw6KU3IstpM94yRAvOG7FeEgvEhrSmtxRJY50X3Wd7MqQInt8aJjOMY5O28zRh
	KD3NT31AqwErh89NbVYzoUDxBINTBSiZYQEAjCtLyhnKSV4W9c6RAWjBnkmoE5/jEwgLRkhrzF6
	K7eIBGGC73VfakYEx5d/LlN35b4Xc3kVSYTFLoWJH43kYzEuPeB49pMSDwQ33AmBraCNnXsHpfQ
	5xTU559NlmzCD16ndSDKjUEN+JVdg==
X-Received: by 2002:a05:6102:6e88:b0:7cc:2152:4f72 with SMTP id
 ada2fe7eead31-7d72b361a7fmr3205448137.1.1795377960563; Sun, 22 Nov 2026
 12:06:00 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
 <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com> <ba116748-1650-4816-97a6-69eeecd4b2cb@lunn.ch>
In-Reply-To: <ba116748-1650-4816-97a6-69eeecd4b2cb@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 13:05:48 -0700
X-Gm-Features: Aa3M54pG1AzgHZF28ZU3Gb7U1D0EKDZkbO9-Ggw6woKfAmVhRg5yTB70PYbUkHk
Message-ID: <CADvTj4pDQhnABu0GnsXN-mNhvdiHkwrrk3yJs5gq9RaMPWZFSg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool rx-all
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Jakub Kicinski <kuba@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:39=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +static void sun8i_dwmac_update_rx_ctl1(struct stmmac_priv *priv, u32 c=
lear, u32 set)
> >  {
> > +     struct sunxi_priv_data *gmac =3D priv->plat->bsp_priv;
> >       u32 v;
> >
> > -     v =3D readl(ioaddr + EMAC_RX_CTL1);
> > -     v |=3D EMAC_RX_DMA_START;
> > -     v |=3D EMAC_RX_DMA_EN;
> > -     writel(v, ioaddr + EMAC_RX_CTL1);
> > +     guard(spinlock_irqsave)(&gmac->rx_ctl1_lock);
> > +     v =3D readl(priv->ioaddr + EMAC_RX_CTL1);
> > +     writel((v & ~clear) | set, priv->ioaddr + EMAC_RX_CTL1);
>
> Netdev does not like these magical guard constructs. scoped_guard is
> acceptable, but good old fashioned lock/unlock is preferred.
>
> It is also unclear why this now needs locks, when before it did not.

I added the lock because changing rx-all adds a new writer to RX_CTL1
while the interface is up. The runt-forwarding bit shares that register
with the RX DMA enable bit. If ethtool read the register just before
another CPU stopped RX DMA, writing it back with runt forwarding
enabled could also turn DMA back on.

I went back through the callers to see whether that can actually
happen. RTNL serializes the ethtool change with opening and closing the
interface, resetting it, and reconfiguring RX queues. Neither the sun8i
IRQ handler nor its TX completion path requests a DMA threshold change.
System suspend does stop RX DMA outside RTNL, but userspace is frozen
before the driver reaches that point on the normal sun8i suspend path.

So although the register is shared, I couldn't find a path where the
new writer races an existing one. I think we can drop the lock and
leave the existing DMA callbacks alone.

> This patch is too big, does too many things. Please break it up into
> smaller changes, with good commit messages, which are obviously
> correct.
>
>         Andrew
>
