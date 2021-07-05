Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E070
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jul 2021 14:21:12 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id u18so1744866lff.9
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Jul 2021 07:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=l1ZrdwS0EO3HPEfKflIzIsXIeZNOzyg6hBp2t5o51/U=;
        b=snbzaa82ejr16NJrskAmzUoH/NcKNdRsWZpuvSke5PzOBpi/SjJfpwSk5zMdj4O6Ap
         3ubcUg0bSIzM01N4vXSRrC4XM3/yXbj4dozWie3kZa3BScPT9VlUNm88QWKQHRMK2gnE
         RNXBYTVjUvhOSTzD2pi5L7I8cE0DFmlQHgxc4okUyh0iyOAfQNeqdvj15o35Xp/em8dk
         Divf2eMNXLUKBttjz0hECIVdet7djy/E51V2Wi3iWlAIXWokK6afGVLRkImazHbl3Hak
         eMjDR1UVCRcG4FLvplOYCNSZLg1UhRaf6InxQ9hM2cgGFzZIpxoPt2rC5TVCXD2UQFvT
         +Wow==
X-Gm-Message-State: AOAM5322pea1iziaRFOQzV+1+lxyFtimeNgISbikyfX1YhnDAi1cmGl6
	wj2D9gXK4MFRxxqJDdlO5AGCerYxsG7jPA==
X-Google-Smtp-Source: ABdhPJyroN39AVHFxcxMmVI1rV6kgyh/vBvolZ8n+/sRlRkhZkrLsOARKmn+BYEICUL6kGMfSlTbRw==
X-Received: by 2002:a05:6512:4c3:: with SMTP id w3mr11075788lfq.594.1625494870586;
        Mon, 05 Jul 2021 07:21:10 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id d6sm1091827lfc.183.2021.07.05.07.21.10
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 07:21:10 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id p24so24908178ljj.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Jul 2021 07:21:10 -0700 (PDT)
X-Received: by 2002:a2e:88d2:: with SMTP id a18mr11173992ljk.463.1625494869873;
 Mon, 05 Jul 2021 07:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210701015009.13985-1-qianfanguijin@163.com> <20210701015009.13985-3-qianfanguijin@163.com>
 <20210701153720.42c1f512@slackpad.fritz.box> <CAGb2v67-BAn=OMid-=MoJ15QUdt0NQ2RVfLTN-bkgUstyXNj2A@mail.gmail.com>
 <55b9f018-95da-fe3f-24a4-c499babb9ef3@163.com> <20210702120601.22k44u6cdlag57ku@gilmour>
 <20210702132409.6c2e7bd4@slackpad.fritz.box> <CAGb2v66c7ZM+8QW6X0uJ5OzBqDdBxmrwi8OLr3MdC-rMTsiACA@mail.gmail.com>
 <213baae6-a2f8-10de-1c9a-aa8f8683ddc6@163.com> <CAGb2v66m=8OY2j=QgU5E+gNA-xeEhNk90BK0-PB5B19+WK2UGw@mail.gmail.com>
 <9e9fe3d1-0ccf-0ecf-53d0-3e15b0c6ddff@163.com>
In-Reply-To: <9e9fe3d1-0ccf-0ecf-53d0-3e15b0c6ddff@163.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 5 Jul 2021 22:20:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v66KjGjiNuwi4D5jCHBTYLpW7-04Gq8SHpv9mK8Hf3Kjpw@mail.gmail.com>
Message-ID: <CAGb2v66KjGjiNuwi4D5jCHBTYLpW7-04Gq8SHpv9mK8Hf3Kjpw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable usb_otg
To: qianfan <qianfanguijin@163.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <maxime@cerno.tech>, 
	linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 5, 2021 at 2:30 PM qianfan <qianfanguijin@163.com> wrote:
> =E5=9C=A8 2021/7/5 14:20, Chen-Yu Tsai =E5=86=99=E9=81=93:
> > On Mon, Jul 5, 2021 at 11:51 AM qianfan <qianfanguijin@163.com> wrote:
> >> =E5=9C=A8 2021/7/2 20:30, Chen-Yu Tsai =E5=86=99=E9=81=93:
> >>> On Fri, Jul 2, 2021 at 8:24 PM Andre Przywara <andre.przywara@arm.com=
> wrote:
> >>>> On Fri, 2 Jul 2021 14:06:01 +0200
> >>>> Maxime Ripard <maxime@cerno.tech> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>>> On Fri, Jul 02, 2021 at 10:46:20AM +0800, qianfan wrote:
> >>>>>> =E5=9C=A8 2021/7/1 22:47, Chen-Yu Tsai =E5=86=99=E9=81=93:
> >>>>>>> On Thu, Jul 1, 2021 at 10:37 PM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >>>>>>>> On Thu,  1 Jul 2021 09:50:09 +0800
> >>>>>>>> qianfanguijin@163.com wrote:
> >>>>>>>>
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>>> From: qianfan Zhao <qianfanguijin@163.com>
> >>>>>>>>>
> >>>>>>>>> Enable it.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> >>>>>>>>> ---
> >>>>>>>>>     arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 14 ++++=
++++++++++
> >>>>>>>>>     1 file changed, 14 insertions(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts =
b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> >>>>>>>>> index a6a1087a0c9b..072535b383b5 100644
> >>>>>>>>> --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> >>>>>>>>> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> >>>>>>>>> @@ -43,6 +43,7 @@
> >>>>>>>>>
> >>>>>>>>>     /dts-v1/;
> >>>>>>>>>     #include "sun8i-r40.dtsi"
> >>>>>>>>> +#include "sunxi-common-regulators.dtsi"
> >>>>>>>>>
> >>>>>>>>>     #include <dt-bindings/gpio/gpio.h>
> >>>>>>>>>
> >>>>>>>>> @@ -299,6 +300,11 @@
> >>>>>>>>>          regulator-name =3D "vdd1v2-sata";
> >>>>>>>>>     };
> >>>>>>>>>
> >>>>>>>>> +&reg_usb0_vbus {
> >>>>>>>>> +     gpio =3D <&pio 8 13 GPIO_ACTIVE_HIGH>; /* PI13 */
> >>>>>>>>> +     status =3D "okay";
> >>>>>>>>> +};
> >>>>>>>> So there is the same USB0-DRVVBUS signal connected to this GPIO,=
 but
> >>>>>>>> also to the AXP's N_VBUSEN line.
> >>>>>>>>
> >>>>>>>> Not sure if that means either of them can control the voltage?
> >>>>>>> It's better to use N_VBUSEN if that is connected. Since the PMIC
> >>>>>>> may have that pin already enabled, it can cause issues with VBUS
> >>>>>>> input not being correctly used.
> >>>>>> I had checked some boards in linux such as sun7i-a20-olinuxino-lim=
e2.dts,
> >>>>>> they has the same design
> >>>>>>
> >>>>>> that enable VBUS by using a gpio and then connect this gpio to PMI=
C.
> >>>>>>
> >>>>>> there is a example:
> >>>>>>
> >>>>>> ./sun7i-a20-olinuxino-lime2.dts:&reg_usb0_vbus {
> >>>>>> ./sun7i-a20-olinuxino-lime2.dts-        gpio =3D <&pio 2 17 GPIO_A=
CTIVE_HIGH>;
> >>>>>> ./sun7i-a20-olinuxino-lime2.dts-        status =3D "okay";
> >>>>>> ./sun7i-a20-olinuxino-lime2.dts-};
> >>>>> IIRC, the AXP209 typically used with these boards doesn't have a
> >>>>> N_VBUSEN line
> >>>> According to the Lime2 schematic and the AXP209 data sheet from the =
Wiki
> >>>> it does have N_VBUSEN, from a quick glance with the usual
> >>>> functionality. And the connection on the Lime2 looks indeed the same=
,
> >>>> USB0_DRVVBUS connected to both the PMIC and a GPIO.
> >>>> (Also the BPi-M2 Ultra has an AXP221 anyway.)
> >>> The difference is that the N_VBUSEN pin on the AXP221 can be used as =
an
> >>> output, while on the AXP209 it is strictly an input. And U-Boot tends
> >>> to leave pins it has used in whatever state last used so ideally we
> >>> need to coordinate both to use the same method. Otherwise you might
> >>> end up with N_VBUSEN always driving DRVVBUS high or low, and the GPIO
> >>> on the SoC not having any effect. Ideally we need some way to reset
> >>> the state of the pins to high-Z.
> >>>
> >>> ChenYu
> >> I had changed the dts to control VBUS by using PMIC, but I had a
> >> question: what's the perpose of
> >>
> >> the gpio?
> > Which GPIO? You mean the one on the SoC wired to N_VBUSEN and DRVVBUS?
> > Or N_VBUSEN itself?
> I means USB0-DRVVBUS(PI13) on bpi m2u. We can control VBUS by PMIC, and
> PI13 seems is a redundant design.

Well, that depends on if you want the PMIC to be the component in control.
If you want the SoC to be in control, then the N_VBUSEN pin could be put
in its input mode instead.


ChenYu
