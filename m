Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2300F1AD9E7
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719934365; cv=none; b=SK739UODcIuGID5H+2YmIxa9+GDB4kDiSxja4lrvI8dXCmH0en0jUV9YY4siiT0c62KRph5qqotapYNaqfhUaak4K1M1vfhP7pT2b6PIb23dnd0DTeUiUeMBik0s97zzApGIRAKyQYrNeJ80RZGIiuxdVITIBFVKcGSrcXqqR58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719934365; c=relaxed/simple;
	bh=C/m6fd75vr0+1BIFC2PeIwG+mleUy9yNFQhDe3qHmc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POQt5InXmVnY1tKvLaHJ6/AO1Ehd/a5SzZ57wWcgfzhgJy4pTinbAdBvKyJqc6KIuDN0WC+QBEBqN4/89YcmuyLJ5YWOK8jrpeGrf3TB7bEA4am0lT9p5EgQwQpdZCmsSSfJIsweYRJiFfVHrYnYnbWag4PJFVOMaKHzcWR3+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cka+948w; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cka+948w"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec50d4e47bso42108541fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 08:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719934362; x=1720539162; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C/m6fd75vr0+1BIFC2PeIwG+mleUy9yNFQhDe3qHmc0=;
        b=Cka+948wJNMDmQtsRknpOSf5dkftRj95X39hfgReswp7QV0tlV9U9+30ABZgUq81xC
         HblCkflOThlN3MxBbKCOkFJQ153+drx1lN9QwJUhodiit+bHWTiF6tPWSOlnQL3NOWDa
         /iWwdAg5G4odo7OyaOqmLr7Ub+nusSZHbE0KBVPXB1kLVMmdZSBrvQI4PvinF5qDjfu/
         HcOHTdEHzP+/FdkgFjVrPeiScOG60H/MlNXxwE2b9Y4oYiM5TsKyLZblmWxM3tV9/hsD
         o9KLbEBOFl7cBwmXB3mxgj8G6qTouPW/I5gvIe5quFOIlUaOMvuZm58o1MdtW1AJD1Lz
         ZgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719934362; x=1720539162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/m6fd75vr0+1BIFC2PeIwG+mleUy9yNFQhDe3qHmc0=;
        b=IacCaSroeMSpJk7m8kNHxoxQCU8BFljCTcBt8tWMIK2p/E+OViFF9eO7pOzMDLF0hQ
         KEQgync5SqsltCxCp7JnbCtoap05f2fCohrjWTwZnVUaRHfnTtQDpLFK1/TGN9Ig3KeM
         qHjh35yOZltbVbVZIvaksjpPlvBD+Fy2dbM+PLiJUuyfMhhK6K9S5IU9S6HT8h3ehz0t
         gtDy9A1B9P4MpN3u4jc5YhqShBLmthesFwp+00jeiXTO5o22bkggewJo7yxoDQL/UkuQ
         L7FcEbVzBX3Pwx4h2LriYz3vE5HtPEngTBrInDWq20b3GmSHEHRhRMboqKsPtBMYTmNZ
         oJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvvxWPUDwFuFP9/iqBKrg6yTobgh4r2p5wGtXHy0bJuzt1lJ+TA9ILOJXMygmtnO2S5h09hDK1dwGe/KhgICAw/FnMHnoCDFZPGjs=
X-Gm-Message-State: AOJu0YzoJkIB8IGCvte5xE66EdsiI4/kXi0Dfpimra406VBLbdGmY6bQ
	SMdiXz3q4vLuaBY1xz4o3ri3duR7Jcowl7V4CsGTNmfRf6T7qxti3uRM2CQ8mZ4U6+2vbfuvcvw
	2kMSYH7sbH/eUexxllIOkBCbPvJs=
X-Google-Smtp-Source: AGHT+IGpss4noUQgT3U0y8rHVx0PXPERHp6cM4+5fhPb2ffHe8Jw2nNKmIcPJRz59rdV4Tn6bFNR4p7ayqOSLwFJSvM=
X-Received: by 2002:a2e:9a13:0:b0:2ee:6254:f9ee with SMTP id
 38308e7fff4ca-2ee6254fb2cmr65786961fa.42.1719934361988; Tue, 02 Jul 2024
 08:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zn8GVkpwXwhaUFno@titan> <CALP2yXcUrCdzyqQx7RQUup3QjfbH4VnMVCPFVXNmmd08GJkKMQ@mail.gmail.com>
 <CAMBcuYNG6n1_yc0-5MSFoh2xCfh3-tHG7VcQq5vY65RKSq39RA@mail.gmail.com> <ZoB1ac1bEI8aH-Yp@titan>
In-Reply-To: <ZoB1ac1bEI8aH-Yp@titan>
From: Jakob L <jakobl.gm.g@gmail.com>
Date: Tue, 2 Jul 2024 17:32:29 +0200
Message-ID: <CALP2yXexcwNR69Og48Wd8oyqP+YRUnujtUkgbu4ZLkQUQsAEVw@mail.gmail.com>
Subject: Re: T113 TCON Top tinting troubleshooting
To: John Watts <contact@jookia.org>
Cc: Kirby Nankivell <kirby.nankivell@gmail.com>, linux-sunxi@lists.linux.dev, 
	andre.przywara@arm.com, Paul Kocialkowski <contact@paulk.fr>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

i am pretty sure other devices don't have this. At least i have never
seen it on V3s, A20, A33, H3, A64 with RGB, HDMI, LVDS, or Mipi. This
was the first - and on MIPI its pretty bad, to a point where its not
usable.
With the allwinner u-boot from BSP i had not experience that tint -
but i assumed it to be somewhere in the wrong Mipi packager or DMA
setup.

Since i am not very experience with mainline contributions i am not
sure what is the best approach. While i agree that ideally its done
right on all sunxi devices, the risk of breaking something without
need should be avoided?

All the best
Jakob

Am Sa., 29. Juni 2024 um 23:01 Uhr schrieb John Watts <contact@jookia.org>:
>
> Hi,
>
> On Sat, Jun 29, 2024 at 12:14:39PM +1000, Kirby Nankivell wrote:
> > Tested this on a MangoPI-MQ-R with a RGB lcd and can confirm that this fix
> > removes the green tint I experienced.
> >
> > Disabling the mixer1 in DTS entirely also works.
> >
> > I suspect on the basis that the Mixer/TCON-TOP topology is identical to the
> > R40 but does not seem to experience this issue, that is a
> > silicon errata specific to the T113/D1s as far as we currently know.
> >
> > However, there is no functional reason from a drm perspective to require
> > more than one mixer tied to one output via tcon-top - unless someone has a
> > good argument here?
> >
> > in my opinion:
> > 1) implement this as a quirk on the t113 and fix mixer0 > rgb/dsi and
> > mixer1 > tv0
> > 2) make this a global default for the sun8i tcon top driver where only one
> > mixer is initialised against an output (which would also impact the R40)
>
> The only reason I caught this issue was because I implemented LCD output in
> U-Boot and saw it looked a little better- I thought the tint was the backlight.
> Had you not contacted me and had it not affected the person I'm doing
> work for I would not have bothered looking in to this.
> It's entirely possible that the other supported devices have this issue,
> or that future ones will and nobody will notice.
>
> Going with a preventative approach here by fixing it for all potential devices
> and relying on the behaviour the sunxi code assumes rather than the datasheet
> says seems like the best approach to me.
>
> John.
