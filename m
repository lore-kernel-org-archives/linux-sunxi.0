Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A43BF68D
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 21:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841449; cv=pass; b=pTWTi3UqoDtn3dJ37lBIaHKQ9t7qxuvQYREhQvU8oJ3iTN9P39CIwaoqquRGR2gWl+OG9zbSBatIknlkjmqUehMM/v/coUX1I0mKa8IllaZfpGKPPSx8p/hUJUsR8vEf1mnRXL/7iMyH9YfY6/w1rJy+1hshgwUUZn124+By9ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841449; c=relaxed/simple;
	bh=4rQCMA0YD118aHw+hhFF9+PsdILXF6N9UmQsk1sUyMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVshG1fTkZBiNMHsCK76U6mYfN889ON71sGAvdidOXKPdUSdi5ngA4Xe/neeCZJ1nHyD2vg+yLoEbfNpZpfsjFYO9o/xoZIPjnadGvlySBu2uNfgRX7bQx9VnTcSv21hTKB6rKkJRqRDgMhqhnRCUTUWWrB42MVflsgHnulR2UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7I5cOSI; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7I5cOSI"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-98c78660542so1033527241.1
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 14:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841446; cv=none;
        d=google.com; s=arc-20260327;
        b=Fkbdy8yMjeJeaE+tg1xwXg1eCkgc0mdvGuxog7x6C0fIgW64U6/vL+wbBqaPLaxhLz
         bB9V+d4hVKIH7G1cZUKrWXPuJRxJyN4eJ0Yg4jP+IJ5Uq/ueENs/Thy7HRbvAU/DJjIT
         KfIQx32cr5B8j21Jl/90G5x0KgphUEf0Qlv3Hi1EO079xzXZX3uSTglG+l3Si9b5lQ0i
         P04dfSyqifDztlPWQc/d43lqL+PXDhbnbT+/RNBL5RCyg8wkcKb6ZA0zx1FkaC0avcXZ
         vy640TNRAVXF65LjzZAMdz3Vj0uPSotmCXCwaFrFBXYyjfxeLe59cScPidp9yqI3DGHS
         v0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        fh=W2H/RLPD/2ZaEY0xUWzUNagnMiLJqtcZxuxq6hTrn8g=;
        b=KjkoIa8Ke6FkAAW/A5A2+2SCLaa+c2MwELF2f30fnLX0uBh0Cf7S5la5v4HnELzYAr
         DBDN0p+NAid2aqcQZ0bBgsyFufxOyiU/u8cCIlLG0gnC3M1zN5C7OGxs0sBQzrMo1Xjt
         U8bkEm/dtiJjVUrbRSRlLhTTp8suRxb9mn0zo5jN+khSeY/HqtNkuPDUZ6MmVDoMznF9
         mk7ie/I72KbdRPp26AbdlP6Gn4YFRnQX6YVWW7Vpj4l5GHaeS1FhU5JHvcBhvQWhkoXG
         9yG6htaz+AINXIYbLOGF5J030CRg9jb03OCMAJ5p7zIKgUVPRfeQyIZOXuHIIrRnZfs5
         O1aQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841446; x=1792446246; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        b=r7I5cOSIGsG23oNwiq0jbdDJtczUyPrH6ikHtbfx/f/n9zWQcqAVB4/AZEn42WdVUN
         zpAWKuC4BQ+S1wEAu1tniCML1Yh50KRX+IgU3JXI0QdZJX3oFJunHwlhbi0a4U5R+Zhj
         3YVTdDLGGX6yK/x1VdhUTrzmNbBklXCrk4ZVHjw5PWDCN/S4UFq+BPMKSroLTG/EQzRi
         8pN67VBgHffCmDHzkhUB+x+sdw84ImuDdFKkF7MwcFx1nnzXgs+Q5YcvKMh6j8a6EQEH
         5lDxgyXbc8I5IK+C1MXyTZsxgV5HZcl+1T2u8EQScmnHBdO+mKW2wY7b/PmghI0ZrLBW
         xvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841446; x=1792446246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        b=jw5gIK0NBeEYZ3bJv0TZ5f0ua8/UBNBkWwmk77EMKjE6CyiNfLb3jTGOx/64IDbtSy
         H54ujgF9EbsNvoDDNp5wbUStWAEijfFzbNPAlS+VPKtoinUkP6ssFTvbnMOcjCH2Av1d
         2fGTHtCf5T7+XIXb05ZBEnf+y5M/5lR+dtSOza1/+fEMhewWJdE/q32iNd359jt2sULx
         l7MHf/CepJk9D9uGuxpXewEtAuH0Rb9XBfJgpyznqxw/O/WNyQYWVzgFDuyj9mO3aYdq
         MYOvi9nlnW8NmYbafkhfLCwbRnGpzUsua08GmaEc8N8nV2mzbOKlSjqEYeOqHmLPPxUr
         zJ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxz7HsK7D5xvYtxFgWVBmXE8vs3ia75uxtLMoF9wsTJuk3E3JEdMRTiZg1GnHkyDWtTWKExAKwVFobjkg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJU0sU1paqIU1vwSH7s4uaSTcpNOkXnRn1C9braIiv6Y4i9GMxh
	VD/L7q+udl3Tw8VA2PBcC9yodJbiRiBuhvQEpa4PQGulhI9WBy/Ol11O3wAqfJ619YHcvERUYwd
	3lC0edC2Kc1onosKmlujkg50LTti4VpM=
X-Gm-Gg: AYBFou0LYnVQrUzTcRjIqp/gVfyU0V5ZmQiuBJxGBVWQKDZ2kM4Gn2qRgwtS0jNW04o
	2zHIhdPYlzIumRNk55ZE/HNE5/TKtIbVUahtQaCZosM24Dcl4veNuOGRFf1aYrKs2efeOvxHpLX
	zrlZc1bzWztlcvEH65n6wPO0wjWWtKFLtZUKnw9JagzF43vX8tJr5lrk4yQ28lUPgWocVnovGZG
	deLu6NYt4pKyzO4lLVMvuDxUpOZ9aq6AtVpALTJkTmdyoDpxogTLL9ktUu//2Fa98WsBvXhX4mZ
	YZk+Ucyf29Ope6k96jphLz6yljN9YePNimKcVLHwLqzPnsH558pwk1007YliwWLQkr6EP1XC2N4
	Ur1LHrVaBxTiWVgOxgbmezj3HcYfQB/IN2kuRjmozay8gGdmaZFNX9JWkSvBu8izAaQVC40D+MJ
	m3lDSnsi2P5H0jpp9ok+KjQkWfBdnbVbSfWFsO9oex3AuuPybI9fAoVLo=
X-Received: by 2002:a05:6102:5814:b0:79e:2b00:b4da with SMTP id
 ada2fe7eead31-7cb3a0059admr2967326137.6.1791841445569; Mon, 12 Oct 2026
 14:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
 <8733ua23xs.fsf@bootlin.com> <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
 <877bjmzqkr.fsf@bootlin.com> <CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
 <87pkxey725.fsf@bootlin.com>
In-Reply-To: <87pkxey725.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 15:43:54 -0600
X-Gm-Features: AclHuK9S8X-EJbG6Jz0l1nDWbI3paRApUkydjtgW5vHKMROEOTWMTqhZBvuvO68
Message-ID: <CADvTj4p-o=EQMq-6E1q2=NOmQbscAVGMUbwX+Wh4R0v5kbXe_w@mail.gmail.com>
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

On Mon, Oct 12, 2026 at 2:53=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
>
> >> >> commit log, I now disagree with the first part of:
> >> >>
> >> >> >The old handler can also complete the new wait or restore an obsol=
ete interrupt mask.
> >> >>
> >> >> "complete the new wait"? I don't see how a stale handler completes =
the
> >> >> next wait given the handler is a hard IRQ and the interrupt enable
> >> >> register is cleared on timeout.
> >> >
> >> > The case I had in mind is an already-running handler on another CPU:
> >> >
> >> > CPU 0: Read st and ien for operation A.
> >> > CPU 1: Time out operation A, mask/acknowledge its interrupts,
> >> >        then eventually reinitialize the completion for operation B.
> >> > CPU 0: Call complete() based on the saved st and ien from operation =
A.
> >>
> >> For this to fire, the hard IRQ handler on CPU0 would have to be stoppe=
d
> >> between reading st/ien and calling complete() long enough to span:
> >> - A's timeout
> >> - A's cleanup
> >> - B's wait being rearmed
> >> On this hardware, how is this reachable?
> >
> > CONFIG_PREEMPT_RT provides a concrete mechanism. The driver requests th=
is
> > IRQ with flags =3D 0, without IRQF_NO_THREAD, so the handler is
> > forced-threaded. A higher-priority task can preempt that IRQ thread
> > after it reads st/ien:
>
> That argument only appears in this reply. It is not in the commit log
> nor in the diff, both of which reason about a hard IRQ, no? I'll happily
> take the PREEMPT_RT case into account: in that configuration the case is
> reachable, but it reads as a justification added after the fact.

Yes, PREEMPT_RT was a later concrete explanation of how the race
could occur. I should have made that distinction explicit.

The original rationale for disable_irq() was to establish a clear
boundary between the old handler and timeout cleanup.

Simply masking the controller interrupts does not stop an already
running handler. A partial-event handler can subsequently restore
an obsolete remaining-event mask. A handler whose saved status
satisfies the wait can instead signal the completion after the
waiter has moved on.

disable_irq() prevents further IRQ dispatch and waits for existing
handling to finish. Cleanup can then mask and acknowledge the controller
events without the old handler modifying that state afterwards. The
register readback flushes those writes before re-enabling the IRQ.

This also keeps the additional synchronization on the timeout path,
without introducing a driver lock into every successful interrupt and
wait setup. The checks at the time established that the caller could
sleep, the handler did not require the NAND controller mutex held by
the caller, and the IRQ was not registered as shared.

Sashiko's report[0] was the starting point and mentioned both
synchronize_irq() and disable_irq(). The ordering above was the
reasoning for the implementation, rather than the suggestion alone.
It was not based on an RT priority-inheritance analysis or a measured
performance comparison with a spinlock.

[0] https://lore.kernel.org/all/20260909085434.C8F201F00A3A@smtp.kernel.org=
/

> Then, I'm curious to know how the AI justifies the use of disable_irq()
> as the RT-appropriate choice: doesn't it block without a timeout on the
> very IRQ thread the scenario relies on being starved (and gives no
> priority inheritance)?

Yes, it waits without a timeout and does not provide priority
inheritance. I would not present it as the better choice for bounded
RT recovery latency.

A spinlock_t-based implementation can provide priority inheritance on
RT, provided the handler holds it from the status/enable reads through
the register updates and complete(), with corresponding protection in
the waiter. That improves recovery under priority inversion, but adds
locking to normal interrupt handling and wait setup/cleanup.

There is a real limitation: if the IRQ thread remains starved, recovery
cannot finish, and other NAND operations can remain blocked behind the
controller lock. So the operation timeout does not bound the entire
cleanup. The argument for this implementation is the straightforward
handler-lifetime boundary and absence of additional normal-path
locking, not that error-path latency can never matter.

>
> Thanks,
> Miqu=C3=A8l
