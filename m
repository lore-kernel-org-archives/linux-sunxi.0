Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870188;
	b=Ra+pTeSdqO71reC5AqNhMnoXNR4LNzo8lenHz6994GvBQ4jjraBqpvVqNtlbT8yrKsb+
	 r7TAdLRzQ6vvDrpOddwf0rbvBpr4PS+ZZ2m+4rVYlO8ARER1s8OsIXjgLZnIHNCNZQKC1
	 9nG/KH8my38EU+KbNpUEke5Q+xawq963YYfK9r5Y53XfGaaFdmFX3wRYoj/DNgrbLcLmd
	 TWqNvvfeciD9cfddgfXBQR6iG4mvu9lGsKfpnlyOHT+y8yrH/fuBGsqegpCVqyhTn/0cb
	 hjWMnGHG9NaZlni/jWt0WSgVkPj4++3QfogxaJnK0q609joOP1EbvmVLDph1zUc05OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870188;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AaYrzlsh63Kq39GhHHI2u9iALQEdfJBV6NB3OKFCfA8=;
	b=I1r3s26yIHStC4PwDBoxsUfaFA1sak4/MgpHKIQ8fYSrLQuBBkmPpS9u4fokWD+WoBPq
	 NMdf9SKSyX0rznMxD+ZWR/p8jE8YTjiLLLmiwrdmgFXyo8wSf02FZBtqhllCI25iwIlei
	 tSdXdKupSr2fqgDXcuA48z/B6NTCyjW9QIGLaALdGF9DaIjmBGYycaYnnHZt7imUYz+lY
	 zluw2lGSdOipQVinv532MDkok3Gvdg/9Ns4uWeMNqLhkGorj0oaXllGbiipQlI4fssvRp
	 Uw6Rb0URbYynqbf7uaLBeFDiSPAGWfmoOFxOiQJ6uFbVyuT2Jx3MG4oiwRdrjX1/mmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwLynrdc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F390C606A32D
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwLynrdc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46C81F00A1E
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870187;
	bh=AaYrzlsh63Kq39GhHHI2u9iALQEdfJBV6NB3OKFCfA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VwLynrdcYLs5RvmTneK7ASfYo7Q77QES8CdEFfRhbXxKuL9w/fQpBSt9HVRFDWqzm
	 qMrMTx00tQQGit+nNf/abi3xEEV3vDAOtnMIVA02L/EjRJYWhJmIfTlqTHbdbQrQuy
	 G5Gc1eyz6N+TsMSPrNuI/umq31igbmLYNkzR0GKeSikNKD3ewxz9Xhwt+2XVnbHLn9
	 RmgRuzF2KBuB5oO1+4DhdmbNNgU1NxU7eqdrKqv9s+PRIh/kSQOrAe+StC60lUmP9P
	 zGqeM6bR8qxjiOmKEONh0gLGwjy0paXgDi5ZjSWbW+enxibtPCwiGr2nUoIWOTVfsp
	 cMcPYiOfvPJUg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso3703471fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 01:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxl36S1sMa1+13jBYHUwApzOB3U1c9EotyamFNH/HbVYXGiLOhrQG7B9HVFu8eUVGwjTCnJK7RKXEgk3g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/N1sCb9hT9Ra8EAaaKHCeV1vQJWhZHcrZMpMMY4pLYgEoRtVwO
	Fpg02lgE5NRB7IOmKdbK6eYDYMySWWbogsibNmb+9YQM+U5HYrHwkpueewbxQ57T/jMlTMYH/4B
	XmK5M43DtO6VzbFS/+R5/PWSkiYxB5EQ=
X-Received: by 2002:a05:6512:2306:b0:5bf:d938:b80b with SMTP id
 2adb3069b0e04-5bffa170f99mr528748e87.27.1793870186373; Thu, 05 Nov 2026
 01:16:26 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-1-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:16:13 +0100
X-Gmail-Original-Message-ID: <CAD++jLkj=nOGMk4vveKvm8d0JY4dxwarZ-mJifrTgsDzc6g_tg@mail.gmail.com>
X-Gm-Features: AclHuK8Z_fG5b4bwr08ALhc1h2_lYGNTUPFKnPZS5m3aB2BlXOq_Z9AX8QOoOvo
Message-ID: <CAD++jLkj=nOGMk4vveKvm8d0JY4dxwarZ-mJifrTgsDzc6g_tg@mail.gmail.com>
Subject: Re: [PATCH 00/10] pinctrl: Fix out-of-bounds accesses,
 divide-by-zero, and error handling
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Aaron Kling <webgeek1234@gmail.com>, Ajay Kishore <akisho@codeaurora.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	Andreas Kemnade <andreas@kemnade.info>, Andre Przywara <andre.przywara@arm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
	James Tai <james.tai@realtek.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-realtek-soc@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>, 
	Paul Cercueil <paul@crapouillou.net>, Qingliang Li <qingliang.li@mediatek.com>, 
	Rob Herring <robh@kernel.org>, "Ryder.Lee" <ryder.lee@mediatek.com>, 
	Sam Shih <sam.shih@mediatek.com>, Samuel Holland <samuel@sholland.org>, 
	Sean Wang <sean.wang@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Tzuyi Chang <tychang@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>, zhouyanjie@wanyeetech.com
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

thanks for looking into this!!

I'll wait a week or so for maintainers to pick up individual patches,
then just apply the rest.

Poke me with something sharp if I forget it.

Yours,
Linus Walleij
