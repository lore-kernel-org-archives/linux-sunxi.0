Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327076;
	b=rvhTc9ui1o7KddANT3j4BbzgvpbP2sYhWdpz4ZMZykoRLkpoZp41t6heTg2kjg19Fm+9
	 fnj/KUinLN8NHbdGUXVw4eGcRGMXotkgmm3Ah5SeWGCYiYnc/MSFQZeXxe2PHW76TxCne
	 F8/3oY+yIJDqMrDAwjOI/Dprc+Xai1jvdgTg+atesTjEWqDr/2qqLKi4PPlqZBPCI7khg
	 LmJ7GhUEtDHQCuLJSBW9tWKZ6f+u7gUCxIhRfoTfNIYTWbxx5F0jtxjx6eZMh1P7UhT2C
	 2fqAM8nYleUt9Y/gE4f7yCeEsmMBAgGSSDYiRIj5rI4OrVizDBwD5Vz/EUOqSyftG6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
	b=IAmLazaUL4z9vIcOtmE2fdu/kuswNkI1aWefEL92wZxxbhYOSmJ07uXABfiITv4HR3le
	 0y/lI7r2dbTKEZt/+Nh9DV4UiFRhc3uijC5MTvi1zenWuMb9R+Fh8uH7YaqQI7rPYQ4f4
	 vjKywTZtza+VVz8BwFOHKukFZ7/vjyhMehlvn4px3bns4o6NtbNLgmOHA3R0I5nD8O8Y0
	 ihCwg+6e9gCN6huJpfng5m1f0HKOJUwd7MjvrUI581/fm1AhBEV+SjqJQhPm7KFAN4tL4
	 zXUpbMq63+90TI2Xs5maplsyfsxP/IP/31XL+9g6ehCJwg1hdIR0S0fL6UAWPMnXWzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X5tHWA8G;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7958F606D7AF
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 16:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7958F606D7AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X5tHWA8G
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c504bfd7393so140099766b.0
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 08:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327075; x=1794931875; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
        b=X5tHWA8GJ2E9ldyERtYGe99G7V1QocsXMyfIdRb62q3UIeAvbfUdO+Q41wJOOotCXP
         DyhZ3Ox32tUsiqekfSJEm4S9F8/2DD4dgcR3vca0MwzVsvMi6epw5XzSq0r5ebHIQyk+
         Euwkgg5VZI7EwvYS4R4aW5rYtc8zOfHtxLhFxEngy95xSDIXiz7RBbTqMO6dLO6K6TJY
         XUbdGCcn7eWUW52CFMXzkGeo8tJ7J31uaZMljlO5X+lBUKV3gGIs7r2rBShw6FavHPtt
         9YJQD9id+G5dFSBRjDlMjotAWp+PAaxDG+GbAo1dZWKcPRpjBvPECE0/mRY1cxlh74Nk
         SuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327075; x=1794931875;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
        b=UholEZnVjTuImpUxnGYq5/L4DnaML0v+2kJZQGk8b73IUd4hAdXCoC8Q8nAjazrpmd
         E0nQx4L9ZZ0rr5IadHN/o31PwB2OW/Cb+i5k0Szy1Y4gSQDybT76CmGPXPnwc+U+p0JI
         QUax+FAZps88/szBq9DMkKtt6q+ZOZ3xbjd79zybuYiCDnLzlxjSvvABmM2HGRHiJzlC
         CjTV1bhBCjuoi+A2Tk0rZ29hWurwwesxo27m9FIsvbh+Ss/DWfk7ZOQVu6HipP3zrJiM
         8PzT9NYpNoC9geIw6sSsA+LJM0BOudwITJ83wvZGbjXF+jpH78bb5OHWrtuXWo/p6Jw8
         etww==
X-Forwarded-Encrypted: i=1; AL+hErGOaukp9Hjxe9zIRkboEcrwvMmiY7ukIXiNjE8hDNNDDSGg4RjyYG7vXNwDt5r318DFiUfWUITgBfQarw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9q9SVVAPm5t4VbuYXXyQnIGIjQQx9uTD1ECO7cs7Pta6z6G7JI
	+HrAeZilCysWfPu1gPlA3pVs2VfC/GtvuENOBBIvb4bX6ex60ReHzA2h
X-Gm-Gg: AYBFou3o4IAmpUS1g5ZL6o0a92+xsq+ThH9Zhu0y5nUexK2X3/ay06CobKzvLQkk7yU
	swD6nNcwdqwfGkUSECEC90gny4N6wW8hb786J9FciTcXTKlaGCFR/5/9AeeN2qKcVP6MJ2I56L3
	WNAuNYgrXN9IvTQx303lABbm90fTG0Wbsc7ZVgJYq1oe2JMjBBSEwM/HTaTijOAJBl35UhJLgsn
	wstz9yUQWJTHBCu9S9xFusHKeJ29MiknYXaUdcVbw5TSdLXhOB7WvUdRXdtZcK29JJ+5awn/wND
	bKuUCHdA3hjEuK58zmYfW8LXGGYH7Iy7Hga0Yjd0HPyAsebt6yiwvi2X5y2Vur6d5XHteIZFd3I
	9QlFNf2nhfGJYE/8nIx8PuctzQxtXlZVqUnGonI5kerNDl56yPISM9Vqz8kpXRIQvuy3XvneQDc
	+FvtQZaq96THmJRAvwvOFyi18EH5LEoqbmOfzQxYpBy2RpWaKQNKx684ZYFXErh6598ZxUJwreD
	yUXilFagKQdZ4aNzYvaPfN9aQ1SJwNBypWlDHSfGfr2FiltPuKQ/BwfD5Kk9sc9AyeCCEXhXISj
	48+Npitn6iRaHhlRAvpN+9DA5kMUFZ/etB3jNqbO201ilJt1TxYlQOZcdigLeJdi44zqUhrro05
	uX2i+NR0qXiGjzOwaOYzO8WvxW2cgg0SbByQs8+wpZpl0V9TxSp1XhvV6oD4X5F1XV6iCug+WTZ
	rjOA4c5xu4wI2rByMoLUKjNML5J9Zu0FP6pX2G21KCTfLD40nDca6umZxmwdLLPAK2aPuPoK6Ho
	fVMyGLAUScHccIrsl40tAaJUnKC3+AQHN29OOouH/DugPCt5xOJzQpfhxYCI9hq01rLYUSw1duZ
	N7FPJ/Jg
X-Received: by 2002:a17:907:3da8:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c5049540483mr285400966b.23.1794327074616;
        Tue, 10 Nov 2026 08:11:14 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a591485sm127282366b.32.2026.11.10.08.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:11:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c aliases
Date: Tue, 10 Nov 2026 17:11:12 +0100
Message-ID: <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com>
References:
 <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
 <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com>
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

Dne torek, 10. november 2026 ob 06:37:02 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The I2C core numbers adapters after the "i2cN" aliases and hands out
> dynamic numbers, in probe order, to adapters without one. The Orange Pi
> Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
> for the header pins gets whatever number is free when it probes: TWI3
> on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
> changes with the set of enabled buses. The vendor manual and the
> vendor BSP name the buses after the controller.
>=20
> Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
> TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
> changes for buses that stay off.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

NAK.=20

Extension connector is not covered by board DT. Use overlays
if you want to use them.

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++++=
++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index d5d39bac5915..98fc83291dc8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -12,6 +12,15 @@
>  / {
>  	model =3D "OrangePi Zero2";
>  	compatible =3D "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
> +
> +	aliases {
> +		i2c0 =3D &i2c0;
> +		i2c1 =3D &i2c1;
> +		i2c2 =3D &i2c2;
> +		i2c3 =3D &i2c3;
> +		i2c4 =3D &i2c4;
> +		i2c5 =3D &r_i2c;
> +	};
>  };
> =20
>  &cpu0 {
>=20
>=20




