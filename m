Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A4D1FCC;
	Thu, 27 Apr 2023 07:46:59 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-54fb9b1a421so63640927b3.1;
        Thu, 27 Apr 2023 00:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682581619; x=1685173619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEqTvNM+jsZjZI+7JGQt1mFWY94TcOH6GPmA2DQxr8s=;
        b=Zp4SaR51jlbUyO1i2r8B069QTMaXgl5ATuiY8M3iJlqg4LwDwur7eXXSayR6s6gd5D
         E2q3o4WkD38enY/juVLcJqYgMBkhsHIomJ7tmlutvYY6phcWpKLUfYp/lDPYDdzViRne
         7gnDINT8BME7TC26hj16BUIl/nIvN4lq5lBnAJ0sIVqp4Hsv10vcjjs1riVJS8x6+fhY
         FWphcUbKFvhCSuqOayTSlFI4PATtEL8ZGq5HTkazETEJooXwqSxf79ZmNlYKLMHoUw8s
         ore7EpEjP/RVcP+ULxyN//Dv+/Te9zRmOatYHQMFPNzENzwvT0/1u2OqskXO6bezSgk0
         g9pQ==
X-Gm-Message-State: AC+VfDznUAVHz0E620o7eBqw2nX8u8wdFW0pXh7X8/xqy/N8j1+D9gOR
	cRA87ir9ZIP9Abw46M2eewcRcdJnAvG+tw==
X-Google-Smtp-Source: ACHHUZ6qx+XOOsG8KpHPzlR5vlX2ps2PNmOzwpMSTwJKR+TOZYjkk9tFVTCaBXB+NGAnJt+GBXgNTA==
X-Received: by 2002:a0d:e28b:0:b0:533:1853:9a1f with SMTP id l133-20020a0de28b000000b0053318539a1fmr563764ywe.39.1682581618561;
        Thu, 27 Apr 2023 00:46:58 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id h1-20020a81b401000000b0054f80928ea4sm4600521ywi.140.2023.04.27.00.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-54fb89e1666so63620977b3.3;
        Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
X-Received: by 2002:a0d:d712:0:b0:54e:ed46:6b39 with SMTP id
 z18-20020a0dd712000000b0054eed466b39mr582224ywd.31.1682581616022; Thu, 27 Apr
 2023 00:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com> <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
In-Reply-To: <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Apr 2023 09:46:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
Message-ID: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Ansuel Smith <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 9:37=E2=80=AFAM Matthias Brugger <matthias.bgg@gmai=
l.com> wrote:
> On 25/04/2023 17:57, Rob Herring wrote:
> > On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> >> On Tue, Apr 25, 2023 at 12:16=E2=80=AFAM Rob Herring <robh+dt@kernel.o=
rg> wrote:
> >>> I have a script[1] that does the conversion written the last time thi=
s
> >>> came up. Just have to agree on directory names. I think the easiest
> >>> would be for Arnd/Olof to run it at the end of a merge window before
> >>> rc1.
> >>
> >> "emev2" and "sh7" are missing for renesas.
> >
> > No doubt it's been bitrotting (or I may have missed some).
> >
> >> Does your script also cater for .dts files not matching any pattern,
> >> but including a .dtsi file that does match a pattern?
> >
> > I assume I built everything after moving, but maybe not...
> >
> > That's all just "details". First, we need agreement on a) moving
> > things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> > been stuck on a) for being 'too much churn'.
> >
>
> I think it makes sense to move them and probably the best way to do so is=
, as
> you proposed: that Arnd or Olof run the script to move them just before -=
rc1

FTR, no objections from my side.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
