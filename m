Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326146;
	b=zdOKHC+l2dZbwxuly2++HsuPpERmn9s4r2etlSPi2TWUYWIRQOkghrcCqDmwqGZS0c7f
	 QXAB8hwrWG/c6ClMkVYCCWUO5O0ZYvPVpkPovCVMws03LWkgZP9MXLy2ltHA3bLjA+rPP
	 VXRm9xdNLIXz1TyOKkk3XYsmO/1nF0C/+cnw/4+GarG6oBKzc2di1pWep5m9/7vDuVClT
	 166Sya5cRoxE38KDfjYV4+tJGLPQRbzmf7cpqQuZAlYaJUrrhkDvqbX/++xfi4c8yCk2/
	 6sZeqrda725LgQyk5zKDm6je0aC/yswVPXPgZj44qydf7gOYMq70DEdUA/PRjYXH6FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
	b=c1GJCBcZZG5/bBJdEszYQAU/l/BqmIY9P8WoqCR2kQzETQCTtOMek1YeSqfXODv4aCaq
	 Drkm3rBNZfw4atNWX6pPyJY597Bn1dQgY188RgfQzNhVahIl/9htbiLxtJmxQSjkP0Udu
	 uu0dU+U1rMfR4bNPkPlZkI7GoDiYOvS7e/KnAN9ljFdnWy0HibysPmY6bp6znRkQrxZ+U
	 e4B6eg+iJvNC4XuZpolb0v6BMzXW4kUI/AZXDacP9pqdWgu3V31m1fgtKWvt/I8kXVcdb
	 86dVX2Rad2UhODHaT3Cj4ezzgmi22GWP+YdefFUAoWVZZ26RErD10jrDYCQx7xuBZhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfFYFC60;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5C160A2600
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 15:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5C160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfFYFC60
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so19837195e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326144; x=1794930944; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
        b=sfFYFC60jtA+Oo2DLYqaE0M1OC/uv6J+o0PAeJgoBRK3zjSw3bFw4Uy60nK4tGj2x8
         7YBnCC7xJQJFYo2dwkdyZFpoW3IcuHl/Vyfs4m0vli1yqZv8qH7nOrMgBWx1PyYvceAs
         5hQCIVTypraCIy+AJORuO0C1dl9VmD0YhrQWXu922JG1zJA2uQQhLf8RXcDiJGWU14De
         qoBZTbdkiHIsKrTv4lW5GLQ1FVDfFCXwoDqht1/i8px47eIWDKlhUgjf0L7JJWGk5wzP
         XtWWe96ZRf+44b4SOpXtLOcDQ7Xp9WKyvYyaBsKpvtJ06+HscAd+sl+DgX4l4Y+hc9/d
         v6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326144; x=1794930944;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
        b=1B5THq0zr6zLea0YUEnbAxRMKbrcXvdwBhscnWQgV8euRrc/4QFkXI8MZN2na5cEil
         1sReO0lHm7UFbuuqszFJz0+DQsPJsGsi+3dRKxuNo6gGU5Uf0KJ01gotFeOqVeraK2cA
         AGTZ9a3ax6Fd/kQP0QcKIGbaTzlAvge4apT1NvUzcoQEFQ3PwhpxVlMrehee1QPyPZ7G
         E1aP22VHc93tGl34rtSYG7upd3kiH33TlCl7LH5XeiTWG+6K4rESCkfqf6WDd3IFfXqA
         Mfxpde93SDaV2qBx8XnStL/8STKvvmHX6zpFeAjX5L4u1gDyP4RTdLKZs+8XpkXTZT6C
         k6nA==
X-Forwarded-Encrypted: i=1; AL+hErGsdpZKfeVklvFPYrv0cHBD6yRewqlsKa8cHdvSrCSBliYO0noa8c9A6WMdICIdwbvewTRPYe6/f4iyHw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+6YowADWSvcfEk3QP8Y1A6N9sOTsR9dUqjmd9jZiDZvj9Dd0k/
	XlEjjEZ0NkDmW4KCcbcRXATQSyOODr8guHcqWn4X+ELUxocLnuM3/1R9
X-Gm-Gg: AYBFou3vi65oYFiM9VC8Vnm+6xGHe9qE0xAulAQMIpQsyJIgKfLrowfh+QAgi5VfUiL
	T47RGowpZ8Fj22guXHhWKzXWXo/f4bs83aEg4TMFuBU/dRmhfWlVWt9pakuEDYbPRRiO0cvNgL+
	LwuqaTJrCzgim8ODm/5/9t2JpYa022djdVzyWizwYv6XkD3Xs9lYSUjfn9rwMD5KAcvctqshMfA
	IXYCFhvRPkUcdAGC67aTUr61+Jxef86WSTPrynwmMg9UMS5VUkzSV8g46HTjpVlvECmHKzPRTDV
	xn3CbyHuWJX3p30iLgPgyCH49gVFKfLkL5M7H2ykWivhXF4CliHtaZ+b0ydvvCOssz2y4dvSRgU
	GSj0S4tAFcYgDFPw7pMB9nw4aAF439J1qtny6doX2Doc01w9IHQMvuOqGiTY4W7LQcn0su80brh
	io7d2gwB/b6Tm8QMQmzlMKmuNP0WkVygZDIUYszqxd+p3O64xkUJcMsJTgmIL3BsgmyQVWhnRvz
	EZIFlnPPu5W2HlDc23iHphtT0Z4VUJztoqOvxFN2EoGoVQspbXbjo3gnwTy+sbSLSdbraAne5JL
	lFhbmAPBesiTmyVNiw1UiudIwLwsLhga4GJxB3xYve3JFFkNYone8gpswc2/5hPzqtbPyBJImLV
	C3op23Q96pLStVtmwCJu7XzuQDnt6oOUhMZ+zPJtxFo1eVnnj4mDuM5W0S60VJFJ/MB8a9/R85P
	Iiz17ED6jhVAFUIhX6dXc52Y8tK3JSVnr6R3CQIp2TNlpaPm8RuYFsxAiyVsf4AckXFLjbHNH1g
	gBPu3GQD3gf5eCscsXJQQMhl0RPLKejTbpZe6zsGnDU55ZLhJw3Ug==
X-Received: by 2002:a05:600c:c4a3:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ba02308542mr51845065e9.2.1794326144134;
        Tue, 10 Nov 2026 07:55:44 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm73237085e9.2.2026.11.10.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:55:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject:
 Re: [PATCH 2/2] clk: sunxi-ng: h616: Let the S/PDIF clock set the audio PLL
 rate
Date: Tue, 10 Nov 2026 16:55:41 +0100
Message-ID: <ThOkLORdSauix4Mt72r-lQ@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-2-e5e36e8963e4@gmail.com>
References:
 <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
 <20261110-h616-clk-emac-spdif-v1-2-e5e36e8963e4@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 10. november 2026 ob 07:03:01 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> sun4i-spdif asks for 22.5792 or 24.576 MHz on the S/PDIF (OWA) module
> clock, depending on the sample rate family. The spdif clock has no
> CLK_SET_RATE_PARENT, so it can only divide down the rate pll-audio
> already runs at. Unless another audio device has already set the PLL for
> the right family, the power-of-two divider rounds down and the request
> succeeds at a wrong rate: about 12.3 MHz from the reset PLL value, so
> 48 kHz content is sent at about 24 kHz.
>=20
> Propagate rate changes to the parent, like the audio codec clocks
> already do. This is the same change as the one just applied for the H6
> [1].
>=20
> Link: https://lore.kernel.org/all/20261104185027.883011-1-jernej.skrabec@=
gmail.com/ [1]

There is no need to link to H6 patch. It's clear that patch is needed.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 C=
CU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index d2625fec651a..f703d690a563 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -529,7 +529,7 @@ static struct ccu_div spdif_clk =3D {
>  		.hw.init	=3D CLK_HW_INIT_PARENTS("spdif",
>  						      audio_parents,
>  						      &ccu_div_ops,
> -						      0),
> +						      CLK_SET_RATE_PARENT),
>  	},
>  };
> =20
>=20
>=20




