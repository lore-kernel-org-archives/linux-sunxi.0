Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC2F199FAC
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763302144; cv=none; b=qfbDPYCXhpqfy3rwtTVl3Axj/CC/JksdpagPld1cP0Gbkvw3rth3AgGUJfyuL0Q9nbEyEqhN3UzVE+JPzDRdCFrL8X05U+u2tqyro1ehB16gLN45n3srqu1e+3PljSJKSUIq8QxgUZoLDusVUOUfEAds75gaT7ZGjqXVzJTate8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763302144; c=relaxed/simple;
	bh=6z2t3fnQ7xiPY0tvUjdQLsEvcN5HAqfOnKKPIwC09Ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHSuiB9eVHy70fGq0pQ5Xe+sGfQ4knNRiJmJxiTCgawT44AieWDPoFPU/ycFG32eusYFbdIP5DTIuOlzup35jpNVrOTgmPWYc7tYxy/pQ5s2Be21cFpRv/Iw4lhTpoJFU/D/5gep0gm5J8akBxEcwn81eHwr4ZgqrfDnAIEPZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59578e38613so3659241e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 06:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763302140; x=1763906940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1P5GUNQOH0XPCOyCgZr+gwsMYMYyLhVYsxtxGdPiZx4=;
        b=fCELCsz8aaH7n7FF+niMm+Lahot8+hYDh5BFSajySqNfe3I9Nj+u7AoRawPtrKebE1
         ojvOKZt5D+uIQjnRO9LyDV8E3wb27oqliCv9mWbTP5QYntV36PoPHobwEp+JCt7FVeRd
         A4GMqoxJlFp5wQidcO1CXrCnjFxaTGTqb0/ZmnA71TiALZVeW9NPOm5Tda34Y4xYLcSC
         oVeW1a6fydp8cvVCj4W7u9tbjbzXZCYEofwHfV8S4iO/web1MzMrj6OV0q12XrZ+D8Vi
         hT0Poaar0lR9LjA2E3OMBu1B7G5oqM3V4e/sJYeog6ToHcXHoEilo6gUizP8/iowEdgT
         Z4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVDLb1ZC9KiCKpSObOsowtB7y04v7xHIT+7nL+jkfNJcwaQxgBGHDm0K7HrYXWPwA1MKd+Fgwa8uy/OJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn5pYU9b3YK+Q3vfRcSbNkv8zB8k7W9E7Ekja275Ov9ulrEYEW
	typp4+3N9PIB6h08uhPyp7o9bT3AUqPr12ACn2vs3oLDm4uJDFFANxYgpOj90v43VBI=
X-Gm-Gg: ASbGncs+B9BWYjWtJ0tTvF65FY1j/hCdogR7YGW2NnjWsK8bz4BP+AAFu9MG5u+nxuE
	UnHwxiVJhi97Ekp8NogdlRf7HnFrcVFTosX0DqiezNkRXHKIQT2QU4SrhW6xiZtx2LJsuWLdAdi
	hG22mHTuJOPPcpf+xc3O/QuZKW+N4kXS0bIryaGdJVB13XVLYMlo71aWUCWk/1TAZJ740dKwaE2
	/eCrnuPJZKa8DHawB9AaM9xJ+BNYfyv5tQqx/F3GW9XfIGOtq/Ssq43PjxsKEj6o3B10Kj4j+Va
	0CRhfH8fl3ielgZrp2sTyZi2RIhG96tcvINL79QJsFwgXc0gZ7YGwRZ6nof28H27jpUlPReFySh
	sixfR3oLde4XXFzWxS1QVCuAuN0EEOlSWgkZHuT5J0YNQTJpP+ge8AgLplfL0yx5gGtj/tdzGUq
	0yUJFlG2kspETYpJo8hgPQ6b8AK+Bf
X-Google-Smtp-Source: AGHT+IG8PgNhYKvtlQOITYJq+ZyFti8FqvpbDEJdd+/XzyxTndYwpnvpLU0ILOs2u2G0NOcxNBU3Ow==
X-Received: by 2002:a05:6512:118a:b0:592:f521:188a with SMTP id 2adb3069b0e04-5958421907dmr3215127e87.49.1763302139299;
        Sun, 16 Nov 2025 06:08:59 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803aca3csm2430368e87.5.2025.11.16.06.08.59
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 06:08:59 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59581e32163so3130937e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 06:08:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxuDqLxsVEHOOcVACv92A7DT79WufLVASj2pboZ/ZCGixg7GV+t5mi4Us1eITEaBvzMiAzV0yWV+WHPA==@lists.linux.dev
X-Received: by 2002:a05:651c:440f:10b0:37b:9e27:89f with SMTP id
 38308e7fff4ca-37babd73323mr19895421fa.37.1763301811739; Sun, 16 Nov 2025
 06:03:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl> <20251116134609.447043-1-kuba@szczodrzynski.pl>
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Nov 2025 22:03:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
X-Gm-Features: AWmQ_bnVpj5bkGX3ksszDMr19xhbiJNyazuPC_F2JRblaiVwkcXftIdoMcMBl8Q
Message-ID: <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 9:46=E2=80=AFPM Kuba Szczodrzy=C5=84ski
<kuba@szczodrzynski.pl> wrote:
>
> [replying to v1 to keep the same series on Patchwork]

That is not the right way to do it.

If you reply to an old series, the tooling does not pickup the new version
as a separate series.

ChenYu

> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
> PD0..PD9 pins are used for either DSI or LVDS.
>
> Other than having to use the combo D-PHY, LVDS output is configured in
> the same way as on older chips.
>
> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
> is then configured by the LCD TCON, which allows connecting a
> single-link LVDS display panel.
>
> Changes in v2/v3:
> - Applied code formatting changes from review comments
> - Changed "dphy" to "combo-phy"
> - Made the LVDS setup/teardown functions abort early in case of error
>   (adding a proper return value would require changes in several levels
>    of caller functions; perhaps could be done in a separate patch)
> - Added the PHY properties to DT bindings
> - Renamed lvds0_pins to lcd_lvds0_pins
> - Rebased on top of drm/misc/kernel/for-linux-next
> - Hopefully corrected the incomplete patch list of v2, which happened
>   due to an SMTP error
>
> Kuba Szczodrzy=C5=84ski (6):
>   phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
>   drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
>   drm/sun4i: Enable LVDS output on sun20i D1s/T113
>   dt-bindings: display: sun4i: Add D1s/T113 combo D-PHY bindings
>   riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
>   riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
>
>  .../display/allwinner,sun4i-a10-tcon.yaml     |  6 ++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 11 +++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            | 50 +++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 70 ++++++++++++++++++-
>  5 files changed, 141 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>
