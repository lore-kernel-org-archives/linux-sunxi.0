Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C04168
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Jul 2021 12:30:26 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id q4so13033776ljp.13
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Jul 2021 05:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=44uGuISOkVraFGldRCF1+0LWylBGX7vWrC/gmijrTwo=;
        b=OcGTSg8IE0yMkP8vnu9fxhfGPfmpzHlYc6MFRlsYuozVLXcvaJdHmQT/heGuD7i9gC
         lDy2Clo8fLiZLjyZt0APvVJGcdo51/bO5NMoIHm+ebhgjdy6ZWzRke7GZ56DBEqul0pu
         P+7fEtHk4G/dne4gckM5DdgVWXwxKm51c2YkHEEVUhBwpDUt4V2kaBKAew5Fc9xL3Vd1
         +EK2HuCTtfMydUqJE5ltojgcRel+qF9VIpZa+0z7SU4KXcg5URSdUHXp2/obsZQ9KOXu
         2OsiZG9gv3NQryTH/B4Ue3vrkhw5yL/+VlJMtE3Qs1RF+BRMDVI6TsT04jtkrfaB+qow
         oGew==
X-Gm-Message-State: AOAM531h9GPYfv2Rt5Zib1Tyik1E+2NL+YCX1vjZT8hFVCIfxSemhr7a
	Shd6pBCsXPTmdVEYpnmrNqz+JKfuUcj6Ow==
X-Google-Smtp-Source: ABdhPJyfttzc0bGGyYOOazLXEvceAUPRRQ+23DXbhA9SKRycFOvjXWyg7yRm4v3KuP15tdhOxOfyUg==
X-Received: by 2002:a2e:8e29:: with SMTP id r9mr3597864ljk.370.1625229024920;
        Fri, 02 Jul 2021 05:30:24 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id r18sm259947lfm.127.2021.07.02.05.30.24
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jul 2021 05:30:24 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id n14so17773363lfu.8
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Jul 2021 05:30:24 -0700 (PDT)
X-Received: by 2002:ac2:5045:: with SMTP id a5mr3709382lfm.203.1625229024055;
 Fri, 02 Jul 2021 05:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210701015009.13985-1-qianfanguijin@163.com> <20210701015009.13985-3-qianfanguijin@163.com>
 <20210701153720.42c1f512@slackpad.fritz.box> <CAGb2v67-BAn=OMid-=MoJ15QUdt0NQ2RVfLTN-bkgUstyXNj2A@mail.gmail.com>
 <55b9f018-95da-fe3f-24a4-c499babb9ef3@163.com> <20210702120601.22k44u6cdlag57ku@gilmour>
 <20210702132409.6c2e7bd4@slackpad.fritz.box>
In-Reply-To: <20210702132409.6c2e7bd4@slackpad.fritz.box>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 2 Jul 2021 20:30:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v66c7ZM+8QW6X0uJ5OzBqDdBxmrwi8OLr3MdC-rMTsiACA@mail.gmail.com>
Message-ID: <CAGb2v66c7ZM+8QW6X0uJ5OzBqDdBxmrwi8OLr3MdC-rMTsiACA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable usb_otg
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <maxime@cerno.tech>, qianfan <qianfanguijin@163.com>, 
	linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 2, 2021 at 8:24 PM Andre Przywara <andre.przywara@arm.com> wrot=
e:
>
> On Fri, 2 Jul 2021 14:06:01 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> > On Fri, Jul 02, 2021 at 10:46:20AM +0800, qianfan wrote:
> > >
> > > =E5=9C=A8 2021/7/1 22:47, Chen-Yu Tsai =E5=86=99=E9=81=93:
> > > > On Thu, Jul 1, 2021 at 10:37 PM Andre Przywara <andre.przywara@arm.=
com> wrote:
> > > > > On Thu,  1 Jul 2021 09:50:09 +0800
> > > > > qianfanguijin@163.com wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > > From: qianfan Zhao <qianfanguijin@163.com>
> > > > > >
> > > > > > Enable it.
> > > > > >
> > > > > > Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> > > > > > ---
> > > > > >   arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 14 ++++++=
++++++++
> > > > > >   1 file changed, 14 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts =
b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > > > > > index a6a1087a0c9b..072535b383b5 100644
> > > > > > --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > > > > > +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > > > > > @@ -43,6 +43,7 @@
> > > > > >
> > > > > >   /dts-v1/;
> > > > > >   #include "sun8i-r40.dtsi"
> > > > > > +#include "sunxi-common-regulators.dtsi"
> > > > > >
> > > > > >   #include <dt-bindings/gpio/gpio.h>
> > > > > >
> > > > > > @@ -299,6 +300,11 @@
> > > > > >        regulator-name =3D "vdd1v2-sata";
> > > > > >   };
> > > > > >
> > > > > > +&reg_usb0_vbus {
> > > > > > +     gpio =3D <&pio 8 13 GPIO_ACTIVE_HIGH>; /* PI13 */
> > > > > > +     status =3D "okay";
> > > > > > +};
> > > > > So there is the same USB0-DRVVBUS signal connected to this GPIO, =
but
> > > > > also to the AXP's N_VBUSEN line.
> > > > >
> > > > > Not sure if that means either of them can control the voltage?
> > > > It's better to use N_VBUSEN if that is connected. Since the PMIC
> > > > may have that pin already enabled, it can cause issues with VBUS
> > > > input not being correctly used.
> > >
> > > I had checked some boards in linux such as sun7i-a20-olinuxino-lime2.=
dts,
> > > they has the same design
> > >
> > > that enable VBUS by using a gpio and then connect this gpio to PMIC.
> > >
> > > there is a example:
> > >
> > > ./sun7i-a20-olinuxino-lime2.dts:&reg_usb0_vbus {
> > > ./sun7i-a20-olinuxino-lime2.dts-        gpio =3D <&pio 2 17 GPIO_ACTI=
VE_HIGH>;
> > > ./sun7i-a20-olinuxino-lime2.dts-        status =3D "okay";
> > > ./sun7i-a20-olinuxino-lime2.dts-};
> >
> > IIRC, the AXP209 typically used with these boards doesn't have a
> > N_VBUSEN line
>
> According to the Lime2 schematic and the AXP209 data sheet from the Wiki
> it does have N_VBUSEN, from a quick glance with the usual
> functionality. And the connection on the Lime2 looks indeed the same,
> USB0_DRVVBUS connected to both the PMIC and a GPIO.
> (Also the BPi-M2 Ultra has an AXP221 anyway.)

The difference is that the N_VBUSEN pin on the AXP221 can be used as an
output, while on the AXP209 it is strictly an input. And U-Boot tends
to leave pins it has used in whatever state last used so ideally we
need to coordinate both to use the same method. Otherwise you might
end up with N_VBUSEN always driving DRVVBUS high or low, and the GPIO
on the SoC not having any effect. Ideally we need some way to reset
the state of the pins to high-Z.

ChenYu

> I would lean towards Chen-Yu's suggestion (use the PMIC).
> It seems like my BPi M2 Berry uses the same layout, so I can do some
> experiments later.
