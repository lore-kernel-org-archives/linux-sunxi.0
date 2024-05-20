Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9C3E57D
	for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716222677; cv=none; b=jah8C86Dl+l9gl+8bxcWCgt5KXFPVMCPmldk37LH6LnIk8W+FNGMSFHmIxEWoyU2zOnh2+/hvYfo9MlgkWv+FiVwyVfCWG89dbU5i+EufgSFAhByspTv0IVgQpQkmlEaFFhkcIQf8RZ1TIiOPiQvfVFY10zNZq+QBD1ZO0Z0Xmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716222677; c=relaxed/simple;
	bh=gR/NW1Cv1ga24OQMPJ4bKmzAi8kk1QABUcj7SZoJqgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqOPMzP8EArdsBTTVvwk5BGOeDvSilV3nigjCjrYODzPRzKiuzeHyzXoNP8sO9NG2ZY0JTVkmgDa9D2W3iGmpWSWvIvd5FzGm08szmfP1N+XBSBr9sp2q97BpySr+aPI1LOUlZYEDMe5RCUsZSt9qcwsj6RKQ5PKxfg4BlcOnnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NW1T51sL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NW1T51sL"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f45104ef0so3858147e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716222674; x=1716827474; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rCcW9VH2LOI+iC9p+xwamz+SEmIGnUU7jFFABNDc0Sc=;
        b=NW1T51sL32/nDUCDlWVI7qOS7J5YCXQPobQ9/Azar8UMSwZHbTHSZ7rVv+mzyx8S5N
         /y4Bec6YUIzi+TPJTcFB+7Us6gyoDlkaOHyaJEQoz2Zx/4pOucA5ksAEmHYvtaSmU0GT
         ExYU7kNN5XttTGQCt4g8WG63OJe16Wj491eSbU2+CG7t4hcSkGT5cciG2aXL6zqHvhbp
         w1xiTU0o2b5wY9qjnJqdY/q0fp6n30hUdxfi3EhIlg/YcocwqquaLeofK/6vqnqeOdic
         W9B6ZbTDud4aQXHA47ZftwuqU1tgiCfWZDyyMGikQR10oWWSIjIlUBIMW7TtRrAXdWZq
         q/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716222674; x=1716827474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCcW9VH2LOI+iC9p+xwamz+SEmIGnUU7jFFABNDc0Sc=;
        b=I51K3flYghbRsWayRCtKEJQoKvzXEMuUjv/Bin/z9xekuJ8AqNYmg6H5sS7DiQrps2
         dgd4qzhxq7oXrymPNN0LCfgHMgJ4cxlIZIzUiDMs7yMJxaKw74joMsdipZ9409jRltlY
         1nzUIDnjg6W12h03hivFYvREkmHSx6jRGv/TTT2pixiVxN0kn0rmJGDmVcSfb++Vk3kg
         nqRshuSCWzsbhqwfhHnJ9aLT7oErsxzDapVaP+aa9GI5VQF6238lyBG9DW/TNm3RKnrt
         PGAuLRrZQ9IB+z9S+5wp/dA5iul3t5CVOpG3ZzgDQ4ZIJAb+vwqAJwnZuhHn2N8VtMWQ
         9/qw==
X-Forwarded-Encrypted: i=1; AJvYcCUCadAa5Eh70eqOyCuX4HlxeXw/uLX2j+9jPW1jW5I+z3WE2ODfljnvToIwHYXOWpiikUDMjw28aWPVgsgu3v3W/1RyG/QREg7fhqE=
X-Gm-Message-State: AOJu0YxY0bbyYRVVhWhy4qnRYyuaL+QHQZOVWMyVImu+uXIC2C7SQZXI
	USLK9rPfET1H8ITCcXQBqEYpaWNK3+FMoXYGypWWJmS33ydNsO6WZMih8Cg7G/M4+vkdlh/4Fqn
	1VwDBPCmtWwCbNRAQrAlzj5CKgWg=
X-Google-Smtp-Source: AGHT+IEO3PH/dOQ2T8v5If4sEgtSi2/J0hDU+93uun/AT6WFE/kTIrG1M84hXZb7/jfvQZWZEzNDGdGRZ0R5iWZV7Dw=
X-Received: by 2002:ac2:5f48:0:b0:51d:abb3:d701 with SMTP id
 2adb3069b0e04-5220fa7191amr18004811e87.5.1716222673580; Mon, 20 May 2024
 09:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240515234839.26898-1-andre.przywara@arm.com>
 <CALeDE9OrY-wdpbdOWvqkgYE6YD8SLGCw_Fo1FaBsjQ75LQcqtQ@mail.gmail.com> <20240520151808.1e5fe1e1@donnerap.manchester.arm.com>
In-Reply-To: <20240520151808.1e5fe1e1@donnerap.manchester.arm.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 20 May 2024 17:31:01 +0100
Message-ID: <CALeDE9PWTfJA48MMgYhZP2RqO1vxPzOrxXg8dziFC7Dp4yzxpA@mail.gmail.com>
Subject: Re: [PATCH 0/6] power: pmic: sunxi: consolidate AXP SPL drivers
To: Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Chris Morgan <macromorgan@hotmail.com>, 
	Ryan Walklin <ryan@testtoast.com>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 May 2024 at 15:18, Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Mon, 20 May 2024 13:48:41 +0100
> Peter Robinson <pbrobinson@gmail.com> wrote:
>
> Hi Peter,
>
> thanks for having a look!
>
> > Hi Andre,
> >
> > > this is the first series in an attempt to clean up the X-Powers AXP PMIC
> > > drivers used by the SPL for sunxi boards. So far we have a separate
> > > driver file for each AXP variant, but the code was largely the same,
> > > just differing by the regulator ranges.
> > >
> > > This adds a new generic driver, which reads the regulator description
> > > from an array of structs. This is similar to how the DM AXP driver used
> > > for U-Boot proper works, but is simplified, since we won't need the full
> > > feature set for the SPL, and we want to keep the code size small.
> >
> > Overall seems a reasonable approach, would it make sense to put the
> > regulator descriptions in a file that could be shared between this and
> > the DM driver so the information isn't duplicated and hence may
> > diverge over time with things like copy/paste errors?
>
> Yes, I thought about it, but it gets nasty:
> - The SPL should only have the regulator descriptions for the *one*
> selected AXP chip, whereas the DM driver can afford to describe all
> regulators and select the right ones via the compatible at runtime. This
> is to conserve memory for the SPL.
> - The SPL should only be interested in the DC/DC buck converters, we don't
> really need any LDOs. Again saves memory.
> - Each regulator entry for the SPL should be as small as possible, we don't
> want and need the regulator name, for instance, or the table pointer.
> Again to save memory.
>
> Currently the array for the three AXP313 regulators in the SPL is exactly
> 30 bytes long; in the DM driver, just for the small AXP313: 192 bytes. The
> difference is even more pronounced for the larger AXPs.
>
> I am hopeful there might be some macro magic to express this, like:
> static const struct axp_regulator_plat axp313_regulators[] = {
>    SPL( "dcdc1", 0x10, BIT(0), 0x13, 0x7f,  500, 1540,  10, 70 )
>    SPL( "dcdc2", 0x10, BIT(1), 0x14, 0x7f,  500, 1540,  10, 70 )
>    SPL( "dcdc3", 0x10, BIT(2), 0x15, 0x7f,  500, 1840,  10, 70 )
> PROPER( "aldo1", 0x10, BIT(3), 0x16, 0x1f,  500, 3500, 100, NA )
> PROPER( "dldo1", 0x10, BIT(4), 0x17, 0x1f,  500, 3500, 100, NA )
>         {}
> };
> But we still need something to avoid the array altogether when another AXP
> is selected, which might require #ifdefs.
> So it might be possible, but the devil is probably in the details.
>
> For now I just wanted to avoid adding more AXP driver files to
> the drivers/power directory, so I consider this a future optimisation.

That all makes sense, thanks for the great explanation!

> Happy to take patches :-D
>
> Cheers,
> Andre
>
> > Peter
> >
> > > To help bisect-ability, and to simplify review, each of the simpler AXP
> > > drivers covered by this approach is handled in a separate patch.
> > > We just convert the AXP313, AXP305, AXP717 for now, and on the way add
> > > support for the AXP707, just because it's now very easy, and we will
> > > need it soon enough.
> > > The other AXP SPL drivers are more complex, and support more regulators,
> > > but my hunch is that we really just need the DC/DC converters in the
> > > SPL. However I need to prove and test this, so I will convert the other
> > > AXP chips later.
> > >
> > > Please have a look and comment whether the approach in general is a good
> > > idea.
> > >
> > > Cheers,
> > > Andre
> > >
> > > Andre Przywara (6):
> > >   power: pmic: sunxi: only build AXP drivers for SPL
> > >   power: pmic: sunxi: introduce generic SPL AXP DC/DC driver
> > >   power: pmic: sunxi: replace AXP717 SPL driver
> > >   power: pmic: sunxi: use generic AXP SPL driver for AXP313
> > >   power: pmic: sunxi: use generic AXP SPL driver for AXP305
> > >   power: pmic: sunxi: add AXP707 support
> > >
> > >  drivers/power/Makefile  |   8 +-
> > >  drivers/power/axp305.c  |  82 ------------------
> > >  drivers/power/axp313.c  | 133 -----------------------------
> > >  drivers/power/axp717.c  |  92 --------------------
> > >  drivers/power/axp_spl.c | 184 ++++++++++++++++++++++++++++++++++++++++
> > >  5 files changed, 189 insertions(+), 310 deletions(-)
> > >  delete mode 100644 drivers/power/axp305.c
> > >  delete mode 100644 drivers/power/axp313.c
> > >  delete mode 100644 drivers/power/axp717.c
> > >  create mode 100644 drivers/power/axp_spl.c
> > >
> > > --
> > > 2.35.8
> > >
>
