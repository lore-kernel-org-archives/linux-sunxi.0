Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795200384;
	b=L81DMbFkZJHPurp7PIMtPVs1vt8ZiQM2W92bNgPPaT6Kfq5lDh1LAJbxYgAvC3S8um+D
	 snCn+iGX5JVJZgfmXugrFLfCGmvWtGP1YcOasvsM7XtnLfPMYG0LfhKXCsA1o7yts4pnz
	 R4FOb9Ez3ximrHGXdCHa9v8lt2zlQXcxL0mo2nDnKzKT9fFQtos4Pcjg64nDpQlwvpPJz
	 eFU7dd8GzT51Vdwa16lbjRRYoQ+RvZI3Wp4ixrXqFaQjtBnYaNVefHBnBvta67eZ0It2C
	 SyAj5IC0t/xk+wSf6OjzxLQiC2aJ9iEHLM93rCkRwRcuwYnmfVKLSNaj2eR6mY27j5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
	b=Dp3goOeWKRbvY+hwEorCQeHMxevU8OBY/0zHYjSey4/qX4pH8eQJLjm0l6DpqRQ4V4LZ
	 br4sbvYZQ1S6fqYfAZYZFtfjiAFVLy1ZkQHB70YUHgfS8X6E5MuNeMuu/9BzgAcZRAxu5
	 /3wAMt29S6ez98DRQAKvaFc9IhSsZQomN/I+w6ogq8ZA5x4IccgRl/9gfk3XJapHiMS8L
	 YVKIRvukU1RjezxNc+OOQW67izmxdkZ6jolQ2P4egQKtlXo43nC4YOZHBfM/FVFnPSdRX
	 RjEMKWe8oEVpUxdrubDGfbj3UfSf8OcqJUDbCGoy1t7uCK9razGqWKX6wJbW0X/iqHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNaKzgrt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6362C60A2611
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 18:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6362C60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNaKzgrt
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eabf243d05so440177e0c.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 10:46:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795200383; cv=none;
        d=google.com; s=arc-20260327;
        b=rLAFSRjDted74l2ZX5Xjcu8pBvi27E66jnLadTEGsA84oIypECHaG3VrFDeyGl1+fF
         9Z67Vxy1qIJJUP6xIowAlf+UWPWXck/KDDuPMZFIwnuabeEr0ibzaWXimZqh3jIA6ybv
         WWco9DaXDZ52GpG7TiIlVP/d3NC0WfDKOf1N+NEW/PTmXXVZtWQjSDstqCp9S6EvRuxs
         um1clBHNnA8TrW6dtNebWVbpqcw3Ko0+t+iF2J/Ft3JWmdJalzvqcLtsZHPl7PQ3eIYC
         XcBVPVJDfcFfNPx3u12y+grZOeUJf6COOf9uc7ekB71owtGcGe8SK5+OY97pDquRJVHt
         I10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
        fh=tjZMiRuEwrOYp1uz8+zVkTS+46AXsxTygO2s2oMC7hw=;
        b=ZTRkonIpTls36mMVvrWoPtXyBtdhjKv24wBFr6i7YOrFDWdpmpWV8Vi0gqil5WF6Os
         BvbJEpymW6vEDDBQAnwrM8HUFABA3tp2o7kg1px8ODW0L4+c6BVjndF6gUs7C5BJO/mR
         7OZRwmw7Oxg0Q69ruRvyfnPAjPT+ZcKZdgVLaPZsRaj/pZ/c3ZvxYXKSWTd9FBE2uQpD
         /ncs0eqfwY5MY1r6MKHyk4a4Cy+tfHziy/GumgFUtksusKWbKqP8f9HLpQyipeFdafyv
         jUHEWOqBG/ZCV4iKuBqy1uKpUh2vwUrWNopHHxrXmRbt9rrl+i82o0InWItSOpTi8KaT
         30mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200383; x=1795805183; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
        b=LNaKzgrt+Uxj6SITeM7/i9BNPsjeqisvnFs8KNW1Gv/OLDdnKfPi1ZTHYxin9hmaci
         rJ/mcAkd3OxjKD3LHu9ya8kjuhGOwTXNDPpW4rWqvULQlSqe893XAjJq4RsgQTZwaV0S
         GH9wVtJHZZTeKkbEy9kV1p9Y7xXRA59QsDKA/sp6Q3h4Njes1GTqCDil5ArgS2rq19q0
         1mZdiR+fG6OCNP816m9/x0ydMXGVB7LLi+lb29B04itZc+077V6bax6URtL3hgy2UpKN
         tQVHweSESVC45c1tkf5hMmw1XCUiNCRYnILHwlNVcr6XFqkPJ7wsGsAl9951FhUuAGzn
         1OjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200383; x=1795805183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
        b=lhtiryJ1bPHPkqUGmIjkpSmi/oCj4GAVGKdsCSwhDgILsJkpm4Gv/IdaTT/ahn7gSr
         fjL/lxytRhkhJAvo0fYXvGU9VBCzZRJgDwsPxI3bAeCX3w93EmdDimkvD6/Un3YPMLSm
         R1WpqQmbNoUhOgSZpcHETLkE2HzaDCZNq/e2A7I4Vwej2jA3NNLjLO/+XQtLIBm/AiMX
         WRqbUhG3/gMAPqPrQb21XFZuWGx50CHG77IbFBZZRuQbH4381ks+aCLEAduWRAIusdcs
         +/DscrJ+p2UBPTA1idG2OjXPoXaX0VdPP9MYc+VewbfavnxZOz8pr/hBl6MmwsGNYqCS
         kizQ==
X-Forwarded-Encrypted: i=1; AL+hErHarSbPtRNbjsiFiREihnTL54Zm0UKmDVZ3ZM8IE5pPUHOAsp7zO3Ab/ewTnwixP2LYVFknhc3OysnVpA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/yuSSN8AXohIgmvbP5js0XMm8h1g4awiNlBYTi+2O+KMt0y4Xc
	dddHPYXfvmgtAzMQ5Yp40WQVw8Zdf/cEAIY4h8YwHihnzBwhWte6hkC11sdigCO47/oG1eRvBd+
	SOGgmTrPFCP5PyEVg2+HsyYUdxvIVzEw=
X-Gm-Gg: AZFdTZdw50F/l4oeYb4lxrDZlfgmUV37JohySocb4dk264lub/6N3mFA/xuN7DUBwHw
	5DGu1ipAPEqoKA0nA3V4a0ND30TOTVlf2Q9X3OikD3MG8eTGGp1nukyjD+4HKeR8UTseFmVd8+f
	iB+uGQWhmld8aPtslCbv6Bks4fhM4qMOkdqTLVSZgnzrejPqDDT5x8pUqUaNC/65ShQI3RtDPBM
	T583yzoJGtSyX/ruR3i9CrkpqIJ3eE1rfVRxC/QfxGlTdOHKy2v8HNZ4nNG5Juck7TMFC6taktO
	gSfuYSOa66Ed2xGgQyosPr3atvuDMLQJ4HeRaPpbo484tFZWNiOrLxvwT4IjeA9lWDMR7ufuDfX
	dvaeIbwtncW8ebo9C7YePIzHaEZGir5eI3X3mhSFeGZaBjAMTsTDpoNzP/Da+HOqGoO6wDLnGwK
	RC9S+itY/gdZWlVZCsAwq1rrCAU3p24U7UKb3gD+xKlQEAz3ijZ1+uS19N6Cl1i1aTiNa/1OClJ
	TipIdyqrzqQD1aj7pfqGo4+SlR6WQ==
X-Received: by 2002:a05:6122:9003:b0:5ec:41df:f110 with SMTP id
 71dfb90a1353d-5ee8af6c74amr2016084e0c.23.1795200382307; Fri, 20 Nov 2026
 10:46:22 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
 <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com> <a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com>
In-Reply-To: <a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 11:46:10 -0700
X-Gm-Features: Aa3M54rJ5Y8qFUvIsWTDnCsT7oGEaCdkKyaPFOPkJ_ACUKYfdbfqerO9yZONmfs
Message-ID: <CADvTj4r-KPM6GB7UyDK=XF-D9mvOy9m7EvC3qzznz9VKvFLw6A@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool rx-all
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Ong Boon Leong <boon.leong.ong@intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 11:30=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/20/26 16:32, James Hilliard wrote:
> > Packet captures on sun8i cannot currently inspect frames the driver
> > discards for Ethernet errors. Add opt-in rx-all support for complete
> > frames with a reported wire error and for runts the MAC can forward.
> >
> > Set the runt-forwarding bit at hardware initialization and when rx-all
> > changes. Serialize live updates with the DMA controls in the same
> > register. Deliver these frames without claiming a verified checksum or
> > including them in the good-packet and good-byte totals. Keep counting
> > the wire errors even when the frames are delivered.
>
> This deserves a series on its own. it's not only about sun8i, it add the
> whole plumbing to stmmac itself. Is it something you've used and needed ?

I used the hardware error-forwarding controls on H616 while comparing
the AC200 PHY's CRC error counter with what the MAC delivered to DMA.
For example, the PHY counted both 63-byte and 64-byte frames with a bad
FCS, but only the 64-byte frames reached DMA. The use case for rx-all
is to inspect the frames the MAC can forward with a normal packet
capture. It isn't needed for normal reception.

> This feels a bit strange as you answer to the series info bot that this
> comes from Jakub's comment on the previous series, but I don't really
> see the connection except that Jakub mentions RX_ALL.

My reply to the bot was about the checksum fix in patch 1. Jakub's point
was that a bad transport checksum alone shouldn't cause a packet to be
dropped. On sun8i the same hardware bit forwards both checksum and
Ethernet errors to DMA, so patch 1 enables forwarding and lets the
driver discard bad-FCS frames. That addresses his comment without
needing rx-all.

> If you want and need this feature, you can submit that separately.

I'll send the checksum fix on its own and keep the rx-all support for a
separate net-next series.

>
> Maxime
>
