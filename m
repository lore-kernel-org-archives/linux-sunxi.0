Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795116248;
	b=03mreydDIpRIoZ4+YLnDuEHAHxe6L5NCXjSlpGdE/ryzQ9NWvtxmfD6DOqXQwOBhLK1S
	 aX+YtuJ3ulHFSwf1PN2PkffhSRJRpFHwLG/OxETMiZBtz5X4R+l2/lA+iO2BCaBZXRhKL
	 UkmzZ6Ts5KRlJX74Slt3RcsQ+34pg4T16PsEtbrAHmDb37QVZh5Nf0BWaBSy65ZV6uBqI
	 wq6NFVM192JhNXJc/he943l/j7s6f1vTueiOqqbqCY3pyYCFQ3GN5oiGi9+Uocs4Efde7
	 W1RGCwqmjaMxiLoQrkN+nordHltGDVQHDcz+749mlextTv7S8e8bvovNeaxXeUUFduw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
	b=qufVCWMBxknsu/8fE7l3ZbDIv9LXPox7jbOQ4G25c7NCBCltGu9IJ+gTdJ/XoAZbRQe3
	 VSRdlwch6CPjiK/V/J6vMatvnNssEe/t6ZZOKkwtiwgOYu7Q4baS52K0tCdV+Y/XDCB6y
	 +Qbx4DRygqHOG8IObKaldhS2zQHMOeafykWWFcXhQoxwxtGFOQWMs35N2e7L1rSREeXuw
	 RTKMRqBv0yMQmDoZ7gTHAKVknvAjr6VJXOgIHgFHF+B9w5Icx8T50MckuXAdKA3wNoxqm
	 MFEfNSdjTJO7oqPPJ8JCyUgIE0JZmhRae8pIwzlfwI/V17ZqKnhD4773qkXTwtFuZXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANmkUVYC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC5606A330
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 19:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AC5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANmkUVYC
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ee029fd76aso37188e0c.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 11:24:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795116247; cv=none;
        d=google.com; s=arc-20260327;
        b=d/31GS9c9z83QnSQijPEVIwSDxy0nVAamM1JSdPSeMX75RJRyTDsljgcHmfFSwDaxe
         OgD9LhR1kA8cVM5rct1Op4r3+dcZsAthJMCzwhhm+HrPGbRjla2G2gJ+MloI/VD3ufcq
         O0wMLpZanrcaV+iyOopeccVQKPAxyeMmBKhMEWhRWqpTmqRQtaHk7RgrMDXJNRVFQR3P
         H2UvCbPukUfzOscXgkz96aKaSA/w3sFORRpWZI8P+XpvQq+ubTI9i3fVUL41mJEOgA05
         p4u1hCr0wnSuAci3FVmvlBAYOsI5wSuEu5M/c0X7VcJTU7Y6wmgsCOrokFCza04NGBpU
         4WXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
        fh=BpKB7s5NptZxvjDTc4SCfDFLn4nc3qaiXFTjqitgazQ=;
        b=exONAiFJY3zFe64xUX0ctKiXjCgx7C8HGXvSggiU44kbZ9vCvYnrDLVA3yvpkTsscR
         OsVWmHDi/Q7U99tMp5F7ArE/Y6bQpy4/guFBbAyayxOssBZ9dUfYXREccEwkV2pYNh3C
         c9nn+/gL2XncAqJy0VF0TlCh5hWSPdFTGzZ38lIuEBG59xxNba/7k7L+2806i4UdH/lt
         xUoN6KeBTCAkDjGQflUph7Kmw7jQiRA+MoeU/ZlEnJjnjMSwC9SVvkjn26XN6tvELQtL
         wWN2mkh/D6dnb8x2vdz5sg728tRbvq19FclDX1SwBgyBYMQT8yi9LS/Vl3oqGkyhrs7b
         h9yA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795116247; x=1795721047; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
        b=ANmkUVYClR7SdFDyJJDdhZse97yb22rHV5lS3sKexZ4Fj8uei7FuJKTSRGyIcgEW5y
         crJnb1mOBWeq6etJCZMu4Iw7aK4hlq8BUT5WfWbyBeGG62drPnZg1bec0TZuyH6wrO8r
         D3i6WrlHDdOE+2qJSogNaRIdCq88j4+8dExwnrrEVMCuSTAQpa0NDuP9Pbn/lTeACCNQ
         eEwXEidkUhG42jxhel7RMt+jnI8XgX6dktTIaVUq3GNzl9bh4DU0h5vbq8jmFMt0kq/K
         Q2Dq6lwT+1m0+Kx6Umh3ujx+AHrhPC3fN/gvfi4vU9vcHblmMRwpLqEBCtT5Qr4L9Vjr
         Gnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116247; x=1795721047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJ9lQlnrIoDeye4I9sWURdg2kwBBKMsAxkmiWLBweSU=;
        b=VZ65lE+SM4Y3vJdPJcnjWyd9BGkfuxECdqtRCqb+EWLM8AhklcW1ULg+d/8L/NalH8
         Fu0shTwXmVB2D27hEvm4Fx20QohGlS/07qGFGktNdzSrcIZA59kWOzsbiRQjsa6LWXT3
         kRK3a2yfZS4nl+XUxL+I/CfIAR4KY3hgJOcKa+6vYtLrjJDn+eW0bGAoCZfpz2LrTxvD
         kTBMlhgI5g1xuSr91okCKsUtxA3mQfB3pBv+VnVclGYGw8tAijeoUonKBkd+2AII5V/S
         IUqwCbV4MEGWDwdsm4bP/r4hk7rv69HeKhOXI1c1b2PWaC/2Jyuh4QpH5gpqUqfdt5Qw
         iXIQ==
X-Forwarded-Encrypted: i=1; AL+hErH0u8yEGv+ABfLPCxhp1mDlFZf1GElHhNz5WgYdQ4Di9lG4Y1kClSrLh5zTIBzcfJVffSFPTRZaAzmYCQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z891hxYKDsEX1j4znynm2MWzu7moF/jktwSBtnSWo75KoPdKKus
	RVAfsfjXIMYTZfGLxIQaThzDbRXjNYwHAjG8WXbeQ2FmJZgERyLbNq2oW7D0efqRrbzE9NRpPsf
	ZkXtgvGWQCrEH2GcOzWZRpYebyocSGrc=
X-Gm-Gg: AYBFou2jyEjzgtxBNl9Z/bI/UFBQm+F3P4Uc0jOxVr4harRyTi5ZR9nSJ1of13/x1jm
	7zloSS2/ZX71cvVguN8/m202zllZPkFD3JhUIEJ663Vi061EjDPkCbIkWC7UWCEXrwg0AAYyxBC
	A78Loa1FITkIGqCAKrqONPpZ9XondB6SiWZVSEj/IXKoLT7t7yZcG7vIiskgHoJjLhW2ggB+LYc
	jy34lggYjm/rW1/KRgbqA4FM46uwi4YzoLHeXUqp4G7JfJk5aRCrkFSW8qI4d0UeDW+Hxuz8lf6
	KqAQFBuVWmOqVJIF79Sk52Wu1akutBsW6TLQrr1edqVMft9OoQ1oDFA9bEXDYtGcB9Mbj0c6lK4
	CSdPRbCc+L/eUJTz22Sk44ZNbOlYK2xyHc1aImCakBUP9EhepEBaCD0LPJdVOWVJ6bAlidSfyKl
	ZK8ChnY9L8VW0QK4I=
X-Received: by 2002:a05:6122:4307:b0:5c9:a60b:e5a2 with SMTP id
 71dfb90a1353d-5ee8af4fbdfmr474971e0c.13.1795116246978; Thu, 19 Nov 2026
 11:24:06 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <179489221679.1.1429296960451969532.led-label-policy-rfc@gmail.com>
 <179510277952.63755.11124972443142013738@kernel.org>
In-Reply-To: <179510277952.63755.11124972443142013738@kernel.org>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Thu, 19 Nov 2026 12:23:56 -0700
X-Gm-Features: AclHuK__KoKm0l4co8BZ367Zdnaot1-gmSZVSutowrjZ0dfQ-AxhOu-o9nn73F4
Message-ID: <CAH87RzTz0MuLP1yn25CCeL+TgDajNWNEvwZBVNJre9Gw2TFkUg@mail.gmail.com>
Subject: Re: [PATCH RFC] leds: DT: migrating existing labels to function/color
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

This is not a patch, but just an example of what it might look like if
I submitted patches to change all the LEDs.
I didn't know whether it was desirable to switch all the old LED
labels to the new format. But now I have my answer, and I will not
submit any patch to change the LED labels.

Regards,
Cristian Filipescu
------------------------------------

On Thu, Nov 19, 2026 at 12:02=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> I'm not exactly sure what to do with this patch, but not a patch, submiss=
ion?
>
> Sashiko already had some things to say.
>
> > From: Cristian Filipescu <filipescu.cristian@gmail.com>
> >
> > Hi,
>
> This does not belong in a commit message.
>
> > The common LED binding deprecates label in favour of function and color=
.
> > Is removing existing labels desirable when it changes established LED c=
lass
> > names, or should existing board descriptions retain them for compatibil=
ity?
>
> Removing existing 'label' properties will change the sysfs directory
> names under /sys/class/leds/ and risk breaking existing user-space tools
> and scripts that rely on them.  Existing board descriptions should
> retain their 'label' properties for backwards compatibility, though
> 'function' and 'color' can be used for any newly added nodes.
>
> > For example, the Orange Pi H6 descriptions could replace their labels w=
ith
> > LED_FUNCTION_POWER/STATUS and LED_COLOR_ID_RED/GREEN. With gpio-leds, t=
his
> > would change the names under /sys/class/leds:
> >
> >   orangepi:red:power    -> red:power
> >   orangepi:green:status -> green:status
> >
> > The example below changes two files and affects Orange Pi 3, 3 LTS, Lit=
e2
> > and One Plus. GPIOs, polarity, pinctrl, defaults and triggers are uncha=
nged.
> > All four DTBs compile before and after; comparison found only the inten=
ded
> > label/function/color changes. The renamed LEDs have not been tested on
> > hardware.
> >
> > I was thinking of converting all the deprecated LED labels, but I wante=
d
> > to see if this was something maintainers wanted, since it would touch a=
 lot
> > of files. Would you prefer retaining existing labels (potentially addin=
g
> > function and color alongside them), or reviewing migrations with the na=
me
> > changes explicitly documented?
> >
> > This is a discussion example, not a patch for inclusion. Preparation an=
d
> > static checks were assisted by OpenAI Codex.
> >
> > Thanks,
> > Cristian
>
> This does not constitute as a SoB.
>
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > index ce82aa265..8e4117057 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > @@ -8,6 +8,7 @@
> >  #include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> >
> >  / {
> >       model =3D "OrangePi 3";
> > @@ -45,13 +46,15 @@ leds {
> >               compatible =3D "gpio-leds";
> >
> >               led-0 {
> > -                     label =3D "orangepi:red:power";
> > +                     function =3D LED_FUNCTION_POWER;
> > +                     color =3D <LED_COLOR_ID_RED>;
> >                       gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 *=
/
> >                       default-state =3D "on";
> >               };
> >
> >               led-1 {
> > -                     label =3D "orangepi:green:status";
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> >                       gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 *=
/
> >               };
> >       };
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/ar=
ch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > index 57b137755..49f3d2fc8 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > @@ -9,6 +9,7 @@
> >  #include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> >
> >  / {
> >       model =3D "OrangePi One Plus";
> > @@ -45,13 +46,15 @@ leds {
> >               compatible =3D "gpio-leds";
> >
> >               led-0 {
> > -                     label =3D "orangepi:red:power";
> > +                     function =3D LED_FUNCTION_POWER;
> > +                     color =3D <LED_COLOR_ID_RED>;
> >                       gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 *=
/
> >                       default-state =3D "on";
> >               };
> >
> >               led-1 {
> > -                     label =3D "orangepi:green:status";
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> >                       gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 *=
/
> >               };
> >       };
> >
> >
>
> --
> Lee Jones
