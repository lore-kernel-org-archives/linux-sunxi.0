Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06734199229
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 02:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729303469; cv=none; b=nNIzrol+LSIl/oVKwwY7vOkAdFiczN5MyhPi0nfYfeTWCwTJjSOrSqrIMDDvv6ZGQSZ4EbQPWSm5ZUZM/HYbedCyuwvxg+VmFJ2JeF93rN3Y0duzuO8ELsXjcLWYrWYoACJD4/yrV0ylaWIH2XJk7AC+3U+wnUVK2J8O44XKChI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729303469; c=relaxed/simple;
	bh=/66BogwaGO1TZ9c3mvfdx1XuHHVfDnGLOwb/j9TwsWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=HvmQyp0FlAmHqY6auDJM//QJWD89QjFiy5gh46zb3A7ia9Cg11eeS56zRGR0+HsEd2s2wT6Wh7hVmTQsTj8jWAAs5FDF1nraLEE1QHVlpVK70/6LDuShU2bqT+r+jdRMqLMcoXgW58QYxQ3fKwAmVbLsZpegFKVJCHwFVEBz9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso30336651fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 19:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729303462; x=1729908262;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/66BogwaGO1TZ9c3mvfdx1XuHHVfDnGLOwb/j9TwsWA=;
        b=L43XslFFXTRXdKd7E7sfbgmrUWAKkPeKzOlnEE8MtDzjXizqYn9OvF6i9D4HZ0R5y3
         2534JEwaJFvavOQtlKCiZMekiagtDD/czlV76gTEYkaPEO7FNLIHaYYLjd2SXCMM0JMO
         wGPrffJHmobQifTA450Llzvhqt23d/BupFn7YzpEzgH/oo7vaBZ18yJ4exfKoyOQfoHO
         HH85rJoIi0NLXxiS1R02/8/MD2Br7ZiUxTEIh0mYpBOhnOFca+/z62Ap8b6MOaU5BkNT
         sndptGTkbXVghFvuuTQXC+eIG8xbiHrlsLDErzp8BTqwNUC2C3zGLdx7ccZKt+KgoPlk
         TPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCjXsBiS8bpvYxP8EZALTYGaAK90t6cxqFkp+6U77yOusxbBcXjKxTEhvd/XjrvfnmWoMUGqlXel5q0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaHTIUxl5PZhKk0jLhtkqnKlcfpJO29/yowMj+FFemqIah/m3I
	5zaZ3o5POwPW6UKIQyxVLOBTTNmTueRR4PSgdWJyco4lRXRoL+rx/MC7F9Jd
X-Google-Smtp-Source: AGHT+IHBaabOgisL3CMR/Sz4sg7OdLS5aTRJUj2yg87n417wBvhtXXfjwrRNluv7vc/b0QoqJn/osw==
X-Received: by 2002:a2e:4e09:0:b0:2fb:4ff6:eb0d with SMTP id 38308e7fff4ca-2fb82eb303dmr19116851fa.22.1729303462151;
        Fri, 18 Oct 2024 19:04:22 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb80a08911sm3461381fa.108.2024.10.18.19.04.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 19:04:21 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so23203551fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 19:04:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJVhqIuhYKF9bCSWgMD9dEV4GAy/x9EvYupaEyap9i+Sa/tmj5S2BINgtH2pNW41InpaotcdSYOgH8eg==@lists.linux.dev
X-Received: by 2002:a05:651c:2105:b0:2fb:5a7e:5072 with SMTP id
 38308e7fff4ca-2fb83200a6bmr25649951fa.34.1729303460314; Fri, 18 Oct 2024
 19:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
 <20240908214718.36316-2-andrej.skvortzov@gmail.com> <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>
 <ZuazIgLz5PP_Z8Cn@skv.local>
In-Reply-To: <ZuazIgLz5PP_Z8Cn@skv.local>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 19 Oct 2024 10:04:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v66-saec9RcQsCTNOz_Tz4+BSFPdDd6CEA+RrGcF6kCY=A@mail.gmail.com>
Message-ID: <CAGb2v66-saec9RcQsCTNOz_Tz4+BSFPdDd6CEA+RrGcF6kCY=A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to PinePhone
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>, 
	Icenowy Zheng <icenowy@aosc.io>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 6:12=E2=80=AFPM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
> Hi Chen-Yu Tsai,
>
> On 24-09-09 16:08, Chen-Yu Tsai wrote:
> > On Mon, Sep 9, 2024 at 5:48=E2=80=AFAM Andrey Skvortsov
> > <andrej.skvortzov@gmail.com> wrote:
> > >
> > > From: Icenowy Zheng <icenowy@aosc.io>
> > >
> > > New batches of PinePhones switched the magnetometer to AF8133J from
> > > LIS3MDL because lack of ST components.
> > >
> > > Both chips use the same PB1 pin, but in different modes.
> > > LIS3MDL uses it as an gpio input to handle interrupt.
> > > AF8133J uses it as an gpio output as a reset signal.
> > >
> > > It wasn't possible at runtime to enable both device tree nodes and
> > > detect supported sensor at probe time, because both drivers try to
> > > acquire the same gpio in different modes.
> > >
> > > Device tree fixup will be done in firmware without introducing new bo=
ard
> > > revision and new dts.
> >
> > FYI I've been working on an in-kernel prober [1] for such alternative
> > components. This does not require firmware support.
> >
> > [1] https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chromium=
.org/
>
> Thank you for the information.
>
> I've tried to use in-kernel prober from your v7 patchset [1] on top of
> -next and it worked without any changes to firmware.
>
> Since there is still on-going review of your patches it looks like
> it's to early to submit my changes for review. But I'm ready to test
> your new patches.

FYI I'm open to either approach. If the firmware can do it, that is also
fine. I don't know if it makes sense to have both disabled by default
though? That would break existing users, but so would the in-kernel
prober approach, which requires both components be marked as
"fail-needs-probe", and also requires that the kernel driver be enabled.

In other words, I think the firmware approach is friendlier for existing
users that have the original batches.


ChenYu


> [1] https://lore.kernel.org/all/20240911072751.365361-1-wenst@chromium.or=
g/
>
> --
> Best regards,
> Andrey Skvortsov
>
