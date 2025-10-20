Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8E18871F
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760984581; cv=none; b=Oa15stNlVJoJHhp+jdf3F47RfC66HWB6J9mzhr948V4LCeJS9vvlb3zrDu3X/hJQ5U/7JQDuh/ZpqpKPrkADdm9vycwQ+hwE/pZlzzUS01x4VySKwg3t3f10LTXt62q1fRS/HYlcLelDuUzmsc3DXj8u9sE1PR+LKNelB7Pg5KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760984581; c=relaxed/simple;
	bh=nJnS4KEn5GPnGDMDu5zhj3c6qjfMfV3vNNzdaEccvcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H6WagVroxX1z1hr2peC5KwwIGPS1z5k1O1wA+OUdJjOt8oPe6yOJAIvdxv5c4N/1STKm/un61CyQAKo5zMMUO0IGi0xmSgXglrEEIX/+bEQ1s2LF5n4VCWIA2/5tXTR1lqQ7EZiNw0IAr7hDUP+wu4h+/9dgKOn89xcnknzn9v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xo2lbSD+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xo2lbSD+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso21268485e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760984578; x=1761589378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LobheSjDQzmXm5jTVKxbVYkJzFJNe2SiM69pvM7Dmgo=;
        b=Xo2lbSD+VkY53XTVPlWlPnY6vFGtkm0+N9F4HPVaoNqbk45zukjVHahHrk3yCmH41t
         t1eIvbb/cCTCFSKZ3fSnIZ98kJ/rA43ekP+9Cgt6l4q2MX4twBSPVpwFDPY3NejXs7pU
         isFpSZ0AaQTq090Kq2glmquagkoKimmtyGkcb/BKfkB2vHZiX4P1wY9cPx5xV9XMNmtJ
         0wYejDT7HI5RRlM13rJxEHISUhREDMhP1ivlvcgS62NDM73he58uQQhvnz2Ngi73uCoN
         Y1BcaRcgweheywyJsDrUqI5P+/Vhq2I10+8F467PKjHI96ZpkW6VygbOo0G5Io1vKnEQ
         9rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760984578; x=1761589378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LobheSjDQzmXm5jTVKxbVYkJzFJNe2SiM69pvM7Dmgo=;
        b=hHNAtmY/ud1vP7E22+aX/KG9WEWNtsG13siWAnCSIuRhPFKKCgtlkxcmcGLmR/rjvQ
         WAGcGmVqxzSfnoqhG8rD1ubVdHw/k+Bgi8mfEEFDxszli04BwypEW1lQX4kHpyzONJkh
         J7dg3h+dxMqiAdXXtIwcEwgwgepQmrUNmfj9fYNtxxEESGNfyr1oPZh7VPU9eim1FbsN
         Y0uCzXeiR7EDA6YSofc7sXSTwia9PIVYO7Cvi4yYIHX4wVLlNs9eNQ88LQVxenAfcU7r
         BUzrnkEf4YR4Vhz2u+YRqGGwryeb3Djx+DdIhK1YPxj++HsU2E5aHIHbLAYfMZOHzr70
         vrng==
X-Forwarded-Encrypted: i=1; AJvYcCX+y8GuJBUoZmcYK0a1Rcc+2hUSeWuIwRQ1K3MScuP8f2jyUubDSXkscenx8+llhT++NDzv76Foaaucew==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJaCJKiIl3HL2IZPrgv7CBPcggxyxcVZNYPY2QiElAUQJisnFC
	bYF4IjtmoI2fzKth9Qx9HH8VUDYGZ7JngKvwbvqovNLnOcrS5d7qLh64
X-Gm-Gg: ASbGncuU1mntJmfmpUwLlvipXOb+g7V+xCk/mKTlPLITbXvVNByVKfmw2nrMW7JzPBg
	hKD2T0n9DkLEBOIK9uQV+c+JWoH0kZMIN0CKpqdf/vnM489CM38dZDngEprYWn/5iwGOHeChnDs
	Y54EeG2n7EyFcscqXSorNA+Xk8mQAt73NMlKb3OesJxc+HxdIDGJJJbxUN4JNqsz0gNRpTZZopA
	U9PPD+Xj3FrARbXTpDV7n/mr7e7cyokMVAevyEhC3ZD93xJ4WWPjO9wrLGKj9PyPkl1wpFcLtdk
	NgV4bNIul2vB0qnC7TUSGLxhYJPOiZ+mvGk7sSmtwGmQnoZQi1aZ8Bi1f6Avr38f6dFXCMg707f
	OI4QUILwrCCBtQrFwylbJujBNEZxjd4uRA5b0NhIIhM927jsCM+6WxjwjK0Zk1tsgu1FCi5qCi2
	0N9CIYgWjShgxF7qBrPR6aOoAyZEAtN85BuVw4TxoC/IldgrbUhXeELkgQsQ==
X-Google-Smtp-Source: AGHT+IH8xdImUVWc08yxtV5+NexJ4U7oKJ1he449w6/L8td0W1j3sEp5QRRipKGJLDowyWmFeCZmFw==
X-Received: by 2002:a05:600c:1f93:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-4711791c66fmr116218965e9.28.1760984577798;
        Mon, 20 Oct 2025 11:22:57 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a96asm16569602f8f.31.2025.10.20.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:22:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 06/11] clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum
 rate
Date: Mon, 20 Oct 2025 20:22:55 +0200
Message-ID: <1837721.VLH7GnMWUR@jernej-laptop>
In-Reply-To:
 <CAGb2v66osdLJa=_nTxz9wppUkxvu2fuS=NgYN8fKOUOLHw6-Ag@mail.gmail.com>
References:
 <20251020171059.2786070-1-wens@kernel.org> <8591609.T7Z3S40VBb@jernej-laptop>
 <CAGb2v66osdLJa=_nTxz9wppUkxvu2fuS=NgYN8fKOUOLHw6-Ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 20:09:18 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> On Tue, Oct 21, 2025 at 1:52=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne ponedeljek, 20. oktober 2025 ob 19:10:52 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> > > While the user manual states that the PLL's rate should be between 180
> > > MHz and 3 GHz in the register defninition section, it also says the
> > > actual operating frequency is 22.5792*4 MHz in the PLL features table.
> > >
> > > 22.5792*4 MHz is one of the actual clock rates that we want and is
> > > is available in the SDM table. Lower the minimum clock rate to 90 MHz
> > > so that both rates in the SDM table can be used.
> >
> > So factor of 2 could be missed somewhere?
>=20
> Not sure what you mean? This PLL only gives *4 and *1 outputs.

Right. Nevermind then.

Best regards,
Jernej

>=20
> > >
> > > Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CC=
U PLLs")
> > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Best regards,
> > Jernej
> >
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523.c
> > > index acb532f8361b..20dad06b37ca 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > @@ -300,7 +300,7 @@ static struct ccu_nm pll_audio0_4x_clk =3D {
> > >       .m              =3D _SUNXI_CCU_DIV(16, 6),
> > >       .sdm            =3D _SUNXI_CCU_SDM(pll_audio0_sdm_table, BIT(24=
),
> > >                                        0x178, BIT(31)),
> > > -     .min_rate       =3D 180000000U,
> > > +     .min_rate       =3D 90000000U,
> > >       .max_rate       =3D 3000000000U,
> > >       .common         =3D {
> > >               .reg            =3D 0x078,
> > >
> >
> >
> >
> >
>=20




