Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E99D23C4
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Sep 2022 18:41:50 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b44so6614518edf.9
        for <linux-sunxi@lists.linux.dev>; Sat, 03 Sep 2022 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=y/fyX7Fgx7pidbZm1EbW1sYH2qqBKD2aPEMgJoc7r7A=;
        b=cKK/oblrAd4xpjnI2tAso16qm9Dx5ZK4cT9a7pOslArAyWGvZQRvP1C+61uKZGqXk0
         ChPwXWrEMKYiQTq5IUIaeVfy0FoC83K/EIqZxIdqHQuY1C+C3J3FbAQt30nvIvJlm5Px
         N56ZDNfNHMvDNvJ/WpHR2Sro4SujJxEZILta2c04tx4IWWRio66XCVXRrHUhADjYrsgV
         3Cx+lmZ3pKqnBvGhIZGIp4Q1m3da4V+loZCcfZhXRR9BdqmogEpQ3nFQVeO8xa8osaTy
         Iu1mgRjIIMfhXeIDFDV/CXGyXgA4zOfkCwXINP1A6Ae0KVVSRKR+9XdjkiXEClxQCgWb
         KsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=y/fyX7Fgx7pidbZm1EbW1sYH2qqBKD2aPEMgJoc7r7A=;
        b=eiA0iSIb42IDF6NOZAf+Qf5fAtWi17FFLZgDFWLjifvEw1OsALNGORo+8vaWxfasK4
         zCzbXmE3kQ/kFhkoiKUN7De+NIihyQtpsu5JdF6gKFLSIQSzEvf3H1/0i2Z3hUqpSXqa
         9CpD6veeYmUdZ2+Q2jaJD+DlZX+0SMMd8zb7QK2rPLgj5+smleQQtQ79ZTStDrw4Ljyt
         ovHWLCd2ON266mEQOPKEovDst06g1NeWdvaqPs2gZXzNaqUXLehcfy+O8c4k+GtoNo3d
         rjaB/qH+chsDA4KI6rMta+rQKRruNrQRCaio3uaO9FGVxCvkXEAU05wNttnTiCIji8iq
         P3lA==
X-Gm-Message-State: ACgBeo0KCFv+5pdyoMZqVRR1VRyEajzDJ/6oz+AjyorJ5vC+fUsVs4xr
	Ef5hZO0WuSoL2Bcome5aPqI/mlW+eVhxFx9lKmk=
X-Google-Smtp-Source: AA6agR5kquHLK08sJV7wPSiA6uDfnxrcaGSZokgPnt8ENqvTPyodp6p6/lTYfIShLzXKEcAmhUXvwNyourKGFKn/PFU=
X-Received: by 2002:a05:6402:11d0:b0:448:89ff:88f0 with SMTP id
 j16-20020a05640211d000b0044889ff88f0mr23145854edw.166.1662230508161; Sat, 03
 Sep 2022 11:41:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220821173051.155038-1-peron.clem@gmail.com> <20220821173051.155038-5-peron.clem@gmail.com>
 <0c028109-bb50-fbaa-de18-9876706a7477@sholland.org>
In-Reply-To: <0c028109-bb50-fbaa-de18-9876706a7477@sholland.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 3 Sep 2022 20:41:36 +0200
Message-ID: <CAJiuCcf7NuXFFLw6-RFcyZPNFPagfSB5aR7rY5528USzNB-iKg@mail.gmail.com>
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

On Tue, 23 Aug 2022 at 05:07, Samuel Holland <samuel@sholland.org> wrote:
>
> On 8/21/22 12:30 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > Enable GPU OPP table for Beelink GS1
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/=
arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > index 6249e9e02928..20fc0584d1c6 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > @@ -5,6 +5,7 @@
> >
> >  #include "sun50i-h6.dtsi"
> >  #include "sun50i-h6-cpu-opp.dtsi"
> > +#include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> >
> > @@ -261,6 +262,7 @@ reg_dcdca: dcdca {
> >                       };
> >
> >                       reg_dcdcc: dcdcc {
> > +                             regulator-always-on;
>
> Why is this necessary? This file already has:

This is a relica from the first serie at this time the OPP doesn't
properly enable the regulator it's now fixed since:
https://patchwork.kernel.org/project/linux-pm/patch/81eb2efeeed1556d1240652=
52f32777838a6d850.1589528491.git.viresh.kumar@linaro.org/

I will drop it.

Thanks for the review.
Regards,
Clement




>
> &gpu {
>         mali-supply =3D <&reg_dcdcc>;
>         status =3D "okay";
> };
>
> So there is a consumer for this regulator.
>
> Regards,
> Samuel
>
> >                               regulator-enable-ramp-delay =3D <32000>;
> >                               regulator-min-microvolt =3D <810000>;
> >                               regulator-max-microvolt =3D <1080000>;
> >
>
