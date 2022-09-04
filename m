Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085E03229
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Sep 2022 14:29:20 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id nc14so12494777ejc.4
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Sep 2022 07:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=ZfqVcyFbKI9Os+wuA/QVa335RYVnkmodjGXffhuOttY=;
        b=FPG1SsLMC0jyE8WitBgdhh2yGeR8ZASK5uoZmOd+HPKWSifYv7jzdzzKFDhxppCgw7
         Vag1F37uPBf98sMc/qBwPXFlOhEs0mFu148esRqj9eB5tDgSASRvhioAn5FphYaioelD
         9mkCUCqJnOihqrgwVVZWNncOmPoXhARGl5+NSVEnM++2QxhZp5PaP21zzYywUGlmtwHh
         WnvyjnFGali4LAnsD5e7t3rhqF8o+UYHZ+DC47UhpRjlz0AtNuo40ebIAO4+9q6RavSG
         pyj6yacVuKxMR2jWMX1yBUmRZ0Dld/+XJUI/9BgsEFV9t5SHwRWseGXfM/yTVojsvoja
         qjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZfqVcyFbKI9Os+wuA/QVa335RYVnkmodjGXffhuOttY=;
        b=U56kBCbpJC1U/5KTL0MRx+7Sh3IoOwgnHOdmEgAMNcMBGCONu4Kvpo/HsJc6Uz385l
         Gz5R8uP+k5XiER/MOvPW8XtJrmbtUMHJmlygxoqfqEOoarcg3YSJkwDuGZ7c3+dwuZte
         9i0FAekkZim2vVq16Lh244jg3HT67IQUnBa+9DkXiEv8+kPfdNPiKD2Id9DSuXr2SDvN
         3YLTyvlZWxBP+NRa5oOiWlprlOb5eTGnr/8hhftQn4uKXqa2usVusHiWOGEj4elKK17e
         2XQTHKKBIcVva645xedGuX0PQom2Dl3mz5H5UrrXpg9N4f63jn+msRw2dhMo4CX0CuDI
         NGWw==
X-Gm-Message-State: ACgBeo3L6DhlCd91g1TLfengRqkfL/TgepjlG/aqHCa98Xut/y9SXOZ/
	9brfDbVBwGyZikaCkw08yoJauLEGwkTyrAWfVD8=
X-Google-Smtp-Source: AA6agR7XVnrPDDvO1MS/Q/m5mVMZemBGRMS+fLOrHm6jmsdUlwWEmB2mtOoI49y0CHLtPXjjASKR7loH5XA3XyRJ314=
X-Received: by 2002:a17:907:8a09:b0:731:610:ff8d with SMTP id
 sc9-20020a1709078a0900b007310610ff8dmr32726251ejc.399.1662301759048; Sun, 04
 Sep 2022 07:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220821173051.155038-1-peron.clem@gmail.com> <20220821173051.155038-5-peron.clem@gmail.com>
 <0c028109-bb50-fbaa-de18-9876706a7477@sholland.org> <CAJiuCcf7NuXFFLw6-RFcyZPNFPagfSB5aR7rY5528USzNB-iKg@mail.gmail.com>
 <CAJiuCcf0io5T=+Ap8io2uKn+CNqrCi2pbaCtyq2PVW=bEqKakg@mail.gmail.com>
 <26ebdc2d-caca-2d53-45bc-8c8b90c7c1fd@sholland.org> <CAJiuCcdGS-H+tq0o47Zm=UJNEL+Ff0_mkUU1N86ttE=iOTbknw@mail.gmail.com>
In-Reply-To: <CAJiuCcdGS-H+tq0o47Zm=UJNEL+Ff0_mkUU1N86ttE=iOTbknw@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 4 Sep 2022 16:29:07 +0200
Message-ID: <CAJiuCcfRrRwzaeikknR7OzWA=TmugvhHXtwGCdxU64hvmaDdNQ@mail.gmail.com>
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

On Sun, 4 Sept 2022 at 16:23, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> Hi Samuel,
>
> On Sun, 4 Sept 2022 at 05:32, Samuel Holland <samuel@sholland.org> wrote:
> >
> > On 9/3/22 2:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > > Hi Samuel,
> > >
> > > On Sat, 3 Sept 2022 at 20:41, Cl=C3=A9ment P=C3=A9ron <peron.clem@gma=
il.com> wrote:
> > >>
> > >> Hi Samuel,
> > >>
> > >> On Tue, 23 Aug 2022 at 05:07, Samuel Holland <samuel@sholland.org> w=
rote:
> > >>>
> > >>> On 8/21/22 12:30 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > >>>> Enable GPU OPP table for Beelink GS1
> > >>>>
> > >>>> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > >>>> ---
> > >>>>  arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 2 ++
> > >>>>  1 file changed, 2 insertions(+)
> > >>>>
> > >>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.d=
ts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > >>>> index 6249e9e02928..20fc0584d1c6 100644
> > >>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > >>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > >>>> @@ -5,6 +5,7 @@
> > >>>>
> > >>>>  #include "sun50i-h6.dtsi"
> > >>>>  #include "sun50i-h6-cpu-opp.dtsi"
> > >>>> +#include "sun50i-h6-gpu-opp.dtsi"
> > >>>>
> > >>>>  #include <dt-bindings/gpio/gpio.h>
> > >>>>
> > >>>> @@ -261,6 +262,7 @@ reg_dcdca: dcdca {
> > >>>>                       };
> > >>>>
> > >>>>                       reg_dcdcc: dcdcc {
> > >>>> +                             regulator-always-on;
> > >>>
> > >>> Why is this necessary? This file already has:
> > >>
> > >> This is a relica from the first serie at this time the OPP doesn't
> > >> properly enable the regulator it's now fixed since:
> > >> https://patchwork.kernel.org/project/linux-pm/patch/81eb2efeeed1556d=
124065252f32777838a6d850.1589528491.git.viresh.kumar@linaro.org/
> >
> > This should have nothing to do with the OPP driver; lima already has a =
"mali"
> > regulator consumer that should be enabled whenever the GPU is in use.
>
> Okay so you propose to add a regulator_enable() in the panfrost
> drivers in addition to the OPP consumer right?

After a quick look it seems that it's explicit that we don't want two
consumer for the same regulator and OPP should handle the enabling of
the regulator.

/* OPP will handle regulators */
if (!pfdev->pfdevfreq.opp_of_table_added) {
err =3D panfrost_regulator_init(pfdev);
if (err)
goto out_devfreq;
}


>
> I will send a patch to add this and see what's panfrost maintainer
> think about it.
>
> Regards,
> Clement
>
> >
> > _Adding_ a regulator consumer from the OPP driver should not somehow de=
crease
> > the refcount.
> >
> > >> I will drop it.
> > >
> > > After retesting it, it seems to still no take the regulator and make
> > > my board hang... :(
> > >
> > > [   17.698597] sun8i-dw-hdmi 6000000.hdmi: registered DesignWare HDMI
> > > I2C bus driver
> > > [   17.708475] sun4i-drm display-engine: bound 6000000.hdmi (ops
> > > sun8i_dw_hdmi_ops [sun8i_drm_hdmi])
> > > [   17.718350] [drm] Initialized sun4i-drm 1.0.0 20150629 for
> > > display-engine on minor 1
> > > [   17.877443] Console: switching to colour frame buffer device 320x9=
0
> > > [   17.936050] sun4i-drm display-engine: [drm] fb0: sun4i-drmdrmfb
> > > frame buffer device
> > > [   17.961881] platform 5200000.usb: deferred probe pending
> > >>>>> [   31.710731] vdd-gpu: disabling <<<<<
> >
> > Are there any messages from lima, especially about mali-supply? Can you=
 provide
> > regulators_summary from debugfs?
> >
> > Regards,
> > Samuel
