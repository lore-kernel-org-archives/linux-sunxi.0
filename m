Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C037A
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Jul 2022 10:12:16 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id e69so13134664ybh.2
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Jul 2022 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zGLFrLBHG+1vv4/3v4Wd5AI8LgLowaMQ1bylMp8eakU=;
        b=QLb4YxBFgvCvVSM3WWcpg/dUiKZWa7PTOwW655/JTyr59QyvjD5FM95w9faZhye6CX
         9uFJ6x8kItnEYz5Kr3Wwl1WASKa2yXCfqytF06RseZjJoHh+cBDmw+tEtqUClRzBr/Oc
         iBYMzopVI0D82GFaEUbNFxjPX+8mxdhUm/qfoe9WOi9H2oIXD5j19d4BqFX67m/fHKFs
         kOzWcpgEpnhmb+qTosCLhQThWYUwrIzcrtp2m7e4ZGfQAGDZ9vZlmR5p8ttPWQ1/RXEI
         /uO5wgRSY7ByZPDUTvjPDRIe2Sij5lJx5kx2OZcc+8MsTWSPZGrXnyfHbOdiOXD9kJ4Y
         WtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zGLFrLBHG+1vv4/3v4Wd5AI8LgLowaMQ1bylMp8eakU=;
        b=Dg4KvARVkJ9/+M+I/tnZjwLt5PduTlX1zKNbQJA65BVarUIHKf/M1+C5y4D6zpdN9E
         4N1avdkoO/xehcq9c14mftB202THWa6QgnDOh5m+g+8lYK2+/aD/U7XK4UipAejLKyo7
         CSdFdQij9fFbtUY4k+F4htBLg1HokD2RpxRt3VqxUA7YtAOo2waYo6n5z+KX4fvDvURq
         GhSPlm5I2d9KrIsyiMUK1HhyjcPJLaxJ5mOqQNasxB3GsDV95xUqAVqRmfJEY7tNlWTq
         YbBfTCEWJTLGvcn+DP59jAg8DrBY+DBg+N8119npar0lepivchwUY3m4/c8L/9oobXgP
         hJZQ==
X-Gm-Message-State: AJIora8/YhbdYW9uhJzSV6PVw8gVmedOEEx360FOpdD1qiGJhQvgGO2R
	WURpyV4iyH5I4hx9I6UMQPyEhcrPGOKtL1PPlx0=
X-Google-Smtp-Source: AGRyM1uHJNRmgjQfalyLG4jytq0xStL7w+XWRtNelxM3bTZS79V1VyOF1h+TbGs8VkEMK0RdJshJwdamh4TFrh8p69I=
X-Received: by 2002:a05:6902:10c9:b0:668:e27c:8f7 with SMTP id
 w9-20020a05690210c900b00668e27c08f7mr21528639ybu.128.1657620735969; Tue, 12
 Jul 2022 03:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220710081853.1699028-1-uwu@icenowy.me> <20220710081853.1699028-3-uwu@icenowy.me>
 <CAHp75Vdso_PGUomjmKaF1ytdUe4qLeAbpwkNmcRng9aNHs7g8w@mail.gmail.com>
 <7a947683de71e68a0925cfd4cab80238c3a03205.camel@icenowy.me> <CAHp75Vc0kfQZJjdu+MrJAAdcR7GKD9Sh1zU4gz5dua5Lw9BVHA@mail.gmail.com>
In-Reply-To: <CAHp75Vc0kfQZJjdu+MrJAAdcR7GKD9Sh1zU4gz5dua5Lw9BVHA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Jul 2022 12:11:39 +0200
Message-ID: <CAHp75Vcv3zVGjty_vLUgYu3sowNtg-sWg=qtVt7Vp6mqX6pLvg@mail.gmail.com>
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

On Tue, Jul 12, 2022 at 12:10 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jul 12, 2022 at 11:37 AM Icenowy Zheng <uwu@icenowy.me> wrote:
> > =E5=9C=A8 2022-07-10=E6=98=9F=E6=9C=9F=E6=97=A5=E7=9A=84 21:06 +0200=EF=
=BC=8CAndy Shevchenko=E5=86=99=E9=81=93=EF=BC=9A
> > > On Sun, Jul 10, 2022 at 10:22 AM Icenowy Zheng <uwu@icenowy.me>
> > > wrote:
>
> ...
>
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_device.h>
> > >
> > > No use of these.
> > >
> > > > +#include <linux/pinctrl/pinctrl.h>
> > >
> > > Missed headers:
> > > mod_devicetable.h
> >
> > Thanks for these.
> >
> > In addition, how to decide what header should be included? The code
> > works properly because of_device.h includes mod_devicetable.h.

Forgot to put in the first place this:

The rule of thumb is Include headers that the header or C module is
direct user of. Additional information is located in the sections
below.

> The best approach is usually learnt with experience =E2=80=94 the more yo=
u
> code, the more you get. One of the rules is to avoid too many
> inclusions and at the same time reduce indirect inclusions, so that
> the headers which are guaranteed to be included by others shouldn't
> appear. Another rule is that, for the headers (*.h files) the forward
> declarations are preferable over the inclusion in case if the opaque
> pointers are in use.

--=20
With Best Regards,
Andy Shevchenko
