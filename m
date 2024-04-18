Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62F617556A
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 18:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713464405; cv=none; b=YP4R46TnzxB6HuFkMm4BbDv40VjCSQjPSlOeUJiU4QS/U52elcn9T84NTD64sGmCu10FYfH3nq1bv7qkO0LYM+sYB4yqTTf1j4ycKeETvXo0pUyd8h1wuW/PjwcF0u3Lz+gVgdVM0paJ3YduVlMjqHDEB2jC4iSg+kYh6Lb64Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713464405; c=relaxed/simple;
	bh=eG3q+zpUjWVOdPOZkaSjqo0usEFxFJPlILtnK4zyysA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfmKTG2ZNGM98SuYB+yHL5FSToNSnwhONOHGuvktWLGl9vzshp+VmPTFsnQEWki0bLSoh9o7J9tZ4q2Q5nd0kQb41/S3UVM+8TckDe+NUbaN9Bkt2gBJcKuZlNGu3LrV0QVZelYD7lpK6lsd3EfJJ5xSBabEGecTBYbtwIR03Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMm6TvMW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMm6TvMW"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-518d98b9620so1328550e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 11:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713464402; x=1714069202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eG3q+zpUjWVOdPOZkaSjqo0usEFxFJPlILtnK4zyysA=;
        b=IMm6TvMWvu3LbaZICvMJDQGPIzuftFSDbmu2k9pePy1Kxte0ONYQ+t01lVdgK9zMvw
         v/mqBXbnCb7laVYVjom2Fud6v8008SrTDbFZrZ1gcvitbHIVluM6fqWB8SHah6D6xcc3
         UoVdctTrGmSYAp/kbXYK+2NSgYQx/Nyzg/M9iYwhJzH+O9s0XPpTzw9bS4D9Cc5fuG4M
         NxRuopf2piBMST7YLvGfUHeQm8CRmj0390IQi3RoXZlhFR4UQe/Au8LH7mm9GfCia12X
         OHP8kMiGlKOKouuI8pRMJRqr2MA2DIYjV5Xk6iXt9vjHejts27+2dFJr5Y/Q8kmok0/0
         dAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713464402; x=1714069202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eG3q+zpUjWVOdPOZkaSjqo0usEFxFJPlILtnK4zyysA=;
        b=ggjkj71Sxh5XVfQjgwp/NiqDPExf/xmjWREM5dldrueK449DxUgthUsz09F6mKg4Co
         1Zj12cFQANi2huzmFvW56A1cxQ1j/TNrIvkg3Cywc9KqlbY93clA7PET0bl/mXA4ofTb
         9XzeUfhcemrFTGEGe5dWM3QaOio1uXazCV22LFwXSPSSzX7MooIJJhJlkbp2u+lofKEO
         tlUnZ8DJ343N+TbZoZteUbpd4GJJSoTrJtNmF0zYiQV6i9D/BMXAEH1Zjg0BKK+jdcV8
         AMPp3vzLuvYnK1kRRRTzvnoH47+vHXmyOXUbWHlgeWByyxnrfbxfbl8OackZnAPvevhW
         8gDw==
X-Forwarded-Encrypted: i=1; AJvYcCUoEZ+t29oZbr5G1Ar9N/U206jq9UL25azdqrTLgPNAItW0WILkMIS6njio245lp5lb1yLR1nlQg1I3SEvmt+q7OYTJiaBbn+M1t4A=
X-Gm-Message-State: AOJu0YysOYZQxJvaJvAE6ID8A83BSKlx61uQ0n17fXxMBhI6HvmFtSfZ
	uhmYyl63TneTzrUVS26LXi5MEtxVUC1pQelO23pm8R/55BLXoty1TkCwK+0secCzXRdkNoV6Gx6
	EqwJVqvJCztZnYhuCqWHV13vrb9w=
X-Google-Smtp-Source: AGHT+IHalOQ/s3NxiyYDgT5G+ca4oEPzuDrE48u3GmuLSNbZCinbhI/Pfbda9fQysbueYW+MPNlitEcynwqbQEQ4c54=
X-Received: by 2002:a05:6512:3b1e:b0:515:9185:652f with SMTP id
 f30-20020a0565123b1e00b005159185652fmr2480035lfv.33.1713464401599; Thu, 18
 Apr 2024 11:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240414175300.956243-1-aren@peacevolution.org>
 <20240414175716.958831-1-aren@peacevolution.org> <20240414175716.958831-2-aren@peacevolution.org>
 <CAHp75VdZavToGYqLYnkKYt53HXoQxXnRER5Cn5b2==gWTvkAWQ@mail.gmail.com>
 <xxeg3as5m5vmmu6fbjujcnvchrerxs2rr42nloirwsktbv4r57@vpxtxblxmspl>
 <CAHp75Veoibnk2pYuAY-T+u=8t7ackQ8zBjxSHcWb1AeHnq84yQ@mail.gmail.com> <fvuaq2yo4jh6jc3cklkvatr5r5du2jzmqblvvkpkpmxdt7e2ys@345lrhtnipfw>
In-Reply-To: <fvuaq2yo4jh6jc3cklkvatr5r5du2jzmqblvvkpkpmxdt7e2ys@345lrhtnipfw>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 18 Apr 2024 21:19:24 +0300
Message-ID: <CAHp75VdvbQzwqTBzioqVkiV4vHrQFX6UpoDce1t6whWYHcXYKw@mail.gmail.com>
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

On Thu, Apr 18, 2024 at 8:50=E2=80=AFPM Aren <aren@peacevolution.org> wrote=
:
> On Thu, Apr 18, 2024 at 06:56:09PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 18, 2024 at 6:06=E2=80=AFPM Aren <aren@peacevolution.org> w=
rote:
> > > On Mon, Apr 15, 2024 at 05:04:53PM +0300, Andy Shevchenko wrote:
> > > > On Sun, Apr 14, 2024 at 8:57=E2=80=AFPM Aren Moynihan <aren@peacevo=
lution.org> wrote:

...

> > > > I forgot to check the order of freeing resources, be sure you have =
no
> > > > devm_*() releases happening before this call.
> > >
> > > If I understand what you're saying, this should be fine. The driver j=
ust
> > > uses devm to clean up acquired resources after remove is called. Or a=
m I
> > > missing something and resources could be freed before calling
> > > stk3310_remove?
> >
> > I'm not objecting to that. The point here is that the resources should
> > be freed in the reversed order. devm-allocated resources are deferred
> > to be freed after the explicit driver ->remove() callback. At the end
> > it should not interleave with each other, i.o.w. it should be
> > probe: devm followed by non-devm
> > remove: non-devm only.
>
> I think what you're describing is already the case, with the exception
> of parts of the probe function not changed in this patch mixing
> acquiring resources through devm with configuring the device.

Okay, then we are fine!

> I hope I'm not being dense, thanks for the clarification

--=20
With Best Regards,
Andy Shevchenko
