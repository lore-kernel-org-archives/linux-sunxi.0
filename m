Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6688B23C4
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Sep 2022 19:06:22 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id e18so6696458edj.3
        for <linux-sunxi@lists.linux.dev>; Sat, 03 Sep 2022 12:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=PgXAoEjaK+oBqIHlUNSsVz+XYAWaT4gNl9Cw4DlvWvk=;
        b=nZdmq14cxKphnBHlXGOFXuqbYhrcbVOU4VintRpC40x9LLWper3dLsYcLp5ygtBhn9
         tKiqtuw0oIevYBzRZx9G8S4jS5IeoJ0EpFRDJvS/N4GExmNsdo6DOMQOrcxOk6AU5hSl
         99G1p6i3mpTRjH0dE9tMWHGUPCnsDC4G/6n9cr7x5UvXoRXwxCOtLfFWSfqSyqCg+Px5
         niF+CkffW/D/oI/fRDxM+amUYVmv8VNkbd4z9yZNgbEyRAKalQS+iJ155EC99xyhqHdX
         d8sKL0CtzjMhR3zGYMQ1P1rhS9AnBYAXZYdYq4HsEU0TX8mip5bOkTqRpQdEPX4EPniM
         Notg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PgXAoEjaK+oBqIHlUNSsVz+XYAWaT4gNl9Cw4DlvWvk=;
        b=OcdSQUQlTbBE+5iYvXONN6kvNYJLHUJp0gL4qEXwUVixx/UwKXZq/TDHeW5dW4YgWl
         K/Nn1ZiWUJbKv21mpavd2b8TCOwRKkAiyMRMWa7+wJ2qS57+nnMxKasQJiqI9oElrD/I
         XVp5OR33SEu+kOfINx0tNdibSo+UE2JYDPYyB6KkxxCadQwMv8rXWdKmf5ZLKNkjpeiN
         1l6E2A4znnLEsvW/s4VzZEpfCoRqBJ5A29UlaNY9l4ZayuECj5NNow0yjYZJpGVMgNT9
         wfdW+X8tJwQsORclqXZoHcGk8LVYFanQ1vK5yICO8unCSHL+4X1CWz4/XpdpSw0aY+Iq
         ZSaA==
X-Gm-Message-State: ACgBeo2B0VbqNxKbvMaHuwFFWuQ9mYXZo9eNS0mjeCMUTS50WTvANyvY
	FrY+6jEht7BVXb6wlXbyIFMLqycufI8BbeqgOVY=
X-Google-Smtp-Source: AA6agR6tzif0PTLPRjrJRC9n3NDsx1UfOC1EJTRL9N+BQ1uPNw79YC5jgfZkorGBMCmrSqeEBuuzrKuZ9NMh6JiQIfY=
X-Received: by 2002:a05:6402:11d0:b0:448:89ff:88f0 with SMTP id
 j16-20020a05640211d000b0044889ff88f0mr23202839edw.166.1662231980416; Sat, 03
 Sep 2022 12:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220821173051.155038-1-peron.clem@gmail.com> <20220821173051.155038-5-peron.clem@gmail.com>
 <0c028109-bb50-fbaa-de18-9876706a7477@sholland.org> <CAJiuCcf7NuXFFLw6-RFcyZPNFPagfSB5aR7rY5528USzNB-iKg@mail.gmail.com>
In-Reply-To: <CAJiuCcf7NuXFFLw6-RFcyZPNFPagfSB5aR7rY5528USzNB-iKg@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 3 Sep 2022 21:06:08 +0200
Message-ID: <CAJiuCcf0io5T=+Ap8io2uKn+CNqrCi2pbaCtyq2PVW=bEqKakg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: beelink-gs1: Enable GPU OPP
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Sat, 3 Sept 2022 at 20:41, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> Hi Samuel,
>
> On Tue, 23 Aug 2022 at 05:07, Samuel Holland <samuel@sholland.org> wrote:
> >
> > On 8/21/22 12:30 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > > Enable GPU OPP table for Beelink GS1
> > >
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts =
b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > > index 6249e9e02928..20fc0584d1c6 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > > @@ -5,6 +5,7 @@
> > >
> > >  #include "sun50i-h6.dtsi"
> > >  #include "sun50i-h6-cpu-opp.dtsi"
> > > +#include "sun50i-h6-gpu-opp.dtsi"
> > >
> > >  #include <dt-bindings/gpio/gpio.h>
> > >
> > > @@ -261,6 +262,7 @@ reg_dcdca: dcdca {
> > >                       };
> > >
> > >                       reg_dcdcc: dcdcc {
> > > +                             regulator-always-on;
> >
> > Why is this necessary? This file already has:
>
> This is a relica from the first serie at this time the OPP doesn't
> properly enable the regulator it's now fixed since:
> https://patchwork.kernel.org/project/linux-pm/patch/81eb2efeeed1556d12406=
5252f32777838a6d850.1589528491.git.viresh.kumar@linaro.org/
>
> I will drop it.

After retesting it, it seems to still no take the regulator and make
my board hang... :(

[   17.698597] sun8i-dw-hdmi 6000000.hdmi: registered DesignWare HDMI
I2C bus driver
[   17.708475] sun4i-drm display-engine: bound 6000000.hdmi (ops
sun8i_dw_hdmi_ops [sun8i_drm_hdmi])
[   17.718350] [drm] Initialized sun4i-drm 1.0.0 20150629 for
display-engine on minor 1
[   17.877443] Console: switching to colour frame buffer device 320x90
[   17.936050] sun4i-drm display-engine: [drm] fb0: sun4i-drmdrmfb
frame buffer device
[   17.961881] platform 5200000.usb: deferred probe pending
>>>> [   31.710731] vdd-gpu: disabling <<<<<




>
> Thanks for the review.
> Regards,
> Clement
>
>
>
>
> >
> > &gpu {
> >         mali-supply =3D <&reg_dcdcc>;
> >         status =3D "okay";
> > };
> >
> > So there is a consumer for this regulator.
> >
> > Regards,
> > Samuel
> >
> > >                               regulator-enable-ramp-delay =3D <32000>=
;
> > >                               regulator-min-microvolt =3D <810000>;
> > >                               regulator-max-microvolt =3D <1080000>;
> > >
> >
