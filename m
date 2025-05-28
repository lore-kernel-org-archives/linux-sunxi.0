Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219463B1AB
	for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748466870; cv=none; b=IRASMKJTXl/Z/PIjuynb5FP5Z6Vgq1mYk6fe+QLAAa6sIOT66rPCHYmkXvBSSRrYbnjXhGKJ25m5X2yIVlrOEq41mrpZeTNY0yh+SjI1SyTY91D3zeKbXaJsy+iJNVhl451dodC+m0xTI9gOBwZ8UhKdbn8y08yG0WZYZATrFIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748466870; c=relaxed/simple;
	bh=bik8tiy9zD4tncn3V/spfXhSHei4QkySdXosKgPMaGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4hAjtvgw+PI8vhmOqyOjAwZLrrT70dYx1gGV2M7wdi5/2z/lZ12wxH2MIBi/4+yU6tJNXSsPLyQ+YXd+NY7XrHzg4FDsv7UiuaofDKkoloUT6bDhikXmQmwYKWslceAAtnVzAt5f+nYe1YAKf6gLZsYLsPRgYm5pBU/geVjkZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nD20Rd+U; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nD20Rd+U"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e58ef9cb69so87694137.1
        for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748466868; x=1749071668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bik8tiy9zD4tncn3V/spfXhSHei4QkySdXosKgPMaGo=;
        b=nD20Rd+UpFpHlHRRW9yDGc77jrWFbPfOBYnbbvbvuqO0VmU9yes2h3cwaf1GQo1Tcl
         KlL7DtcAPOKPfgGII3f7BbIeuZCNmHk7GeqZwJ+jo2eWZL9pqa1rd5+HePrDHIdRq+/o
         1DpqJ+IGx/t7KBFWNVAGM3KQfO8hiC/ugeMitNH3UEd7XD2/0uwVMJ2VR5EPwOvC5lCl
         R8Pf6HfJwjmbZkCxGIWX6ygonU7VX92zRD6Qu0UhBZsxjLpd3GNIYJMsZWgaa0VfBMGu
         9wP6icRrxETelNea79lxTccBI9+SDQt3hlzOwnNQEJy9fGg8GCfzdv5m3+fI52HZQ7QE
         9puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748466868; x=1749071668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bik8tiy9zD4tncn3V/spfXhSHei4QkySdXosKgPMaGo=;
        b=wyx+A3SH1qENka0lGg33WnFZLaS76Ij1aX4L/7ke2nTrzmmYNOOuVpQAlYj8Dp09BR
         eU3H6HX0lGg1jDVa9StXTteSafUk6Qd2dwKCTMfnVfLhzxWm8kFf3c/Z+LVdV88ONVW3
         /A+JHQFPf6/KPdxrEJPYRz0nIfxXEyszvge2UHb3O9MiRjmX4LNcH7G0MY2jfyBCEEWm
         A2mENpYcHrwmZTI/saunt5JtHvfeDNbQEX5QgCIYG2srGPGsXyQ4E3ymvCU1UYnSj4sH
         vsZZb6BlwnX96Mkm3J6sAtYS1SpWfd7rOFxrV35Y9U/ojoWZS41xfSHPSayGphGBiAJr
         XnVA==
X-Forwarded-Encrypted: i=1; AJvYcCW1qQ9gnZpFC5jD8mDEG8zxDDt63a+lFpPOqmrFPc8TszM/Ezz5IyUth9HLQ5BsB/OA9dKlS0tVUVJSew==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKVQUo7RUruJoVk8ypb16uAOPe2Jb2WeuxiiqGMTsYq2tfwVUc
	oSmlNN69ev/nyP+LFDLbKx122TzS5P0jADjbYl0wtGzcP97K+CiL8hjGlqByI4/CsKA8MbebJlJ
	FQ3+vHFFKGrwnPVFtuqrOzAoUO0ZSb3g=
X-Gm-Gg: ASbGncv8/7h4BWWl9wQbLePnWeFMmARB1JW764+X3YRYa2ycmIzgkFLa3LqaKbCpJca
	An4B3T1ebl36e8BjBZbU9wCe5fqWX9oPqcNJMYkMmRj2+f5iWsRqDTnUJLTyeDz0ZG98RwIRgIC
	66ny9CXHsScJqRgMlWF9v2c7YRE/OCh/uDGA==
X-Google-Smtp-Source: AGHT+IGGLLvtEb730nnh7rC673oR16aeQY2nH92ZW4fGCX/YiQ4QwWrxJP/i3AUVjXlzBuIQT/Ux8cWPw7wSCO4tioo=
X-Received: by 2002:a05:6102:1612:b0:4e5:958d:4962 with SMTP id
 ada2fe7eead31-4e5958d5d03mr7448988137.2.1748466867876; Wed, 28 May 2025
 14:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk> <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch> <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk> <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch> <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
In-Reply-To: <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 15:14:16 -0600
X-Gm-Features: AX0GCFtJbKcSZrV6aI_DEhodkWvBg_0kUSxJMObTitKRlUNU-S1IGzUWOHTLoqc
Message-ID: <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, wens@csie.org, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 3:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, May 28, 2025 at 01:45:40PM -0600, James Hilliard wrote:
> > On Wed, May 28, 2025 at 1:27=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > I think a lot of ethernet drivers use phy_find_first() for phy scan=
ning
> > > > as well so it's not limited to just stmmac AFAIU.
> > >
> > > You need to differentiate by time. It has become a lot less used in
> > > the last decade. DT describes the PHY, so there is no need to hunt
> > > around for it. The only real use case now a days is USB dongles, whic=
h
> > > don't have DT, and maybe PCIe devices without ACPI support.
> >
> > I mean, hardware probing features for this sort of use case have been
> > getting added outside the network subsystem so I'm not sure what the
> > issue with this is as those use cases don't appear to be meaningfully
> > different.
> >
> > > I suggest you give up pushing this. You have two Maintainers saying n=
o
> > > to this, so it is very unlikely you are going to succeed.
> >
> > So what should I be doing instead?
>
> Describe the one PHY which actually exists in device tree for the
> board, and point to it using phy-handle. No runtime detection, just
> correctly describe the hardware.

But the boards randomly contain SoC's with different PHY's so we
have to support both variants.

> Do you have examples of boards where the SoC variant changed during
> the boards production life?

Yes, the boards I'm working for example, but this is likely an issue for
other boards as well(vendor BSP auto detects PHY variants):
https://www.zeusbtc.com/ASIC-Miner-Repair/Parts-Tools-Details.asp?ID=3D1139
