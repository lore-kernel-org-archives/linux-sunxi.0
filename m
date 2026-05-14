Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D51F393DDA
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 11:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757775; cv=pass; b=Ra1AxVkaR5qgHSMroH6w4wIO8VyzKlR0taKbWWFGxXPO1mVWOlK/ytlhlqL8FCLcO1vpK5NWV9MIEttHXoqX+Y8/GQBh2lS+yFl/r7GffmK2BQScb5kC1+nXzMI7sDjR5LVJroMyYpB92YaTAr4EUwy0H/TU8GuMFTKprS08scU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757775; c=relaxed/simple;
	bh=G+4CgINOVqRB+vwmqfuqtu/PT2C/eA/of9pY5c79+8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqBPtBCY9Xt//6ace+KMylPDwuCW2wsaEFgUj/dsYUz24QuFvmdX26fZHWtn6yGLlhv8aVFBPkMHNy7luvmJY9ydA0YOy19yEW/+CReXduY5CmEDOX3Oyj7Mf4EjEF7ualJepR4YkY/7iO/aD/545QhIrtBr1BomL1GCfDPcTvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTSHU7Bl; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTSHU7Bl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso76954505ad.2
        for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 04:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778757773; cv=none;
        d=google.com; s=arc-20240605;
        b=WmqBVva8QJrjSGlMsuCjZpGZw0wJnppzbII7kS5eX1jdE8wSSoY/xrWSXyCd9C62Xt
         PvQpmUM6JtPhe6lomcNXUYl/iJt5dKzV8Fj41EiYDuzESVFEcv9QG7tP/OdkCIPzCwWz
         mKkn25y/iRLC8o9wh92RmFFz74LsnJv/IIJDj0n2i1dCDjvPUWe4yUV/CN8FW19QF/UJ
         4aEwUqcTzwbpEY2LMXwWRud2kIPg8mFa4FKDpdHGS+lc9qbxYpK1DsUEQPRR0dsJbmz+
         iSuwCdTe9Qb5FDMmgi/6dODvMUAoJfTynmRXzMn0e3LDDcrg2iG883ImqBhI0g20hwbo
         GEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+aiHeBjA5EXuqkcOrEKcbl47CSb9UCZY/L9Yxg6gL6g=;
        fh=DHjdiazyXdowSKc8QFJ0cQPiw6JytCzKGsbsz5/ouWo=;
        b=B7fNw56oETa56lJyjg3KNfsnY7b14eHqOMdD7eEMcQnKAXsWWSpI9jT4dvfXHZ0di1
         NVYcKpJc3vmRUPvbStO+gZsN7Z6iGMxea16XLWTCYd3JGk8uGj0T8gFFHyiskwBsTnGZ
         QC6NM+XdNK8eE58/hY7FKp4HCk4veRqyXNnfUGuhkNXYIoTgy8zbttQSZ2gkNPCMXxEM
         oJTzAGlkjhaG37S54ZcJdnfCYxXtP2OhEx7q5ALtqs/FlTa7PwyQslagh7CK7JkaJbwI
         7zETTRG0dvusI+IwDBI5w9PWrU9WeboR+gku7RwDgaVwLjQlDpteKSZgn+r0fp9KvaHt
         7Dkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778757773; x=1779362573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aiHeBjA5EXuqkcOrEKcbl47CSb9UCZY/L9Yxg6gL6g=;
        b=hTSHU7BlttbBBHLX8mqCTGF9d2urHe7A4tJx/xTtrkYYNXWbUQwRdxZqiVhlnkIDXZ
         xb8u+yaOcekyNC9zogNKVVptXuHAkhY+p6bzYuRpqU9ZPltm8gjw1kLpiSpDSmJFr9sn
         j63+t4P1Nd1mj6YkNI8nlGTwM0aGW8g3Z6/K/Q9TqgUydQC6Nc/qLEFTR+PQXCFE1Kva
         x3FNuDP0q7gUoZBEoCFcWRY3z0RYnWn8I+JN85zHSrdGYsCD+8/ilSL+5helSd7fuRT6
         G0LbORvWzi5LjW7DdTfbp1LIQkEJhSz88j/PU36HBh356ckvBVeBomHly4kR7nJm2HL2
         On5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778757773; x=1779362573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+aiHeBjA5EXuqkcOrEKcbl47CSb9UCZY/L9Yxg6gL6g=;
        b=rwYTYNcRVcoXP9LJTlzbloPfEwSNECDcFYsCeDT8ibNAJqrMnpTBIJ5Z3AOPR73hbG
         bwlEEoHIml1Ac/zKf38YcWKAbLuIrT65xS/TY1XyIxKeGtuKai9jXhCSg6dmBn7LJtRr
         pY5Wdbcp34nPlBPzsdmCmaJxLCeJghDSINt+7mANrqoBVFGLhVEFsjfRe1Ofxb8P0UqB
         3qP3PHlc7ya9wTJluuo5NMLOSa5VQBOsvV6nDwtbiMga6vEqGFWZYq7qR8NTIkeDbf4Q
         SksoD2SB/ruC+9MByxuib7PxRsOQROit8Qnrm3rXwLXIoLRBOkuFFjanDv/W8/jsdYtD
         qq7w==
X-Gm-Message-State: AOJu0YxHi9vSlXjTZwtOI8h1AydRMeCP0vHA8ZF/xU+ZCyZzob8wkOJK
	tZNys8vdaBSTAb8hmWxJdCfDlr+F1hHReeBkMsMgGbRg6E4dmui0ysnTAcVAkEO2Q5Gq0rgTNgl
	fHrvXC/9roybFMd7KxZlxOXgHdExyFog=
X-Gm-Gg: Acq92OHbyf35lRY6kPA5mqKbl7NaujY67T+tYqSuTzGnDi9d/6IkEBwWx6AXBVpk2+x
	oscp7gX5VsESL3jMRgJEa0N6ozh+dPJaOLFdMO1OTZpeBK06ZF/CU8o4PjzzsAr5vJAqFLe5fN/
	xooaWIH59GlqIzRku2noRsRhX/Vqoh8beiLko/wb3pWboDJgUAbzkeSDoN62PJC/zeYYihE+4l1
	2H5E/ZNHkGzo/cb20cC2B3swolUEZj1JoPRbwZD7/z3cjb2YWWYOdtp7uZothMGqoL8pizCO4hG
	+w3FEfXs0DGSBjWqBxzripR8kCvXmkAikvsgTXYXFq+YUw/r
X-Received: by 2002:a17:903:31d5:b0:2b4:5cea:f61c with SMTP id
 d9443c01a7336-2bd2718bf40mr60788185ad.4.1778757773211; Thu, 14 May 2026
 04:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513105003.81880-1-phucduc.bui@gmail.com> <20260514043314.62222C2BCB7@smtp.kernel.org>
In-Reply-To: <20260514043314.62222C2BCB7@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 14 May 2026 18:22:41 +0700
X-Gm-Features: AVHnY4LUIQe1jBwH9cUWnqH-ISzyHBaqq-xByedrLfX2adyX9ocD6KaPRXTjjog
Message-ID: <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

This seems to be pre-existing behavior rather than something
introduced by this patch, since the current change only converts
the locking to use guard() helpers and does not modify the
runtime PM handling.

If this turns out to be a real issue, it would probably be better
addressed separately from this cleanup patch.


On Thu, May 14, 2026 at 11:33=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Hardware State / PM Violation leading to bus hang
> --
>
> commit 0686001584788d984a0f16403183bcad78fe4176
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> ASoC: sun4i-spdif: Use guard() for spin locks
>
> This commit refactors the locking in the sun4i-spdif driver to use the
> guard() macro for spinlocks. It replaces manual spin_lock_irqsave() and
> spin_unlock_irqrestore() calls with scope-based cleanup.
>
> > diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdi=
f.c
> > --- a/sound/soc/sunxi/sun4i-spdif.c
> > +++ b/sound/soc/sunxi/sun4i-spdif.c
> > @@ -427,10 +427,9 @@ static int sun4i_spdif_get_status(struct snd_kcont=
rol *kcontrol,
> >       struct snd_soc_dai *cpu_dai =3D snd_kcontrol_chip(kcontrol);
> >       struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai)=
;
> >       u8 *status =3D ucontrol->value.iec958.status;
> > -     unsigned long flags;
> >       unsigned int reg;
> >
> > -     spin_lock_irqsave(&host->lock, flags);
> > +     guard(spinlock_irqsave)(&host->lock);
> >
> >       regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
>
> While this issue isn't new to this patch, does this code risk a bus hang =
if
> the device is runtime-suspended?
>
> The regmap configuration lacks a cache, and these ALSA kcontrols can be
> accessed by userspace at any time. If the audio stream is idle, the devic=
e
> will be runtime-suspended and its APB bus clock (apb_clk) will be disable=
d.
>
> Accessing the physical registers with the clock disabled will trigger an
> asynchronous external abort.
>
> Would it make sense to ensure the device is runtime-resumed (perhaps via
> pm_runtime_get_sync() outside the spinlock guard) before touching the
> hardware?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513105003.81=
880-1-phucduc.bui@gmail.com?part=3D1
