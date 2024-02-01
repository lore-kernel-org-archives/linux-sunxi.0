Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFC85638
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Feb 2024 19:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706817258; cv=none; b=k1hIPl6lsDF5rMnbMb9YCAMsjtBpZPCJMZZST2I1jY+7RcpgvZmRruPGGKbpvAaNH/KZqcNrde9pyGkPxyTiIzsrpFMpiMWJkHmkRW9e1UoGfzxklQp0UEpS764G7uKYeWOhRi+qu4PbL+dXzEQS9CIqYbZrcWn0V7ugiJWOsWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706817258; c=relaxed/simple;
	bh=igWepZJuJ7/NxlfTBcvat+93tyRHyJ7CtS8SToYFt88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWxOMK8+AclYtuBNtnkSWX/lAR5ltEUcN3al6pThct1wTqF9CantLOxJlBAzFarcKVH8YbpdC307ZZPnucB3sSF1UrAYXbIRMTxINk2cRwkvcWIsZZW7PB4vautsLaFsfcv9GMknxyEeBO32z0ql7z7gDDOd1Ia8jpB0RfI6sMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRHmD1vM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRHmD1vM"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33b0e5d1e89so949416f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Feb 2024 11:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706817255; x=1707422055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw0ii54g50YM0TTuIh98HIpGP8lHOO7kLQ/jqdmdMzg=;
        b=NRHmD1vM9vCmzujiJhIcHoo8vaPAB1eubt9vSCpzn0JTDzov834MbpuAgQF+kv1qnP
         tqqcEXBpBNQc+PiUnsYbArrO22lCwMxqWiHZfBTCwOvjs+MZB5rZMYMpWfm7QsgutS4G
         JPcN1lix9t7666Px/Qn6cfx0bTDvqFE1pQsWC8gUMUT6zVbMCDzMuo4Ct6kf1hnxJMOk
         51Jqfmekm/jURKV3z9E/fUYpoKBiVkL8p+MUTUJWKMf+7saJSDuESoD6xeynGHki2pA6
         DYgM7vIuqse2leV3zBZc+LySAbckjQL3oe/lJVelKNjeKVuO5AYNtqlv6GK9k1m8SeZD
         /CFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706817255; x=1707422055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw0ii54g50YM0TTuIh98HIpGP8lHOO7kLQ/jqdmdMzg=;
        b=ZYKQJdR2YHcpdh1mmVhLzMqOlS2/bP3axW9BaoiOqtcPjM0YdgzimIIrshiikbmDOp
         +bT1cyjn3ibOaYYdtbLS5ZbCNNMXOLFe5rAVE718AQc9EflkvOwLN7HDweqOry9NEVpd
         0HMn9xAdCylxMaiU3Fd6W5TcySYlXEEKOzRXn5IZ3UhkdIuzo2wjqkxbtFG5z5eJXulp
         UaLtj3JKhGj0inuWh2WTYLKeUAIiGpvUdTn+KRiXFJIyx1mtbSBfoa3uOdMov7/1Wvem
         pDyBLEFc+P5dSGKe2H1JuMpadEMJOYWxjCBwjRjZt/B0FF7f+ETAX+luUmNQD1BqIZHh
         1Xuw==
X-Gm-Message-State: AOJu0YxGHsbBnQNFb2Uj7LSlEbCd8KqJyoa0RTBfxpH4M9D3XrMRTStF
	U26GkE7LOfJXTsQ1gK1hq8CSl3uApcMryoGPInm9gbYt0MFZbKgV
X-Google-Smtp-Source: AGHT+IEnh5hwCXXTj+jcR1g0I5bM3FN4GQ3RUZkTBdSNXXRnJnKzpnLqx2ztJH2PVqejHm+eHD5rlg==
X-Received: by 2002:adf:f64d:0:b0:33a:ed59:c13f with SMTP id x13-20020adff64d000000b0033aed59c13fmr2215794wrp.53.1706817254477;
        Thu, 01 Feb 2024 11:54:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUkIqDqfPVesemdoaqG1j9jyMLDsyXZci7qdN4rwuZyTnBZy4P9GdwzPQDb4Y97RzDb7Nt0/KTkiYHc51OSLbBILSGHypTjb1PDb72ZoN4kaiS2TT38IIny9hPv2qk7pbyB11bBj5eswJ+oqt6ESrIo8PmhujbvmHrZ92DidVXSYCIjxN1acjdlenKmkXnSfu++c+dj/Av8asn0HmbyqnJOHJwIvOONyMQz7F09oEWk0jsg4Qs3a3TqQFxA5SUAaxlPo2IJXN4OUMn6+DxZIgdQzBM6KWGu35l4Soq52r7+Zd0QERbzokhqf2Tb42N3SFmMLFs+a7yMc+7eTw7Al8QKIOgIa0u0jl1oDEI1AB6rPSle+MxY1/QtbLL8
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net. [82.149.13.182])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d4b0c000000b0033afce63fd0sm211781wrq.53.2024.02.01.11.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 11:54:14 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Aren <aren@peacevolution.org>
Cc: linux-kernel@vger.kernel.org, Miles Alan <m@milesalan.com>,
 Ondrej Jirman <megi@xff.cz>, Chen-Yu Tsai <wens@csie.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 2/4] arm64: dts: sun50i-a64-pinephone: Retain leds state in
 suspend
Date: Thu, 01 Feb 2024 20:54:12 +0100
Message-ID: <10409647.nUPlyArG6x@jernej-laptop>
In-Reply-To: <sbcg74hktwv5x7hookeb4su27xut7swarl3d5mbs3i5cqxtq4g@4evugu43ctiv>
References:
 <20240128204740.2355092-1-aren@peacevolution.org>
 <4892315.31r3eYUQgx@jernej-laptop>
 <sbcg74hktwv5x7hookeb4su27xut7swarl3d5mbs3i5cqxtq4g@4evugu43ctiv>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 01. februar 2024 ob 02:36:46 CET je Aren napisal(a):
> On Tue, Jan 30, 2024 at 08:06:24PM +0100, Jernej =C5=A0krabec wrote:
> > Dne nedelja, 28. januar 2024 ob 21:45:08 CET je Aren Moynihan napisal(a=
):
> > > From: Miles Alan <m@milesalan.com>
> > >=20
> > > Allows user to set a led before entering suspend to know that
> > > the phone is still on (or could be used for notifications etc.)
> > >=20
> > > Signed-off-by: Miles Alan <m@milesalan.com>
> > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > Signed-off-by: Aren Moynihan <aren@peacevolution.org>
> >=20
> > Where is patch 1 and possibly cover letter? Please resend with all patc=
hes.
>=20
> Oops, sorry about that, I'm still getting used to get_maintainer.pl.
> I'll resend this properly when I have time this weekend, until then the
> patch you missed is available at
> https://lore.kernel.org/lkml/20240128204740.2355092-1-aren@peacevolution.=
org/

When sending patch series it's customary to send all patches to all
maintainers and mailing lists (to have a context). In case of large patch
series, you can send only selected patches to each maintainer and mailing
lists, but then send cover letter to all involved and explain general idea
behind the series.

Best regards,
Jernej

>=20
> > However, this particular patch is:
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Thanks
>  - Aren
>=20
> > Best regards,
> > Jernej
> >=20
> > > ---
> > >=20
> > >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi =
b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > > index 87847116ab6d..ad2476ee01e4 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > > @@ -43,18 +43,21 @@ led-0 {
> > >  			function =3D LED_FUNCTION_INDICATOR;
> > >  			color =3D <LED_COLOR_ID_BLUE>;
> > >  			gpios =3D <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
> > > +			retain-state-suspended;
> > >  		};
> > > =20
> > >  		led-1 {
> > >  			function =3D LED_FUNCTION_INDICATOR;
> > >  			color =3D <LED_COLOR_ID_GREEN>;
> > >  			gpios =3D <&pio 3 18 GPIO_ACTIVE_HIGH>; /* PD18 */
> > > +			retain-state-suspended;
> > >  		};
> > > =20
> > >  		led-2 {
> > >  			function =3D LED_FUNCTION_INDICATOR;
> > >  			color =3D <LED_COLOR_ID_RED>;
> > >  			gpios =3D <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
> > > +			retain-state-suspended;
> > >  		};
> > >  	};
> > > =20
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20




