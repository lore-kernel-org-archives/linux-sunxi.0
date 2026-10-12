Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DFB471CEB
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 18:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829574; cv=pass; b=AZ4wWUfSAYzRBgr6BulltQc5aeLXh5eOWI515AcFK12rY/XLXIqJCd9P/xrfiJMoqKyEB0aQVWHkC0d0b1M/DTPpsolAHOzwEiRmoIhn3t0ZawZZjLYAjp1id4CRFpBkbjinq0wbTkikTBKlIe0Jm6dJ6tt6j7updbG4bLuChIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829574; c=relaxed/simple;
	bh=i4NUyyNT6Z+Ov6SBreB/v9GEhH7h3KQp3Gl3VKlI4o0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcKsOWRPNBiu4Erf8qNxkHPyUQhUx35usSolXJuH19jCx0J0GjI6FBbwCn77XwPgoCTgS8oMfVpJGPvtGzutmiUdGdFs1LsDoj1HJ9qZT7mNYKsUDvBNy0hwKNuJhR1G2lTkdqoRz/2x0F59CC2r4/Rnn4yM2KfIgjD4X6YrVPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxtP7sXY; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxtP7sXY"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5df34e70a50so2870792e0c.1
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 11:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791829572; cv=none;
        d=google.com; s=arc-20260327;
        b=SvtS7KSqyU3/CmljSCaBLTU5t1ou+2zTr4bwefITOVaJ1JiXb8E55uDH8dI03iJkKw
         HMLq+VYR9MUv9ekZ9VCB6tTRbpGc7J8b0VHo0lJOqgWkkqQWRWlZORYbFcKP+cOWVW8h
         jQhjYDkd3t+aRmv2oSj5pfWOnIqAjtOnDc7/M4kb0Kf2K548Fu1i8E0EQ+pKXrZx6Bo9
         O+dP/1MkBnEx6Kpib0H7DYrTlXataAO9a0AU2hc0ZMVRYlQ2UCwX6O7SAzRkCh8guoBs
         B+zI2MXupBdo0EFKfRIW5ZjIfzwUVQddjrAvfGYy0I/uDURS+kYHDRJI0aeq+3evhmlT
         fT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uS0kC1tZmKLnFAc3gpM2J8lvwjycam1N7G0nExBvzCY=;
        fh=XwMlL1wV/JO19DSYtUxcKNkTbxPkhuzK9seYWhjYWDY=;
        b=sRF4feHpKwJDBqSSP5iakhflJICc7PMMEY+I+F44CDiBuORkWZN7P2WLivdwP8VI9d
         vbVM3qVFtEKVmC1Qk9SoRscUaCYE2MSUX7CRRVBPlWcGzKDJdEiFUQrh1VYsmpxVGT/v
         swQcSWZwaOnPDUDelo4NqG9/X0dJRjPmJayCp48Z5jsBqdeCPpxMTr+l72h5L09ZLer6
         Td/yzXlIAQzJc3PehLQApASBczevnxNlx9cA5ltCgL3dqF9xXi3RTEbHHnMPLH2HsyaN
         Dj/5TYU/TqbgLjyDFXyLtOiWLcrQYNHeUxQTYU+qfmviUQ3UmYrjymMRHMwhe/4bl8JH
         ejFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829572; x=1792434372; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uS0kC1tZmKLnFAc3gpM2J8lvwjycam1N7G0nExBvzCY=;
        b=ZxtP7sXYCYdvj2CaaH+feNt30JPEHfiT/sksHp8TEmQxAqJ9Ve8wKkOvgy30l6DykL
         7uf2zdUx0/ASck134NAZK8VqT/JTCiEKFHRwrVJSxc8vDkknlhlMq4G6sgJb2iCpeCKB
         yXLQItnZd659yDUtoQwaI5fw83NUyX71Y6NfrtZwu/Y3uuUTj0DCmmRfhr5QS2MHGyGH
         DLhjtD7NgojCmBVyqEiTcwaridO3i04iwMjxotRZUJ4/nJ4ummw3zaXO31sxx2+dCzW4
         CmQVruSLNpUdr9woCM3sVS3H3ggt8mIA15ovHZlY3Aa0+/uLNhkcd65OCrxjgteRviX+
         m3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829572; x=1792434372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uS0kC1tZmKLnFAc3gpM2J8lvwjycam1N7G0nExBvzCY=;
        b=NPfpTgxGHyNO5FTvxhuXP3VoCtdYvYZp/oYazQ8mR/JA3AZaJg6x80aQJjEX7DwVpW
         Gtrs2ThrFdXjs7Ew9AY1o6gJ1kQlLxdOV5A9dbgwloa8AjXpz8xNl/Pu7qkeKi9ASay9
         iGSC2q7wsIepmP+YgotCxyPjJ2b2QBu3PCliOXpgWoF+4yhJjdIaXFyBxQFM36jSNpeS
         +MczznQ+UqEZsP6OLy0OleYc+Bdjk5CkWip5VhVlrBZvFbINaOO1rU4gPNIwuxoxw0Jk
         Vq4oPqDlBb+k7+aHrViKrDP3cG2c07r6jekEXKVB8mwwPK2VnVFUioQQx+sv3cTMSWM0
         LL7g==
X-Forwarded-Encrypted: i=1; AKwUvBw6kT2e5hFIQUldUUnSF58R/6w56wefR3EMTiK2jinCvkJp3bFn2tLWZ7DNPtr2wYeGZlcQKxmLph108Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKJgIEHlI1eAqc7kmRGluSPf+kl+5s+arCA9Qj7+Pr3fkyJW7AB
	h4wmT4TmKfLsFiapUMXdLsvL0tOqamRNQ/ssb8YjEIaIaGBpT8XtyuKXONNQz7ndfiUILFUbEPA
	gzQ0phsZzOR8S2Xpc8lUlJNYjVEzUIJE=
X-Gm-Gg: AYBFou2Swi2D315tn/S8mtzrseeICEpyToVtCFA/rfY0mLz8epjYjIQjgphg3H994ag
	I8AAHbVH3TWgFYXKXufmX+eRzd/LUL/z/nptdX8cAKZ31GQoDzEjqxFqBnQIGWfaR/KSe/8D7S2
	Pd68INletGnhceZ/H6xX7tAymqJ6bC5XNgXxbt2xkEzXgpY6qNa2V5Hmz8IVfdDEbD3PmqdmuTY
	i7E2DJ9WQvSVnMkfxPpr0y4GcxC7dPL1+WosJyAil015gJvltRqWQrq6LGtljzISzkTFypbVbxG
	VSjBDwXBx/D4tUEtFMafI+F0tF0yKOU/wXLvCTatotTZ0fQ3ydH68qa83v1mxt6yK/Ri15hCPPW
	c/Y1BT6EAgPCJcisphOF4jJygjK8efE6d0cbM3dAewjUF0k5RFZIaZY2b6KkOhDytQAvvTCgOJg
	nyJpV7m1Ee4x80XGKdzMFmK8IUu74UiQc2XS+LkUirLoQS
X-Received: by 2002:a05:6102:370f:b0:798:24e8:23f4 with SMTP id
 ada2fe7eead31-7cb42a03e2dmr2294757137.7.1791829571647; Mon, 12 Oct 2026
 11:26:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com> <8733ua23xs.fsf@bootlin.com>
In-Reply-To: <8733ua23xs.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 12:26:00 -0600
X-Gm-Features: AclHuK-YE9EZvdISkdO2ItcawmmP4G9wFY0yyJFRi71wZBtPLVkiWianJdKsR5A
Message-ID: <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:02=E2=80=AFPM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hi James,
>
> On 14/09/2026 at 15:09:47 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > A timed-out wait can return while the interrupt handler is still using
> > the previous operation's interrupt status and enable mask. Starting the
> > next wait calls init_completion() on the same object, which can reset i=
ts
> > waitqueue lock while the old handler calls complete(). The old handler
> > can also complete the new wait or restore an obsolete interrupt mask.
> >
> > Initialize the completion once in probe and use reinit_completion() for
> > each interrupt-driven wait. On timeout, disable and synchronize the IRQ
> > before masking controller interrupts and acknowledging the waited-for
> > events. Draining the handler first also prevents a partial-event handle=
r
> > from rewriting the enable mask after it has been cleared. Flush these
> > register writes before re-enabling the IRQ line, leaving the controller=
's
> > interrupt sources masked.
> >
> > For successful waits, move complete() after the handler's register upda=
tes
> > so that the next operation cannot race with those updates. Keep polling
> > unchanged and leave controller and DMA abort handling to the existing
> > callers.
> >
> > Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller suppor=
t")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> So from the commit log I understand that you are fixing a race. The
> problem seems legitimate.
>
> >  drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
> >  1 file changed, 20 insertions(+), 6 deletions(-)
> >
>
> ...
>
> > @@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, v=
oid *dev_id)
> >       if (!(ien & st))
> >               return IRQ_NONE;
> >
> > -     if ((ien & st) =3D=3D ien)
> > -             complete(&nfc->complete);
> > -
> > +     /* Finish updating the interrupt state before waking the next ope=
ration. */
> >       writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
> >       writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
> >
> > +     if ((ien & st) =3D=3D ien)
> > +             complete(&nfc->complete);
> > +
> >       return IRQ_HANDLED;
> >  }
> >
> > @@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc=
 *nfc, u32 events,
> >               timeout_ms =3D NFC_DEFAULT_TIMEOUT_MS;
> >
> >       if (!use_polling) {
> > -             init_completion(&nfc->complete);
> > +             reinit_completion(&nfc->complete);
>
> The whole change around (re)init_completion looks relevant (here and in t=
he handler).
>
> >
> >               writel(events, nfc->regs + NFC_REG_INT);
> >               ret =3D wait_for_completion_timeout(&nfc->complete,
> >                                               msecs_to_jiffies(timeout_=
ms));
> > -             if (!ret)
> > +             if (!ret) {
> > +                     /* Drain the handler before it can restore an old=
 IRQ mask. */
> > +                     disable_irq(nfc->irq);
>
> disable_irq() for serializing accesses to a single register?

The intention was to drain an in-flight handler before cleaning up the
timed-out wait, rather than just serialize the register write.
disable_irq() provides that synchronization as well as masking the line.
It is only used on timeout, and this IRQ is requested without IRQF_SHARED.

A spinlock could also address this, provided it covers the handler's
status/enable reads through complete(), together with the waiter's
cleanup and rearming. Protecting only the register writes would leave
the handler able to act on an old snapshot.

> It
> certainly works but I don't think it is so common to use it like that,
> for such simple cases. Typically in this case I would have used a
> spinlock maybe? Or even better, why not just avoid the race entirely
> and handle the register in the waiter?

One detail to account for is that the MBUS DMA path waits for both
NFC_CMD_INT_FLAG and NFC_DMA_INT_FLAG. The handler currently acknowledges
and masks each event as it arrives, leaving the remaining event enabled
until both have completed.

Moving the register handling to the waiter would therefore need to
preserve partial-event tracking and avoid leaving an asserted interrupt
source enabled while waiting for the task to run.

> You certainly don't need to write
> it in the IRQ handler. You can handle the IRQ configuration at the
> device level, which will also prevent the need for your extra
> readl "barrier" before enabling the IRQ.
>
> Furthermore, now that I have a better understanding, re-reading the
> commit log, I now disagree with the first part of:
>
> >The old handler can also complete the new wait or restore an obsolete in=
terrupt mask.
>
> "complete the new wait"? I don't see how a stale handler completes the
> next wait given the handler is a hard IRQ and the interrupt enable
> register is cleared on timeout.

The case I had in mind is an already-running handler on another CPU:

CPU 0: Read st and ien for operation A.
CPU 1: Time out operation A, mask/acknowledge its interrupts,
       then eventually reinitialize the completion for operation B.
CPU 0: Call complete() based on the saved st and ien from operation A.

Clearing the device's enable register does not invalidate those local
values or wait for the running handler to finish. Hard-IRQ context
prevents this overlap on the same CPU, but not across CPUs.

That distinction was not explicit enough in the commit message. I'm
open to a different implementation; the requirement I wanted to preserve
is that the old handler cannot update the mask or signal the completion
after the waiter has cleaned up and reused it.

>
> Thanks,
> Miqu=C3=A8l
