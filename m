Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66046AEE2
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998220; cv=none; b=lL9e/MDvNrP9V18u+bH13f29KXvFI/N32ztikIn9mOb68pHGjHfuiGHlKXPmqyv+QbdAFbIW9dUPIm3188DNvDry6Dlizyd4W0PVfE3R/EMM3niZBxlelUxpc45YBV0uF99EIr4os+kLaYONHf7V/TOfxKax6YPQgKgiVd14sCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998220; c=relaxed/simple;
	bh=anPUf+K1f/VrCDMAp1BHNbEjgRlzyjFTp1BJcYqY0fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LY+enudrLD2Wg2u1seTY2nR1rEu/CxeKBFroDjg4i1Os2peYtZaoupxMxRNjWWn5ewm6Vz2rtTPIa2UbXOOafwjKkYXuwAsvJPmhmQGVx0CttJC/epwMLVpFb0FkE2qc6dnuY4ssXUVFh3juSKcnUMxq5/FO4pZ2w59UkCpR32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcf1etw0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcf1etw0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d77f60944so3553903f8f.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777998217; x=1778603017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApEyVbHibMfUXEFKd8vG2mJSusEJJaisfPMffm8l//c=;
        b=gcf1etw0rKHE1mKhRyGN4t3/xjoAWZzuV7gZbw90JfgNp6oRZTVdWOyy/rZuE17bse
         H43sK6ZFP9+4DfFqvr17m8nRuFdWVu+Vzebqg2psKWB5Pg7g6lt4+YpJexZlIDKkyHRs
         363K1jtw/PWwFmlv+lpRqmMpdcaAqhzb/OFRqUbT5zxP/84QkQq8uLtjUNTaXcDPW/AU
         EiwByAqG85FDewVolCg43puEXSAe9OspAjvbnFOhMgKhQJWpZJk1B9pbzWrpC5SmzvrZ
         cvH0DRyb8IikLKCHorjKjWp8Y7TIOQscU/FWvc3lLQBRFAXvmtMW3JsJTab7gVIx6yo1
         Vn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998217; x=1778603017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ApEyVbHibMfUXEFKd8vG2mJSusEJJaisfPMffm8l//c=;
        b=YzFuJoCSba8Vd4q1sE1sKrVxhpdaAQyLNqm9PBJ7LyHwkmeNTPyDnmZ2cM4jA6dSo2
         Y+pQaHhY+liVDxrtUZ/yj/asMuUwaNvuthFznGxy9a8KlYHS9vwmKf0KkI/UzR2/k/qh
         lTGrtnKNvmbS7OcxliIX2/w89uEiZtFeT7Hjvzze96W9xoiOHkxk4aEzv7WITaA5lePu
         haBIY/AlWv/aGAH2Ohv5WV4RK2vnENVOXzhucyieEQsVXqJi4ellHZrtxZymFqtWViP0
         rQCe/W0n+Bh88Tm68TYC4ZO0EQ3wZOrLVYCeR+DB18n4pAAmG3aCQVKcnCHfCYTbTyy2
         05kw==
X-Forwarded-Encrypted: i=1; AFNElJ86XsNL5uDH0CnMWJdQ0DgdwuoGsARZjMmpCW6ytEYTGqT9EmDGYszrmjGe1tt0GXJahXZLDb0wfjlPbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyniYU9rviVEWZCf27w7MLtydgrZv0wC62wyD4zLjvu1yPtfbhf
	KatFkjLO8pPUootig2AVTR3v3C3XDhM7YgbeJRq8x8H/EtctIYJ6KzX8
X-Gm-Gg: AeBDietZzDxJCYPkkenWzvAD2cbLUg4+mxzJeI5dx6bNoyd31KW1wQufXn6GhSvEMsh
	Vi1aGdJtf5f3CH8WSX2GgffmV6/gC4jHq5m+/4MRc6y6nbTIuzrftjEXdyIuO18xO9Sf70+N32Y
	QyOzXaqdMpvqHdnZGRmwNgr9Oe2HsySZgem6NwUTptHgPck9VRHC64CkDrxo8gW6p06Gj4hzrmF
	j99Zjf15UiXkonz/GyteKIto100MXVvsNeY8xU4UsSenH376eydGKovQCLQ69WnlHIqUW7v8cwN
	yQzgCCBo1VJzqJBbe298DUiIGmalUnu8OAuPhxePv4HrMuuaPggPj079WU2Ssddk2TnpZasm760
	MaafxCAo4CnYhoWckX2zfivFvrKG8CX4W8JmnQzQIfO6ojgp8ysktSUonWrrZLCZU5xKAbjvuaT
	796isMlJHojh06MFFrxCbBabmLiuJuNa+kpQA0Dok6ZPTGv2sXrG+Ef0ou85TWlIpOmMW9NWyr/
	R22yBvtUQXk31nEhVRkSu0QR0x/
X-Received: by 2002:a5d:5d8a:0:b0:44a:2555:f8a9 with SMTP id ffacd0b85a97d-44bb3c94c11mr24734377f8f.10.1777998216446;
        Tue, 05 May 2026 09:23:36 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm5934939f8f.21.2026.05.05.09.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:23:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH v2] arm: dts: allwinner: t113s: enable watchdog for reboot
Date: Tue, 05 May 2026 18:23:33 +0200
Message-ID: <sv5CLRHyTX2Cm45r4DQahA@gmail.com>
In-Reply-To:
 <20260425-t113-mangopi-reboot-hang-v2-1-fd343207a4be@mmpsystems.pl>
References:
 <20260425-t113-mangopi-reboot-hang-v2-1-fd343207a4be@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 25. april 2026 ob 10:19:40 Srednjeevropski poletni =C4=8Das je =
Michal Piekos napisal(a):
> Reboot hangs on T113s boards because no restart handler is
> available.
>=20
> Enable the SoC watchdog whose driver registers a restart handler.
>=20
> Tested on MangoPi MQ-R T113s.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> Changes in v2:
> - Moved watchdog enablement to SoC level dts following Jernej's
>   suggestion
> - Link to v1: https://lore.kernel.org/r/20260412-t113-mangopi-reboot-hang=
=2Dv1-1-5002cfa6e0cc@mmpsystems.pl
> ---
>  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot=
/dts/allwinner/sun8i-t113s.dtsi
> index 424f4a2487e2..d3bbed84eedb 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> @@ -34,6 +34,12 @@ cpu1: cpu@1 {
>  		};
>  	};
> =20
> +	soc {
> +		wdt {
> +			status =3D "okay";
> +		};
> +	};
> +
>  	gic: interrupt-controller@1c81000 {
>  		compatible =3D "arm,gic-400";
>  		reg =3D <0x03021000 0x1000>,
>

=46ollowing, at the end of the file should work:

&wdt {
	status =3D "okay";
};

Best regards,
Jernej


