Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C019258E
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Nov 2024 02:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730859614; cv=none; b=lx3EGboiLxH/Gz+5u6+fRchrWVgl49wO58i4HThBSLGbi27v/MNFGW+WD0mH3TW0htF5oc4UWuPyDBpey+jJIE7BfWzybibI4WKEolmhs/cNSkURAFeelXAyKTjbcoO3cCa9higeaqIZj+ixDSw1OM73CVaTRB+Zu2DSXROZY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730859614; c=relaxed/simple;
	bh=hciusCmQ46W/T2AcAGCqFbobcRKG3w7tjodOgj0wnp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q04nID5+kpMiQGYkhmn3KWZ35cG9jaf3H2PXqsv75AefW/VK7ejbgluQp9sfhv7d5ZamABBYBWUsHRqiMmuTdDqIe9JJUeJDpmZLGY31TQ4PJjEjzVhyFC8iXiN6S5onQ0DGaR+f0GMhgjCjLRZ5ivn4l+N0U3qkJT72ooZJ27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb49510250so62513451fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Nov 2024 18:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730859608; x=1731464408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8a8+IO/gHzs/8HUWMdym7QT6xBD7UjDO0WtfEtRhaE=;
        b=Phqeia9vzSYF6k/7UX7g8Ubs1xXENKrldr1D+QkWbgUnd7F4eZ2ITnSTfTdNzbx62b
         JaX2RBWGMnPSBh2+j6rkeFU4mFByfPJ3e9qJbUO3nvNNENu6GTXpihi0wS00DLqynE7P
         EP9tvj+cuLqg4T2T6OSF9R5lF9SskWemhv6GLqY/85My3LOf9r3Iu//MetvCwO093AJf
         Nd8hHyih1xwILTUIJ7kStFp8t7BrdJJFWa/sYvlxJagm4cdmkDVhkHg+TqOjkAzyZirJ
         LdEBgdcTgB6HAYeHM/i282XgZqGNqNf50w3dtNTsnN+dSbKLpmskKSlm03DpmfaiJOdz
         /Uig==
X-Gm-Message-State: AOJu0YzfMkDMz8p9as38bdGyyVQ9IsvjvUGmIoenzPr4lE9s31sbbM4y
	ZZ3g3nqD23c5Lv9E4aJ4WkfuzN78+lcqx5DAwZvANrtHug0NxgqyalCI0sku
X-Google-Smtp-Source: AGHT+IHQQLwCD7+H0e3RTURsWQoz6O+slYnvfhU0G9n2fB/gCFVqlNMwxzS7yFlJN5S0zwUq5R9jug==
X-Received: by 2002:a05:651c:1987:b0:2fb:6465:3198 with SMTP id 38308e7fff4ca-2fdec4ca375mr113573401fa.5.1730859607896;
        Tue, 05 Nov 2024 18:20:07 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d6903sm23348501fa.46.2024.11.05.18.20.05
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 18:20:05 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso45263031fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Nov 2024 18:20:05 -0800 (PST)
X-Received: by 2002:a05:651c:556:b0:2f6:649e:bf5c with SMTP id
 38308e7fff4ca-2fdec726444mr95931291fa.17.1730859605489; Tue, 05 Nov 2024
 18:20:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <129f0c754d071cca1db5d207d9d4a7bd9831dff7.1726773282.git.dsimic@manjaro.org>
 <bef0570137358c6c4a55f59e7a4977c4@manjaro.org> <CAGb2v66aody60h=Bpk49pxogq93FekmO48uThPET2RKxvx=OGw@mail.gmail.com>
 <cfc090cb87a8b926116d1a436694d17d@manjaro.org>
In-Reply-To: <cfc090cb87a8b926116d1a436694d17d@manjaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 6 Nov 2024 10:19:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v67fLPf-yKObuds3LC77gT_W_OmgSK5y2KotRC-Zn9aL7w@mail.gmail.com>
Message-ID: <CAGb2v67fLPf-yKObuds3LC77gT_W_OmgSK5y2KotRC-Zn9aL7w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ondrej Jirman <megi@xff.cz>, Andrey Skvortsov <andrej.skvortzov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2024 at 12:11=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Chen-Yu,
>
> On 2024-10-25 16:47, Chen-Yu Tsai wrote:
> > On Wed, Oct 23, 2024 at 5:11=E2=80=AFAM Dragan Simic <dsimic@manjaro.or=
g>
> > wrote:
> >> On 2024-09-19 21:15, Dragan Simic wrote:
> >> > The way InvenSense MPU-6050 accelerometer is mounted on the user-fac=
ing
> >> > side
> >> > of the Pine64 PinePhone mainboard, which makes it rotated 90 degrees
> >> > counter-
> >> > clockwise, [1] requires the accelerometer's x- and y-axis to be
> >> > swapped, and
> >> > the direction of the accelerometer's y-axis to be inverted.
> >> >
> >> > Rectify this by adding a mount-matrix to the accelerometer definitio=
n
> >> > in the Pine64 PinePhone dtsi file.
> >> >
> >> > [1] https://files.pine64.org/doc/PinePhone/PinePhone%20mainboard%20b=
ottom%20placement%20v1.1%2020191031.pdf
> >> >
> >> > Fixes: 91f480d40942 ("arm64: dts: allwinner: Add initial support for
> >> > Pine64 PinePhone")
> >> > Cc: stable@vger.kernel.org
> >> > Helped-by: Ondrej Jirman <megi@xff.cz>
> >> > Helped-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> >> > Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> >>
> >> Just a brief reminder about this patch...  Please, let me know if some
> >> further work is needed for it to become accepted.
> >
> > There's no "Helped-by" tag, and checkpatch would complain. The closest
> > would be either Suggested-by or Co-developed-by, but with the latter
> > you would also need their Signed-off-by.
>
> Thanks for your response.  You're totally right about checkpatch.pl
> not supporting Helped-by tags, but including neither Suggested-by
> nor Co-developed-by would fit very well in this case, because the
> associated level of credit falls right somewhere between what's
> indicated by these two tags.
>
> > I can change it to Suggested-by if that's OK with you.
>
> I've created and submitted a patch [*] that adds support for Helped-by
> tags to checkpatch.pl.  Let's see what kind of feedback that patch
> will receive, and then we'll be able to move forward accordingly.

There doesn't seem to be any activity. Maybe also try adding it to the

    Documentation/process/submitting-patches.rst

document?


ChenYu


> [*]
> https://lore.kernel.org/linux-kernel/0e1ef28710e3e49222c966f07958a9879fa4=
e903.1729871544.git.dsimic@manjaro.org/T/#u
>
> >> > ---
> >> >
> >> > Notes:
> >> >     See also the linux-sunxi thread [2] that has led to this patch,
> >> > which
> >> >     provides a rather detailed analysis with additional details and
> >> > pictures.
> >> >     This patch effectively replaces the patch submitted in that thre=
ad.
> >> >
> >> >     [2]
> >> > https://lore.kernel.org/linux-sunxi/20240916204521.2033218-1-andrej.=
skvortzov@gmail.com/T/#u
> >> >
> >> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
> >> >  1 file changed, 3 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> >> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> >> > index 6eab61a12cd8..b844759f52c0 100644
> >> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> >> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> >> > @@ -212,6 +212,9 @@ accelerometer@68 {
> >> >               interrupts =3D <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
> >> >               vdd-supply =3D <&reg_dldo1>;
> >> >               vddio-supply =3D <&reg_dldo1>;
> >> > +             mount-matrix =3D "0", "1", "0",
> >> > +                            "-1", "0", "0",
> >> > +                            "0", "0", "1";
> >> >       };
> >> >  };
> >>
