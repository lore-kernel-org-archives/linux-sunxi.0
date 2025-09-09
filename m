Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D50625A32E
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 17:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757439671; cv=none; b=LtVeCJ++y1jS+jo3VYc1gvyZBlBsB/3eD9CauWrZSsYaQQxnrKngiHL/eUmBMVh+MOlUWdeq1k5Cy0/YZeGvn7ybONZxWOoNbQ84IScoLPsilkvz599n9tWm3E7ydDuTcfNgznvTp7ErutV+K523/i3T5/CbH3tdOLbuui64XjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757439671; c=relaxed/simple;
	bh=iMqzuo60ZLuJFOqTZIOoW/WODE7m+60kgAFLvDECvRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZMuEjg56QI8rqc/ZoejXfAt2V0mBIFLtxVmMJFYvTjEJDQQCMxhgjJefGxh/hEzpPr75Qk6EMW//H9hl1h4tK9CnL6gi+sguTmEmZBwCtQwp8FcXBOAx73Rh3nCaPN2D3BQQAkWeMUC0sW8NXIZHQHr9X8aMrtQc1vZe4Gw2Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBMl0+Vf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBMl0+Vf"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso4527920f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757439668; x=1758044468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ry5FSpI7dPZc6Kq1cRRqL+tbhUwVxII5JV+3rpol5sI=;
        b=fBMl0+Vf8SPmYKKjysv8GpnypUiOK42LseBUt+LXhHePkULLRokNeucWfGkUPb7cKx
         mLkZdf4PrqTkmm0kc4epUmPaK7yUgb7Yq8Vt8PWSMf4A3G7ApC1lOLLB3dXu7t2hE/+p
         G5+m8XNKzkZj3PWOdQevm/UpL8pxxvgvDrjWHs1mNG59uAin7f/Rh5yAAUYG0atFojq/
         acjfsPrjv52/fffHHVqxhgaqE1arvv/rl8gArlGQ1ZdOh/48RTe13h4hLWehxXmKL07M
         r9U5J18mYbj6vBmWpKndSJ73fAp8UGy2n9lTdnqDjGID3a/0K/pe0Swhy6XaKqzvhzVp
         aVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757439668; x=1758044468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ry5FSpI7dPZc6Kq1cRRqL+tbhUwVxII5JV+3rpol5sI=;
        b=fQLSVDtyUelvHdFL/vlE2UmytUmG0XIr+/xSLYJotJYnFFoz2yAoOcGlXuOCWPZTjJ
         krXDseB90a9vg5AV0HuA+z0L2Y74T+trAutM4jyCSvH6hBkamJPrcAqqfPavyczLgiZd
         cckS992xQ6/CoeQk/WIRKVfLkur/lT5mV1KIkjBXpOL4Zo/c7OZ5TFhXpr2jhHZfCeTx
         hEesa5A2n3CfG0HdqWdfK08GdqGAs7PtZO2AKHBO5xSWbyyPrYsWCsNMlE64yVdbb/73
         vbJBEwYi1QtmX7AQho7P9t60se7q5AYvxZRC/UAmm2GFDIETxILS1BZ3tUInI2ZtnlnO
         BMjw==
X-Gm-Message-State: AOJu0Yw7pNUF0G7yluqXexH/XHu8QGADNvQhXPqkbWFuQNtI0JTF/6Ga
	MxhhthEDlyASJDYRPJmtM9haanZbBmDdtgG0N9pt9aTsHdxbFy4AdVAi
X-Gm-Gg: ASbGnctLUMEdjkn6KTMUVJ7yt9pc7dLTikNncagVQ+0VEg7qXVXVxCKMAKLdWJ8gdIR
	6fPlXCv6PKTrMlw7q1/C4TRdJmmBlRjYyJ6/+9MEx0FvWYSO0C1flcDbH/z+VteIVvausNJJP2u
	M3Yy96ULhi1F1MKmSDcwGRDHn1dCMAuKQFY+f0UleuFu/gyYefPxRkEx/75xtpbWTL0u/kww+nl
	Him+2fFzcJADZznG8R4iBRkxLPJNpLX2HRrRhK0tHSAqujTZx2JT/MTE/a8M30zUyqUZVyyt2M7
	HIRYqisPHALLWFIiDPpbFPMR+nry1MMqn6vc5+smPXggSDzRESXZlocfbEN/3o1c9t2dsFVmrR9
	8cGlzW0KOwnDmwRWj9C17dBrMXH0xGn5unrA84eGUveO55PAcxtmZFs2rk9yNjo0WVbX1WoNQ7A
	TWW1irmTVYWQyu19RZ+wY=
X-Google-Smtp-Source: AGHT+IG2uQ4FJ9P3y+p4jrZc5L4f0i9TvG505+l+khrDgQ8Fx5vRm9E1UHocXbYiO2BBq31vpy9atw==
X-Received: by 2002:a05:6000:2383:b0:3e7:438e:cddb with SMTP id ffacd0b85a97d-3e7438ed1c0mr10407637f8f.45.1757439668124;
        Tue, 09 Sep 2025 10:41:08 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm3366103f8f.60.2025.09.09.10.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 10:41:07 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun6i-rtc: Add A523 specifics
Date: Tue, 09 Sep 2025 19:41:06 +0200
Message-ID: <6189783.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20250909170947.2221611-1-wens@kernel.org>
References: <20250909170947.2221611-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 9. september 2025 ob 19:09:47 Srednjeevropski poletni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523's RTC block is backward compatible with the R329's, but it also
> has a calibration function for its internal oscillator, which would
> allow it to provide a clock rate closer to the desired 32.768 KHz. This
> is useful on the Radxa Cubie A5E, which does not have an external 32.768
> KHz crystal.
>=20
> Add new compatible-specific data for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/=
ccu-sun6i-rtc.c
> index 0536e880b80f..f6bfeba009e8 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -325,6 +325,13 @@ static const struct sun6i_rtc_match_data sun50i_r329=
_rtc_ccu_data =3D {
>  	.osc32k_fanout_nparents	=3D ARRAY_SIZE(sun50i_r329_osc32k_fanout_parent=
s),
>  };
> =20
> +static const struct sun6i_rtc_match_data sun55i_a523_rtc_ccu_data =3D {
> +	.have_ext_osc32k	=3D true,
> +	.have_iosc_calibration	=3D true,
> +	.osc32k_fanout_parents	=3D sun50i_r329_osc32k_fanout_parents,
> +	.osc32k_fanout_nparents	=3D ARRAY_SIZE(sun50i_r329_osc32k_fanout_parent=
s),
> +};
> +
>  static const struct of_device_id sun6i_rtc_ccu_match[] =3D {
>  	{
>  		.compatible	=3D "allwinner,sun50i-h616-rtc",
> @@ -334,6 +341,10 @@ static const struct of_device_id sun6i_rtc_ccu_match=
[] =3D {
>  		.compatible	=3D "allwinner,sun50i-r329-rtc",
>  		.data		=3D &sun50i_r329_rtc_ccu_data,
>  	},
> +	{
> +		.compatible	=3D "allwinner,sun55i-a523-rtc",
> +		.data		=3D &sun55i_a523_rtc_ccu_data,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
>=20




