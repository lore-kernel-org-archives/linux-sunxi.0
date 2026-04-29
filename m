Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B940B6E0
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Apr 2026 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479672; cv=none; b=ThKawojmhvK1DvFwBeV+ThZxquJ17V3waGpFlvS7hJoKVhCvtLaXhb6Z7s++YVuZhM01DnjSt6kGuSmgrYy92FNHMsb7JWhgVPZ4L/XLKD2YP1h8jyfALCKSUdeyER3Sz/wYu8WF8ACeey1wLXMMKlUnWLYp9rvptN6Qksh6ZYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479672; c=relaxed/simple;
	bh=vImslMwyXcASfDEei180MXXimfMtSB52kRlkM75F8jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGfN7bwfClH0BubfwpzhPkFGyXl6OkSG3yoXIF13aHe0f+oM2odl18e5YTFRn78cAA2N603+R1FPuD3PD667At9qjQlfhmMsKwlACuvvjUYc85VaxU8iVp1RGtcfv7pE+Myw/iiAcK1bPH4LVxe+aV6u2tNm0taBb2Qh/SpsP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvaUbguP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvaUbguP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44509921fbcso2298098f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Apr 2026 09:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777479657; x=1778084457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vImslMwyXcASfDEei180MXXimfMtSB52kRlkM75F8jo=;
        b=cvaUbguPUVq+5tk1NQYCrEGlyHGRZADfX1z/xhV2Q/R0nA2/Xg+cxMDLMXGqVaUcmm
         E9Qoe7rvtuyipj8LsrtHd1QkPOSeuOPjN0hoOFPDFRjHe+lLcswEb//o7nJzQUv97kGR
         Ytu/KbswVilbABPesFV7j8iDyZ74St88cVh0xQwUu0p23hJII7ScTrr0Pe6G8ZfrX5NB
         LMoT17Txkg4W4zZPpcepGHFvPA2rXlPV7UPjONDL2FT/kCxylgpgJ6t5EyR+tkvnbtW+
         xf3Hgl7C2nO5b0BS5fWf+h2eiIXBHC3bctM08L9b/79RxSWj6aaRM73klgzn5MaoS/MN
         BjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479657; x=1778084457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vImslMwyXcASfDEei180MXXimfMtSB52kRlkM75F8jo=;
        b=eAcTY0Ov8+iM1eIn21prnGxVMfaVZA9/wPITWpkGud8NgYzKIUV6IHGsqmD78jgHDK
         Ch+RFg+ePwKXo47DR4/l28ePwgrGxpR2SnezMJdBx5ItCoerRZz2OTmb2GoNI5mLgxU+
         6T4B6KuyXNRTdKaiwRjpInpuFbFFgbtvja7q5lOch7cOS5VoHcW/KhTbnQ4qgeLko6ah
         BU9cOnk+RN1fy9IQjqe/a0h3IGGaJjjiGn/7je2jmCFuY7GLQTDXkLdFuT48rZzQn9MH
         kHz+yV7hFI8w75LZGBjXZcXy65n/BDbHPspoqDwOlzH2Hq2O0mcViY3lzclFnb4E1Oao
         ubRw==
X-Gm-Message-State: AOJu0YwqqphkJ6pD4n7Gskwax3ksBEE3yJtdExoiL7fa2xftJadxEDdo
	8wabN3EX0v+Ss5vuX/khr0l1LKGgkIApDnwW2j+pn4CZEynlCpvdJG4/
X-Gm-Gg: AeBDietxoLmrp8lMR1hm4z4MvgR23z70/9ruNN6f6djjQvO1Vu7s4JNwrTVPeiFS8ge
	ZESXxOWf9QYQlKpvE5LyNgsglPvlIsK+incQbS/XkjxdDvAVCqoOgYi3exrDGY1ZSRZjGbjWOTq
	o9fP7uiG+hvaXy+qSvDkGeyg1y7BYNr3zxJFu8DJkXWs5BLUXrjlJhsxdfH7BweYOAnXym/6DQL
	H1Yt/hdp4Ak0GI852RVQ43U2uOma5Tabkj0zKVI0YMsZqPH4BeKtHGWykTFDHBmYUOu4cfzXr35
	XkaZ2ixP7KOJr9E31xsZ1L27hZi/PY74Ami6rJvQiVbgiVlSyKSrkZhd5oys3Fp2EnN9YJVMJVd
	jadnhMGTroR0joyPV9vW9KQbEqZuWl5futZAUSu/H750wLMIhFXzfxZDNFEi1AxP1ecp2BfyD2r
	hHOsqeKPZ7SEkW92Tfdl/BzfmlRBBj9cgXBtXoResnlNcGnvISO0ut5fNBZIn/4HlWBw==
X-Received: by 2002:a05:6000:178b:b0:43d:1bf6:30f2 with SMTP id ffacd0b85a97d-4479009bb44mr8106156f8f.20.1777479656792;
        Wed, 29 Apr 2026 09:20:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217c56sm6742489f8f.20.2026.04.29.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:20:56 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Yixun Lan <dlan@gentoo.org>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH] spi: sunxi: wait for TX/RX fifo reset done
Date: Wed, 29 Apr 2026 18:20:54 +0200
Message-ID: <aWjBFp42SZOUo6dm7CAJWA@gmail.com>
In-Reply-To: <20260421-02-spi-fifo-reset-v1-1-e2cdd4bd474d@gentoo.org>
References: <20260421-02-spi-fifo-reset-v1-1-e2cdd4bd474d@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 21. april 2026 ob 06:47:50 Srednjeevropski poletni =C4=8Das je Y=
ixun Lan napisal(a):
> Once reset SPI TX or RX fifo, the underlying hardware need to take
> some time to actually settle down, the two bits will automatically
> clear to 0, so use a poll mechanism to check status bits to make sure
> it's done correctly.
>=20
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> On Cubie A7A board which using A733 SoC, we encoutered a SPI nor flash
> timeout issue, it turns out that the SPI fifo reset take a few time to
> settle down, Add a loop to poll the status.
>=20
> This was the error message shows on A7A board once this issue happened.
>=20
> =3D> sf probe
> ERROR: sun4i_spi: Timeout transferring data
> Failed to initialize SPI flash at 0:0 (error -2)

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


