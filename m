Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D39915B987
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Sep 2024 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726657215; cv=none; b=kWzpLefCRzTRH/zlzzS4oIx35RR+qjD4+qX98y/6H8GH1nQfOZ3xwvuK+RQZ/y6uOSgYFiLd/7hDtaTw9B3PJrDizGWkCOHAcdVaWPa+FV3cyDVnEpDf5jFaa43cB2fjMe1cn35zmXZfaldYAcicMlv7Mn7IJLFeuA34/iikl/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726657215; c=relaxed/simple;
	bh=fFDG2O6uVfN5BabQK+bFRTLg6JogWoNvGo3M5U/0W38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1BVOEfZLh3Ey0W7KkKtjRBRHH+ztvDrwFkL5LdCYtaBJuD5ryKqjqBDk+kKOQBZhZuh1/JC0xsjw8dkJXFTQd/X1Az0iXamtI7df8h2M/rwKuJBmMdiUfN1AiASQjdMbUA9R061Wfshh2sJOd0PRk+Oz2FUB8ch7VKZabfuN/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j//wgPhV; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j//wgPhV"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-535694d67eeso724077e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Sep 2024 04:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726657212; x=1727262012; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyoz+r3z2fTtTxOXwV3PfYzr+O9ELMQOoDfKks2rgks=;
        b=j//wgPhV/6/mrTK+L4sL9Xoo3X5sGC8j3a5YgcAG1eogMQcWBJDAPfM/f7l67KqRhh
         8Ye8SZkWaJ9xYDUXh0wNp3ZDpYM3rEw6yRPyo/jhyg7FRmBVK/k8sqN3Rpb8wQn6itiN
         oVO1q6gWKSHUwtgbAdtxLmLqnnR68b16z/PnRHOlrHir2UA1XtZWf1aEFsr5S5LRnEvW
         db0B69G++fujXLlCMQQlW6ZenGpBc3xv64Md7XrVCtM00BuBqNB6EmxRUh4rCaAJ7/Q+
         Bnnt1K5tB6mJeuyNkqomndQEWtgbjzRIMKQP5XrdetYFgWX3WpLmCF44VgpDoqiQXIHE
         Ur8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726657212; x=1727262012;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyoz+r3z2fTtTxOXwV3PfYzr+O9ELMQOoDfKks2rgks=;
        b=fb2FcQfXfEKwqSNTecd2EF4yquv+SUMrDex87QS4oMrkTMH+h2rR0LCIlocjK+XE57
         3dmHdK8Q9pCn9SYeauJo2Q1sbTrIJIglperWmRjxlu+Cj98Ze2CfVgW7iT5UXZ4L55SC
         I3ZclAO11pI99UXxcf+52vqp1FrSS+/WJ8KlOBC9E8AroBRmLYhjkgBcUkMQXkFMoLiG
         OwwU6WcYprLWKC9Pv46FLPdmfwb4TLovxhLiuVo91ZtFlIXFu8uDRGQkeHRMhniXB6yC
         SyGDhF7vQT+tzlc7sIrFUayX8TBdJhFWQuZL6Udh+KJ4ZHSiewU6uPC6oY8plVXoJDVT
         rN6g==
X-Forwarded-Encrypted: i=1; AJvYcCVSIVadcYumPrbS3UgLDomflhhYB8ZqNQhCZULRtKyRPG5JsARBU2aDnaecQpLWpyWQ6DMAU1NfQzzY2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+4rPqZtDu8T4lEXxDA/BJQ8Ar4jGUsF/XxVD/Ohl2osvjhJ1A
	irgM0nROvXE6Hwk9w6pm7RD1PXPMj37P632WsjS2dDmBy/Rl+w2C
X-Google-Smtp-Source: AGHT+IFlJ2O1ZZMm0urEG0PIruAPf3kfHMNdT/Jxt4BdRNZGgUDCk9cJYsWZo8HwEHhRbUhpLyeHCw==
X-Received: by 2002:a05:6512:3051:b0:52f:441:bdd6 with SMTP id 2adb3069b0e04-5366b7d4cdcmr9419364e87.0.1726657211673;
        Wed, 18 Sep 2024 04:00:11 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53687046f7bsm1482259e87.35.2024.09.18.04.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 04:00:10 -0700 (PDT)
Date: Wed, 18 Sep 2024 14:00:10 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Subject: Re: [PATCH] arm64: dts: sun50i-a64-pinephone: Add mount matrix for
 accelerometer
Message-ID: <ZuqyuvZ6tdzp5XSW@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
References: <20240916204521.2033218-1-andrej.skvortzov@gmail.com>
 <6e5d0e9978bff30559c17f30d1495b59@manjaro.org>
 <ZunCysUTSfQU1ylg@skv.local>
 <c7664fda936d36e0d916ae09dd554d2e@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c7664fda936d36e0d916ae09dd554d2e@manjaro.org>

Hi Dragan,

On 24-09-18 11:27, Dragan Simic wrote:
> Hello Andrey,
> 
> 
>   arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
> 
> The patch description should be reworded like this, reflown into
> proper line lengths, of course:
> 
>   The way InvenSense MPU-6050 accelerometer is mounted on the
>   user-facing side of the Pine64 PinePhone mainboard requires
>   the accelerometer's x- and y-axis to be swapped, and the
>   direction of the accelerometer's y-axis to be inverted.
> 
>   Rectify this by adding a mount-matrix to the accelerometer
>   definition in the PinePhone dtsi file.
> 
>   [andrey: Picked the patch description provided by dsimic]
>   Fixes: 91f480d40942 ("arm64: dts: allwinner: Add initial support for
> Pine64 PinePhone")
>   Cc: stable@vger.kernel.org

Thanks for the commit description, it's much better, than original
one.

> Please note the Fixes tag, which will submit this bugfix patch
> for inclusion into the long-term/stable kernels.
> 
> Also note that the patch description corrects the way inversion
> of the axis direction is described, which should also be corrected
> in the patch itself, as described further below.
> 
> After going through the InvenSense MPU-6050 datasheet, [1] the
> MPU-6050 evaluation board user guide, the PinePhone schematic,
> the PinePhone mainboard component placement, [2] and the kernel
> bindings documentation for mount-matrix, [3] I can conslude that
> only the direction of the accelerometer's y-axis is inverted,
> while the direction of the z-axis remain unchanged, according
> to the right-hand rule.

yes, it looks so on the first glance, but in MPU-6050 datasheet there
is also following information:

 7.8 Three-Axis MEMS Accelerometer with 16-bit ADCs and Signal
 Conditioning

 When the device is placed on a flat surface, it will measure
 0g on the X- and Y-axes and +1g on the Z-axis.

So sensors reports positive acceleration values for Z-axis, when
the gravity points to Z-minus. I see the same on device. positive
values are returned, when screen and IC point upwards (not the center
for gravity). 

In device tree mount-matrix documentation [3] there is

 users would likely expect a value of 9.81 m/s^2 upwards along the (z)
 axis, i.e. out of the screen when the device is held with its screen
 flat on the planets surface.

According to that, it looks like Z-axis here has to be inverted.

It applies to other axes as well. And because of that I came from (only Y-axis is inverted)

x' = -y
y' =  x
z' =  z

to inverted solution (Y-axis is kept, but X and Z are inverted).

x' =  y
y' = -x
z' = -z

probably should put this information into commit description.

> > > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > > > b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > > > index bc6af17e9267a..1da7506c38cd0 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > > > @@ -229,6 +229,9 @@ accelerometer@68 {
> > > >  		interrupts = <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
> > > >  		vdd-supply = <&reg_dldo1>;
> > > >  		vddio-supply = <&reg_dldo1>;
> > > > +		mount-matrix = "0", "1", "0",
> > > > +				"-1", "0", "0",
> > > > +				"0", "0", "-1";
> > > >  	};
> > > >  };
> 
> With the above-described analysis in mind, the mount-matrix
> should be defined like this instead:
> 
> 		mount-matrix = "0", "1", "0",
> 			       "-1", "0", "0",
> 			       "0", "0", "1";


x' =  0 * x + 1 * y + 0 * z =  y
y' = -1 * x + 1 * y + 0 * z = -x
z' =  0 * z + 0 * y + 1 * z =  z

your description says, that only Y-axis is inverted, but this matrix,
imho, inverts original X axis as it was in original description.

> Please also note the line indentation that was changed a bit.
> 
> [1] https://rimgo.reallyaweso.me/vrBXQPq.png
> [2] https://rimgo.reallyaweso.me/uTmT1pr.png
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/iio/mount-matrix.txt

-- 
Best regards,
Andrey Skvortsov
