Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C1311C04
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 15:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927351; cv=none; b=eB9vH80w1y15kXiBfkrqK0h6EzZb0yYLAbCLHicF1s4dExSv3DofTlhcM9kmnDSiBJ9Jv4d1QI6eGTV1AEreYqkiJ/24Fo9sPPqC1AQQt4srycIZIgYyU8rc+Xt4Jh9NvPxprhqD5a/0xx6PUuyP43fRFj+vZFbWyZlX5dtf91E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927351; c=relaxed/simple;
	bh=jghzTGNsqqz1rFTmtewT7ZFfl8qUI2KPWVgKNn2kQxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fL+8cziuLHp3S4CuF50swrxQItImxQa22mATJyIc0nFsdqrSdQPfhrHDKpvS1jBvC0w89Dh33QBl7eaezcuDrTeAzphkGRb/sEYP1U3AUeQCLjf4JSuuiquI/XV1HdE9aS/dbQ6GIxLBdIZRcfGeztm3TrmqVomWQVu+ySQOVaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2OT3Oyp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2OT3Oyp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-458bc3ce3beso27560985e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927348; x=1755532148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaN/aMxeAvic2TkFt9SUzJa/+Zp0mhELgjX9980aLdI=;
        b=L2OT3OypM8iqh/DMnYQOXLQGhsPZZdDe0ZcLzfeE6OWKPe/O2w3HUjwTp062ANfUIR
         9rJHppYHWuIbNZuleffqaET8hYXFz+5GGfkBA0L0ym12cSBRk16Joq4fathIDymSMWgk
         OeG1AA8W67/lg6djWLQ/xXj/+7IW6g/hdhoeyQBehB/5DlKEFBPaHDWeirRedxdP4TLq
         LWyIghbq1JeBfghjHgZZ1b+FzyYnSbrewmXre3v2fas3936jmVeMyRTUqp0+SLQUUHvm
         9RObhD3GrcekTsqwkZL/h8HRhlq9BSL8TNEdeqVNEtITS3TpGFClvevsxSrpdoUtXg7k
         Ds9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927348; x=1755532148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaN/aMxeAvic2TkFt9SUzJa/+Zp0mhELgjX9980aLdI=;
        b=meAHYSDECQae5AAMTEIcINDW5rt+sD1f2099DuOoaB1wpQw8hDlMTKXs6xcovjRsLL
         SRWcgUfb0HVl4VJnCYcSAlLPvgPyig9oH+gUhbkvWAdFZHJZxVMw2Oto8uPWZUBOjP+O
         /q97WM4rPoNl9DTITpkoTx5GkQHH0EQXIeg8s07U9BD1dF5qSC4oELhrNd740tUVGRsm
         EE11/f2HLbhmxgQ1LPeIzzQZB2Ut67VgfA9wdx0wcP6eL0jM2hErENtoIpEW/8nIwrho
         chE6WseLxY31g5IYOg3wAN0HS5K2XQHtaZa4AF2LeuRluwbgOAiu65NrbOFdsyRsbfEM
         TePg==
X-Forwarded-Encrypted: i=1; AJvYcCW5kF6gb70gt8zyAg/6ukkdoN1q6WyERKgLkmo/ZXdvA5TboHuLvZHQfzmMoC8iosjwJaVBHLZcFNVyBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw38+d8/vjt5JNbTat1I2QUZUB0x/zyqhMczaHuACc4k2f23+Xw
	pz357CLwONmuCIRTl5HF8AAptN1WN2Deahp4l90AGLLsmAsC4rp67IMx
X-Gm-Gg: ASbGncsA009+d3dOvVnXE2JdDYw/OilpHXhhSnw5y7EpNTe9SCVVzIl+ADXQEIfNScg
	ByOaB9NE9KcATYUHiuILF3l7eRr0dADGsAKo/eBARyxgSMsYDbpT05pnCch8XneW0Qx/mPMqW0O
	rXN8DBCWXIDP4CHvm7YNZk9cUJk8ehTbzJJPesV+dtsQ61cKsKsACg/S3Kh9UcRgwkDquaGZ50p
	IavMUebvbcqCyeOcMpjQ5jFo0ZhQ6AHCG+x/FfqZTYKEy/wB3XdIjZfuXT4BP9xJkpd3yRuOXAB
	3b59xmxW+5Jk0KjYSbf/gkFfFeodfK0HlnPJSSOlL8kpuXX7l5lHoQ1mcXD2wtHjwbm3e8dXUHn
	9d5jCa63R4rOHq557zXgln/3HS6oHnLin1qVHh9l82jdJNudgs4ZHhhmsm5k2GtYINguST0cZLQ
	==
X-Google-Smtp-Source: AGHT+IF8yaEb0JXZCQAYRhjt9mD68TKy30Kri4hWnVqeLz0qZ3mQZzXGJNEZQEgDX14gMmnLLo7j6Q==
X-Received: by 2002:a05:600c:840f:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-459f4eba76amr117620555e9.8.1754927347309;
        Mon, 11 Aug 2025 08:49:07 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e584302csm280904685e9.7.2025.08.11.08.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:49:06 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Chris Morgan <macromorgan@hotmail.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] sunxi: H616: dram: fix LPDDR3 mode register settings
Date: Mon, 11 Aug 2025 17:49:06 +0200
Message-ID: <7836068.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20250801234918.19176-4-andre.przywara@arm.com>
References:
 <20250801234918.19176-1-andre.przywara@arm.com>
 <20250801234918.19176-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 2. avgust 2025 ob 01:49:18 Srednjeevropski poletni =C4=8Das je =
Andre Przywara napisal(a):
> The JEDEC LPDDR3 spec defines mode register 0 (MR0) as being read-only,
> so there is no point in trying to set its value.
> Also the H616 memory controller encodes the mode register index to be
> written starting from bit 8 in MRCTRL1 (for LPDDR3 and LPDDR4 chips), so
> we need to OR in that number to tell the controller which MR to program.
>=20
> On top of that, the mode registers between DDR3 and LPDDR3 are
> completely different, so writing values crafted for DDR3 into a LPDDR3
> chip is just wrong. Due to the above mentioned bugs the writes for
> MR0-MR2 did not have any effect (as they were all trying to set the
> read-only MR0), so the mode registers just stayed unchanged.

Nice catch! Looking at BSP DRAM code, it only sets MR1, MR2 and MR3.

>=20
> Looking at the LPDDR3 spec and the BSP code, let's write the proper MR
> values into LPDDR3 chips, using the proper addressing mode.

Please explain how you find those values. Are they always set in this way
for all boards using LPDDR3?

Best regards,
Jernej

> Use the opportunity to document the LPDDR3 mode register bits written.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/mach-sunxi/dram_sun50i_h616.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi=
/dram_sun50i_h616.c
> index 877181016f3..3345c9b8e82 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -1078,18 +1078,18 @@ static bool mctl_phy_init(const struct dram_para =
*para,
>  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
>  		break;
>  	case SUNXI_DRAM_TYPE_LPDDR3:
> -		writel(mr0, &mctl_ctl->mrctrl1);
> -		writel(0x800000f0, &mctl_ctl->mrctrl0);
> -		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> -
> -		writel(4, &mctl_ctl->mrctrl1);
> +		/* MR0 is read-only */
> +		/* MR1: nWR=3D14, BL8 */
> +		writel(0x183, &mctl_ctl->mrctrl1);
>  		writel(0x800000f0, &mctl_ctl->mrctrl0);
>  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> =20
> -		writel(mr2, &mctl_ctl->mrctrl1);
> +		/* MR2: no WR leveling, WL set A, use nWR>9, nRL=3D14/nWL=3D8 */
> +		writel(0x21c, &mctl_ctl->mrctrl1);
>  		writel(0x800000f0, &mctl_ctl->mrctrl0);
>  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> =20
> +		/* MR3: 34.3 Ohm pull-up/pull-down resistor */
>  		writel(0x301, &mctl_ctl->mrctrl1);
>  		writel(0x800000f0, &mctl_ctl->mrctrl0);
>  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
>=20




