Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962D1168
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Dec 2021 08:32:12 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id o2so9960433vkn.0
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Dec 2021 00:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4jBkRmOreODS96RHr2PzrInC2SwVLBJmgP6qQbKkVOM=;
        b=EE0K+g/IeAge6kMhwkkhJnz/IAJAcKM2j/tSRa5odTJrSDBgZqwqiX3I7EqdIRQNfG
         dbXAYFsozpBLr57XwcYeUAagubmKXE3FST4PGFmartyRW/t84ZldrjhnGOZZSJOA/usV
         tSGYUabvy9Y8tXCuvB/tBfCwNnAQB+KR/dVlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4jBkRmOreODS96RHr2PzrInC2SwVLBJmgP6qQbKkVOM=;
        b=pbvIeEWVyeFd+HT1z2YxJr6xrrJ0B0qxk26H/eSnbQeq6MO9PB7i+p3GVr3CBC3XUX
         AcfWiClwNt0bVHCnffDCo7lZKVGiQR/FbgR0B/qCIgVTOHN4zHEl/lO1D2WZW26Re9pS
         gJ2ZTK0aGFsrpgajq8/ktNNQlUHl1kJqXwQ+pERFeulPJ5/s3289hmk2tyyTc1X/WoKd
         SpiV5dJqG/PUNW7ihfVL/kh89SjlOlBgjG7HUErkPUTqFc7XYFF8fdU9aCgQemWEA5NB
         M1VEA7dIvGtpa3ZFEH1A5WgTtGa2FJ0j15P7FJyb60hJx7IUAKnwDpO/r3bLwcUOVe3A
         8n+w==
X-Gm-Message-State: AOAM5324aBhWvAME2sC2tp0CfXcY7OKVVfpeEJADPswXGNXqIpWXdNwB
	yRaR76Pwlf9zAGAbzdq31ESOGe62ILWpi871htws2A==
X-Google-Smtp-Source: ABdhPJxTU1sOGGackckq7m0NzsV7BwC4t+FEjHeBZpk/ZscDQyaFJ1S3ZMFYbCyecPL6RFOKSH3zE/sdzYZi2XYoLRw=
X-Received: by 2002:a1f:9dca:: with SMTP id g193mr44693vke.21.1640680331348;
 Tue, 28 Dec 2021 00:32:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211213010322.10726-1-andre.przywara@arm.com>
 <CAPnjgZ2QxLib_XLdaGzPFw8Q8yGo69UVxb5_prmMaafnLnoAeQ@mail.gmail.com> <20211220170141.21770084@donnerap.cambridge.arm.com>
In-Reply-To: <20211220170141.21770084@donnerap.cambridge.arm.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 28 Dec 2021 01:32:00 -0700
Message-ID: <CAPnjgZ1bXFqf0=uKu8A0JxS=ft4_ux_WeS04dsUWv+QtNUAd4w@mail.gmail.com>
Subject: Re: [PATCH] sunxi: add board documentation
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Maxime Ripard <mripard@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

On Mon, 20 Dec 2021 at 10:01, Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Fri, 17 Dec 2021 09:37:08 -0700
> Simon Glass <sjg@chromium.org> wrote:
>
> Hi Simon,
>
> > On Sun, 12 Dec 2021 at 18:03, Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > Add some long overdue instructions for building and installing U-Boot on
> > > Allwinner SoC based boards.
> > > This describes the building process, including TF-A and crust, plus
> > > installation to SD card, eMMC and SPI flash, both from Linux and U-Boot
> > > itself. Also describe FEL booting.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > > Hi,
> > >
> > > please have a look whether this makes sense. Feel free to just try something,
> > > and point out ambiguities or missing bits. For missing topics, please
> > > send a follow-up patch ;-)
> > >
> > > Also this is quite long, shall this be split up in two (or more) files?
> > >
> > > This is what rst.ninjs.org made of it, if you prefer to read it formatted:
> > > https://paste.c-net.org/PleasantNeedy
> > >
> > > Cheers,
> > > Andre
> > >
> > >  doc/board/allwinner/index.rst |   9 +
> > >  doc/board/allwinner/sunxi.rst | 304 ++++++++++++++++++++++++++++++++++
> > >  2 files changed, 313 insertions(+)
> > >  create mode 100644 doc/board/allwinner/index.rst
> > >  create mode 100644 doc/board/allwinner/sunxi.rst
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> >
> > I agree that a follow-on patch to remove the duplicated files would be
> > helpful, but this patch is a big step forward on its own.
>
> Thanks! I will address the other comments ASAP.
>
> > It would be interesting to convert sunxi to use binman.
>
> But Samuel fixed that already, didn't he? Or is there anything left that
> binman should do? We even now use mkimage to generate the magic BROM
> SPL signature, and then let binman combine this with the FIT image into the
> final binary. Or am I missing something here?

Yes I think you are right. I was thinking of creating the image so
that you could just dd it straight to the device without skipping
stuff. But now I remember that we need to skip the partition table...

>
> Or are you asking for patches that remove sunxi as the bad example from
> the existing documentation? ;-)

Regards,
Simon
