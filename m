Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B630F72
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jul 2021 06:20:17 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id p24so23170683ljj.1
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Jul 2021 23:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=bngr9Nv0Y1UOSId1pMTP+3CRnvPkvJCGdjqxftdS5ZY=;
        b=J/y8yJEjmeK9UHruRVb8eAt16Qoi2ifQHrssES9qthBGcE100xjuVUHqscGCZjbudM
         X0AYWk0sxrgrxEY8k0n+fAof5AtUd99TpZNxblNvQRf87PHcp7i1bSM/wajR6KCFhu9t
         pmfbrQUJRCLsuEn1A1XPjc2oWWxA8zTT/sgRfhp7nFWyBNNXU8bU/PRLT5/+BlPNtRHd
         K+XeiuLCcTHrJVj0ABiYFuYMeNDZifB6iLrXvyQecW0DIFml9YDxxl6BY3ifg3VePnDI
         4XHtg1t0W5FmV78IlfarIosAMBIKtUm8oLX346+Q0TOZlJBbxaR9siLUM7xDeZwRC5H2
         cXCQ==
X-Gm-Message-State: AOAM5308qxD51xM4efneHRSnFmgCEaTrUUFVDL5XTA90pWD2ecWzmGHJ
	DZAySu56LNfTFr0jB5JE3q1zhC628Wctxg==
X-Google-Smtp-Source: ABdhPJxd+Urut/6r2Nh60nPo/5yGNN/uM/5XwoYVnR4D0Fmj0sGZmGVwBt4y95Rh+aOhOD61RUN4pA==
X-Received: by 2002:a2e:860b:: with SMTP id a11mr5690888lji.208.1625466015561;
        Sun, 04 Jul 2021 23:20:15 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id o11sm984614lfb.218.2021.07.04.23.20.15
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jul 2021 23:20:15 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id d16so30422145lfn.3
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Jul 2021 23:20:15 -0700 (PDT)
X-Received: by 2002:ac2:5045:: with SMTP id a5mr9303922lfm.203.1625466014834;
 Sun, 04 Jul 2021 23:20:14 -0700 (PDT)
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
 <213baae6-a2f8-10de-1c9a-aa8f8683ddc6@163.com>
In-Reply-To: <213baae6-a2f8-10de-1c9a-aa8f8683ddc6@163.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 5 Jul 2021 14:20:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v66m=8OY2j=QgU5E+gNA-xeEhNk90BK0-PB5B19+WK2UGw@mail.gmail.com>
Message-ID: <CAGb2v66m=8OY2j=QgU5E+gNA-xeEhNk90BK0-PB5B19+WK2UGw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable usb_otg
To: qianfan <qianfanguijin@163.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <maxime@cerno.tech>, 
	linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 5, 2021 at 11:51 AM qianfan <qianfanguijin@163.com> wrote:
> =E5=9C=A8 2021/7/2 20:30, Chen-Yu Tsai =E5=86=99=E9=81=93:
> > On Fri, Jul 2, 2021 at 8:24 PM Andre Przywara <andre.przywara@arm.com> =
wrote:
> >> On Fri, 2 Jul 2021 14:06:01 +0200
> >> Maxime Ripard <maxime@cerno.tech> wrote:
> >>
> >> Hi,
> >>
> >>> On Fri, Jul 02, 2021 at 10:46:20AM +0800, qianfan wrote:
> >>>> =E5=9C=A8 2021/7/1 22:47, Chen-Yu Tsai =E5=86=99=E9=81=93:
> >>>>> On Thu, Jul 1, 2021 at 10:37 PM Andre Przywara <andre.przywara@arm.=
com> wrote:
> >>>>>> On Thu,  1 Jul 2021 09:50:09 +0800
> >>>>>> qianfanguijin@163.com wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>>> From: qianfan Zhao <qianfanguijin@163.com>
> >>>>>>>
> >>>>>>> Enable it.
> >>>>>>>
> >>>>>>> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> >>>>>>> ---
> >>>>>>>    arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 14 +++++++=
+++++++
> >>>>>>>    1 file changed, 14 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/=
arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> >>>>>>> index a6a1087a0c9b..072535b383b5 100644
> >>>>>>> --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> >>>>>>> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> >>>>>>> @@ -43,6 +43,7 @@
> >>>>>>>
> >>>>>>>    /dts-v1/;
> >>>>>>>    #include "sun8i-r40.dtsi"
> >>>>>>> +#include "sunxi-common-regulators.dtsi"
> >>>>>>>
> >>>>>>>    #include <dt-bindings/gpio/gpio.h>
> >>>>>>>
> >>>>>>> @@ -299,6 +300,11 @@
> >>>>>>>         regulator-name =3D "vdd1v2-sata";
> >>>>>>>    };
> >>>>>>>
> >>>>>>> +&reg_usb0_vbus {
> >>>>>>> +     gpio =3D <&pio 8 13 GPIO_ACTIVE_HIGH>; /* PI13 */
> >>>>>>> +     status =3D "okay";
> >>>>>>> +};
> >>>>>> So there is the same USB0-DRVVBUS signal connected to this GPIO, b=
ut
> >>>>>> also to the AXP's N_VBUSEN line.
> >>>>>>
> >>>>>> Not sure if that means either of them can control the voltage?
> >>>>> It's better to use N_VBUSEN if that is connected. Since the PMIC
> >>>>> may have that pin already enabled, it can cause issues with VBUS
> >>>>> input not being correctly used.
> >>>> I had checked some boards in linux such as sun7i-a20-olinuxino-lime2=
.dts,
> >>>> they has the same design
> >>>>
> >>>> that enable VBUS by using a gpio and then connect this gpio to PMIC.
> >>>>
> >>>> there is a example:
> >>>>
> >>>> ./sun7i-a20-olinuxino-lime2.dts:&reg_usb0_vbus {
> >>>> ./sun7i-a20-olinuxino-lime2.dts-        gpio =3D <&pio 2 17 GPIO_ACT=
IVE_HIGH>;
> >>>> ./sun7i-a20-olinuxino-lime2.dts-        status =3D "okay";
> >>>> ./sun7i-a20-olinuxino-lime2.dts-};
> >>> IIRC, the AXP209 typically used with these boards doesn't have a
> >>> N_VBUSEN line
> >> According to the Lime2 schematic and the AXP209 data sheet from the Wi=
ki
> >> it does have N_VBUSEN, from a quick glance with the usual
> >> functionality. And the connection on the Lime2 looks indeed the same,
> >> USB0_DRVVBUS connected to both the PMIC and a GPIO.
> >> (Also the BPi-M2 Ultra has an AXP221 anyway.)
> > The difference is that the N_VBUSEN pin on the AXP221 can be used as an
> > output, while on the AXP209 it is strictly an input. And U-Boot tends
> > to leave pins it has used in whatever state last used so ideally we
> > need to coordinate both to use the same method. Otherwise you might
> > end up with N_VBUSEN always driving DRVVBUS high or low, and the GPIO
> > on the SoC not having any effect. Ideally we need some way to reset
> > the state of the pins to high-Z.
> >
> > ChenYu
>
> I had changed the dts to control VBUS by using PMIC, but I had a
> question: what's the perpose of
>
> the gpio?

Which GPIO? You mean the one on the SoC wired to N_VBUSEN and DRVVBUS?
Or N_VBUSEN itself?

ChenYu
