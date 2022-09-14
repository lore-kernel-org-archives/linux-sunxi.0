Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7392F23
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Sep 2022 18:34:52 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id z14-20020a05600c0a0e00b003b486df42a3so7049086wmp.2
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Sep 2022 11:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JsISeLX5mpCpxthlxP4ErXH6DoBjoU0NuzMWeuum25Y=;
        b=b8XJVfQgh6f42h4IZgOyV2auxtNTfJY3Mk7tvhffw5JvkTV1xU/OF/9oVfq+T3vsGw
         7ACWO0CxkPuDOSE95YphAae2xw8NLfOsAVlrOw+rm91jS4inQJllP262nDZdKw86Y2Sb
         FfMkC5eCONnnz405vkcfga5Db6IQmBplsIxluHiSEtctoQjmxaIXPKASB4EPTsBvya9U
         I7TDRD5wRGAwaglR8FLXYj3LmLWZirwBtEIRr1mIbkxmG91CE5V1KBiY0/I4olvPK2ax
         WGVgXBVa6oN5F6HC0jhJzZri8BLPk11xKLDDeKkmFJNmP4No8PR/gpI4CiCsnzyUWO9+
         6ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JsISeLX5mpCpxthlxP4ErXH6DoBjoU0NuzMWeuum25Y=;
        b=OrO7skU4PnAfjRkoH/qlELavrcuTW2DghkpXs6ycyDls1TP2qc9u1S/YciqSOnBtUM
         q6PV8BCFpalHdKAb4n04S8nx/UzGXHCQcT7Z5x0T/BK7y+7UXmew6nJNJZ0xbzsF2hPz
         5DDDhLanW0XYka+AbIUDYoS07bzUi8ReweJERbBytXA+I4X3Ti0zuxUy8ONRUfWFa9wl
         V/Rbz/r7AWlDl/NuJCaCC09ItRLbdMxpVGPpT8WF8f5+VCGCZ3th2HJZvx7VpA8uImA3
         6zsApwiSmJBws3FWf6z9GgX1QLfLK/SSitR+ev9bi89Y+tSh0zc6JKEvBFJUV5vijXFP
         OBPw==
X-Gm-Message-State: ACgBeo3O3MIMZmM82sVEAsztjwoRzZyLT6u3CzZnkukUCrpatHvO/0n2
	qOqpKnvl2/HMGzzbMD04x+c=
X-Google-Smtp-Source: AA6agR6UytNvjwp9AcqLcUEBZZ05NnxYruVwOlvPiNIgw9/oAArA3qxOg8XR4dS2Q4nnZMWmAxFQWw==
X-Received: by 2002:a05:600c:444b:b0:3a6:6b99:2394 with SMTP id v11-20020a05600c444b00b003a66b992394mr4105344wmn.43.1663180490778;
        Wed, 14 Sep 2022 11:34:50 -0700 (PDT)
Received: from jernej-laptop.localnet ([89.100.165.250])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003b483000583sm12313287wmq.48.2022.09.14.11.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 11:34:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1] ARM: dts: sun8i: h3: orangepi-pc: Add CMA reserved memory node
Date: Wed, 14 Sep 2022 20:34:49 +0200
Message-ID: <1826631.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <CAJiuCcefkre611=1UXEkwScN+bYSBhE_ivGzTK7ZMvp-j4MbRQ@mail.gmail.com>
References: <20220914151125.212876-1-dmitry.osipenko@collabora.com> <CAJiuCcefkre611=1UXEkwScN+bYSBhE_ivGzTK7ZMvp-j4MbRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 14. september 2022 ob 17:33:27 CEST je Cl=E9ment P=E9ron napisal=
(a):
> Hi Dmitry,
>=20
> On Wed, 14 Sept 2022 at 17:12, Dmitry Osipenko
>=20
> <dmitry.osipenko@collabora.com> wrote:
> > Add 256MB CMA node to the Orange Pi PC board. This fixes memory allocat=
ion
> > failures for Cedrus video decoder on trying to play a 1080p video with
> > gstreamer.
> >=20
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> >=20
> >  arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> > b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts index
> > b96e015f54ee..e655346a9fb4 100644
> > --- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> > +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> > @@ -60,6 +60,20 @@ chosen {
> >=20
> >                 stdout-path =3D "serial0:115200n8";
> >        =20
> >         };
> >=20
> > +       reserved-memory {
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <1>;
> > +               ranges;
> > +
> > +               linux,cma@40000000 {
> > +                       compatible =3D "shared-dma-pool";
> > +                       alloc-ranges =3D <0x40000000 0x40000000>;
> > +                       size =3D <0x10000000>; /* 256MiB */
> > +                       linux,cma-default;
> > +                       reusable;
> > +               };
> > +       };
> > +
>=20
> This change seems legit for all H3 boards and could be moved to the H3 dt=
si,
> no?

That's true. However, there is a reason why this node doesn't exist. One or=
=20
two H2+ boards (which use H3 dtsi) have only 256 MiB of RAM, so this can't=
=20
work with them. A few H3 boards have 512 MiB of RAM, so you eat basically h=
alf=20
of the RAM with that. Additionally, contrary to A20 and similar SoCs, which=
=20
have such node, Cedrus can address whole RAM, so this is not strictly neede=
d.=20
It's better to leave this decision to distribution. Some don't care about=20
Cedrus and some do a lot. Default size can be set via kernel config and it =
can=20
be overriden by kernel argument if necessary.

Best regards,
Jernej

>=20
> Regards,
> Clement
>=20
> >         connector {
> >        =20
> >                 compatible =3D "hdmi-connector";
> >                 type =3D "a";
> >=20
> > --
> > 2.37.3




