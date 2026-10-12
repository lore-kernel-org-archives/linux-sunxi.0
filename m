Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABED37DAA9
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 19:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832658; cv=pass; b=iobZrjpWebmQHn2kQJ8pfJJ7Rknna+mJOd87Zz4QWnOsoHfS+tB7QhNQaeIVDcYmTzSoY2RuAccpwbG2f6TdXzH0rx/75MO1OTVPr1ax3WzahxUVMTQOYeP1Hv5YHVkj3gmXi45Jd41lGZyYWItmJkqUg8+wOYEEJxCaGWlv3+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832658; c=relaxed/simple;
	bh=0NroonrhKu8HwhfLgxgL5i69Qnwboi0dL0/KlCJxyMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgehOobDk9MGFAGXFgBQpYlyLsaTB03hBOhpZvjW4qphEqmMyppJ4uDijHgbAhJ3tyK5+wUQp/6Po2tzB6ePTQ58/lkvdmk4ooJAXyRd+OvsoO8Vkl1J8X/s9/HsVl74xtQAuDi7eMzjK0K3cDlXdpZBfazMj9Qm61wJT/LGbvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwZ3ZkWt; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwZ3ZkWt"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7c02791cadcso633929137.2
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 12:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791832655; cv=none;
        d=google.com; s=arc-20260327;
        b=BcJOqRrw1NpjieAzRFEWeRPaDbP2rQaHFM+/k2Gqumg/6nptUgylFOKx3MRz4B7rhN
         TRzQlYvKcA8CUXpeKJ9wm5kbKJve0S+4kU27PGNk1Ip3MRv6lSD4XVrQyEpLUv4pCViJ
         54lm0NMt5rrwXWc9oJ/4DgmoQBpYzLFRTeJSJBJFhRYjuH/fh7aaCwVrq5/1mSvjpLYz
         UgsNJ+9L7aW0znnPYrJfCGZ4bE4P9NcV/P3EzfVqzezGbTjNd561GVwGl6p79FJ3i/lk
         nnsFVcFSHapyaXW+6F+OaNzIvRWPLTyNbM65MjvmmPa2jFxbsVnehF0BnhjITbIiIGte
         uqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uPLLkky/mBMG1bxMgcOlfanOcStnyU9/PqoEofggCR0=;
        fh=tsjNzzyGYucsvNpbc59O1QRdU0JC0RIursMcO7Vn3qI=;
        b=DPJWZqwey+P16Ugmc8CQue4UEa9IQUK003KwQvYEk1U/lmOLTSZ8NoeVe8xVDmA4Un
         jkxOSMHrhmbgeLrOXYMLGRmzVGejCR3zYroDv6PLRgKvth4BtWBUBIDQWDw3RVfyO6N3
         BPsDZMYzjlJWr0cWgGxFiXeAr3i7G1qLgftxGt5HgVHB6UPv+B2OeIENZPeZeWKqbIp5
         fp1zKchqQtePR5r8iRWGETv0n8Wihyg76pjFyHgzo4lO7Fmeu8YOXjYbWnP+XOyiKSQn
         KuQXOuHkO3JoOCeecWOaLEWmfcD/WTdEPiy7dAxGG7iJ3bXq0tWaYIMLifhX4wAQlHjZ
         RWBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791832655; x=1792437455; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPLLkky/mBMG1bxMgcOlfanOcStnyU9/PqoEofggCR0=;
        b=mwZ3ZkWtvlYdIhwryH72reR94OCxhS4qVHqwGDc9A62kMvk+LEFwJ4xrNfH0eQNZxG
         etqB6j4UW1X4fJduOgBY2YRpB0cJTS0OX5oqiL3HC3WX45HDOjh+K+IhZQWy/e9hRzR8
         ztPBCcO+6a/6nSnVxeiio4D6FgjOtRsZHtd4ExRTBZ22KWYqA6LvKn3JhPSZ/yYFSV0J
         idx9hEnKPp8MgtzA8vCPUcgnwZNdNOAXtEsMLBDe+8/QJxTlo4A74dVmMy+jMc7e2Zs9
         uqfLE6YLmq7oLZ8cusENwAb8/l5uP4Dx3tzRbYVClLVV9omnwxCNyuLEQFfifU6Fu/uf
         bFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832655; x=1792437455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPLLkky/mBMG1bxMgcOlfanOcStnyU9/PqoEofggCR0=;
        b=N9dJY9T3sE0RpvbFHoijO2ElXoEjZ0PrZ9trxHnHEkksuwa/oc9KG5fw/qlYIE6rVb
         gJ0IPYYm9ljbg0wvCZzOxt7EBfTrmoWoTfoOwGztMClhwVGvyo7pEFtN71ZIIiv+W8sa
         g6DN6PtGTbGCE2tp3vfhvYPUA6rIQgXLxyaypuNwoaTOkxGzyDgPthEs2reY2JURoHtt
         KQn8kdajo44PIInstsshQz48qKJWIAsWtSBdOJTB4Fo7DPO5hVFehmlDCMApDdG8JHvy
         SzJ4Z/jZBKbc1Q1A9cfNSw1cCJ74SjPMsO84qWdspF4I7TVf7hlspIWtIarG4x68WWFP
         aXYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+1FU1b/nUbkB3j9gwqBT8ei+vB7lklFl9ufPRJsQLvraPuZtxejSBfMB0cAB103p6T6QnZ8t05DmJLg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJeIkmribD0PFMzvkda7Ajsg+giAKb/CRnm+Iv1veYEO5+byavT
	tLBmItifwEliUEcKF6YKN4iRW7d8G3N4xNtaYoi3uV55R1Jxgpm9W3amVYHxbxZb/D45AgT5trm
	St5RjoURuOCCZKoAaAiqXwM9ynI/1VPg=
X-Gm-Gg: AYBFou1e+pa93ShqPMw5sFRsGXBnnqvEcwUcq7wiuTrTr8JW8TbdeLaeL2riMaVnO8s
	jFmP6X265DJ1fiQxp4zXYK54yPRW/PYuHNxqxDxxiiLm9YpkOe9l3k5SdvBxVO7MdzK/xcnwK2a
	t0dcwSKsTkJNANJJh4jcWCqfpv0GkbnuNVHn9d1FuOwz/ZI1TEf66Jt5aCPZyf5ORPbQEQFFtG9
	CvixOIJzcNyvBJkIRp+Hs/OdDAxJSq752ePaSMZ+MhAAEmKWCBq8kHJZXBzF2reRxjgmcwW3BCl
	yMQMBea7UqUUdMZDJJ2LmxkvIUsDzqMABGNldlVghzlzW6gPugCJR6CYAYZdOiSsWHS8rlh4jl2
	+F9lrxR7G7FbRzFpy+XIH07WK8T0ILlwZsSotxsCMOFc/l5AxvIK0RoLY1yMno76AnU8ndO0j1Y
	/BcB/LcaHWDfrKOlJSJGqVy/bTyBc6+WdXRGZLX/yIf2Oa
X-Received: by 2002:a05:6102:6c7:b0:7c1:8aa5:36d6 with SMTP id
 ada2fe7eead31-7cb372821a6mr2739066137.11.1791832654562; Mon, 12 Oct 2026
 12:17:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
 <8733ua23xs.fsf@bootlin.com> <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
 <877bjmzqkr.fsf@bootlin.com>
In-Reply-To: <877bjmzqkr.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 13:17:23 -0600
X-Gm-Features: AclHuK_F8iNKqf1C4Ki3QntMVw0O_GSO7mPk67Uyart16gEEmw2VFpP4md4WlVw
Message-ID: <CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
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

On Mon, Oct 12, 2026 at 1:06=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> On 12/10/2026 at 12:26:00 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > On Mon, Oct 12, 2026 at 12:02=E2=80=AFPM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> >>
> >> Hi James,
> >>
> >> On 14/09/2026 at 15:09:47 -06, James Hilliard <james.hilliard1@gmail.c=
om> wrote:
> >>
> >> > A timed-out wait can return while the interrupt handler is still usi=
ng
> >> > the previous operation's interrupt status and enable mask. Starting =
the
> >> > next wait calls init_completion() on the same object, which can rese=
t its
> >> > waitqueue lock while the old handler calls complete(). The old handl=
er
> >> > can also complete the new wait or restore an obsolete interrupt mask=
.
> >> >
> >> > Initialize the completion once in probe and use reinit_completion() =
for
> >> > each interrupt-driven wait. On timeout, disable and synchronize the =
IRQ
> >> > before masking controller interrupts and acknowledging the waited-fo=
r
> >> > events. Draining the handler first also prevents a partial-event han=
dler
> >> > from rewriting the enable mask after it has been cleared. Flush thes=
e
> >> > register writes before re-enabling the IRQ line, leaving the control=
ler's
> >> > interrupt sources masked.
> >> >
> >> > For successful waits, move complete() after the handler's register u=
pdates
> >> > so that the next operation cannot race with those updates. Keep poll=
ing
> >> > unchanged and leave controller and DMA abort handling to the existin=
g
> >> > callers.
> >> >
> >> > Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller sup=
port")
> >> > Cc: stable@vger.kernel.org
> >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >> > ---
> >>
> >> So from the commit log I understand that you are fixing a race. The
> >> problem seems legitimate.
> >>
> >> >  drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
> >> >  1 file changed, 20 insertions(+), 6 deletions(-)
> >> >
> >>
> >> ...
> >>
> >> > @@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq=
, void *dev_id)
> >> >       if (!(ien & st))
> >> >               return IRQ_NONE;
> >> >
> >> > -     if ((ien & st) =3D=3D ien)
> >> > -             complete(&nfc->complete);
> >> > -
> >> > +     /* Finish updating the interrupt state before waking the next =
operation. */
> >> >       writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
> >> >       writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
> >> >
> >> > +     if ((ien & st) =3D=3D ien)
> >> > +             complete(&nfc->complete);
> >> > +
> >> >       return IRQ_HANDLED;
> >> >  }
> >> >
> >> > @@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_=
nfc *nfc, u32 events,
> >> >               timeout_ms =3D NFC_DEFAULT_TIMEOUT_MS;
> >> >
> >> >       if (!use_polling) {
> >> > -             init_completion(&nfc->complete);
> >> > +             reinit_completion(&nfc->complete);
> >>
> >> The whole change around (re)init_completion looks relevant (here and i=
n the handler).
> >>
> >> >
> >> >               writel(events, nfc->regs + NFC_REG_INT);
> >> >               ret =3D wait_for_completion_timeout(&nfc->complete,
> >> >                                               msecs_to_jiffies(timeo=
ut_ms));
> >> > -             if (!ret)
> >> > +             if (!ret) {
> >> > +                     /* Drain the handler before it can restore an =
old IRQ mask. */
> >> > +                     disable_irq(nfc->irq);
> >>
> >> disable_irq() for serializing accesses to a single register?
> >
> > The intention was to drain an in-flight handler before cleaning up the
> > timed-out wait, rather than just serialize the register write.
>
> I guess here you relate to the race explained below.
>
> > disable_irq() provides that synchronization as well as masking the line=
.
> > It is only used on timeout, and this IRQ is requested without
> > IRQF_SHARED.
>
> This is clearly debatable, since we can identify the IRQ, that flag
> could (should, maybe) have been set. With your approach it would have
> been even more impacting. But that's not the point.

Agreed. I mentioned this to describe the current registration, not to
rule out IRQ sharing.

> > A spinlock could also address this, provided it covers the handler's
> > status/enable reads through complete(), together with the waiter's
> > cleanup and rearming. Protecting only the register writes would leave
> > the handler able to act on an old snapshot.
>
> I'm not sure what you call "only the register writes", you can call
> complete() from within the lock if that makes sense for this case,
> yes. complete() does not block so it is fine.

Yes, agreed. I meant that protecting just the writel() calls would leave
the snapshot unprotected. A lock covering the handler's st/ien reads
through the register updates and complete(), with matching protection
in the waiter's cleanup and rearming, would address that.

>
> ...
>
> >> commit log, I now disagree with the first part of:
> >>
> >> >The old handler can also complete the new wait or restore an obsolete=
 interrupt mask.
> >>
> >> "complete the new wait"? I don't see how a stale handler completes the
> >> next wait given the handler is a hard IRQ and the interrupt enable
> >> register is cleared on timeout.
> >
> > The case I had in mind is an already-running handler on another CPU:
> >
> > CPU 0: Read st and ien for operation A.
> > CPU 1: Time out operation A, mask/acknowledge its interrupts,
> >        then eventually reinitialize the completion for operation B.
> > CPU 0: Call complete() based on the saved st and ien from operation A.
>
> For this to fire, the hard IRQ handler on CPU0 would have to be stopped
> between reading st/ien and calling complete() long enough to span:
> - A's timeout
> - A's cleanup
> - B's wait being rearmed
> On this hardware, how is this reachable?

CONFIG_PREEMPT_RT provides a concrete mechanism. The driver requests this
IRQ with flags =3D 0, without IRQF_NO_THREAD, so the handler is
forced-threaded. A higher-priority task can preempt that IRQ thread
after it reads st/ien:

CPU0: The IRQ thread reads st/ien for A and is then preempted.
CPU1: A's wait times out, performs cleanup, and eventually reinitializes
    the completion and rearms the wait for B.
CPU0: The IRQ thread resumes and calls complete() using A's snapshot.

Clearing the controller's interrupt-enable register on CPU1 does not
cancel the running IRQ thread or invalidate its saved values. The late
complete() therefore acts on the completion now being used for B.

This does not require a prolonged non-preemptible hard IRQ or a hardware
stall.

>
> > Clearing the device's enable register does not invalidate those local
> > values or wait for the running handler to finish. Hard-IRQ context
> > prevents this overlap on the same CPU, but not across CPUs.
> >
> > That distinction was not explicit enough in the commit message. I'm
> > open to a different implementation; the requirement I wanted to preserv=
e
> > is that the old handler cannot update the mask or signal the completion
> > after the waiter has cleaned up and reused it.
>
> Miqu=C3=A8l
