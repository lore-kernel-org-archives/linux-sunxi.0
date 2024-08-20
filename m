Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B759E2E3FE
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Aug 2024 03:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724125071; cv=none; b=XiW1aSq/Ojk0suGRiBQjj53+jOHfe+fIzBVyGdldzgQ2s+Sl1GdZHxveNnzHFzx0SCsYfwzgTfCLLZTR8e8ZY3LaLBWg2roEzZH65Hk8p9uuqQDUgpIrKdqf/XE0cChXf4lqb9MhL7ucXGI9tN3KnOBxu6XiOxQPkwtTQFu3a7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724125071; c=relaxed/simple;
	bh=Rt3PQpGwr0OrGnVMdnb4y8XjWOV8CrCp5TrgGCBQqkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6q0hcR3dSOGQwrFvnou00nMKwpFWJytdXFmNd8fsIg0qbuqqQs/ZBhxWx6+pVHmk/IsujIOb1mx0sRwCnlOYpXZKfrEe81eMy3jhx7l8bcJZGaRI+ApLIYW/KxCkM9tW/uel4ZWF2kdopXhIZfFnL2IXiqrlcw9zxnOMdFlQCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-530e062217eso6686271e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 20:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724125064; x=1724729864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PjZJNDLPpu1pUqlpHfBE30HIhjstanAnmmTUSnp6UOI=;
        b=W21mn1ZRyw2D90FNXkaWuDfN0qI/5jWrZlFJ5W5nDsr+5kBL/WmIpBGg7Vg/tmz07P
         Yh9TPei8ujyo08cMGpuv24Iq0f1dCu6ioOlujj8bP3yHqJ7oONFkwMpPwxdnNMMwNgqH
         JAUR4Tz39vkjwQQ4z5V+yOHpnmHY7ZsiDA4S0YuZWBrm5fsr56utTjpCA8RP6zTltPgA
         X2PXa8HDd1SOUG7jLnnLUt9/Ncw/fwyg4azoDcV6PYs56TiuyYSvJ/4deEq1QyFUbL0f
         TcpA6pioVn0l/mEot6fDjmx3dzIjO2CsQ2C8WKtBMDqBR6VXWKvhoynKiZOeppjnzoFa
         15Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXZhS1OUX4pjzvrEgvLNCZYRVL3G8f/OGbxdGDWViEB9Nd4L+nzx5TpGnz8nhVDpoGlFIlHXcrfVB7IoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzK/fOQYYzcPxfCmOd1LLvBeXYTz5p2Hj7chvsnXJEY00uXCWlX
	unAOfvOJlu17Ez8y63I4HJ0JLgz/J0IJBA8w8hlpnCOxJsBJkRVlgBFZH9u1
X-Google-Smtp-Source: AGHT+IE1exUcNnrhvc3RjmURUwTvwVeRWAQfndStBFzoSh/SnEJh63TYV1PICwOvnZlTznBTDlM5xA==
X-Received: by 2002:a05:6512:ac3:b0:52c:d6a1:5734 with SMTP id 2adb3069b0e04-5331c6a1e50mr8767799e87.14.1724125063476;
        Mon, 19 Aug 2024 20:37:43 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3b9094sm1672690e87.78.2024.08.19.20.37.43
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 20:37:43 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f3ea86377aso2957651fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 20:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVp7Y6FMPLacCiMaD1zCM2P7iFesB+SWNmuDbU51XuUWePsLjyolEg7/Xn4uja3gswz9AwO1D/MjQ6yvg==@lists.linux.dev
X-Received: by 2002:a2e:812:0:b0:2f3:abca:8b0f with SMTP id
 38308e7fff4ca-2f3be5b168amr78827001fa.27.1724125063104; Mon, 19 Aug 2024
 20:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a17e0df64c5b976b47f19c5a29c02759cd9e5b8c.1723427375.git.dsimic@manjaro.org>
 <24406e36f6facd93e798113303e22925b0a2dcc1.camel@icenowy.me> <25b65e9ef1cae59a8366532cc8db576b@manjaro.org>
In-Reply-To: <25b65e9ef1cae59a8366532cc8db576b@manjaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 20 Aug 2024 11:37:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v64aQAkqj1OR55HVyrVU=uNrH70fx+jOaT0SBMHBzCFgRQ@mail.gmail.com>
Message-ID: <CAGb2v64aQAkqj1OR55HVyrVU=uNrH70fx+jOaT0SBMHBzCFgRQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Add GPU thermal trips to the SoC
 dtsi for A64
To: Dragan Simic <dsimic@manjaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, linux-sunxi@lists.linux.dev, jernej.skrabec@gmail.com, 
	samuel@sholland.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, wenst@chromium.org, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 10:46=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Icenowy,
>
> On 2024-08-12 04:40, Icenowy Zheng wrote:
> > =E5=9C=A8 2024-08-12=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 04:00 +0200=EF=
=BC=8CDragan Simic=E5=86=99=E9=81=93=EF=BC=9A
> >> Add thermal trips for the two GPU thermal sensors found in the
> >> Allwinner A64.
> >> There's only one GPU OPP defined since the commit 1428f0c19f9c
> >> ("arm64: dts:
> >> allwinner: a64: Run GPU at 432 MHz"), so defining only the critical
> >> thermal
> >> trips makes sense for the A64's two GPU thermal zones.
> >>
> >> Having these critical thermal trips defined ensures that no hot spots
> >> develop
> >> inside the SoC die that exceed the maximum junction temperature.
> >> That might
> >> have been possible before, although quite unlikely, because the CPU
> >> and GPU
> >> portions of the SoC are packed closely inside the SoC, so the
> >> overheating GPU
> >> would inevitably result in the heat soaking into the CPU portion of
> >> the SoC,
> >> causing the CPU thermal sensor to return high readings and trigger
> >> the CPU
> >> critical thermal trips.  However, it's better not to rely on the heat
> >> soak
> >> and have the critical GPU thermal trips properly defined instead.
> >>
> >> While there, remove a few spotted comments that are rather redundant,
> >> because
> >> it's pretty much obvious what units are used in those places.
> >
> > This should be another individual patch, I think.
>
> Perhaps, which I already thought about, but it might also be best
> to simply drop the removal of those redundant comments entirely.
> Let's also see what will other people say.
>
> >> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> >> ---
> >>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 22 ++++++++++++++---
> >> --
> >>  1 file changed, 16 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> index e868ca5ae753..bc5d3a2e6c98 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> @@ -212,7 +212,6 @@ timer {
> >>
> >>         thermal-zones {
> >>                 cpu_thermal: cpu0-thermal {
> >> -                       /* milliseconds */
> >
> > The unit of a 0 isn't not so obvious I think, so I suggest to keep
> > this.
>
> Quite frankly, I think it should be obvious to anyone tackling
> the thermal zones and trips.

Sorry for the late reply.

Not everyone writing or editing the DT would be fully familiar with
all the bindings. As Icenowy mentioned, it's not even obvious when
the existing value is zero. I would prefer we keep them.

ChenYu

> >>                         polling-delay-passive =3D <0>;
> >>                         polling-delay =3D <0>;
> >>                         thermal-sensors =3D <&ths 0>;
> >> @@ -236,40 +235,51 @@ map1 {
> >>
> >>                         trips {
> >>                                 cpu_alert0: cpu-alert0 {
> >> -                                       /* milliCelsius */
> >>                                         temperature =3D <75000>;
> >>                                         hysteresis =3D <2000>;
> >>                                         type =3D "passive";
> >>                                 };
> >>
> >>                                 cpu_alert1: cpu-alert1 {
> >> -                                       /* milliCelsius */
> >>                                         temperature =3D <90000>;
> >>                                         hysteresis =3D <2000>;
> >>                                         type =3D "hot";
> >>                                 };
> >>
> >>                                 cpu_crit: cpu-crit {
> >> -                                       /* milliCelsius */
> >>                                         temperature =3D <110000>;
> >>                                         hysteresis =3D <2000>;
> >>                                         type =3D "critical";
> >>                                 };
> >>                         };
> >>                 };
> >>
> >>                 gpu0_thermal: gpu0-thermal {
> >> -                       /* milliseconds */
> >>                         polling-delay-passive =3D <0>;
> >>                         polling-delay =3D <0>;
> >>                         thermal-sensors =3D <&ths 1>;
> >> +
> >> +                       trips {
> >> +                               gpu0_crit: gpu0-crit {
> >> +                                       temperature =3D <110000>;
> >> +                                       hysteresis =3D <2000>;
> >> +                                       type =3D "critical";
> >> +                               };
> >> +                       };
> >>                 };
> >>
> >>                 gpu1_thermal: gpu1-thermal {
> >> -                       /* milliseconds */
> >>                         polling-delay-passive =3D <0>;
> >>                         polling-delay =3D <0>;
> >>                         thermal-sensors =3D <&ths 2>;
> >> +
> >> +                       trips {
> >> +                               gpu1_crit: gpu1-crit {
> >> +                                       temperature =3D <110000>;
> >> +                                       hysteresis =3D <2000>;
> >> +                                       type =3D "critical";
> >> +                               };
> >> +                       };
> >>                 };
> >>         };
> >>
