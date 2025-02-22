Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483382063F5
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740217719; cv=none; b=TH8zRH1lJJA5x71E8n8IhIFk96R/jpgOkhGEAeRxd3L6B12ysqqoRzEil8JRvRSR/8L1db7Rzw3eMTsUeSfhhl2Ri1bUAHkcyTPvS07E/KicxUDRUkB15rq39C8muYy4NKy+QeN9QqyGwGvKRarquQWduCXyyOF6PD2jSc0SQRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740217719; c=relaxed/simple;
	bh=ztSqARlpjqYzwMSasyTQ+otEfFsPH2w9nVNI61+VeH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f5aFqUd+aqDOXrZ8Hj/KMaIfTK4YyFAi85JdXHOc8fvKQRnNEaA9w31mvlfTwCNpNLjp4Mgd4s4vAA74KYK02/MddmqpyVTBRyboC2rpMOa2Urln5u41fC1G+aykVu/HHNcudDlZyuGAFaQcZ+VwBGIbIBQeeToiSe8xibYYBDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biYfTKOR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biYfTKOR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso14634255e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 01:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740217715; x=1740822515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odi1efTWWEwIVG7IaIikJsL9BAzjMuppltEZzw/Hk9k=;
        b=biYfTKOR9oBYMl22Ybzvg/aLchJHSD+wbu+cdw+fNA2LwfHhnV3JlaQ2X9GNbyhklL
         ZrwEp0AIszNSH17a8TVskyuGW2EebXN3VYwFLuyTZI4QVg/kbvPg6IWKUBSl/LcEdDIE
         kFT2qh7If3HkECsryXBZub9Pj8zXKNY6zPvLhe926ptQOdF/wS2+aVIogyOJYKz+swmW
         4vEPKjCUfC5rygV+4IUBd78iObKr6AE2oy37MvUsytYRRcJ34+EheOQ1M3MEmi8IcwMS
         c6BNsP5LSvyPHZrQ+ZZRylI+XRU8+MV8aazu93+4E1u44qJ9qvrhb6Ulf8LarHXU5S0i
         rkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740217715; x=1740822515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odi1efTWWEwIVG7IaIikJsL9BAzjMuppltEZzw/Hk9k=;
        b=jmf17tNejBEcHs2syezLqxbx2Nm5c6qQqTOQhvAjFqG3VywziXdvL/XfA1NUOoqiVv
         0SRSZAyHftIhWhZ20bTMme3OA3sSyvVqdsdXDxFIOyNIZLPUw5RxESSULTRfa32l2/7j
         fIBOt/SJnefMpZ10gqIPy6D6PMDgKG4w+t62Am35vgWOqRvRfbwqF9PQ9vTgXGH0FnJ6
         sZYQwGmS/41nS9QsnmV+CW/1tjZ4X4cVBpkR202VJrLLwGJ1YIWEFMm2oimRtYeXy3JE
         i6Q8mS3z6E8EhpfwtHIH6SsmFSHS2CyTy92KN8/Sv4Mrt3fE7AdosO3Rpo5LyvrNwjzu
         W3yw==
X-Forwarded-Encrypted: i=1; AJvYcCW2lY5oopLQBB2J5ocepibmzJE9Lpz4a0nyuN7gnh7nDPn6zzMc4C4qo4Z6/uYB+fp1ekiCjhCVY0Vj/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuN/g8sJY2ARRRlBQh0RX94nNuyIvkfNj9DvNG2DpoMirmsFUd
	SEV4BuzpiIjfjiujhS0G1NDeC7YtKSeg6sGvxuRltHh2UDu411f+iNiqFiyN
X-Gm-Gg: ASbGncvaEWQlETGYMu5loWVVJ4JNi81yoJsvVjWn/bQiPqD4pAL6pLJxqCrNvdbILlC
	qJpSyncoVBCc11asxCGdMVCMRlexZmR6LDpHqHvYejSmPOcGwfG4C6bYBB18OMnRnF2KqXnGaz7
	U2PsNmuBKvov5k4rvXhT8B9Tvsya590ghbK7f3hf2lU4xiCxw8eZg8UkwT2KswXqXIJqKRQhDiH
	eXy/FPtdBHE5nCK7T5sggasTZq9UOTj83dDaAet7tvOFAZsEOlAUyvQvg1Kumt/ly13zu9MKBpr
	N316MQw3D7EAxdwZVpAjbqJ/CkRVkTe27zaq0wil3rw8rfB/UlB2c+zigAHeTrRW4/t65iW4HDy
	mNQ==
X-Google-Smtp-Source: AGHT+IFUTa70+9kLfcm5J6KugqNrq5ylrSHEHWyLg2k4fxiZqzwuPYhX/x3EnpJl6rQ7Cmu+/YYJkw==
X-Received: by 2002:a05:6000:1f83:b0:38c:5bfa:a93d with SMTP id ffacd0b85a97d-38f70772c98mr5722741f8f.10.1740217715291;
        Sat, 22 Feb 2025 01:48:35 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25914171sm26137034f8f.53.2025.02.22.01.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:48:34 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH 6/8] arm64: dts: allwinner: h616: add LCD,
 LVDS and PWM pins
Date: Sat, 22 Feb 2025 10:48:33 +0100
Message-ID: <4407188.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20250216092827.15444-7-ryan@testtoast.com>
References:
 <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-7-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 16. februar 2025 ob 10:27:13 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The Allwinner H616 (and its H618, H700 and T507 package variants with
> the same die) have 28 video output pins for RGB/SPI and LVDS display.
> These are in GPIO Bank D and are multiplexed.
>=20
> In RGB mode, pins PD0-PD23 are for 24-bit RGB pixel output, pins
> PD24-PD27 are for clock, DE, HSYNC and VSYNC, and PD28 is a PWM
> backlight control.
>=20
> In LVDS mode, pins PD0-PD9 are for LVDS0 and LVDS1, and can be
> configured by the H616 display engine for either one high-resolution
> (dual link) or two low resolution displays.
>=20
> Add device tree nodes for the LCD, LVDS0, LVDS1 and PWM pins.

Let's just drop PWM pins. PWM support is not yet implemented and it doesn't
fall into display themed patch anyway.

Best regards,
Jernej

>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> [ryan@testtoast.com: add RGB, LVDS1 and PWM pin assignments]
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index 242bac95840f8..806ad87705abc 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -322,6 +322,32 @@ ir_rx_pin: ir-rx-pin {
>  				function =3D "ir_rx";
>  			};
> =20
> +			/omit-if-no-ref/
> +			lcd0_rgb888_pins: lcd0-rgb888-pins {
> +				pins =3D "PD0", "PD1", "PD2", "PD3",
> +				       "PD4", "PD5", "PD6", "PD7",
> +				       "PD8", "PD9", "PD10", "PD11",
> +				       "PD12", "PD13", "PD14", "PD15",
> +				       "PD16", "PD17", "PD18", "PD19",
> +				       "PD20", "PD21", "PD22", "PD23",
> +				       "PD24", "PD25", "PD26", "PD27";
> +				function =3D "lcd0";
> +			};
> +
> +			/omit-if-no-ref/
> +			lvds0_pins: lvds0-pins {
> +				pins =3D "PD0", "PD1", "PD2", "PD3", "PD4",
> +				       "PD5", "PD6", "PD7", "PD8", "PD9";
> +				function =3D "lvds0";
> +			};
> +
> +			/omit-if-no-ref/
> +			lvds1_pins: lvds1-pins {
> +				pins =3D "PD10", "PD11", "PD12", "PD13", "PD14",
> +				       "PD15", "PD16", "PD17", "PD18", "PD19";
> +				function =3D "lvds1";
> +			};
> +
>  			mmc0_pins: mmc0-pins {
>  				pins =3D "PF0", "PF1", "PF2", "PF3",
>  				       "PF4", "PF5";
> @@ -348,6 +374,12 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
> =20
> +			/omit-if-no-ref/
> +			pwm0_pin: pwm0-pin {
> +				pins =3D "PD28";
> +				function =3D "pwm0";
> +			};
> +
>  			/omit-if-no-ref/
>  			spi0_pins: spi0-pins {
>  				pins =3D "PC0", "PC2", "PC4";
>=20




