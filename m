Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755852;
	b=qM29HetFYaliTszsnVlwb1z+sHoro6IqLVJ1p7mdNIYZqvExO5sRy6YLrPqfj5jfi24E
	 lEtGBHJgBhQVYC+JCTFvfe6YG7Dnd7y05W3GOACwT3pbGryUZNWdrXB9OLSWyI3faT8Hb
	 dWXkLBBOzPaG+zYM72NrOKnBjgBjb5JQNQbjCPKRLk2Z4JqZ2vMUveIcbY99s07S856Rr
	 Jp1mlI2A5QxAIFYtL4RgptgfWxKo05PgIjRPQRAmeypCTvdN9aCyI0aONv4igzhodAdUu
	 DdmHX2rEEW0SgQIm7EZmIllBGn95DA+g4AWiE9uY0xUYGRfP+POnG5ZUB4p0yP18JUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755852;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qIkegvM0vM7wyeDCr9yTjV+nCu5PD6X7FTu58o7P70U=;
	b=Q5UTjDqRpSiiQtPJso6T88eQN7laER2q3dMJqTxlXMSNmJO1gnxsjpHi8cPzNzWLNoL+
	 o/YJrsZbBHKWO+YWB+uyf6m4oG+CaK9f2nMong97nvOGxPoyFyacT6f1OehUEfDGjtUiF
	 iJO+nAJ6AjOTQOKqIZsBZyzVY4UMzZ6hyoPeFVjlEL57oTV9eS+eyKpyrhTE5Ul9EshwZ
	 vCFPpUSDgYqSpeKCMKJ4Lev47rormLYyoYctjM9obf8ZUgAUBOgUUJkw40IBUlxvaN5/j
	 ZmA9lRaKauDDOa900Znh9CYE9S1cu27DPURWCbriFGCZq7JvcbvoMP6uwb+hpn0Qriw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j21gX6zX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606F4606A31E
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j21gX6zX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124CE1F000D1
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755852;
	bh=qIkegvM0vM7wyeDCr9yTjV+nCu5PD6X7FTu58o7P70U=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=j21gX6zXDBAG6MY8+WrsN8mJnhvZS4pEbMFH0rtgAa1XpBrQm6P08/9TekLTD+bOZ
	 PIRV7sVtKt5MnbaTDLds8nZQQezw0XhqDoxV53rnoMKBc5AYEQn0JaiCJrUPFqPK0U
	 ue+K0988nl5towhzBXn5IbmCl62WlRdtXNyBKNm6GOEarDFZ222c29FIp5MKtwF8Ps
	 mt78rrH1qpiSccpfhI73dCPhARZmJAtGdyDt6z7aestGq9dqS7cjJIIkxP33QBY7SJ
	 ZNHC7iZgah3JsgA7ZSEk1ooZHARvLnjWxkEVoPIywnZk6sikOyQZf9LDZLHYWhgzGj
	 CyCwsPAjqCgUA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ad5529ae64so26539431fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 07:17:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE/2NBNiGaMpz+qF2z5JfzHHgaKqrcwwhR2u+FaxgkSeacqCIHdmbp0A1rWujAzgvN/dtINuj0JvebP9w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+zmzonjNmcXRxo34Dwqeft6m9yGcjFbQBCJM86We8ulkqKZ35S
	VJydswBVRHPX5KBrWD07wi1k/bsGpJczWsdZSWJ2Rv1CgCu4veAA8YYfYNt8oCjWM8vm1hc7H84
	XR3q2AOQrJ8OrcU+NR77c9HIa/7+Jt8o=
X-Received: by 2002:a05:651c:31d0:b0:3ab:344e:3740 with SMTP id
 38308e7fff4ca-3ae2b41f7efmr26811011fa.2.1794755850446; Sun, 15 Nov 2026
 07:17:30 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-sun8i-emac-mux-uaf-v3-1-c69d4189539d@gmail.com>
In-Reply-To: <20261115-sun8i-emac-mux-uaf-v3-1-c69d4189539d@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 23:17:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v64aOydKdTWJEhF+0GVc45aap4AsHfF5RrL1pzOHF54D0A@mail.gmail.com>
X-Gm-Features: AclHuK9BiEy8NKHYdASo3pcVR5VPMQUIfo9KOqeQ5VGeVR52SQ6tBFPl-jC43Jc
Message-ID: <CAGb2v64aOydKdTWJEhF+0GVc45aap4AsHfF5RrL1pzOHF54D0A@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: stmmac: dwmac-sun8i: Fix use-after-free
 in the MDIO mux error path
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 5:05=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> If mdio_mux_init() fails after the internal PHY was powered, the error
> path releases rst_ephy and ephy_clk before sun8i_dwmac_exit() uses them
> to unpower it. Unpower the PHY first, as sun8i_dwmac_remove() does.

And sun8i_dwmac_remove() also indirectly calls sun8i_dwmac_exit() through
stmmac_pltfr_remove() after reset_control_put() and clk_put(), so it is
no better.

I think the correct fix is to move stmmac_pltfr_remove() before the
*_put() calls (but still after mdio_mux_uninit() in sun8i_dwmac_remove).

>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Found by Sashiko's review of another dwmac-sun8i series of mine.
> Build-tested only (arm64 and arm, W=3D1): I have no board with the
> internal PHY (H3, H5 or V3s), so the error path was not exercised.
>
> Developed with Claude (Anthropic); I reviewed it.

It feels like your agent needs to do a bit more deep diving through the
surrounding code.

> ---
> Changes in v3:
> - Drop the Fixes tag (Andrew Lunn)
> - Shorter commit message
> - Link to v2: https://patch.msgid.link/20261113-sun8i-emac-mux-uaf-v2-1-6=
203666b2687@gmail.com
>
> Changes in v2:
> - Target net-next instead of net, drop Cc: stable (Andrew Lunn)
> - Shorter commit message
> - Rebased onto net-next
> - Link to v1: https://patch.msgid.link/20261112-sun8i-emac-mux-uaf-v1-1-3=
08ae7e6fcf2@gmail.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..898560e8e95c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1245,6 +1245,7 @@ static int sun8i_dwmac_probe(struct platform_device=
 *pdev)
>         return 0;
>
>  dwmac_mux:
> +       sun8i_dwmac_unpower_internal_phy(gmac);
>         reset_control_put(gmac->rst_ephy);
>         clk_put(gmac->ephy_clk);
>  dwmac_remove:
>
> ---
> base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
> change-id: 20261112-sun8i-emac-mux-uaf-1ba885219fee
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>
