Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6E51F37D3
	for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441534; cv=none; b=dqUxrYDwCaml8l4olIRzFIVUqI7iWpHhr6sAJc7cbn/TClj8cwKavsIMfqKnAAQwD7t8XDw1Oq6oHNiREg4feAxzGe4TLiIg096nqh3Oyv76Ta+7PYzW6bETr8eiGdFqJ3aj6Itze4GlypyDVLipgBFl68PgY1qjOmQcURn+pks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441534; c=relaxed/simple;
	bh=RgnF/poN7NkMo2BBglJzOP/AgJJGoqN5W76orbXdxCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FfBqRt0W0QeduL57848M/Opm9ivid25pBsHoU8DqYrEYDgQGADD7cXm+DgFj/FohzAsKo6jDqoCZuknmuG+fcdspi+cu2fFZ9m04AfUrhP7r/ZZzV6s9V8HcGFeHcVzDCRJ71hBNEon22TSDAlT6Upk4n9/p9iXyhZwr9ePuXDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55324587a53so1207319e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 07:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441528; x=1749046328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ksdw7M5oeACHV4O06/7f6T9AIjZYxql+qwEMoPd8Euo=;
        b=rmi60yJ9yAwVVG2w+4eG+X5M6UqEaM5++yyOY393fxmiLF5gxCzKS92GIjVGUbEsYi
         NT3NBfbfZxQwQNVqZmrk8jEQLS6ex6pPgqyCV/uKsYyyH5mZY9gwOu0IV+2L/ZoNKHOP
         1kQenYhpF7O/e0OPvPHxKw7shpvFCqUIkNvaUdkkV0ems08lnpG9XlED7ypU9EuCEM+m
         GkM+2lQpokLMLCn9pNf/tUt3JP0ENLyg/MbTKTDi8f/eGP/uH5PWZORVFT622swkzMfI
         kupGaDhEeMYQ7HODer8yEoU8neNULCWh5JB2gTdyhEbqp2alF214EfMJkdqECPPjdhoB
         yX1w==
X-Forwarded-Encrypted: i=1; AJvYcCUtAMzHzYFK+ctIEPVM3YRueGLtuRg1kcjZ2B957GV5c9TrmcwOcwS1MxYFNHq96BydxQUs4MLRAZsptQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTZ0FbDkG6l3skRYe7I5RRj3Q97XTN9OfpLFMmai4jDb/t+mIz
	d39ldAALsUUMVBdpcsyodtF2NsiX+ova/LX1W9JnbFsLJzoaDr8gxSPKUhzrjrkn
X-Gm-Gg: ASbGncvcGxkXoFiaShSV7beWf7hGJ5x5iV1KUsln2IU28/aB0fpYvcK+yhULdGnD8fD
	G+/vSDmjOhyrslwCrTmLROBZGiSL1MBFkEhtEgDXsf+mINKDPX1coiXlvHomz2HrMqPjiA6MDQY
	UN2N4zKvJoPGeqwlOH8PEQXhVGc3ZiEy3vft1Zu5YHDx3ps3QPxVPrAwRO1e96yhbPspl35SLFl
	zQQmnjypoT3QdDSC0A+0qYk1mm90GmYElb48v+AN8s8mvR46op4PVPNBQH0irzoaBTonQS9jVv6
	nO3Clqp6Fkd+eLzhKnTBZtk1u2gBQ6vjw3VgSvPm8t9VF4ar1hsXSzFZaNax7hx3c521iieawvb
	5gcTlrYYtzyUlTNR0KYU=
X-Google-Smtp-Source: AGHT+IGttfHPN3P2hoXGcx9zS9Dcyr79KJB5dhkGOWYCsp03zf244kuN2KuXiIhiPQC18WL2jXFELQ==
X-Received: by 2002:a05:6512:3d15:b0:551:eb1b:f41d with SMTP id 2adb3069b0e04-5532ce338a8mr1677775e87.27.1748441527855;
        Wed, 28 May 2025 07:12:07 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b640esm292511e87.254.2025.05.28.07.12.05
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 07:12:06 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32a64f8480eso9978961fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 07:12:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxHHHBehrFd4lmhpYLwTRb/eYnHJzCt5GvqUEZTcnKCeHbEhPogwBgd63suq75XL20X2ZY5htmXAXgRw==@lists.linux.dev
X-Received: by 2002:a05:651c:418e:b0:326:cf84:63c4 with SMTP id
 38308e7fff4ca-32a736a7554mr15406341fa.1.1748441525068; Wed, 28 May 2025
 07:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk> <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
In-Reply-To: <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 28 May 2025 22:11:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
X-Gm-Features: AX0GCFvkvTc-VRmYOaYU5xGuR2czReptL7cuDFoxwx0sxNWmjpy1lDF4i_MRIR8
Message-ID: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 9:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, May 28, 2025 at 05:57:38AM -0600, James Hilliard wrote:
> > On Wed, May 28, 2025 at 1:53=E2=80=AFAM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> > > > On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch=
> wrote:
> > > > >
> > > > > > Sure, that may make sense to do as well, but I still don't see
> > > > > > how that impacts the need to runtime select the PHY which
> > > > > > is configured for the correct MFD.
> > > > >
> > > > > If you know what variant you have, you only include the one PHY y=
ou
> > > > > actually have, and phy-handle points to it, just as normal. No ru=
ntime
> > > > > selection.
> > > >
> > > > Oh, so here's the issue, we have both PHY variants, older hardware
> > > > generally has AC200 PHY's while newer ships AC300 PHY's, but
> > > > when I surveyed our deployed hardware using these boards many
> > > > systems of similar age would randomly mix AC200 and AC300 PHY's.
> > > >
> > > > It appears there was a fairly long transition period where both var=
iants
> > > > were being shipped.
> > >
> > > Given that DT is supposed to describe the hardware that is being run =
on,
> > > it should _describe_ _the_ _hardware_ that the kernel is being run on=
.
> > >
> > > That means not enumerating all possibilities in DT and then having ma=
gic
> > > in the kernel to select the right variant. That means having a correc=
t
> > > description in DT for the kernel to use.
> >
> > The approach I'm using is IMO quite similar to say other hardware
> > variant runtime detection DT features like this:
> > https://github.com/torvalds/linux/commit/157ce8f381efe264933e9366db828d=
845bade3a1
>
> That is for things link a HAT on a RPi. It is something which is easy
> to replace, and is expected to be replaced.

Actually it's for second sourced components that are modules _within_
the device (a tablet or a laptop) that get swapped in at the factory.
Definitely not something easy to replace and not expected to be replaced
by the end user.

The other thing is that there are no distinguishing identifiers for a
device tree match for the swap-in variants at the board / device level.
Though I do have something that does DT fixups in the kernel for IDs
passed over by the firmware. There are other reasons for this arrangement,
one being that the firmware is not easily upgradable.

ChenYu

> You are talking about some form of chiplet like component within the
> SoC package. It is not easy to replace, and not expected to be
> replaced.
>
> Different uses cases altogether.
>
> What i think we will end up with is the base SoC .dtsi file, and two
> additional .dtsi files describing the two PHY variants.
>
>         Andrew
>
