Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1854A258CFF
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973508; cv=none; b=EtdR5OA5/uFGuZmDd4XBKyCa4x6AUMtQTaMUt++E2p9QOUyxJiDb+M3h3G06Gq5JDD4T4MoQruPzpsRHiMUL+p0Ipfqk+Acll+iR9VR124e5il3I+415Q6WD6peXcKZg+NzGxlPnGf+jwsUXhFSOYZtF54hm45qHEu9o5xrO5N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973508; c=relaxed/simple;
	bh=Jyxeti9uUZ9Fw4cj51QB7FVlE2BcnZaTFx9SeNp0Vgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RyMULciJJHvNN4Yg8zzh8mBhdi6poMqOS+GZyHLC5zXe8h+yR0B+LrZv6x1Os6AeyLDmS8komURV79Km2AwS48RnqWvQGYlP68y5DpM5Kd3NSSCw/E/nw5pMv66Jp5o+QRKhrndLfVAh37eVebx1BrqEGlvz0xQjHcxqL927C0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqgbKL97; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqgbKL97"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471b80b994bso25015165e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760973505; x=1761578305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIri8gPwCvgxzuVNcP5Ad0/5z9CcdBUeY3ByihuZDbc=;
        b=hqgbKL97H7QzEizoEnvMdnKe8n/HD7CXu/gFp2Y1U3ACZ4bZd8g30+p9G681BlkHyM
         gDb1JsltorNl+SwLrvGKeaKJ7bim78puKAzI3SDwTMopf/90bwtHEpe2ZvUCqQ63H5Rl
         aN8SZldAahP3mkYaEr9M78ZCMg+G0g4qCuiZrHmIGYmj/B7ZcXACB7XroST27HGm9/ak
         s+Bk+tKP7zA+y67S5V+AcN9a3u4UG7ZPrTIsJv17+K8cwYI2G1cIdyPZO+kNaHRti5ge
         DxdqS1OqXKSF05VFHdd04+86y8TDj3DpHthfMus+ItnEa12LyZ9XBbNwYzpsNCiQ0EmH
         EMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973505; x=1761578305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIri8gPwCvgxzuVNcP5Ad0/5z9CcdBUeY3ByihuZDbc=;
        b=oTvwcQL77U2o8EVVR5nxqQnbXCF0wWcQJxqRk4gaSWsYBnHJVu4ZOnZt63nTP07JOM
         hQ1sB4xeUTmLzxcrLNY2YGieIzWVzMTcI/nAZjbBRWgJgvNSqdkhr2afuxZ+UvH+nIZL
         m+XzaUVbFqK8ylHzyD6unUBjRm+oY6pVanBEaPZTjRvhhBo1BeCkxRQ5ArNh4lwMdbzR
         +qvzvFyiHfRgyAOTpkUzFz/Ce50iK6E32EYIPQReehhTXh3hpgJ9dIWEQC7DkW/2b7DI
         yi0LNt30nHiXy73u1f4hznjXJoGJKkW6EtjrzducCnijYIIWsfwQ6wadjLWOXrALwOYx
         NHpA==
X-Forwarded-Encrypted: i=1; AJvYcCWYjrJ5w9uwgvqDMSsIji9gO1gOzIxdRuRAEhcTiy3hBa083uvq0aYLPsl7IxtaLEL3xhfE1UWWcmvhXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqNWZANEgRrBw/amwRJS8sSgpFUs4lBvcMJsWjLuMrvbKw5+Ea
	quAGajIWwQYazlI1t9JlMsBty3uomWJFNemsKEGI2qYfK+3m2x38lmm/
X-Gm-Gg: ASbGncsM7W2aCXahRj05l5mBTaZdME2mEUsHIF40QR6G+DF7x3iwFGyEBJx6OosGirb
	q0gTNbB5jDtp7Um0A6KceFVl6qDzTAS6KG+qEWIy5YI42EnSwvcsrrtTBdDQfIjR9cZqwTsvsYo
	MyAA+iEtJiK5RFb087N/mbEo0ufuXYIEgfHTwNTS6YoG9tF8gEkMlRrm4Avcm4c8aKBIvaYEdnk
	MPDzGBaRmIju14HE2cFEfSnv0XfwJ4jL+Fi8UN4yHGP3xFkraD0+Zs9vpf0i0DRKiMLm9cYoKk7
	rp+m+giAiXqEzSJgEsNL9cB0pjOUG6gk5Wv2uSXuiobxjjX1UghgrF9Y55nWwDj5ly0B50lAhoS
	VcFIBmIbyNCD6r/qUA0851ELy+ySKZTN8j47LI+dfJTzbL0IChNXn2FXAjijPQHhAMoYui3RJGl
	Mqrg0BkKmXCE+dE3QWwZpubalAp8mkFjs/Ru6zYLsJWa7fVUZeH/QUdgzf+aCN02umGzgp
X-Google-Smtp-Source: AGHT+IHQEYoBMcfx1b6Nsx/IivzRuTLpzyAZ455r3ZJisHcjzwPbpeFkoct3AeG4wC3jqAyj6VhBUA==
X-Received: by 2002:a05:600c:45c9:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4711791c601mr98951155e9.26.1760973505153;
        Mon, 20 Oct 2025 08:18:25 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce178sm15617638f8f.46.2025.10.20.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:18:24 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: devicetree@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/4] dt-bindings: bus: don't check node names
Date: Mon, 20 Oct 2025 17:18:23 +0200
Message-ID: <5930653.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
References:
 <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
 <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 08:09:50 Srednjeevropski poletni =C4=8D=
as je Wolfram Sang napisal(a):
> Node names are already and properly checked by the core schema. No need
> to do it again.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> I'd suggest to give subsystems some time to pick this patch before
> Rob applies it?
>=20
>  .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-

=46or allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)



