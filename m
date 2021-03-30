Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF970
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 14:05:47 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id u9so25011184ejj.7
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jGFF9gdonKt1Ey7EFMkwXk5G5SyST+KFl475vOEXsnA=;
        b=hN1KXQB6gjh8kexBKcrelNe8Sz4rfhPoccrZdPuN4usGsTRZFYPCMAr3NGtf3wcSqB
         /+RFavdLPO15oWZxdfUp578dEn8es0bzJ7CUyPCNOO/poa8689P0Ueqa8czz8Njt/u1z
         f0b0ErUgK+mIdX0x4DbttqBecDI91IXXySU5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jGFF9gdonKt1Ey7EFMkwXk5G5SyST+KFl475vOEXsnA=;
        b=PYQ7OYVPQAT/gilQFBEwk2vp7qDatW2vvZyaxH4fxUf96HlZmEZupHM375xtnShI7Y
         0W5LsNZ2xh54H8w1r3q/x+42d72XAZJ4ogV4Yq57T+gaMDfuqjuckgiqSfMj45SwaZxP
         TU1Zkj7aNmWcz2y0fpjtfMdxWxsZEhrYewPJSLiBQutQASZLQkopSBk8/p6RYNkUpda0
         DvOZA9i8R2An7JZMhu6WtlLUXbbr/TbxzUwOabXTWzCaXo97ke/8WC07W8TarNRVlx4n
         M32TCoImg9FoocMuIoL1Dj0cXzxdTWpMJuzp3Qcqh4P4fjMokopzl2oOquhJbPyvY9WF
         ovoQ==
X-Gm-Message-State: AOAM533EmObJEtHLRA6zJR07jGczlDIPuvUitgEogru6UNB28F+GMxcL
	JCHL+X2Tp5wF824ITBOe4xkX3RH2dIvX8eD+mJtWUg==
X-Google-Smtp-Source: ABdhPJwMS/K6RYtxbzf950h8vh3nOccngkIxXxgRMbpaJsd699dOb8aup1+c9oabgjJ+AWmgxHWfGGBUcTB82R8jpMA=
X-Received: by 2002:a17:906:2bc3:: with SMTP id n3mr33741675ejg.418.1617113146311;
 Tue, 30 Mar 2021 07:05:46 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210330130122.3915-1-andre.przywara@arm.com> <20210330130122.3915-3-andre.przywara@arm.com>
 <CAMty3ZDpETzmE=1CRo2d3yT4FN0nSi7p+pvf8cLjBSwfu7Kpkg@mail.gmail.com> <912b7c69-fdac-8e2d-9d52-b28141beb299@sholland.org>
In-Reply-To: <912b7c69-fdac-8e2d-9d52-b28141beb299@sholland.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 30 Mar 2021 19:35:34 +0530
Message-ID: <CAMty3ZDLJHgaj0CHbo6rpb3+1-Qz+z1fPiBzkBub9ZDC4mdoJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] sunxi: dts: H616: Drop reserved-memory node
To: Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>, 
	Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, 
	U-Boot-Denx <u-boot@lists.denx.de>, linux-sunxi <linux-sunxi@googlegroups.com>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 30, 2021 at 7:21 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 3/30/21 8:28 AM, Jagan Teki wrote:
> > On Tue, Mar 30, 2021 at 6:31 PM Andre Przywara <andre.przywara@arm.com> wrote:
> >>
> >> Trusted Firmware now adds the /reserved-memory subnode to the DT at
> >> runtime[1], putting in the right values.
> >>
> >> Drop our hard-coded version, as this might clash with the actual values
> >> (which have also changed), and rely on TF-A to add the node.
> >>
> >> [1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7770
> >>
> >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>
> Reviewed-by: Samuel Holland <samuel@sholland.org>
>
> >> ---
> >>  arch/arm/dts/sun50i-h616.dtsi | 12 ------------
> >>  1 file changed, 12 deletions(-)
> >>
> >> diff --git a/arch/arm/dts/sun50i-h616.dtsi b/arch/arm/dts/sun50i-h616.dtsi
> >> index 953e8fac20f..dd4d2f31111 100644
> >> --- a/arch/arm/dts/sun50i-h616.dtsi
> >> +++ b/arch/arm/dts/sun50i-h616.dtsi
> >> @@ -51,18 +51,6 @@
> >>                 };
> >>         };
> >>
> >> -       reserved-memory {
> >> -               #address-cells = <2>;
> >> -               #size-cells = <2>;
> >> -               ranges;
> >> -
> >> -               /* 512KiB reserved for ARM Trusted Firmware (BL31) */
> >> -               secmon_reserved: secmon@40000000 {
> >> -                       reg = <0x0 0x40000000 0x0 0x80000>;
> >> -                       no-map;
> >> -               };
> >> -       };
> >> -
> >
> > As said always. it's better to not touch Linux dts files. If the same
> > fix same available in Linux add SHA1 on the commit message otherwise
> > keep /delete-node on -u-boot.dtsi. This how we are maintaining sofar
> > at least on sunxi.
>
> This file has not yet been added to the Linux tree, so that rule does not apply
> in this case.

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
