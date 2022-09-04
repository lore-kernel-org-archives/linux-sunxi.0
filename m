Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22663229
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Sep 2022 14:24:06 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id fc24so3477593ejc.3
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Sep 2022 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=WQd/3yVISfVxzbk67RJMWa5vojDrpagddwxD0a038Uw=;
        b=QqWTf6BD3mAcwBbQhW+iE5V/E+pc/i599Io0yu7zs7OL0jZjgl13SMU5ZJiDa0ASLK
         mGvDvGkf/GxZHd4oLfupzwlYd4zZMmjS8qWbBDMgu0vtrBQIT4N1ou5ZyJOkGnrXOFcg
         l/EA//E12X9HxXFWyML+wozFbQvI+4SoVv0iOZo2/kssS4lRnA5krZLujtIVDyX5NNW0
         zOi+TAl8NNy2vUdkskbZqEfM97tQAjw+yuVDzqlMoawPUEC2sbhMjpWlVYpspxcr5Qy7
         ZRmHkcIgcW5WytAShqXWxtCBYaAt9KW1ItBP+iC+sa6QBr32DkLKhs5rewc9GFc/0Ibg
         N9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WQd/3yVISfVxzbk67RJMWa5vojDrpagddwxD0a038Uw=;
        b=VQxCPmwTdZ+ogG+rPLjvC90Gdi1KSDk218XKnh0G1MQL/++BEAJA4RflaTtLU2nlQq
         PgrM9drUMS4s9wyT8OjYpNNlBccmV9MNj3Nn9zs/c+azPrL7vxzhAWfrnx11b7G4RX7a
         NM2iFAGD7RrCfvCe164xcDNy/NNNHBxfrwteZaAGbU5mc6b5N97T/8xG2lVo7K7DtYM9
         E6h4AXiphIC3d2mOyEZqzR/P08WGB0oP1ng407TljlJ/cxphclvttXQeZ6pU87+1gpsR
         CSdXeblRadn2Nnu6NcM6pIBK7Lnr9Vu+xPehzh5jMRdk28DFT9N5vCsY9R3/T0FztjCi
         N3TQ==
X-Gm-Message-State: ACgBeo2QcyD4aUpaWSOdMFKlDxYFNe3oELBO+uqY2MAx3VJW+niH9r7p
	DkVqETNjTfZBcvEa6O/oWvTBlLQYhqWLs15dt/8=
X-Google-Smtp-Source: AA6agR4R7Bgy6wTffALjU0IQVwUxVsAM/a/tF2prkx1VQZUnUNx0Euixd76lpoNdKjThz2Xy6nNtSB6yhMgYjaB+K5g=
X-Received: by 2002:a17:907:7dac:b0:739:8df9:3c16 with SMTP id
 oz44-20020a1709077dac00b007398df93c16mr32591399ejc.9.1662301444582; Sun, 04
 Sep 2022 07:24:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220821173051.155038-1-peron.clem@gmail.com> <20220821173051.155038-5-peron.clem@gmail.com>
 <0c028109-bb50-fbaa-de18-9876706a7477@sholland.org> <CAJiuCcf7NuXFFLw6-RFcyZPNFPagfSB5aR7rY5528USzNB-iKg@mail.gmail.com>
 <CAJiuCcf0io5T=+Ap8io2uKn+CNqrCi2pbaCtyq2PVW=bEqKakg@mail.gmail.com> <26ebdc2d-caca-2d53-45bc-8c8b90c7c1fd@sholland.org>
In-Reply-To: <26ebdc2d-caca-2d53-45bc-8c8b90c7c1fd@sholland.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 4 Sep 2022 16:23:53 +0200
Message-ID: <CAJiuCcdGS-H+tq0o47Zm=UJNEL+Ff0_mkUU1N86ttE=iOTbknw@mail.gmail.com>
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

On Sun, 4 Sept 2022 at 05:32, Samuel Holland <samuel@sholland.org> wrote:
>
> On 9/3/22 2:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Samuel,
> >
> > On Sat, 3 Sept 2022 at 20:41, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> >>
> >> Hi Samuel,
> >>
> >> On Tue, 23 Aug 2022 at 05:07, Samuel Holland <samuel@sholland.org> wro=
te:
> >>>
> >>> On 8/21/22 12:30 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> >>>> Enable GPU OPP table for Beelink GS1
> >>>>
> >>>> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> >>>> index 6249e9e02928..20fc0584d1c6 100644
> >>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> >>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> >>>> @@ -5,6 +5,7 @@
> >>>>
> >>>>  #include "sun50i-h6.dtsi"
> >>>>  #include "sun50i-h6-cpu-opp.dtsi"
> >>>> +#include "sun50i-h6-gpu-opp.dtsi"
> >>>>
> >>>>  #include <dt-bindings/gpio/gpio.h>
> >>>>
> >>>> @@ -261,6 +262,7 @@ reg_dcdca: dcdca {
> >>>>                       };
> >>>>
> >>>>                       reg_dcdcc: dcdcc {
> >>>> +                             regulator-always-on;
> >>>
> >>> Why is this necessary? This file already has:
> >>
> >> This is a relica from the first serie at this time the OPP doesn't
> >> properly enable the regulator it's now fixed since:
> >> https://patchwork.kernel.org/project/linux-pm/patch/81eb2efeeed1556d12=
4065252f32777838a6d850.1589528491.git.viresh.kumar@linaro.org/
>
> This should have nothing to do with the OPP driver; lima already has a "m=
ali"
> regulator consumer that should be enabled whenever the GPU is in use.

Okay so you propose to add a regulator_enable() in the panfrost
drivers in addition to the OPP consumer right?

I will send a patch to add this and see what's panfrost maintainer
think about it.

Regards,
Clement

>
> _Adding_ a regulator consumer from the OPP driver should not somehow decr=
ease
> the refcount.
>
> >> I will drop it.
> >
> > After retesting it, it seems to still no take the regulator and make
> > my board hang... :(
> >
> > [   17.698597] sun8i-dw-hdmi 6000000.hdmi: registered DesignWare HDMI
> > I2C bus driver
> > [   17.708475] sun4i-drm display-engine: bound 6000000.hdmi (ops
> > sun8i_dw_hdmi_ops [sun8i_drm_hdmi])
> > [   17.718350] [drm] Initialized sun4i-drm 1.0.0 20150629 for
> > display-engine on minor 1
> > [   17.877443] Console: switching to colour frame buffer device 320x90
> > [   17.936050] sun4i-drm display-engine: [drm] fb0: sun4i-drmdrmfb
> > frame buffer device
> > [   17.961881] platform 5200000.usb: deferred probe pending
> >>>>> [   31.710731] vdd-gpu: disabling <<<<<
>
> Are there any messages from lima, especially about mali-supply? Can you p=
rovide
> regulators_summary from debugfs?
>
> Regards,
> Samuel
