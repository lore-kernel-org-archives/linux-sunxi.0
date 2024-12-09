Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4AC13BAEE
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Dec 2024 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733767408; cv=none; b=fERHe4vAywhzJoaIH/p89hDWPOo1eEzNSAJmtvPCV/swLtofz1yJY1NWzMGlv/QPGqIu0pFp2WNS+mgnSbDbO7n++/6p3hr+rFd7qafIvbrgVlTjTjTPC4n1LRiMIn7d/9gqgVpidOZ+5WsN+bX/M/QMfTqXAXxnvJBjtCFC10Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733767408; c=relaxed/simple;
	bh=EttPOx8CTHWiEQjm6kODu7k6KrmesqYnGdfpbFKYER8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vual/LmfPomRpWwsrwqCfQD9LzdkQL/BCb2lYkSKPGaROw/i8V92P8QK6WuHd/4hd9kXlynWwpsLAeR/Ics1hh0Kl7IB/5QLRwQQJcPEm8/PASJsGOitWr4U1OIyx4BSjh2jH+NwJDZp16Hzb6zzsX0lj4MmQht7hLhnr3ZctXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df6322ea7so5436020e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Dec 2024 10:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733767403; x=1734372203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vt1eQkp9pAQVTjzNi7SG9xZxFIH63Nwe6vPPAcwIYGQ=;
        b=S7HfJy95qjnnD+VV3FJl41nNcUUirQRno9eu0rvfHCkY7tUQbP19oxh2UzjgzTlXUJ
         Rt1WyvqN7lOP1VtPpox55uAD8QqkyuBjJbuJn2Qp1Nmtq49Fdic2F/rtmEActhAfTgPI
         M2Xcjj8L4sh0RaIfcztFpEpnpaOx6GUX840gbg8KxCPhuvqEidbwUUc+FoKQu102J4LB
         8XeaPMwDhTn//1sXrrIgCxTKIcZnUKTbfZbO63bS7biGGVlYW7dvkQGtXZfH0ZGLlzEg
         sba3nTzmiBOD5i1QTISBa7Mo/xMqY0HojZoHJfOzRPjWIZifUtW5bjQfoSbaIIyJ4n85
         ocQA==
X-Forwarded-Encrypted: i=1; AJvYcCXIFPetKg+pQg0FpUHAeL8I3P9mJNJZJLlbDRcKIcAfLeQOQ2mfLxe0Jb8ln91fBugxbb03oc82i/9geQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsF+U8l9eQab6hCHNwd2S+IKju0G8GVeUzT/b5HjMop4QO756/
	qeQUNI+dLloCDgvwMKgUYVceGcwkOHbxhMVDJEEtWHJyfAbtxUe3KSRJRg==
X-Gm-Gg: ASbGncvO0tg+9m2YpoPKQqjYtrX/WwxoTCLB1RFmurZpMhLDnf+rnAqYkpsYzy+KF/t
	r4sBI0kKXVEWc8Qsxeuo8ck9/AHzDRnz+zuQQQVL2P+ofwWIybeF/LpI9tj+YDDiIGJwgiy/f9S
	PANGmGX9UgLu4ZRODfAhsNGNtbmAUVfPppwz0aV/RZRMRReO2Mqq4QF0QZ6qbPpQJ7vYYLPNChV
	LUE3VKhKB07l0XzqQRPbS812al7R+f/G8PEClAJ39mx9vGvgUpOPSI6BrHVJDpGyMgF9dwHmJeV
	VD8XyUU=
X-Google-Smtp-Source: AGHT+IF7eSvx0ddnd8jKtV6WhntxDTE0auRpEL72VINMUwLnboUurYO1yS+etNfBaE6Cq8pZ10ucMg==
X-Received: by 2002:a05:6512:ba5:b0:540:1b2d:8edc with SMTP id 2adb3069b0e04-540240aaec6mr593108e87.9.1733767402565;
        Mon, 09 Dec 2024 10:03:22 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53f93377eefsm723373e87.67.2024.12.09.10.03.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 10:03:22 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so42586201fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Dec 2024 10:03:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxWV5PjhsR/E32uaenoVZkk8On/oiWoe49iMurYTMpv7Ij56T4FzR/7JkVc0YfIOXqcCjZUqoK16Xx7w==@lists.linux.dev
X-Received: by 2002:a05:651c:509:b0:302:2cb3:bb25 with SMTP id
 38308e7fff4ca-3022fd7da65mr6276521fa.29.1733767402058; Mon, 09 Dec 2024
 10:03:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
 <20241205000137.187450-2-csokas.bence@prolan.hu> <20241209175637.283312fa@donnerap.manchester.arm.com>
In-Reply-To: <20241209175637.283312fa@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 10 Dec 2024 02:03:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v644AgZvuOmvQCUXGWyJWYCgVnCkVohNdD-Z0FhgOrp1cQ@mail.gmail.com>
Message-ID: <CAGb2v644AgZvuOmvQCUXGWyJWYCgVnCkVohNdD-Z0FhgOrp1cQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: suniv: f1c100s: Add support for DMA
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mesih Kilinc <mesihkilinc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 1:56=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Thu, 5 Dec 2024 01:01:36 +0100
> "Cs=C3=B3k=C3=A1s, Bence" <csokas.bence@prolan.hu> wrote:
>
> > From: Mesih Kilinc <mesihkilinc@gmail.com>
> >
> > Allwinner suniv F1C100s now has DMA support. Enable it under device
> > tree.
> >
> > Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> > [ csokas.bence: Rebased on current master ]
> > Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
>
> Compared against the manual:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

These have already been merged. I picked them from their original
series.

ChenYu

> Cheers,
> Andre
>
> > ---
> >  arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/=
boot/dts/allwinner/suniv-f1c100s.dtsi
> > index 3c61d59ab5f8..290efe026ceb 100644
> > --- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> > +++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> > @@ -6,6 +6,7 @@
> >
> >  #include <dt-bindings/clock/suniv-ccu-f1c100s.h>
> >  #include <dt-bindings/reset/suniv-ccu-f1c100s.h>
> > +#include <dt-bindings/dma/sun4i-a10.h>
> >
> >  / {
> >       #address-cells =3D <1>;
> > @@ -159,6 +160,15 @@ usbphy: phy@1c13400 {
> >                       status =3D "disabled";
> >               };
> >
> > +             dma: dma-controller@1c02000 {
> > +                     compatible =3D "allwinner,suniv-f1c100s-dma";
> > +                     reg =3D <0x01c02000 0x1000>;
> > +                     interrupts =3D <18>;
> > +                     clocks =3D <&ccu CLK_BUS_DMA>;
> > +                     resets =3D <&ccu RST_BUS_DMA>;
> > +                     #dma-cells =3D <2>;
> > +             };
> > +
> >               ccu: clock@1c20000 {
> >                       compatible =3D "allwinner,suniv-f1c100s-ccu";
> >                       reg =3D <0x01c20000 0x400>;
>
>
