Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84258200128
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Sep 2024 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351500; cv=none; b=FCAJnqNINrt9uwqINMtgdr2e0BQ5t1+1MGjzH8Zyb0ciyRsiOTZkR8ssI+i9zzNVknrHOGnyY4Rn4S5nwiDo6+y2wyevDtgq4PV8AepPb84iPtg0TLe+CiMzvB92mJgG7/jPVBRlASKrjaX2B4Qg92SHqRhxUh0YNY//lWCX9as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351500; c=relaxed/simple;
	bh=0qhgQvbmbEChy9ODs3F6wH1NeF0LrzPomJ4kP8FDAJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWHaZanHPTVyhmV98McU0zzph3evdP0vwbEgn/AxknoL+SgNFlWcq1nOQr2sqTrrsenfukXRrgIL797EUqiqvD8aDeuzXi+dyj9CPKrZCMmV6PDa3YoFMWEjwK/tqcgbwGwhDySjhIvZWT/dxWUkAuKsaSfFyPha2Qp5JVBap/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcYq07UX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcYq07UX"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c26b5f1ea6so738161a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Sep 2024 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725351497; x=1725956297; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1ZJTZfVileTv9+Q3ffTr4495TIhf0ruixvRagHNqUI=;
        b=DcYq07UXiWrEdYvqgOsHuDoaqDiAYPhQ0TOK0qgaBBNKRyHSu68MgO0e9sbZwS4aO3
         ApeW0UGvsySpnyKaKPjBxnAOuc3QIBctfdeKFZTtt0yJSegjYv9Euj/9NeR5imQpePtb
         kQivAAZKN90GzF3FTZbA1Af7QlevLxlHnGQji04kOEnsuCidUuZGD3KaQomHgmwcXutd
         hmwu9/5LYbr4iUqe99r7MNZItS4RxJH6oedeWs2kLttCR8rgyTd1nKDwKvRHYXlkjrZD
         +diUmGltpPorHeUMKv5vKNdGcZ2RbUNc4BX7n5g5DWGtjOpO5JlL/U+sYEXEuFXQ0w7F
         2g7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725351497; x=1725956297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1ZJTZfVileTv9+Q3ffTr4495TIhf0ruixvRagHNqUI=;
        b=q4yESwR7EuhHFkIaUHybZTkyDAAiGFS4a+nM7E7rkth55mPRysB9UGOEglVowE4F5f
         0dw5aW3IY23WbPy9HOiU7Js9EmDNMyNAFO5W/QcPhXcqHbvLB4BPESr4ZcNH8QNgiMGP
         ML0YZ9X6c+APxqZjQH8zfj1DNUrHuNLhZkxvRloKjb6kz3dYEpa6SOVr9cWPtVB/O6fT
         PO/neU6OTYTZe3EHFLtctd+S2Bsj9/ePMctf9Nu3etDC7HPTCRSauUj5mgAGE8nNN11k
         kUuuTfs8B+tnKIJ3hccHOYW2//cy+mEXhIJ4Bv4OWf2uzPuU72R13Dq2KdKRy9tt+AHv
         tM/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi7HB0lYF3Mg66HhKV46OBSmokFYq5t7WT0DYILbRcKoEc4hnYlwuYG+jk6GKNbOilIkWZw1t+jHE48w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4/DJEN0+2yN2aOfjss8aV5jKM+cyt50FiuHvABclKutsDs8Np
	yyBCaTbNrEwFkpagreiHpe2Qv0g9ioqCYmoD45qGQijZN/ImLhptQbmZDY3X+M0dYvoiRJoicD2
	AKfScjsCWv11wMOm01Yucwqtl/dLW1w==
X-Google-Smtp-Source: AGHT+IExhj9TbMIPpSAOQYnqhVtfgFz6Kh0TSu3TC4/B/lDTork0FER+WAdlyBXzR46cNlF8Xc3va8CNxWlCHaeeyrE=
X-Received: by 2002:a05:6402:3589:b0:5a3:8c9:3c1d with SMTP id
 4fb4d7f45d1cf-5c25c3ad6c5mr5258725a12.14.1725351496227; Tue, 03 Sep 2024
 01:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240901122135.1389702-1-pbrobinson@gmail.com>
 <20240901122135.1389702-3-pbrobinson@gmail.com> <34afe6c1857190a23521815d85660f6125f0d302.camel@icenowy.me>
 <5bbdd041-02a3-41de-832b-7f68cadca073@arm.com>
In-Reply-To: <5bbdd041-02a3-41de-832b-7f68cadca073@arm.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 3 Sep 2024 09:18:04 +0100
Message-ID: <CALeDE9NzerV+Da=aRuFg7H6QM27LB5ojvSFfkCiCfwVJTixsag@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a64: Add WiFi/BT on Pine64
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Sept 2024 at 09:08, Andre Przywara <andre.przywara@arm.com> wrote=
:
>
> Hi,
>
> On 03/09/2024 06:50, Icenowy Zheng wrote:
> > =E5=9C=A8 2024-09-01=E6=98=9F=E6=9C=9F=E6=97=A5=E7=9A=84 13:21 +0100=EF=
=BC=8CPeter Robinson=E5=86=99=E9=81=93=EF=BC=9A
> >> Enable the rtl8723bs WiFi/BT modules on the Pine64.
> >
> > I think the maintainer previously prefer to enable these modules with
> > DT overlays.
>
> Yes, we cannot have this enabled unconditionally, especially since this
> is explicitly given as the reason for the first two patches.
> So either this would just stay on the list, for reference, (maybe marked
> as DON'T MERGE), or, better: we indeed rewrite this as an overlay.

Yes, that's why it was separate, I wasn't sure how to label it TBH.

> I will give the series a test once I am back with my beloved boards.

Thanks.

> Cheers,
> Andre
>
> >
> >>
> >> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >> ---
> >>   .../boot/dts/allwinner/sun50i-a64-pine64.dts    | 17
> >> ++++++++++++++++-
> >>   1 file changed, 16 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> index f04f0f1badc4..1d514859e664 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> @@ -138,6 +138,14 @@ &mmc1 {
> >>          mmc-pwrseq =3D <&wifi_pwrseq>;
> >>          bus-width =3D <4>;
> >>          non-removable;
> >> +       status =3D "okay";
> >> +
> >> +       rtl8723bs: wifi@1 {
> >> +               reg =3D <1>;
> >> +               interrupt-parent =3D <&r_pio>;
> >> +               interrupts =3D <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
> >> +               interrupt-names =3D "host-wake";
> >> +       };
> >>   };
> >>
> >>   &ohci0 {
> >> @@ -303,7 +311,14 @@ &uart1 {
> >>          pinctrl-names =3D "default";
> >>          pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> >>          uart-has-rtscts;
> >> -       status =3D "disabled";
> >> +       status =3D "okay";
> >> +
> >> +       bluetooth {
> >> +               compatible =3D "realtek,rtl8723bs-bt";
> >> +               device-wake-gpios =3D <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /=
*
> >> PL6 */
> >> +               enable-gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4
> >> */
> >> +               host-wake-gpios =3D <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /*
> >> PL5 */
> >> +       };
> >>   };
> >>
> >>   /* On Pi-2 connector */
> >
