Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02BD7C
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Aug 2022 16:50:09 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id w19so8280055ejc.7
        for <linux-sunxi@lists.linux.dev>; Sat, 27 Aug 2022 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=VJNF98Jqt99AprHtKq0G9VG/d2DqpgJHfktlSDmD0pg=;
        b=MN8/ETsFbLJzerJD4Via51PdSRuPXLXahkl3CImMSuj4F8mgXXCxd1i7VSiHIxGCFt
         gBttjvyy2grENAq0rDAl+cNdRaDE3lNvlKf2IeqZwyYRDjDvyPc/pN/XP/gjo4gyM/x3
         4XXg7RiJ0uzLoKXcfRrl/IJbFKNAc1nJvBBkxWeZVMOibC4FAJgnVctwKodiVPTIDhQc
         LTlbKqwN7Fbw69qAMl6oyXnRmHf8viBq8EaaXO6UUQC2h1AhyBinSnJBLKHSQoJrGF7d
         qXcB4TVtkJAqlqafVN1p1VDLGDnktOE7BgFdMFAeOvhc6yegecVQM8v34b9IUzLbaDfR
         TSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=VJNF98Jqt99AprHtKq0G9VG/d2DqpgJHfktlSDmD0pg=;
        b=HHWdIWqltdJpC4JqW6ul4L3mWVsmy/gSizDW+X/LNwiEPFKXkT3yNzamCGn6B2sDJQ
         Y5GmbEuOjECZHcspo7gVh0pRuLhf2suc1gPsOliBOweJ5Hj3Qt2BO1ChU7RDXQVNwZ0G
         22ZlNc/ygyNwvMtLz4ZO5giX0N6VIJ0/h0o/TQSyp2BMnBaqPXr/0mTUaB8AG5p/oF1r
         vYMuo5y4HEpMIe1R8fGQ+Hj4a2SGXBbZUHuPkBROBjjYcz3mB6KzBoOYlhykkQgj/eak
         Dts+l0qlMrUCyN7hGlB2ljbroDjtZwr1cOuLWm4sebEfKtnDKGtHbZeOiihk0EsQqKHU
         GLZA==
X-Gm-Message-State: ACgBeo1qy65d3eiTXwHXR8cuU0oe2uS2GuSxcPve1NzsRB+zAjozhgcH
	B58aXiQr81lIcuICAT4NdFFYjQeAzMOiaL1pAwA=
X-Google-Smtp-Source: AA6agR45ebN9N8dztQ/gX5HvnhEDpExulXI+ZZGejqq5d1WBpjxzmH9DKLOsuHlQFtJuyFzYNpSq3aIf5qCCqjTt62c=
X-Received: by 2002:a17:907:8a09:b0:731:610:ff8d with SMTP id
 sc9-20020a1709078a0900b007310610ff8dmr8431923ejc.399.1661619008050; Sat, 27
 Aug 2022 09:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220821173051.155038-1-peron.clem@gmail.com> <20220821173051.155038-3-peron.clem@gmail.com>
 <72f901e6-f646-336b-70e6-2747363944ab@sholland.org>
In-Reply-To: <72f901e6-f646-336b-70e6-2747363944ab@sholland.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 27 Aug 2022 18:49:56 +0200
Message-ID: <CAJiuCcfF=1Ob1oGABtHhM88m0LST727h88fXqCKYBiWRsYmtnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: allwinner: h6: Add cooling map for GPU
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Tue, 23 Aug 2022 at 05:16, Samuel Holland <samuel@sholland.org> wrote:
>
> On 8/21/22 12:30 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > Add a simple cooling map for the GPU.
>
> It would be good to document where the trip point temperatures came from.

If I remember correctly, I got those when getting the dtb from my
Beelink GS1 when it was running vendor Android with the oldest
Allwinner kernel.

But now that you ask I double check with the "new" vendor kernel source:
https://github.com/Allwinner-Homlet/H6-BSP4.9-linux/blob/master/arch/arm64/=
boot/dts/sunxi/sun50iw6p1.dtsi#L2034-L2053

And It's different from what I got in the past.
The throttling starts when the GPU is already very hot (95, 100 and
105=C2=B0C) and seems to only disable the highest frequency (756, 624 and
576MHz).
Which let the GPU running at 0.91V @ 540MHz.

Which is far to be the lowest possible consumption for the GPU (0.81V
@ 336MHz would be better in the hottest situation)

I'm not an expert but either I could just try to copy/paste the same
behavior or try to have a more smooth cooling map (70, 85, 100=C2=B0C).

What do you think?

Thanks,
Clement



>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> Acked-by: Samuel Holland <samuel@sholland.org>
>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 22 ++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h6.dtsi
> > index 5a28303d3d4c..943ae5374dd6 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -186,6 +186,7 @@ gpu: gpu@1800000 {
> >                       clocks =3D <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
> >                       clock-names =3D "core", "bus";
> >                       resets =3D <&ccu RST_BUS_GPU>;
> > +                     #cooling-cells =3D <2>;
> >                       status =3D "disabled";
> >               };
> >
> > @@ -1075,6 +1076,27 @@ gpu-thermal {
> >                       polling-delay-passive =3D <0>;
> >                       polling-delay =3D <0>;
> >                       thermal-sensors =3D <&ths 1>;
> > +
> > +                     trips {
> > +                             gpu_alert: gpu-alert {
> > +                                     temperature =3D <85000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> > +
> > +                             gpu-crit {
> > +                                     temperature =3D <100000>;
> > +                                     hysteresis =3D <0>;
> > +                                     type =3D "critical";
> > +                             };
> > +                     };
> > +
> > +                     cooling-maps {
> > +                             map0 {
> > +                                     trip =3D <&gpu_alert>;
> > +                                     cooling-device =3D <&gpu THERMAL_=
NO_LIMIT THERMAL_NO_LIMIT>;
> > +                             };
> > +                     };
> >               };
> >       };
> >  };
> >
>
