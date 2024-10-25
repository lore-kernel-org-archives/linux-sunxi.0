Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5722615ADA4
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867666; cv=none; b=ZLKwpis2w2HNin9GWUOrj7yN8tAocmM3r2Xtl4zhopI1B9XIDMzExtGXTRMI53UaAjKKcrYA+zJEwUXThBZbtS9pnyWBhZ7J2Rq/xZfWHbxXAYtMdur/osrTfta+zIFOOc9RyJZ4jVMNLdFK7iihEFcXbhpRZzquh5R3r//WYuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867666; c=relaxed/simple;
	bh=rv0sKfSP/YRFHSgY5CLAidWvnvn2HJW92USZDnpqTOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmc8rtT1/pltfXYI0EnHJMvCgwimCRECsnWoNaGKCtEB4qSBPXoPv8Kt1vEcfN4sE8xOs4DIJZSxZ2L80S6FInJkE5rMQr5G9f/+n/u6zEhobXmbpUvjlMeUMySLzDEm0VidJsPaA8BMjuZy+sGuY1l9GjmQ7mCiwBMcmdM/21U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f1292a9bso2735025e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 07:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867659; x=1730472459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMcatHSssIzBAMp8NeTODM9A2XszLfMDJPzpLz8VH0Y=;
        b=ABWymGU/ns2QturbyT+mQLovoGfdDVm9f+H9xYLQiYrRCOmxA56LyD+exg7Vo+Zcz3
         bURmJEFG9ciXQfdHwe9X7AcZNV53EigM/yEv+Tl+RHEp9K2Vsl0GW3TwCIIxyLqvu3Yi
         Jb+B2GMr36ktfjrUTwAB2wgmjkQY+yfb/u9ZRFhvzvsmmTqGXYMBRAkBiSKfACNvsWo8
         unZa2J8Grx2mSFyeEoU4FHnzNryLce/wG2U/2437QLnEcp6xeUV7swDCNtccjd5xTqb/
         SEOlQ3gG0cTB3dunDjrWIobJ8ESoRxOwoX8TT//uCzhjPUm23zOJ02D0rrwJGwCv2FSv
         0unw==
X-Gm-Message-State: AOJu0YxByXUimzyIS1lN/psw88kCmDdYD4mmwR0VI3RN9t+x2WYDIoS0
	ddIehG9/u50UaEGurCiJrpocHn++qvj5Ao12q8DUkRQxRcpv1+hEjfD4JwfVmo8=
X-Google-Smtp-Source: AGHT+IGZAa/NE5qFGVLMT/dTb22ZrxvW2glmzXccsaGJsoqWv4inIyaNO5z8x1Lb8dFxrBohXwVhpQ==
X-Received: by 2002:a05:6512:3b9c:b0:539:f1ad:b7a6 with SMTP id 2adb3069b0e04-53b23e67ceemr3536908e87.37.1729867658477;
        Fri, 25 Oct 2024 07:47:38 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1dee48sm205311e87.242.2024.10.25.07.47.38
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:47:38 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so18994781fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 07:47:38 -0700 (PDT)
X-Received: by 2002:a05:651c:50b:b0:2fa:dc24:a346 with SMTP id
 38308e7fff4ca-2fca82143ecmr39122861fa.21.1729867657676; Fri, 25 Oct 2024
 07:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <129f0c754d071cca1db5d207d9d4a7bd9831dff7.1726773282.git.dsimic@manjaro.org>
 <bef0570137358c6c4a55f59e7a4977c4@manjaro.org>
In-Reply-To: <bef0570137358c6c4a55f59e7a4977c4@manjaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Oct 2024 22:47:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66aody60h=Bpk49pxogq93FekmO48uThPET2RKxvx=OGw@mail.gmail.com>
Message-ID: <CAGb2v66aody60h=Bpk49pxogq93FekmO48uThPET2RKxvx=OGw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ondrej Jirman <megi@xff.cz>, Andrey Skvortsov <andrej.skvortzov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 5:11=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello,
>
> On 2024-09-19 21:15, Dragan Simic wrote:
> > The way InvenSense MPU-6050 accelerometer is mounted on the user-facing
> > side
> > of the Pine64 PinePhone mainboard, which makes it rotated 90 degrees
> > counter-
> > clockwise, [1] requires the accelerometer's x- and y-axis to be
> > swapped, and
> > the direction of the accelerometer's y-axis to be inverted.
> >
> > Rectify this by adding a mount-matrix to the accelerometer definition
> > in the
> > Pine64 PinePhone dtsi file.
> >
> > [1]
> > https://files.pine64.org/doc/PinePhone/PinePhone%20mainboard%20bottom%2=
0placement%20v1.1%2020191031.pdf
> >
> > Fixes: 91f480d40942 ("arm64: dts: allwinner: Add initial support for
> > Pine64 PinePhone")
> > Cc: stable@vger.kernel.org
> > Helped-by: Ondrej Jirman <megi@xff.cz>
> > Helped-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>
> Just a brief reminder about this patch...  Please, let me know if some
> further work is needed for it to become accepted.

Thanks.

There's no "Helped-by" tag, and checkpatch would complain. The closest
would be either Suggested-by or Co-developed-by, but with the latter
you would also need their Signed-off-by.

I can change it to Suggested-by if that's OK with you.


ChenYu

> > ---
> >
> > Notes:
> >     See also the linux-sunxi thread [2] that has led to this patch,
> > which
> >     provides a rather detailed analysis with additional details and
> > pictures.
> >     This patch effectively replaces the patch submitted in that thread.
> >
> >     [2]
> > https://lore.kernel.org/linux-sunxi/20240916204521.2033218-1-andrej.skv=
ortzov@gmail.com/T/#u
> >
> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > index 6eab61a12cd8..b844759f52c0 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > @@ -212,6 +212,9 @@ accelerometer@68 {
> >               interrupts =3D <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
> >               vdd-supply =3D <&reg_dldo1>;
> >               vddio-supply =3D <&reg_dldo1>;
> > +             mount-matrix =3D "0", "1", "0",
> > +                            "-1", "0", "0",
> > +                            "0", "0", "1";
> >       };
> >  };
>
