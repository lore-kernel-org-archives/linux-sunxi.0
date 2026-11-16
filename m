Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852656;
	b=OK7GJNlwXD8XEyYUclwF3S37qx3HYhAF9Ua4+i4V8Bd00f5IV3cRo4Cq+ws99x9bnssF
	 83KIyhFX+0yHpXyBLAOxXKcNYx1u2+AOH08pU7vbtUz/490zwo3RqyVRUi1eCPIAwgL6H
	 OYG4EyWfH9OdbcndmTf4ZAJF+jEzdz+dgbrUQ4Rh5OyKd+mpojCSSxvLXYLborjUevuVl
	 aWvZxT6pLyfI3dmnmsl0LeVH0xWWL1Cd7OnszX9yIXNl1EUGn6gfnyUGkV0C83jRixSiR
	 LYuxm/fXAX0cfq9qjD5ToHksqPcY6Zf5L/Ug4uaR65m+dG96TveMDeSDYoUs1mFWbWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
	b=kbI81EzgIHmDho26RO8OEHt8y9fNi/FuNoA7BZ7hBpv4xMGYj1OpjM4/Vq3kPNiLQguy
	 sl1NsNIUi2gPq2sSga+J1HRQk2h3kXIMg5h0XdTCIKA+gLcjeBw1t3tKT0dtbsa4s2LxF
	 8x1aNolUZBfOnG9aAUwBHFFsMMTWX6CV057wuCIDUv3yoJ/q5oZD0WqxLvSPM/5kJ7Bu4
	 ZCiMPdR8mrNDMwSk/oZS+gdXmaNZ+x5XwfOxL2GOXNPB0fodI1Eg2TKXa0nfXqypGS39a
	 8g9Id0hujTXhRvq7MnuJUs5H0XuEJ8pkLtZrgEs5DfzycfZFkIR5OLpnEJ1Dfi16dOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNL7VebY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA6B606A31C
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 18:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNL7VebY
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ee1e4e3abcso1064234e0c.1
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 10:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852655; cv=none;
        d=google.com; s=arc-20260327;
        b=XktsRdqQtLpf+LwhiX2dGqVVS6fwvvc0fbIa1uJ+hJ6gOC5CXzbVTzBFZxzPjcPN8S
         cEIx9ukye88FA9jo6oZ6HQ15107nLilETqvKFcMOJAVGpZZMUX7HB+yva8+qSFmKAr4B
         ri0DDCPI35prx4wSMGjYKWa4fkLit8dyn3+iY3vN3yaci/mr1wPoiD1r1T10hvoe5gJs
         pHY040DunPeF+r16CaVaSg4W2r0N9Qn5CHlSxM99mIvjK0ttgOug5x1WR44yzgAUNqP7
         sHg6DM98pxwvwHMAGboXB4l2dJElZ6NUtGkkAZTyJ4IG9vUjwIhUD5AY94Ow93HFzXNg
         lmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        fh=PFSCXMGdRdd+IPRSHlI3DkmPZZg7dvoSZ2JKE4+L+zU=;
        b=Px3PITVaLGZetDO8hrEJWn6sGmpNFBYVwfJQh+PmsETxDkM13q11uRXrI9vaAXi2Vx
         L+ZuCGzCt11JdbBWzFG1aZ/W6TKicm/zrFqbqfh5y/3CAcQY8fp8AOn28n1Etlubt0Bx
         V54idtApZY+CoMfWlWPPPwouGyfQYPphv9rQhKhfFiRMPcfrGheu+NGAuxy/5ew9YsZQ
         yvKkyXVCsZqROTuVcWqVTOybDErIcc+xSYwF42YCCx76xTkrn8H/a4AGZcJI6UJe31T/
         xfKUC0pKuaEiNNvG4etRJj4XS6tr4xo33q0UcAw0Lt/bvT2E+EQ3gRWM9qnyIQOJz81r
         XwnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852655; x=1795457455; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        b=oNL7VebY0t4Os1mLpk0e+4pJiUhJ41iOftQf8x2muePkXKWDRc9NDIgMPXk7azsm55
         1jndhJ/2GFxGlEkz75iE+x32bCTZsuDsGlrSFJD7kKnqBShQR5YGtcCJfeaZp5rlZbeD
         db6xw30Pb+cXn0XW1P/HykJetwQtTGG7eUS9x22xIQZMr89eGvPfQSj1pPRFGpJC9JpJ
         pTUV8fDJUW5O5lt6pkqGbxu1+/1wUe4iBM71kQUEziLYrKpLHL7Y1nzYQwYp8NVcI3xa
         qkfqjgnj26I1l4zwwo4rJCEqWltFSdsgWKT066kDSgZ8vvPHU+9SVpJgXNuLmkyiDg+w
         Y87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852655; x=1795457455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        b=RZxyej/bUj9YRcVL1zig2wB+GU8G3IUOD5zTC0pmZ1X2pxbLimIaQatg88kEpCPrKf
         6Ib5kGpXEADqXhJgkx2K2rCIzF5lJNpt1aLqWvlziiwK5ng/LWX5UaiEfq0qvS5qrQiL
         MNtfoejit8s24ARrZVAOFgFLk7FW+FxJweDpoGCeN0p9L2kPUf9svJDHUsqy9htN8hXV
         GoEhZX6UO5TJg5JNav85jwBWYclgz/rbvP62HRN4Youpn1qEX9jUVPL7gm8OyY6r9pKq
         4cd0tDXvNY13m9PG7Xci6Kz5Eeo4/3wB/O6MZ3+VXxeL3aubhWHQPX8ICW/qHwo0kQ0n
         ppUw==
X-Gm-Message-State: APuU4Z99/qsFcTy5Sm28bG/5fyRPKpJy/QXUkVYQrdCeDBsFlqHB/7Bd
	MUTTBNFGtnEPFaNPJl257tvRXYu+C92P0N2aKQxRd48aNImaHa3TZpb5w7/EsMnwVxdbyQJFBdm
	vo5h/gg23p5jhI8821b8oAoMclmY86qI=
X-Gm-Gg: AYBFou2eBJpgKxe9GAuJSMMDgU0UJzdE6v/jkmAiznfLLVR/htnWCgEZuvJ3Gll1pg3
	ZVykBrO6VOk1MElBxScdmD0n6PoMMteRXOmtG2otU2MP93sXu57Kyh+leMafJLSmb5EQ/7ZDS3F
	dRUTLbGFou422N9G1Zc+dAoQb6hjAA/ejHn/h842eSXhz9V61UGP4vAPoAvR82bd8+M4NUBLz5p
	6i8OPCiTwCtB9JLFc6hSmf67/Ru2xBlZXsqV1qByHsjzBuNxd+Vq1i2NOX0c3ynwOciy6jLmOKW
	lcvGKTY+2dG42+nl3xZ6TFGvy0ocSVZlHf8Tki0UIi9OxWiqtG9rdqx8JEXm1KJJty/rmewxcv8
	d0jo1Apo9WV2qoT1NmXKrONeP3nmcdb0Chi1d5xTtrhfB3gyWoScyfpM7xQljD0+PSaOc2w==
X-Received: by 2002:a05:6122:1792:b0:5ec:d5e1:ee27 with SMTP id
 71dfb90a1353d-5ee34aebcd3mr3588477e0c.20.1794852655533; Mon, 16 Nov 2026
 10:10:55 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com> <179485210124.3689664.6903721866612808429.b4-ty@kernel.org>
In-Reply-To: <179485210124.3689664.6903721866612808429.b4-ty@kernel.org>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Mon, 16 Nov 2026 11:10:44 -0700
X-Gm-Features: AclHuK8Q7HwxDEIcfyXjUFUI9dASw3q3swCNJxLwvpsAisQFiqmZU_r7ygT_THk
Message-ID: <CAH87RzQpJ3Nu31cDMqWJ_v_2SRm4mhKmf22nWXf4=c9CA75hAQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Awesome thanks.

Regards,
Cristian Filipescu
------------------------------------

On Mon, Nov 16, 2026 at 11:01=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Mon, 16 Nov 2026 16:44:29 +0000, Cristian Filipescu wrote:
> > Continue Jernej Skrabec's April 2025 series, adding the board compatibl=
e
> > and device tree for the Allwinner H6-based Orange Pi 3 LTS.
> >
> > Use the common Orange Pi H6 include and describe the LTS differences.
> > Follow the schematic's LED roles, remove unused USB ID detection, and
> > use generic PHY discovery with bus-level reset. The binding patch is
> > unchanged apart from rebasing.
> >
> > [...]
>
> Applied to sunxi/dt-for-7.5 in sunxi, thanks!
>
> [1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
>       https://git.kernel.org/sunxi/linux/c/903a676a19ab
> [2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
>       https://git.kernel.org/sunxi/linux/c/a203a4bac331
>
> Best regards,
> --
> Chen-Yu Tsai <wens@kernel.org>
>
