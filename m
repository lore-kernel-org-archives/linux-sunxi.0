Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363274;
	b=b/BD5uj3LYuBTmUdbmBSjTzGzjYtjC2BS1ShoEzN0hufDLQp89xgDSpwcbudT2wr7+4S
	 RQMMaCurnTKQe/nOrlvCqgRZhqT5mlKJgedHx0Z02JzMKrNRsW7yWp7pChcAtprRVVJn+
	 gO5D3eTF2s0tKUSS3RWIC+AMpWh95RlcobIPvim433zWw5OQdRZGUvfCQBlCjRagc5zME
	 Gd7gr0p7MqS0d9ADIjycWZQYmbJr6GxHUDP52P00ZOr5F4gEIqpL2Ch4b2zdKKBQmhcZp
	 8roR3QmdOHt2D1Dp3xbHvj1n4nce6BykRvRPkhwN4lsaHB51kmVg+a4+w7flYKN7Ofg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363274;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/izPWKlba6hwEZVlAponaP1r95LRqIjVUfRXZ0aBzfg=;
	b=uNjQomf3NAQqZkmNqhbZLxoU2qki93rwXigFEepoHockHYZiU+nXksw+817PnDnT7FLT
	 I8Iq7Prdr4WbtCeMuV2WFyP6XRhAERyZgFGgpfcAtLZDq8ftGcs6LBt6f5WVkBbPEHl7M
	 27W1C7zR7KEI3vpUS0Mxdf3GpzsFCFD9CFPz4jxhL4TXEl3y+P683ncRp0XeQ5QwX5m2r
	 ZTOIve6jO7bzvRPqtdriocvabEa6PUexligIZGbg/MOTePUapVyiV4p9ovbDkVxMb9NkG
	 Aju9eZVS+pUIG62jQIVdtZ1ZcP+my/IAy50oqchrMHrfgmBnhygj8mlDdzlHJh7Q/Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzfauxW3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB1606A332
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzfauxW3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905C91F000EF
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363274;
	bh=/izPWKlba6hwEZVlAponaP1r95LRqIjVUfRXZ0aBzfg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=LzfauxW3rEExAgmdG4kLoxGoYz/MCia8CKAMKl83GyTQO0VtPeGsltO2V+0WDIzWj
	 5iECqnhnsj/kKrsaZZtZk0JF7iqOz3ahCt6gKFZoeCjvUuH4G+mPSe+xwT74u1jd3i
	 QF9gztIjuvKpikuFo71r975dBEJ0kr1hGDuDYjo/O/TRz+k3VHSfQI/wli9qg4Ng+3
	 dBPEhXy5EWxAy6sz9xdKD6tt4S48iLgaF+amu2RYe3stbbjXIWbs98fXr1HI5mxKlg
	 KICpVYQ9w6f7Vj+VrtZPVQwSY+uwspIRjAXPj8v0O4PDsMoo3TwFFPD+0XpeTJTuHV
	 dYP13IXmp+OrA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so19659031fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 08:01:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGS9hS3HRFjlmIp2bcDp3N0QtP0qVDQebCDnMa496zvqvuufkm2BBO7OzrcRutgYXilH7xzYHUu9mTFPg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/5sOKWhuaOG6G082JDR7HT4GMtXkEjtQA9YPqZFnVpdb5eyYmh
	NCPa2yu3lHXb9GOZ0Hu161sU0vZFt1J4f0tl6FrCzJ1TNPdYrcbooHG5JpcHf1LQzNoCeOdupGk
	HWrXFe+nVR3PVUBUXYmLZicjisH+3V1Q=
X-Received: by 2002:a05:651c:1474:b0:3ab:f9b:974 with SMTP id
 38308e7fff4ca-3ae7fac2697mr24800931fa.29.1795363272768; Sun, 22 Nov 2026
 08:01:12 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com> <20261122144926.284857-2-maxime.chevallier@bootlin.com>
In-Reply-To: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 00:00:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v65EZ3VP9HDyJps==0RcZ8fWTJuai2d-5ga0V4aEsrM8uw@mail.gmail.com>
X-Gm-Features: Aa3M54qOwDNW1Yljk-lFISp4AdkVQZj8kdy4KwB-RgmQjeLm8Au5CMg40XaXguE
Message-ID: <CAGb2v65EZ3VP9HDyJps==0RcZ8fWTJuai2d-5ga0V4aEsrM8uw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: dwmac-sun8i: allow controlling
 TX and RX flow control separately
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Nicolai Buchwitz <nb@tipi-net.de>, 
	thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 10:49=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Currently, the sun8i flow control setup only looks at FLOW_AUTO (which
> is FLOW_RX | FLOW_TX), and enables RX/TX based on that.
>
> Allow enabling RX/TX flow control directions separately.
>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
