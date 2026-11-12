Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490369;
	b=Cb/QVOwgA8c/x/aXdx/TxP1Pcl8i9c7EjP7s+V/dZa7zOO5Y/70e7QPP67+PkrqSANv5
	 akRagBGESz1xrZD50u+pyvaO+BoKQawMTe4zBDhvy0DCIhYSoeONhMwDKBJjgIgHRnPqX
	 0BswUmRAWu578BvQqyeqVsWrAgADs+ubLEMEX57P3UDJPDX0dyZ6nHCsgrE8xvf7HpVSM
	 P2H1hrF7ER05uPWi34lNggbG2OuTStASVqAMYjZd1e+Qc8cr+DTjh78kpwIwY8NtpYjJ/
	 4AWauxLZIjcFML91uo3rWNWpp4PLqnpW+/xpO2FqrH1tlLjlPpiCBeXgvIAzptU+PJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490369;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iEo2xki5lr0Ld9JYPAmWGvg1Pdjk4kdBgUxL5c/PWWA=;
	b=UZmmR5VXJGLd60zQpdSg4eNvhNdQeAMyMhkbuhzuSqOW7rTJ8zxe0CEWmNaCoJioI2dH
	 zycahh6fBIzaDLOZ6+a4fxMpSoZzap//wczf1jd1TBZpUoXVdKsRV0bEEP1jZtjy98V5n
	 r3sfQ2zsdzcGj9pUZFwWgCawgfPWEgeg4Rru/2vx4FQhNBybkyeDahAzE+3MiLyMa9u6K
	 tjtBy4lxUsFc+PDXorHguBioJk6EiLUnboJ126abEX2/A83TSZvXpNtgLHOesHuB/olkW
	 PWYxdhUgiL4Tc5XpJFB27lrwBob9LASE4OuikLjbeYRyiwExAYNgCqhHyuV1kneTFAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9lBr7SG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C79606A323
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9lBr7SG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1E31F00A0A
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 13:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490369;
	bh=iEo2xki5lr0Ld9JYPAmWGvg1Pdjk4kdBgUxL5c/PWWA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=i9lBr7SG/fDtD9bdmi6KD+XPnkRUcprImJzMti7MgTMiG3fCabTEmScJmy6bmre+s
	 TWwEf8neAUTGDJtN0k8m6X59GkHTQJf4TEQLiHRgueZjgJYfb0LcnmyWTfwb87aVJV
	 YUkRzi42wR3lsTyEYM8X+37yqRRgTaZ+quFhMrcyETttLQzAdbUnBhYvoKGAzz4unW
	 zDAjfUJWjFg0Y6n00Fd1f6iL9ntHsHW3NUgccfxUi4z+32EpyxJ03WL0IH5G/kZ8YE
	 e92roH1ccmLjKYcLOfy0zuUspWwBlHAOZVv3bhsRr/11qxAsBYyQVrdsBiPjDdnIWg
	 0z+nhdXPa72zQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so33081741fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 05:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGCEjShvFOlXDNITP8ErvZfY0aP6dC1K97pWlLvfKdov0kWIQRthcNxJo7hEv4ikQXSokBq1UeQ1JQgDQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8O/p01cyXGko4AEP+7QBINd7e/SbLC6ZonGWOhvAz9v3p4KSFD
	6jZ+elsLNFxyQKDj16avoMUovAJ5g+mtbn1dlWaM4Ygw6oX3nNl8SFtGFu41O5wXUP5+xRYaXNG
	u7dZzvoLJXp/Xp3MGLqhpa3rHwSc2sh4=
X-Received: by 2002:a05:651c:1445:b0:3ac:429f:6da8 with SMTP id
 38308e7fff4ca-3ae12679b99mr12954551fa.10.1794490367466; Thu, 12 Nov 2026
 05:32:47 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com> <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Nov 2026 22:32:34 +0900
X-Gmail-Original-Message-ID: <CAGb2v67P+9zBpmst9qLBJ+PpPG4ghtiC0UiyTz1PK-wRm2jqVg@mail.gmail.com>
X-Gm-Features: AclHuK_HGkL2v-mrL96AWKEOzFXYn0NCtooN1Z9_WCMxITXSHxeYkq61j0wWgcE
Message-ID: <CAGb2v67P+9zBpmst9qLBJ+PpPG4ghtiC0UiyTz1PK-wRm2jqVg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-sun8i: Fix the RX_TH
 threshold encoding
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:41=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The EMAC RX_CTL1 RX_TH field (bits 5:4) encodes 00 =3D 64 bytes and
> 01 =3D 32 bytes (H616 user manual v1.0, 6.5.10; 10 =3D 96 and 11 =3D 128 =
bytes
> as in the driver). The driver has the first two swapped.
>
> The values are only used in RX threshold mode, which stmmac selects only
> when the snps,force_thresh_dma_mode property is set. No Allwinner device
> tree sets it, so no in-tree board is affected.
>
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Checked A64, H3, H6 user manuals as well.

The original chip this came in, the A83T, the manual for it doesn't have
the bits for this register.
