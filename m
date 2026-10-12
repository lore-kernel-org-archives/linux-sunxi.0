Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195F652B1E8
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Oct 2026 17:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913959; cv=none; b=DntrJZX3dQpj1V5qigStt3Cvv4nR4ENjpBEOJbaupLgL2TIT0kuWoJF5o8TfCuKaoWLLYSAReiAoCRtDm5UcJcwd/avC0biyyX0tuP3e+IKQW1No19aeW+mQpZFClN71BG+am/mLrBOliTZQ/A/v8iXzK+r+OVZq/CEcoDzA4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913959; c=relaxed/simple;
	bh=qc27dw1bGRtz0RsRjqoL5oDeZuL03UbAX3nPsjTnkxU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M9yCGvNjQ64fHjiq9g5qzofxrDisU9bXe/KCffoS5sXLBRYjhsk0DJOKjlQrhymz18QZD7dvgU4a4DKohiXy2n+AkFe2fQyvrLpkNsCB121WTHhSgtUKUs7+hifDRV/WbiQwSnfMyt6zjkpgm7mCKN/igWXdxnExGH9lsTjtLxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dlyBDyHE; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dlyBDyHE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CE3681A1217
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Oct 2026 17:52:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1B0160362
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Oct 2026 17:52:36 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 8CBB811D7188E; Tue, 13 Oct 2026 19:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913955; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bw7bv2pnfae4cMWiRM1MW1DbGUPZqrWolE0VMUTTkds=;
	b=dlyBDyHEvUw0pOrBm1dttwDKz4oNZ+hpsYV67qP+BBGu8c6O+fFdC5t/ngeVZNHu0La1ka
	VgUq02uqBuXDZ+p5fpIHiVfio1h/IWPacwx2vE6urr55F19F3xStkOJH5VPxaB677hOOLc
	JgBA8WgYySOn2mbQ9ZuTX/yQr9yIh0nd3Ovn4KDx3CkHrxW3qrMqDFQ5EDSgJB6CzmUsCr
	DRXOAphFCnWv88nM+nbVh7wV0JduCt+NRVgNMTHgRnn5AVxpRbkIVO5wVa92Q+OBcpMt2I
	VU+SayXWm2rN+c4Cc8TxZkkJnAFZrvYq6LtnJsorYvFuIHt+q9CA17+E8gCn7w==
Authentication-Results: mail.galae.net;
	none
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
In-Reply-To: <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
	(James Hilliard's message of "Mon, 12 Oct 2026 12:26:00 -0600")
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
	<20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
	<8733ua23xs.fsf@bootlin.com>
	<CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 21:06:28 +0200
Message-ID: <877bjmzqkr.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +aYWktH/6v0I
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 8CBB811D7188E
X-Spamd-Result: default: False [1.30 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	BAYES_HAM(-0.10)[60.96%];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[gmail.com];
	BCC(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[nod.at,ti.com,kernel.org,gmail.com,sholland.org,bootlin.com,socionext.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:email,localhost:rdns,localhost:helo];
	TO_DN_SOME(0.00)[]

On 12/10/2026 at 12:26:00 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> On Mon, Oct 12, 2026 at 12:02=E2=80=AFPM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
>>
>> Hi James,
>>
>> On 14/09/2026 at 15:09:47 -06, James Hilliard <james.hilliard1@gmail.com=
> wrote:
>>
>> > A timed-out wait can return while the interrupt handler is still using
>> > the previous operation's interrupt status and enable mask. Starting the
>> > next wait calls init_completion() on the same object, which can reset =
its
>> > waitqueue lock while the old handler calls complete(). The old handler
>> > can also complete the new wait or restore an obsolete interrupt mask.
>> >
>> > Initialize the completion once in probe and use reinit_completion() for
>> > each interrupt-driven wait. On timeout, disable and synchronize the IRQ
>> > before masking controller interrupts and acknowledging the waited-for
>> > events. Draining the handler first also prevents a partial-event handl=
er
>> > from rewriting the enable mask after it has been cleared. Flush these
>> > register writes before re-enabling the IRQ line, leaving the controlle=
r's
>> > interrupt sources masked.
>> >
>> > For successful waits, move complete() after the handler's register upd=
ates
>> > so that the next operation cannot race with those updates. Keep polling
>> > unchanged and leave controller and DMA abort handling to the existing
>> > callers.
>> >
>> > Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller suppo=
rt")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> > ---
>>
>> So from the commit log I understand that you are fixing a race. The
>> problem seems legitimate.
>>
>> >  drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++++------
>> >  1 file changed, 20 insertions(+), 6 deletions(-)
>> >
>>
>> ...
>>
>> > @@ -414,12 +416,13 @@ static irqreturn_t sunxi_nfc_interrupt(int irq, =
void *dev_id)
>> >       if (!(ien & st))
>> >               return IRQ_NONE;
>> >
>> > -     if ((ien & st) =3D=3D ien)
>> > -             complete(&nfc->complete);
>> > -
>> > +     /* Finish updating the interrupt state before waking the next op=
eration. */
>> >       writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
>> >       writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
>> >
>> > +     if ((ien & st) =3D=3D ien)
>> > +             complete(&nfc->complete);
>> > +
>> >       return IRQ_HANDLED;
>> >  }
>> >
>> > @@ -435,16 +438,19 @@ static int sunxi_nfc_wait_events(struct sunxi_nf=
c *nfc, u32 events,
>> >               timeout_ms =3D NFC_DEFAULT_TIMEOUT_MS;
>> >
>> >       if (!use_polling) {
>> > -             init_completion(&nfc->complete);
>> > +             reinit_completion(&nfc->complete);
>>
>> The whole change around (re)init_completion looks relevant (here and in =
the handler).
>>
>> >
>> >               writel(events, nfc->regs + NFC_REG_INT);
>> >               ret =3D wait_for_completion_timeout(&nfc->complete,
>> >                                               msecs_to_jiffies(timeout=
_ms));
>> > -             if (!ret)
>> > +             if (!ret) {
>> > +                     /* Drain the handler before it can restore an ol=
d IRQ mask. */
>> > +                     disable_irq(nfc->irq);
>>
>> disable_irq() for serializing accesses to a single register?
>
> The intention was to drain an in-flight handler before cleaning up the
> timed-out wait, rather than just serialize the register write.

I guess here you relate to the race explained below.

> disable_irq() provides that synchronization as well as masking the line.
> It is only used on timeout, and this IRQ is requested without
> IRQF_SHARED.

This is clearly debatable, since we can identify the IRQ, that flag
could (should, maybe) have been set. With your approach it would have
been even more impacting. But that's not the point.

> A spinlock could also address this, provided it covers the handler's
> status/enable reads through complete(), together with the waiter's
> cleanup and rearming. Protecting only the register writes would leave
> the handler able to act on an old snapshot.

I'm not sure what you call "only the register writes", you can call
complete() from within the lock if that makes sense for this case,
yes. complete() does not block so it is fine.

...

>> commit log, I now disagree with the first part of:
>>
>> >The old handler can also complete the new wait or restore an obsolete i=
nterrupt mask.
>>
>> "complete the new wait"? I don't see how a stale handler completes the
>> next wait given the handler is a hard IRQ and the interrupt enable
>> register is cleared on timeout.
>
> The case I had in mind is an already-running handler on another CPU:
>
> CPU 0: Read st and ien for operation A.
> CPU 1: Time out operation A, mask/acknowledge its interrupts,
>        then eventually reinitialize the completion for operation B.
> CPU 0: Call complete() based on the saved st and ien from operation A.

For this to fire, the hard IRQ handler on CPU0 would have to be stopped
between reading st/ien and calling complete() long enough to span:
- A's timeout
- A's cleanup
- B's wait being rearmed
On this hardware, how is this reachable?

> Clearing the device's enable register does not invalidate those local
> values or wait for the running handler to finish. Hard-IRQ context
> prevents this overlap on the same CPU, but not across CPUs.
>
> That distinction was not explicit enough in the commit message. I'm
> open to a different implementation; the requirement I wanted to preserve
> is that the old handler cannot update the mask or signal the completion
> after the waiter has cleaned up and reused it.

Miqu=C3=A8l
