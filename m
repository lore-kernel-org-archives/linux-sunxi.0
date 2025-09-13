Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB02550CA
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757763105; cv=none; b=rg0SEldaiXLDiz5oK2iSyAeEpgIMrwEYlf5zhLlJmfFxW3BNrrOR2G+bzdsMJ+TZedY0xy26S8VKeGGertAK6c9Fm/GkJOk1AnMhF1CKn9XxXX3aHPfMF23kyCWIVor0nFSvK4ee003gpEfCaCZPhtKeBUU8zktGNmj8uTipToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757763105; c=relaxed/simple;
	bh=Pd7LXL3e3fziuQtA+gIdsuKsBHrZf8/dR473MaUf6HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PdkxdS83r0vJpVJt25dNMdVtO32zmF6YRPx5XZ8+PLiD8AWuYxdkuv8BKFaCc5D/oJhUwU9h2rQgU0qKg7JoU4nBxAZ0T/tlPB0Y28MVoPCHLWo+kfYI3BPID1zZZtPl3HVAhYUfeGY1A2Vl7thz1vWSukgY3q/jZ8gjdp8Kwfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuXuHzYs; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuXuHzYs"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-623720201fdso5471033a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 04:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757763103; x=1758367903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhiOMZzJmlK07q9Yx4eHe//JB/+U6zF5S8d+vjc7i3g=;
        b=NuXuHzYsD+e5OX6sN6D6KLWv2ioAgKLou00aH0+6MRUvguKiJBbZn8H+Ars7uCD/im
         xQilyXMUtG+MUgMC4Ms/xems/dXExeHywdY9GDGE+NuAak2GQm0SY5n7/mxJz3e8Z+dq
         dkxXdQ/PT6l6CDdfqWkF11HhGQhcvcgwbmLlToxQ5X6DGCjjeUE1sHOvawO6KD2loTcs
         EwRcsjmHFuSYxJAkxOdm1pmLRFzke2GLKpklRgVjNBHA52V2Q3hwGjbVeHKMRIkh2Hx4
         l4z/IeUAUUAoUa8Wt9cbIhhSp/uUqi0szHsi8RapnXEFmMaYuNeU/+vH17vE8tYUbNjn
         5xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757763103; x=1758367903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhiOMZzJmlK07q9Yx4eHe//JB/+U6zF5S8d+vjc7i3g=;
        b=SgJfoxPGCK+vIlQrB8kNtSxAk+ZcbQ2l/rjT2lm62Dj3L2eeLKG8YA15v/21iTuiDZ
         E3r94qgb/Hi2ZKDyop4WyODRRjE/cB2QB0u/B1jk7JXkTcMSnSpkKycxEiQlTpS+2+DD
         8EEep+fHiwjXWldXwu4iRxAXfBQy1iZD0ugWs6yhsebqpxpP6hvC9TwNPTx9tteDRbVH
         9jKXVdCNDCSsgZ/OAXazTfREG0FabigTudmuaQYsXib0d3HIEE4qxeNn6ULzebCuEDQq
         sBuTxViIW2vKAAc6NIvBg8bMmqQfVv9LlKYcJm/FJtjIVQjnQBDcMagt0/6nwqOh7BSg
         S1SA==
X-Gm-Message-State: AOJu0Ywtlm3d9/9h2zTjKSOspa/gPhrmGXv4XK+2HXv74evWVArFHDov
	MyMo20DwHRhDpo0yb1k0cZdFb1x22RVzhmnFFxxY5r8lvKvXAP9XTgx0
X-Gm-Gg: ASbGncv/eIGqsM1EuK+zVTk98o0pmeZL+RJsTPxRstt5Ex8y9tmpMZ05wU93vMXS4bK
	nn2ag2aim0iExggFWQQX7bLJtwoGw9u7YdtHNasr/hE4ZwVAdTc/36+TkkCbb8OlDbszdjX+E77
	PfF4zZ9fv8SPc6WJXJ9fBeB7dsH52wWIiX+QQklo4YskcBLOX4QfzjQfKwpg+jhxNY5uhxr2X0a
	lm2OpHvtJItN/MjJRMVCxrKB6QvgQyZ3gRulPowb4P7trdHo9lVlZT9kqAHgy8dsp/by5im2Fte
	T2U0NHtT6oFDZ/0ucMA2bNV5WwPprTtdL6DSY9lBzuqponOVuF60bsXMYcRltUF8OlaaujDCoeU
	uq/kFE1np7OGcxdiy43WHUSxM6EgxV+gEQFsOIdkbrtgO2C2+vYm+CoixL6NcrAc9cA==
X-Google-Smtp-Source: AGHT+IHykb2wro/3EPEKGFRhfZdxz0R+s5067Brp4xRx1L5hET4V9Jhz88T1kD9l7Nn6Y1hOSTS1Sw==
X-Received: by 2002:a05:6402:5204:b0:62d:b1c9:f0ca with SMTP id 4fb4d7f45d1cf-62ed80c9f05mr6124659a12.3.1757763102637;
        Sat, 13 Sep 2025 04:31:42 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f136cead7sm825431a12.36.2025.09.13.04.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:31:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 3/3] arm64: dts: allwinner: t527: orangepi-4a: hook up external
 32k crystal
Date: Sat, 13 Sep 2025 13:31:40 +0200
Message-ID: <5009461.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20250913102450.3935943-3-wens@kernel.org>
References:
 <20250913102450.3935943-1-wens@kernel.org>
 <20250913102450.3935943-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. september 2025 ob 12:24:50 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> When the board was added, its external 32.768 KHz crystal was described
> but not hooked up correctly. This meant the device had to fall back to
> the SoC's internal oscillator or divide a 32 KHz clock from the main
> oscillator, neither of which are accurate for the RTC. As a result the
> RTC clock will drift badly.
>=20
> Hook the crystal up to the RTC block and request the correct clock rate.
>=20
> Fixes: de713ccb9934 ("arm64: dts: allwinner: t527: Add OrangePi 4A board")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> index fb5311a46c2e..f71860db83d3 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -393,6 +393,14 @@ &r_pio {
>  	vcc-pm-supply =3D <&reg_bldo2>;
>  };
> =20
> +&rtc {
> +	clocks =3D <&r_ccu CLK_BUS_R_RTC>, <&osc24M>,
> +		 <&r_ccu CLK_R_AHB>, <&ext_osc32k>;
> +	clock-names =3D "bus", "hosc", "ahb", "ext-osc32k";
> +	assigned-clocks =3D <&rtc CLK_OSC32K>;
> +	assigned-clock-rates =3D <32768>;
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_pb_pins>;
>=20




