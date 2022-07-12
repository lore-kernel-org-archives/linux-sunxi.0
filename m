Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A9B7A
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Jul 2022 10:10:54 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id n74so13111817yba.3
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Jul 2022 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZrbCxqggRZgufaB5CskDiyadw0Cspfud9ibS8+AuPuk=;
        b=Yk8iKP/8vgEX0WPSPr+xRjpb4dIH3/V3BA+FYO6VDhvl/l7xVvRWBfW+o9JMSJ75Da
         vOeoVGJolK3DH+lsn+4nESm60wjSPWdxXYhMbhnqqk2rPXQQBM/ffB+ZXcFtaSMiygzY
         M7cRaAK4NnsTxNDxzWkTSCfK+63tV1m6P7xwwrchzFAJsLUN7sprjd91MFbRFOJ0RspR
         LqZhBz4sczywLwXQovlWNaP/SUsyrBnUvQDa0s2Yns6nLEOuLK0wxODopQsxHl/1meOS
         sN9YMY792gkDzlgSacr08pVSd/QOsOt6GwTxkBww9q+xMszIH8jM00XA9hRtYrNWK/M6
         QEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZrbCxqggRZgufaB5CskDiyadw0Cspfud9ibS8+AuPuk=;
        b=LIVGRPGAxEJ4uG1Lp57HXsoqhozS+rxlsHyhgKpzfehJAPvDih8TAaR9xDuKUc9+xg
         KMMZD2/fq/XFEJ1ncx8EiJR6odweSuueg2Sfbk/zBg//atgxaSKtfGUTaUbCCeNpPVfY
         L4fEEThJXWTCpNmgkX8m52aS6vtw4YfBbBgYEcwzmeW2c2BW0wggdTIrTkIzv89wx2gh
         JoM+U8bZLX1Lo0dDCtJuhhFI/sc5YS4s/nhgS8J/f/Cr2FJcUNg8LrJe1jdJtVeJ4P7S
         k41/5XGLnlhRzkqR4D6B3FAhIzTLJtrftAFf/JzcX9q0+6g3rDeaxcKiFJx0Gy2UBtxf
         /eOQ==
X-Gm-Message-State: AJIora+s1lvnw+yBeE0BXGrmPpE/KIz+AotZYaUfZcYT6TOC58d2BofX
	pCVtVxqWQl7RqCXiwz0bPCltA6FuBxggTjrDlfI=
X-Google-Smtp-Source: AGRyM1teu7aOq5oE9YFjF4RCgZz+6u17KG+1hMabxQp9o6pQtFpCaQg2BbQgLOxu9d3xFPmAjzPnH6cpkiK6xgkJq3A=
X-Received: by 2002:a25:df97:0:b0:66f:6e7c:b3c0 with SMTP id
 w145-20020a25df97000000b0066f6e7cb3c0mr4621519ybg.93.1657620653173; Tue, 12
 Jul 2022 03:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220710081853.1699028-1-uwu@icenowy.me> <20220710081853.1699028-3-uwu@icenowy.me>
 <CAHp75Vdso_PGUomjmKaF1ytdUe4qLeAbpwkNmcRng9aNHs7g8w@mail.gmail.com> <7a947683de71e68a0925cfd4cab80238c3a03205.camel@icenowy.me>
In-Reply-To: <7a947683de71e68a0925cfd4cab80238c3a03205.camel@icenowy.me>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Jul 2022 12:10:15 +0200
Message-ID: <CAHp75Vc0kfQZJjdu+MrJAAdcR7GKD9Sh1zU4gz5dua5Lw9BVHA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: sunxi: add support for R329 CPUX pin controller
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 11:37 AM Icenowy Zheng <uwu@icenowy.me> wrote:
> =E5=9C=A8 2022-07-10=E6=98=9F=E6=9C=9F=E6=97=A5=E7=9A=84 21:06 +0200=EF=
=BC=8CAndy Shevchenko=E5=86=99=E9=81=93=EF=BC=9A
> > On Sun, Jul 10, 2022 at 10:22 AM Icenowy Zheng <uwu@icenowy.me>
> > wrote:

...

> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> >
> > No use of these.
> >
> > > +#include <linux/pinctrl/pinctrl.h>
> >
> > Missed headers:
> > mod_devicetable.h
>
> Thanks for these.
>
> In addition, how to decide what header should be included? The code
> works properly because of_device.h includes mod_devicetable.h.

The best approach is usually learnt with experience =E2=80=94 the more you
code, the more you get. One of the rules is to avoid too many
inclusions and at the same time reduce indirect inclusions, so that
the headers which are guaranteed to be included by others shouldn't
appear. Another rule is that, for the headers (*.h files) the forward
declarations are preferable over the inclusion in case if the opaque
pointers are in use.

--=20
With Best Regards,
Andy Shevchenko
