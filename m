Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79EA3E494
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2V3ntDP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c60dfa5bfso67641695e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 07:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703085166; x=1703689966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yicW/0g5zGKG++pwwlmWWUmEq4VzIsF4byaTzV8risI=;
        b=A2V3ntDPeWotN+Q2l9Nt9ntJ5Oj2da3np8Sn9a8oU6IlS3Hcfe/287dnGvZ0NIyoFV
         YOhr3Yuue+4VkpZVq7cnbPEacJ71iN0tyT7l7FU/ERSKDYWMFCVNX+d/2MXj5X1D46eB
         8i5OsF5mLuT0aarNa2QJ3xNe6FeCEUrbdoFMYJJe6ZDLCIpUK+Z0NibU/IxHja0V96G/
         NToWnHxSvs4a9SEHeNRbG39de0nWuqww+zZPQYezUQDbMfiup+sbFA15J6ZHtsgMy76u
         O0eKp99sy9BEvrv4QEeBmI0+znBkv9YfiG+iXSEEcxDdR+KogXUE8L8XEkRJLH50PvtH
         Isyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703085166; x=1703689966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yicW/0g5zGKG++pwwlmWWUmEq4VzIsF4byaTzV8risI=;
        b=SJHPQKe9+uicsIke/i9IWMjYDAjxRrpC4dKw5WdZCRHJ2VrGSFG2nh4wOlp+LhjkTw
         m7TU7HNxfFC+RmRYN4wdeNvZqWi+dArNUXarwD/s0blZ25Mk83kBXr2SarkAs4fEf/fN
         Ohrlhl16SLjWW9nW0v4AnP8Tt3ENYA00pADjRDyhk1kquKhdsF/1AputW804F28+M94f
         9V6g5lyx9qdRYlVRkO7WCz88pOkkvnnlxZdC5cJteM6FULGGFo8A3VL9MVt1LfxcZn9j
         Z2cbSmH7i9fip+Hlc7oZvgjDaCh5VFXxwm4211Y8qIFG5PeII0u3WlrGN41HbfIMAy07
         tkSw==
X-Gm-Message-State: AOJu0YxX4ZizxPOE0L4AV74DMkZYqmamyJGo1bgwnXElGUer4KxC31or
	JZVDDwwxSNlNvF1Thz8wnR4=
X-Google-Smtp-Source: AGHT+IEKaIqHWDfrMHQzZy/DZQAUnHiC5clwJLE6Mzl2x0m3qk5dXSE5YR5bdZlk9zrAuj1HQst5eA==
X-Received: by 2002:a05:600c:4d0e:b0:40b:47c5:35e4 with SMTP id u14-20020a05600c4d0e00b0040b47c535e4mr10309451wmp.39.1703085165645;
        Wed, 20 Dec 2023 07:12:45 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id e2-20020adfef02000000b00336644c400bsm9770223wro.64.2023.12.20.07.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:12:45 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject:
 Re: [PATCH 4/5] clk: sunxi-ng: a64: Add constraints on PLL-VIDEO0's n/m ratio
Date: Wed, 20 Dec 2023 16:12:42 +0100
Message-ID: <2174554.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <87il4t9wi1.fsf@oltmanns.dev>
References:
 <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <13411739.uLZWGnKmhe@jernej-laptop> <87il4t9wi1.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sreda, 20. december 2023 ob 08:09:28 CET je Frank Oltmanns napisal(a):
>=20
> On 2023-12-19 at 17:54:19 +0100, Jernej =C5=A0krabec <jernej.skrabec@gmai=
l.com> wrote:
> > Dne ponedeljek, 18. december 2023 ob 14:35:22 CET je Frank Oltmanns nap=
isal(a):
> >> The Allwinner A64 manual lists the following constraint for the
> >> PLL-VIDEO0 clock: 8 <=3D N/M <=3D 25
> >>
> >> Use this constraint.
> >>
> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >> ---
> >>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi=
=2Dng/ccu-sun50i-a64.c
> >> index c034ac027d1c..75d839da446c 100644
> >> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> >> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> >> @@ -68,7 +68,8 @@ static SUNXI_CCU_NM_WITH_SDM_GATE_LOCK(pll_audio_bas=
e_clk, "pll-audio-base",
> >>  				       BIT(28),	/* lock */
> >>  				       CLK_SET_RATE_UNGATE);
> >>
> >> -static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSEST(pll_video0_cl=
k, "pll-video0",
> >> +static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO(pll_vid=
eo0_clk,
> >> +						"pll-video0",
> >>  						"osc24M", 0x010,
> >>  						192000000,	/* Minimum rate */
> >>  						1008000000,	/* Maximum rate */
> >> @@ -80,7 +81,10 @@ static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLO=
SEST(pll_video0_clk, "pll-vid
> >>  						297000000,	/* frac rate 1 */
> >>  						BIT(31),	/* gate */
> >>  						BIT(28),	/* lock */
> >> -						CLK_SET_RATE_UNGATE);
> >> +						CLK_SET_RATE_UNGATE,
> >> +						CCU_FEATURE_FRACTIONAL |
> >> +						CCU_FEATURE_CLOSEST_RATE,
> >
> > Above flags are unrelated change, put them in new patch if needed.
>=20
> You might notice that I am using a new macro for initializing the
> pll_video0_clk struct:
> New: SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO
> Old: SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSEST
>=20
> Setting the two CCU_FEATURE flags is part of the old initialization
> macro.
>=20
> I'll add SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_NM_RATIO_CLOSEST which
> hopefully resolves the confusion.

I'm in doubt if we need so many macros. How many users of these macro we'll=
 have?
I see that R40 SoC would also need same ratio limits, but other that that, =
none?

Best regards,
Jernej

>=20
> Thanks,
>   Frank
>=20
> >
> > Best regards,
> > Jernej
> >
> >> +						8, 25);		/* min/max nm ratio */
> >>
> >>  static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_ve_clk, "pll-ve",
> >>  					"osc24M", 0x018,
> >>
> >>
>=20




