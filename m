Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DD74FC8D5
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 16:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540783; cv=pass; b=X/R1VVPOGgAA0X4PVICFciIH42gqWrR6QpSP4JnUM3SI3IHzo2/W0E1ynWoFRLq9Bx+tuC5IZFgsJZ/zqjCXBnemUnAAbR1oqIomgxDk0SRDtUALGkfhMhHb8IMCriC6htFLUXMbEztAnpz5Cjpk4MRmmB5DY0uEVg/PUn3NEQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540783; c=relaxed/simple;
	bh=nCqEeX/YmPXgBfiXFWn13hZN8T7Z+lPuAqTre4JIEAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lG5dbOI9aLLDQmhhApg/ZBHVnl3NoaX4j15E55FBnX9ITDSHRFRCrhSsXRRZKbaR7kbEfvDZK+rK1V6CjY32WA3lThW5E8rPhVBSUFKBFhAQwrmIJlUlAhN2TiVvI72ZRYRSENTo6pwmGUpdgzwFqAuSMoHCc1pk30+OLua+uHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3lhLBLa; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3lhLBLa"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7894670be7dso508919137.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 09:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788540780; cv=none;
        d=google.com; s=arc-20260327;
        b=pXv2eFUhvr5P6XXAemkmdqqRn6KAK9ObLZJt+inezrxipXM7Y/4sboMOc38kil71/y
         fLMViOWVnLdZntkzyCjRN7ztD0GuEy8WVqaCgroP5HqIjF90WGMFkvDP0tkr4suyabzp
         ZPkahvuyou+gBHE73G4FYhfo/1R/j0fU5kJOgmd7MqpAANUGwW5+GShe1FjTFGF6SMF3
         VZ6HH+W0Oac2i+Xh1sajAu8D1d3p0HisS8emkwhgY8wYNCxjtAtP0mmgr33YB9vfQ6uV
         b0f4QWwiwLwWZEdgHDL4h8BU+sjOgIvkOWt5Quq/aKJ8O+cxS8SeGVhlmLCgtopATOtD
         ED1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        fh=z3WC9xkV32ryOjOZJc9qgtcAPOjOjkmiathqJVurfQ0=;
        b=o+CtSNjRgqFgn7gaJnSUHZ9Y4/LZ5YuMrxJhxqc9Md1ezWEhfd/jqbqH0EQJrG4FUp
         4JdoIjPxPZFTDEyJpxsrtAR4+kscb1LCUUO/zn+qsBF/OXzi26sKWfPaHrSz4lqYxnW3
         +D1mvQSLZtWQVr0Op1VAw2FF82BGXeZLXWfbWE9rI8o5p3bBEupZsulvVZPBay1lEygC
         uL0M2j9AcHwvjrEY5ujsuxRnWTAhumoiHB/AFxYaCZqAGv1c5yuiEU40CwMKEeEhhGqT
         GbDq27/sgLl/74eS/T957IWgSVA40GKFcHij/K071j7KDMbEXoUxPbDZvzxbbS7vG/yk
         5nRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788540780; x=1789145580; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        b=W3lhLBLaFfzDZuRuePdFYidnmkFt5bN51Y8DkFnOKveoRzNthOFDDsfiedlvu2wguC
         +i37MyK8+6BrYCnmFVP9ZYH6wzyExnr+SawwKch71ChJZIofV4mnxJcRgQJCLRVj6Rbr
         5o7grI+duGcGTip4h0R1OeFFin9VIgFSr9l5aQOZroFewXy7lQmq+Vz9uv6q75PRIjWo
         UUo3rcdQMC8ufWmIRBhBDksZLurfpJSajFxHvQeQ0j9XXZzDhOXMOsv5DJDiotj/Gmet
         YwZfzwg9TmpMuC2fYC/sMQdb6kVaJ1ou2Am9984bcX5XmZWLyQBworWJdmpbd3dZePX5
         ox2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540780; x=1789145580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ien2o60ZIi4QpF5qZ3s+1MoomCrROw/TLgJB8j1A6bc=;
        b=fMW+44XXT0N01F/FNEJgX0mLcYPms63DafBEuVQJ/980eR19veOHk4bs4yfVV16CO0
         J4uGti5GBXOw2lrT6ishKCu0aJ1EG6qr0azRfrXxjS+JAmqg0EmngZ+XvQGZD1i7gN/x
         i8/+zCnhG10SeTYKRIAkg7hUkaaqO3gXKEj6009hRbg88px6GgNi528mSzjiiB82wzpZ
         THFcRMlxuNUMThltYG3uQWQRpRK2hvbHu7vW0DDzhC0sVjiXfkaBvS5RTVdAMy009SRC
         A0ENS8aUDL1rMcWnpDSlQjwT7NJmqkCswBvjFwmFKOynL1BrtjM1jnJlkwG+jc6twwB3
         fLwA==
X-Forwarded-Encrypted: i=1; AKwUvBy7JZPHIVUnPTsV0oy0x9IARZOzPz5K+BXJqIDp80MSHmZQVR1q7BZVJ4cUtJeEGZdd8ciYbOWEzqcTSg==@lists.linux.dev
X-Gm-Message-State: AFuF++kWastB01s9CAebsB1xt7sKjBk1lW3fHN+FULkdbz2Kq5wcy22i
	cGnQjVDEfHiorSHAsURXE5yBsO8ICzzf2oLvp9lCciAuFNxvlt/tk0GxCVAzMRWnUcNtFcJWdHH
	wfK/7IdXvtN9t3wG9MM2LUEWV/tcDMm0=
X-Gm-Gg: AYBFou0KfZDTWvQA1jgxJDzsBqCMd9b36R2/SbjjNF3Mm+0AU9FfbSJ2RFYyqiCJU3M
	Uf65B2Tfh9jEI30fY59QSu0mw257D1GPG6tVp3oFUb9tsuk5jimRrLm4V2LbgCIVVSfeGY3FXTc
	8ooxn0oslhVkHRr4HVWzkAPNoa2a6TzQ9RVBMHru/x0s3cJ8+vWZgqM/GATWdHTdkl5pEY/ixdR
	Jg+oK+/LhOHFEbVpBVzcgSl4chXnQVebmIx+sb3KyOXKTCq/0/U6N6Cx+JvB/RfSd6FeVUbH3ss
	VZ/Uv2YfMmfOrU5cDeA0kFt0J/QaCuS8s2ghZsTr83MX3izp71iL9n8+KLr0VLJKWl7hVb3xnCB
	r6Z+qoL6dlu9WSKW1gtiFJnIOEteVqL8cafFRozZJJNb119mnu1T8c6dLDEv6MRWIEmPxlFRbG6
	iJL1lcF30FyrRDveRhuyVEiRbvqgQoXEDRlW5iKA==
X-Received: by 2002:a05:6102:4b01:b0:786:a11e:484d with SMTP id
 ada2fe7eead31-78a4a86b686mr1500572137.6.1788540780511; Fri, 04 Sep 2026
 09:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811060651.227431-1-james.hilliard1@gmail.com> <87ecf911jr.fsf@bootlin.com>
In-Reply-To: <87ecf911jr.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 12:52:49 -0400
X-Gm-Features: AcwNN1VzoX6Wx03j6h-GsWo7X9YwKmv-DqDt9ZWJFHiKu2jY-uxo82M8zbL9kdI
Message-ID: <CADvTj4p3kFN+4NeeouXscPrnHTWKbauVcYXnh2uW1OGHUL_sbQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: sunxi: reject invalid ECC step sizes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	stable@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Richard Genoud <richard.genoud@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 9:25=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 11/08/2026 at 00:06:48 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > ECC maximization forces a 1024-byte ECC step and divides the
> > available OOB bytes by the number of steps. A NAND with a smaller
> > page therefore produces zero steps and a division by zero.
>
> No, steps cannot be < 1. If they are, it's a bug that must be fixed.

The zero step count is created by the Sunxi maximization path itself.
sunxi_nand_hw_ecc_ctrl_init() unconditionally sets ecc->size to 1024,
including for a 512-byte-page NAND, before calculating nsectors.

The controller attach callback runs before nand_scan_tail(), so this
division happens before the generic ECC handling can reject the
configuration or fall back to software ECC.

For this case, would you expect the Sunxi maximization path to retain a
512-byte ECC step on 512-byte-page NANDs, rather than selecting 1024 and
then validating the resulting step count?

> > An explicitly configured ECC step which is larger than, or does not
> > divide, the page also produces an unusable step count before the NAND
> > core can diagnose the configuration.
> >
> > Validate the step size at both points where the driver derives the
> > number of sectors and reject invalid geometries.
> >
> > Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/sunxi_nand.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/s=
unxi_nand.c
> > index 45ccbce91551..ad314c0e30b2 100644
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -2032,6 +2032,15 @@ static void sunxi_nand_detach_chip(struct nand_c=
hip *nand)
> >       sunxi_nand->user_data_bytes =3D NULL;
> >  }
> >
> > +static int sunxi_nfc_ecc_steps(struct mtd_info *mtd, unsigned int step=
_size)
> > +{
> > +     if (!step_size || mtd->writesize < step_size ||
> > +         mtd->writesize % step_size)
>
> I don't get it, mtd->writesize < step_size is conceptually
> impossible. If that happens, it must be fixed earlier than that.

An explicitly configured step reaches the controller attach callback
after the NAND geometry has been detected but before nand_scan_tail().
The Sunxi binding permits step sizes of 512 and 1024 without constraining
them against the detected page size.

Could you clarify where you expect this invariant to be established:
in the raw NAND core before ->attach_chip(), or in the Sunxi driver when
it selects or consumes the ECC configuration?

> > +             return -EINVAL;
> > +
> > +     return mtd->writesize / step_size;
> > +}
> > +
> >  static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32=
_t oobsize,
> >                                       int ecc_bytes, int nsectors)
> >  {
>
> Thanks,
> Miqu=C3=A8l
