Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F087216D4C8
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713455810; cv=none; b=Q10LPA9yRCL+0AWXzGrHl1/HFTDvnCM9WGYug+QwqspZte7GaxcrUZ3I/QS2bAktnxv3BzZbSGv4SYv1aRdYd4l2f6Vtt5/auNKTmCsf/8kPoywl6oGLn0rHmu0MsOGV1kR6LZM5EHBrnmuwGkkgpxHuSQn3ptK2iW8UR/nwk/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713455810; c=relaxed/simple;
	bh=aBUT2+pQDzYwiVZKUr+Rvc3cYxV7V4n7dBGY3Vt9cNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxU5bt75kgLHZzrf338bXiHz3YasJfvsje+B2MHB5NEJGhEzTyPXSzwMTR6InmdS/1WJEYkIQVSeNojuYjxcn/ZcNLoM/bEX+rkZzk/U/psSYg41v3hxNRZ9VCZ9npZJLJ9Gzw2YIwpZOW1lXlptsJ1BBSif0BSrFJpC8S2uyL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRH3T1cL; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRH3T1cL"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-518e2283bd3so1537672e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713455807; x=1714060607; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVAgtcipfkcWMHjlW6nU5upWM2mMxhSXqMN6JngOSHk=;
        b=PRH3T1cLcldtMQEs45XwkXs06S39J5TUmblB0eNWA3mjW5v68NPfoL78z1poXFbdAN
         WKt/yRwWze0kbagrinfSJWwKwv0UXj27dvhet+LU83l7agYjuebhNogS0ZiyAdmC1XXp
         8shgEU9E9255q72EloKYeH6VO79nuqIyH3q5aWVVnFDMykkuthprKxd5GTQ6UnBuVboW
         ysPtdhdhCXOJjQhcjLBU36f6AHuOi1NKBncctHcsew3/CXdlrF4iDTqidV4upKRTsu0e
         RTv5p1RNWn6944QB8DayJM5VVtQQTIIOZijKJsZfbQmQAA1VOz9ccsegmoQJS21Et+a8
         jHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713455807; x=1714060607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVAgtcipfkcWMHjlW6nU5upWM2mMxhSXqMN6JngOSHk=;
        b=lkgWbodGDp0xLWF0xrRx/KOIoBBzyw7xsnJb71fYOoyAM3gQyVv4y0MCTNY5l54Etd
         5G3slc1XYIhx0VDHeyOZaK8+qGs/zJDELlGVf4ICASMreWQWDpIFFbULWCLrf2/pcNdx
         oa/g1krTtrNMf1jpOjenqPlhN5Y+f7EsHw3WEPDedFZmyTFwMXZ7a0f1MjKuc3bVe+5s
         I1caAhFuCSmOArtuz0+4Mixnff+uhiMdodzJIxptVwBRkORxN9A5GsWRAf6qV7/dJwi2
         GWL17p7ieGFZZiVyo5swmURqz04um4JF5Yl3qkpsdJvoTVZAL/QcU7ykE9717cqx9xFf
         UapA==
X-Forwarded-Encrypted: i=1; AJvYcCWWYUMA+owNI0+pwffV2H4FCcn56sPGtl77uX7dpZt/4twS/O3O4xK7yDGVRpda9IDr5i2bbziIpiiqx2CfAb9TajcPJjCHf5Hb1sE=
X-Gm-Message-State: AOJu0YwlUDfjXiY0Ae+b/4cW83vJwLVCui7GpTOPYD2vFd2RnG11v6S/
	QuJbRVBur8RF0J2bBvLDyyu2JH73JNvT6MRLQorJ71gOLYS/VA/SzuCgui4YAIwFhdbzggJpm9n
	0oJOv97+pC9x25/GBwRzAIUvAVUg=
X-Google-Smtp-Source: AGHT+IG1UvVvPMawq0PN1G95h2KMXcAMXcVnwWBMLVJAP/s7QKISoICSyXIA62E97yFHemf7G8s5MxQ9F1kvhWxIZAo=
X-Received: by 2002:a2e:8383:0:b0:2da:b1fc:8095 with SMTP id
 x3-20020a2e8383000000b002dab1fc8095mr2163555ljg.7.1713455806891; Thu, 18 Apr
 2024 08:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240414175300.956243-1-aren@peacevolution.org>
 <20240414175716.958831-1-aren@peacevolution.org> <20240414175716.958831-2-aren@peacevolution.org>
 <CAHp75VdZavToGYqLYnkKYt53HXoQxXnRER5Cn5b2==gWTvkAWQ@mail.gmail.com> <xxeg3as5m5vmmu6fbjujcnvchrerxs2rr42nloirwsktbv4r57@vpxtxblxmspl>
In-Reply-To: <xxeg3as5m5vmmu6fbjujcnvchrerxs2rr42nloirwsktbv4r57@vpxtxblxmspl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 18 Apr 2024 18:56:09 +0300
Message-ID: <CAHp75Veoibnk2pYuAY-T+u=8t7ackQ8zBjxSHcWb1AeHnq84yQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] iio: light: stk3310: Implement vdd supply and power
 it off during suspend
To: Aren <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Ondrej Jirman <megi@xff.cz>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-iio@vger.kernel.org, phone-devel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Willow Barraco <contact@willowbarraco.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 6:06=E2=80=AFPM Aren <aren@peacevolution.org> wrote=
:
> On Mon, Apr 15, 2024 at 05:04:53PM +0300, Andy Shevchenko wrote:
> > On Sun, Apr 14, 2024 at 8:57=E2=80=AFPM Aren Moynihan <aren@peacevoluti=
on.org> wrote:

...

> > >         stk3310_set_state(iio_priv(indio_dev), STK3310_STATE_STANDBY)=
;
> > > +       if (data->vdd_reg)
> > > +               regulator_disable(data->vdd_reg);
> >
> > I forgot to check the order of freeing resources, be sure you have no
> > devm_*() releases happening before this call.
>
> If I understand what you're saying, this should be fine. The driver just
> uses devm to clean up acquired resources after remove is called. Or am I
> missing something and resources could be freed before calling
> stk3310_remove?

I'm not objecting to that. The point here is that the resources should
be freed in the reversed order. devm-allocated resources are deferred
to be freed after the explicit driver ->remove() callback. At the end
it should not interleave with each other, i.o.w. it should be
probe: devm followed by non-devm
remove: non-devm only.

--=20
With Best Regards,
Andy Shevchenko
