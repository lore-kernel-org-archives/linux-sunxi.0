Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4753528452
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076964; cv=pass; b=oW/g+IkxU8Yg4bjhtT5ohCSSczlrhyPU4nQsxKbuZSbcoo4ixgpG162mbPf83qd2Q7v07Hv+o5pkutndu2ZDIgPWjn22Na3saJ+S4Y0Lfvak/UMvkW0xBeaHfW+atHtYrhL1dXsItDdLIFSBzSqZKSBg2oGT1qGL6Htdu4j/m1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076964; c=relaxed/simple;
	bh=MLiIS6oDDFsD34KL+G8e/3T/Al1HvZKZmMra2+d9nPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lde8+qjU+OL/6TmJrPFbtMFw9T8X60GgC/mX7BrPrcybPZyK3aFqzuGGkTDCXbZ/xQTd2uwvQENKU+IGX1EtLmFCGilmBJ7FvdEJe6XBd9WBG6lYCPAaYkJ+nELLNy9Ppw1PoaZ4lAvrWH+nGg4tlvxW8KQl++kq4yX5wnAVRTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7SwzdLw; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7SwzdLw"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7c2f48f3a96so792809137.1
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 08:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076962; cv=none;
        d=google.com; s=arc-20260327;
        b=stAl4uuAXoOAie2R86rdJfoh6MIL/kyeh1RE3FgU75q8nIqbrUmg2sn69iVkuS33Je
         GuhppDJnrc5ezSwKMyTp6MbxjslMxmEQdMyQFO1WFtHik5+fxc8655Q973NrxDFMn1if
         aihp8mZjgxwNZy3nIk3/BTq52+kEo7kKz9SkNL+zzJRM2mz1QnqpVVkOx7sHbgrGAlJG
         0/SSbo/aZRTH8BAX6jgGqSjTL3KJybrj4uC7u2QSEda215RQPobzPyNNU2he8Zkuabqq
         rhUyj41A/75ihMjxB3UJURoP81UG6qyj0BA/jYCsWcE0wjOTryAhEUfWGaMoqLAmo+rx
         jAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        fh=TLfsZd98cTFaEmWL1ExXIQ3NaBZOGJoMM4uajU6+xds=;
        b=aAySk0Rz/ygjxec5yr2/Tej+jX+Te3oiZQ9zHjxgt9Gg8YmCwcH3LXRzq6snGDLCKg
         HOTdSs0YxFGltHKFRvzN8ar/mUH8GZMN+uxQZG24QsAVxdWjeNOP89b/B7s1lEAaGO20
         FqzYph6SXx81Xv5c4DQzt72LfMYRiBBgz+JfhKPXaqA+TJaisbYKL46Wcf6jDWCxAdXT
         TLqN0NMeFlB5aTn9qYeVgqKdpg6i1APAmNdVDoqRBUX8XvqGAPrZK2nHtfAJpSM54jPz
         ZuqnNsv57WICo0HIUivqDQ+c/HkxAYCOJAEHEhOkPjeChL04SEcqqUTMeNQKKTUp8mB+
         QGUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792076962; x=1792681762; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        b=F7SwzdLwUMdGfSFcfXclemFdUjP9WgCAkxDKhQ+9h7TaPN1pTJ+U10Rnc0U8OAcDqu
         eQnl5Tys71kryUj73gIR7+/DZv700SyiFaBQr+MzGCfjwg9BI0yIZIX0s+XgdxAi0PeS
         C0BtkDFfJI7HSiWDgZhpoLLnbc/8+P7gFpJ4t4Y/SudSkxWyB1UukSsAcMIYdqL/mf4l
         AezF1wJs/pboeMbDCgSqyJYZZSv4OOyk8VvC9dA0ohbRmmmu/npp+hm49A6Z1gfBByhD
         7swMqFqh7qdV3/W2GMn3GhFjErHlQt/r45IedfBBD0cumVeyvJ5OwRjuQExXy3V4Xt7O
         hpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076962; x=1792681762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        b=JFSOH8gNgnST1fg822Pze06AsPXItJ5z1tJA2M/nnUsyKDL1DqCuMPaGDkwB7BEbJK
         2P8fhWeP9bJisiqP4UPGgrZ/wMPsoU/oHlfAK01Mp7p8iToj9zYm1UQmFpN2V/Hg0KyF
         E166DsQi1uMEdXe9+geVdMNz3cl5nIhNG4OKFF3+fNJC4IqP3r3iONm02VtE89HF3SVW
         Z/TJZeUvzD1VWWHLsFTCWLfHDCDFrA4FYSh6yLyugKZp0SUKg1PxCRh7Y+Z1aD3QlNgY
         UXSmiGqam0CzxL9ckT8FwU2ZQOtnYX1rCCqGqa+wksCbCSq3j57R8zmqgA4HOSvzQhtt
         U9fA==
X-Forwarded-Encrypted: i=1; AKwUvBwciUnt+6p+g7vq0SFS5/ubb9FfoowSLgzjUOARPYOwlxvaDuF3vqpTiIZo2Z18QS65VFVLn7N6mO3JeA==@lists.linux.dev
X-Gm-Message-State: AFq9FYL8+F7LztTYjRykgvY0OLzuPKW5cKUWmRjKe+FbjHxrwuj2TvLF
	WjGkChNY3F7wDdHFC7L+2t0QK6OM+vm2x5PYJ9Mq741MoUnEUn6atjFuNpRdvcPzse+GYC5SDqW
	UrssBAGpG8iGReSvii2nF330WqXZ9GH8=
X-Gm-Gg: AYBFou10fZOHqrjNozusLqqJ3+SdRGymjH0YGGFa1g3iA7JjxGMfto7k4zghqfe4tOW
	TkGxGID6zIwc0l6DnjhwPrzRmRDXeWGVTcsi2ZvjUXBeNeSnp35oBjRlCZcMXFuAW9p6ODKOXyE
	FfK9NxoORnM/vVNWoblDkKrwy8k0jV30epaT5rblKLNBiHfiJUA2G7yh5ijxU18V41D27RKMoy3
	aSUpAIBO8hhV5l+NPt53KP/RVOEuF20PvSpb16TCbaOWXAuCzS0Oi2i39zfOIlpK31a2vz+dguB
	afyjSsVtX98/Isux3aA3tiQL++ZPFXviCJSAqzggtfJ8jw0cvAOoSfQ1/iQwBn55zHdUQGIkyiz
	9NWqzxhRcUuM9SEKW7iNEus0MIu5UtM+TfTdSopGkCmRKHW2xVIogsB2DQlgaaNFGq5r5mfsH0y
	u26uQbiU6ddS3P8scjPK8Kc/bz595tBUXoF5X/sQL3S0OR
X-Received: by 2002:a67:e713:0:b0:7b4:bdf5:9307 with SMTP id
 ada2fe7eead31-7cb3a17c668mr4997492137.30.1792076961441; Thu, 15 Oct 2026
 08:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
 <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-4-5d3fc6ad2da1@gmail.com> <20261015071943.7OihPadq@linutronix.de>
In-Reply-To: <20261015071943.7OihPadq@linutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 09:09:08 -0600
X-Gm-Features: AclHuK-qAIJ8Ws5pW7BZAdTu8Nckn4yY6BNzqqth23CDA7sDTjbDwYfiY-Jvt6s
Message-ID: <CADvTj4q9cqLY5fB=u+ZdS4K18V3T-AuQ=_6aMNOgcMyXC8yYeg@mail.gmail.com>
Subject: Re: [PATCH v7 04/16] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:19=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-10-14 19:33:51 [-0600], James Hilliard wrote:
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -454,16 +457,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc=
 *nfc, u32 events,
> >               timeout_ms =3D NFC_DEFAULT_TIMEOUT_MS;
> >
> >       if (!use_polling) {
> > -             init_completion(&nfc->complete);
> > +             reinit_completion(&nfc->complete);
> >
> >               writel(events, nfc->regs + NFC_REG_INT);
> >
> >               ret =3D wait_for_completion_timeout(&nfc->complete,
> >                                               msecs_to_jiffies(timeout_=
ms));
> > -             if (!ret)
> > +             if (!ret) {
> > +                     /* Drain the handler before it can restore an old=
 IRQ mask. */
> > +                     disable_irq(nfc->irq);
> >                       ret =3D -ETIMEDOUT;
> > -             else
> > +             } else {
> >                       ret =3D 0;
> > +             }
> >
> >               writel(0, nfc->regs + NFC_REG_INT);
> >       } else {
> > @@ -476,6 +482,12 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc =
*nfc, u32 events,
> >
> >       writel(events & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
> >
> > +     if (!use_polling && ret) {
> > +             /* Flush the mask and acknowledgment before re-enabling t=
he IRQ. */
> > +             readl(nfc->regs + NFC_REG_INT);
> > +             enable_irq(nfc->irq);
>
> Shouldn't you re-read NFC_REG_ST, checking if the event became true even
> in the case of a timeout?
> Say the interrupt wake the thread but the thread never had a chance
> to run. The timer (on another CPU) had a chance to run and did wake this
> thread. Checking the event in the timeout case would help to prevent
> that.

Yes. I've folded a recheck into the IRQ fix for v8, after draining the
handler but before masking and acknowledging the controller events.

One detail is that the handler acknowledges each event and removes it
from NFC_REG_INT. For transfers waiting for both command and DMA
completion, one event may therefore have been consumed already.
Checking status against the original event mask would miss that case.

The timeout path now checks only the remaining enabled events:

      if (!ret) {
              u32 pending, status;

              disable_irq(nfc->irq);
              irq_disabled =3D true;

              pending =3D readl(nfc->regs + NFC_REG_INT) & events;
              status =3D readl(nfc->regs + NFC_REG_ST);
              ret =3D (status & pending) =3D=3D pending ? 0 : -ETIMEDOUT;
      } else {
              ret =3D 0;
      }

An empty remaining mask also counts as success: it means the handler
processed all requested events while the timeout path was draining it.

irq_disabled is initialized to false at function entry. After masking
and acknowledging the events, cleanup uses that flag rather than ret:

      if (irq_disabled) {
              readl(nfc->regs + NFC_REG_INT);
              enable_irq(nfc->irq);
      }

That preserves the write flush and ensures the IRQ is re-enabled even
when the recheck changes the timeout result to success. Successful
waits and polling are otherwise unchanged.

>
> > +     }
> > +
> >       if (ret)
> >               dev_err(nfc->dev, "wait interrupt timedout\n");
> >
>
> Sebastian
