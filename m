Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD788479
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jan 2025 19:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737400903; cv=none; b=AfxCCKKXH23I3qkMG5+ypimf+MBKcu2EQOvsZN8ZNkijgAscUBN5opBlHdrv1mGrXarajg6kbQCDHFr740nGn5MECsW7GXHhMqOcr8HMTIQqNbZn+vrLMh6GAHMVa6kz4tLsWtJpvyCu1j8P8a73BgtMgWvgJFE70hKyVlzGKw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737400903; c=relaxed/simple;
	bh=ol/UIwxYpsEwhE1G5UkqnxTePc9gTEXrDroT29RXzoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHRZs457NFSDBvRsCcI7utVjP6RmPMbGSRPYYLxP0cWWAPvO462Qnkpwc3osWl5xfc50ACl7SIRmyzhTXdQXrerAdXr2IGPx9puDZQMagDyYhyZIRFdQDQGycCIU8v5THiVcGdGJLPpecCG8Q3o8dgGiH5SpC3y+ElC7yg/iJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MKbUY4dz; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MKbUY4dz"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab2aea81cd8so817719666b.2
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jan 2025 11:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737400900; x=1738005700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muTzZGvk4vEJAiUQGAXvVtBwG/96Tuo+iSaQ5fbh27M=;
        b=MKbUY4dza8qEYpXbuHR81n7tvoesCBliWFy54rM+ayP4TAmu0u7RwmrjYU8Mf9BeN+
         GNl1OUmL/pS1W4164P+9Q59pXjn+xwScimhpohl/mZyJvYaalpyAYts4OANYIKfTj5O4
         K+nhbySWAe3RzcYsLd2vaC9/pqYvcXmCt6Gi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737400900; x=1738005700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muTzZGvk4vEJAiUQGAXvVtBwG/96Tuo+iSaQ5fbh27M=;
        b=CNmetpijjg0NoaZruxkxfK2JjC/6FwurKbcdl5EKyYNIN94UmDJPQgPJaAhcKypLTa
         G6VVAHKSEIBJnGedjCzde0L/dVm9vYTU5++x7AtLD0HgGthiEshLh3vFte8qrd/S9IjX
         6tJWXFcpy/i1VCp4v4I7YXcuZbng+WYo/8mqEPG42MtfHjjFtt04xnueB4k3q4Hw1QAY
         ewY37QVnb25Ifi89Vujl/JzAitTNGUVCwMp8g1CghTY603JuR+t3icorkzq2zjhVxdsb
         d4AQ7YkwPMxTBYhbKYLXqb6theDEIQjmO2qV5p24e/FjBEQaYcGYejYtYUbn3DQ4sxpG
         MEWw==
X-Forwarded-Encrypted: i=1; AJvYcCUPvJZMc5d/l81RyEriEs09/QEJqjGjNnzoQtmWBCWG2tpd0lWK4fy6RrcOKtiSL4+CYF/qF88aNeWMQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIgeyotVnAlB7fyxbmwJxYPiJRG4OME5UntMzyfolap9hvGM+v
	GoyDvlFeD273sqLNpcAwWDw83h7VwmUT9RtS+AopmRstdMFsnnIjDLCz7PdeUv+2P1J+GDjmqW5
	kco65tAttzxsFEWOYNofuHzuRMw1+ufUqNOFh/QD2N1lhqMY=
X-Gm-Gg: ASbGnculbRnKSxx/YmUGF4VeQkj8BQ6253CdUCbpN2h84fd/w6BMx/+EVabzxq4hpMI
	V99tk988Yeo41Nbxjnv4rNK5zwygSq13cOjirIri34x2t9V/lniV0
X-Google-Smtp-Source: AGHT+IGHvXEjthPntDSZf4gH+1cwaOlZnxup6zo9b1UyhtBElrAI5Fxnl0cUjHw4gVOe7ebsRfdsxFgdvG0fONt1GZI=
X-Received: by 2002:a17:907:3e1e:b0:aab:eefd:4ceb with SMTP id
 a640c23a62f3a-ab38b0a2b92mr1435705866b.10.1737400900303; Mon, 20 Jan 2025
 11:21:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250117014537.22513-1-andre.przywara@arm.com>
 <2352334.ElGaqSPkdT@jernej-laptop> <20250119222530.1fd97018@minigeek.lan> <4622391.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <4622391.LvFx2qVVIh@jernej-laptop>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 Jan 2025 12:21:28 -0700
X-Gm-Features: AbW1kvZ4uL025Zh0CyxnFCAVNDg-HM-Yt2Se1k0y2SpyS0gYLi8HjRn7ulftZFw
Message-ID: <CAFLszTjDq4E05Q_esYA2tAGOYdhgbRp3B38gAsF0hX44Nf-34A@mail.gmail.com>
Subject: Re: [PATCH 2/8] sunxi: pmic_bus: support alternative I2C address
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, u-boot@lists.denx.de, 
	Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Tom Rini <trini@konsulko.com>, 
	Cody Eksal <masterr3c0rd@epochal.quest>, linux-sunxi@lists.linux.dev, 
	Parthiban <parthiban@linumiz.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 20 Jan 2025 at 09:42, Jernej =C5=A0krabec <jernej.skrabec@gmail.com=
> wrote:
>
> Dne nedelja, 19. januar 2025 ob 23:25:30 Srednjeevropski standardni =C4=
=8Das je Andre Przywara napisal(a):
> > On Sat, 18 Jan 2025 08:21:31 +0100
> > Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
> >
> > Hi Jernej,
> >
> > many thanks for the review and your opinion.
> >
> > > Dne petek, 17. januar 2025 ob 02:45:31 Srednjeevropski standardni =C4=
=8Das je Andre Przywara napisal(a):
> > > > Some of the X-Power AXP PMICs can be ordered with an alternative I2=
C
> > > > address, for instance an AXP717 could be shipped with address 0x34 =
or
> > > > with address 0x35.
> > > > The datasheets for the AXP717 and AXP803 list two possible addresse=
s,
> > > > and they are always consecutive. For DM (DT) based drivers this is =
no
> > > > problem, but the Allwinner SPL code relies on a hardcoded address.
> > > >
> > > > Add a Kconfig variable that will add "1" to the existing address if=
 it
> > > > is set.
> > > > This enables to use the AXP717 as used on boards with the new Allwi=
nner
> > > > A523 chip.
> > > >
> > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > >
> > > This works until some board vendor start mixing one or another addres=
s
> > > PMIC. Note that BSP boot0 does address autodetection, so it's not ent=
irely
> > > out of the question. Anyway, let's hope we don't see anything like th=
at.
> >
> > I looked at the datasheets for all supported PMICs, and they either
> > state one or two supported addresses, in the latter case both
> > consecutive. Autodetection sounds nice, but also unnecessary: we surely
> > know what address it is for a certain board? And with those A523 boards
> > having two PMICs, autodetection might become sketchy, as we don't know
> > for sure which PMIC we got?
>
> Speaking for T527 BSP boot0 - they check version register to make sure th=
at
> correct PMIC is installed.
>
> >
> > But that got me thinking: what about putting the I2C address in Kconfig
> > directly, with defaults depending on the PMIC type?
> >
> > config AXP_I2C_ADDR
> >       hex "AXP PMIC I2C address"
> >       depends on ARCH_SUNXI && !SUNXI_NO_PMIC
> >       default 0x36 if AXP305_POWER
> >       ....
> >
> > That's should work seamlessly for all supported PMICs, and we just need
> > one line for the Avaota, same as with this patch here.
> >
> > What do you think?
>
> Yeah, looks more universal and avoids code changes in pmic_bus.c when
> adding support for new AXP PMIC, which is very nice indeed.

Shouldn't this be in the devicetree?
[..]
Regards,
Simon
