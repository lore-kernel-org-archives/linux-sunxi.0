Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792696422;
	b=om/G2m7AzQgkn5/gOpq6Lswr6qcqchPaTDFVL9iUA8qyUwLqm6/LkOamEnHQgLNQKZK+
	 Yo6vJO3r4nh5eknuKK1X0ZC9v2ysPC1IaDhPRnJRr5bm1KFmAntpeNnRYwQdYWeL3f3XE
	 OHf+FaWE3H5IauzSBtfiBWdo8BkHfDqNsbMCRdyKftEz4FdPs9TddmtYKFdttQARQJ99J
	 SP62lZI9JH3HlWMaCB3Mhf7yMOKlfX82pbCoCyQuf7VnHMlH7j7TftoHX+oFKSlbVrk84
	 Yu5W4Keon5SVWFeJotFCcYJ0Q5U2TuyLIQZR2zH82K4kHd/fUQPPeUtYyHy8KcEG4ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
	b=Y0UlaFVN56jEmFfXIztVZa4FEBfkWRhARWg1aLQ/V7df9ttcmt3n3iDsiuCEmmv0EbvB
	 UPhJdF9vDWi29tC1PPQYqLP8PusnQvo2V9PpTiVr6dcEs55SoPCX/E9YfMVgChpqig1IX
	 i+zeXsiyjm4YaZHymBklxnSp0ZtI8y0Wkudyp3D3i65Uw0d1AkybMuI+LRGKMgjZotv39
	 IOQuWNXTxAB42VzKMjfLufKz7V6Zkj3p63NG2RI6H8WjTG+GEeysuwskIw+w461Y8B2PP
	 /6fSSnIO5IrmlHPBuPxgwkXvjnLBWAqeJ/eXxKPObh2+vw5Qfeo4WeHpXqBdycKgQyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VQZ7crzh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7555606A319
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 19:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7555606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VQZ7crzh
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-74ab99038afso38204137.3
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 12:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792696421; cv=none;
        d=google.com; s=arc-20260327;
        b=p+qyE8W+fVFLRMWPx7mAgva4c2OLi1WdzMH7A3WYViG9LHloguux2B/iubl0iBC9K0
         n/f0HEJqEbJR+1SMY0CAOkiI+Qz0nUTg16gqwqRwj2AOKivLD3xgOnjWBHM2fMWXadDk
         EL75gy+l2nPpFXzxBXV57gPtHlySxJI8M3Q/Ob8cEnlVktUigaEfDl62LLqIO0QE7MPP
         kNxK1a//Abc4uI2PSNAL5oMBq18OCWiuDvoRRaz1hJ8iWMFXahTNLAA6q8xtt54Rkd0H
         7dXhupQvRFYi7yEnuNAOgQ6bx/OL7ySz8FF7zY3qhN6as9ak8zJ9ShFqKNiA/wVRWKG/
         Gl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        fh=MIOQocaUhsB6DwsJTooNBiKfC3FUU2zzgSyOZLwm0Jc=;
        b=eF9ZAjKuYaRKwLPOpGe45+LNBYXGdA5taPCIpXjSgTk3Zhmq5Ef06sgN++D00IWLmV
         Sbz9wTll3D6684YwsVLk9XYzFONqEsS3INRCQSP8bI7WQ+zvn1PszCy5Q05aPObXuwjE
         7kgeNl1/IxoFo40HbOtjNMgI8ir4Y3AeLtbw8z4D0QpUJxAeYr9f13w1NeDrcH2mxwb6
         FS0nltEKbx2x342pvZ3AAAGtJj0WoiXkvvipyhbk5rfuzDVAobkPZFfSpOBh14CL6NfH
         hawYEfFZh8eaaD5tIXGQWVA8SeSeBtGdoBwsaUuZm81VJIH+4myAhXpwo2VxGxQhdAfT
         GTew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696421; x=1793301221; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        b=VQZ7crzh6iWilF0Gn/kheboDtuMIiXEXRP/5Vd1AKgydZUfT6WXHHTwxpe1OWWvi97
         5mB6+SXsJUOw07Y4y5bVPwhGmpMuM33Zt/qeVRc0EXTLgwQulgreMS9OQleA6kvCcqeP
         sw69lNACrtsCuVnLssqwIJfVSMzbTs7Y+npzs8DCErRdjWBZd77qUz46Y6hs07aeBhsd
         R3bfQ7wQS07CLQ5t1bLPvMx9EYMEaI9mUdfZeYcwCSo8PMTo0Pc05HZu5bxZ5uHWPKE0
         9JQh1BSrK5kI824i+Ah+u2hZ+unhBoiQB6huc9vuinOqjs7s9LgfUpsW5V6YXQKZYo75
         QENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696421; x=1793301221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        b=oV/WbGgJCUNqmLIk55GxRqUIw6topYFhsSe0XITwW2WVNb1oENwnmjiQ1+DQvp3TFW
         gUlCBc8YLpP2xvDakFYWMmlmx/tGSSvYfBRjURtskYLc0LAvS2w2LBXdtJQCiPDinN/4
         featINGRwWZN4mH/iyb/0CK37Y7BI2M6y7yrjbAxPK4BNT64kW4GJYlu5onT+T+WHuos
         QGB+awsrdPNrLrIBAS5+Nn+p7YZKNHjSuEVlg7PEDl8BDohkqjOb7BulDDGsfebpBMBY
         VT/lEBzdcJdWIGTlpi+3U3pNImMzy9LYE5i0QYWvK4zymJV5qMkVgzHp59+nfJhzpBgf
         kNZA==
X-Forwarded-Encrypted: i=1; AKwUvBwIpsl0W+CA7K7V3qK4A/XiTMDfqCjhpHSCxV2Y85ivFmNQpfRezavBzDdX58Xju/nwMn+6Fm9VkUG2yg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLHmRQH1oUIborE9rgWsIRk8TWaUEBWbQnAIvE+rlpiNZ6IK+eK
	CZt81PgU0bJ4ZEvWFq57vDT0tMh4SkETLv308znAOii1W9Tz1jn4wfMTXPNdSLlsbQNDEpw+GQ3
	7dnKcwfhe8g1OSW7MQ1IBfzFvUyJZ1BM=
X-Gm-Gg: AYBFou04PH6sgkZsIC1umAHIG8cZ/H39sayXIrPUQK9fDemtlHN/idLIloKpl49XKnf
	KT5OD6RQPtmsT8HkgIZ7I1B0phcGg8DVNHXHtXo8JgU5Ze27+y2MRomm4CzX3ldquYJ0hq6U7dS
	MKt+7vCAliifwQhrGPCwAUO7ixtP6hmnzKn2Qp5HB7pKkrFw0t4JJPPUySkQ+xp1CtbXqHUsAw+
	jlPTW1Yqsbzbi8FRtDCjN1Y2GLOaCK3qKg4T9yBcipeaCrpIr4qEgp7LC1bol9NwIQ9BKESrG14
	N2vy1cPgUvn9kG0qisuLNIIi1qC31iRaxZg1U7Luahhr2npiu3PatrJIyz5zjd3ea31+PkkvhM7
	O4mdc+JTTcTcY/pDcDkH0W88x6iQVTq6/hGznuZ5C9Ls9VpRUPMczHX8DkDh+U7/CFpijU5M2Bs
	HMB+7wGFt/FRai+5Lz5C+xsFFTW4Hjm9YFMJ0C6wqwKho0Q4k+Aa35FOSK1GjcdDCg7hXL6FIHX
	jIafop+fuLFKcmR1DfOmQQAZSeosg==
X-Received: by 2002:a05:6102:4bc1:b0:7cc:1218:1d2a with SMTP id
 ada2fe7eead31-7ccc32eb44amr171247137.9.1792696420656; Thu, 22 Oct 2026
 12:13:40 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
 <ato1bMSJgTVZnOyd@SMW015318>
In-Reply-To: <ato1bMSJgTVZnOyd@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 13:13:29 -0600
X-Gm-Features: AclHuK8dUweaO7VirTuh-oMszxWLhvnB6Zh7PvCummnzZQmZVHWezvakVRYMIa4
Message-ID: <CADvTj4o+XjFjE4uhNSaaA78t0dqhXaOFkzux_CfWGyC1CCp6Yw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: sun6i: constrain descriptor addresses through
 the DMA mask
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 10:10=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Oct 21, 2026 at 03:11:29PM -0600, James Hilliard wrote:
> > Descriptor allocations pass GFP_DMA32 to dma_pool_alloc(). The DMA API
> > chooses the memory zone from the device address mask, rather than accep=
ting
> > zone-selection flags from the driver. These flags can also reach the po=
ol
> > metadata allocation and trigger a slab allocator warning, as observed o=
n
> > H616 when preparing the first UART receive-DMA chain.
> >
> > Set a 32-bit coherent DMA mask before creating the descriptor pool and
> > remove GFP_DMA32 from its allocations. The driver does not encode the
> > extra descriptor-address bits supported by some variants, so descriptor
> > links must remain below 4 GiB. Keep the streaming mask unchanged for
> > variants with wider source and destination addresses.
>
> Spouse other dma address in src/dest in descriptor also limited to 32bit.

The src and dst fields contain the low 32 bits, but on variants with
has_high_addr, sun6i_dma_set_addr() stores address bits 33:32 in the
descriptor's para word: bits 17:16 for the source and bits 19:18 for the
destination. Those variants therefore support 34-bit payload addresses.
Variants without that capability retain 32-bit addressing.

> Do you means only descripor address have 32bit limiation, other have not
> such limiation?

For the current driver, yes: descriptor addresses must remain below
4 GiB, while payload addresses can use the wider range on supported
variants.

The descriptor restriction is not necessarily a hardware limitation.
Some variants also support extended descriptor addresses, but require
encoding their high bits into the otherwise-unused low address bits.
The driver does not implement that encoding: it writes the descriptor
address directly to DMA_CHAN_LLI_ADDR and stores the next descriptor
address directly in p_lli_next.

The patch preserves that existing restriction by setting the coherent
DMA mask used by dma_pool_alloc(), instead of passing GFP_DMA32.
The streaming mask and existing payload-address encoding remain
unchanged.

> Frank
> >
> > Fixes: ec31c5c59492 ("dmaengine: sun6i: Add support for 34-bit physical=
 addresses")
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/sun6i-dma.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index 7704b016aed8..0ef6ed1f936e 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -684,7 +684,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_dma_memcpy(
> >       if (!txd)
> >               return NULL;
> >
> > -     v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_l=
li);
> > +     v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >       if (!v_lli) {
> >               dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
> >               goto err_txd_free;
> > @@ -743,7 +743,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_slave_sg(
> >               return NULL;
> >
> >       for_each_sg(sgl, sg, sg_len, i) {
> > -             v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWA=
IT, &p_lli);
> > +             v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >               if (!v_lli)
> >                       goto err_lli_free;
> >
> > @@ -826,7 +826,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_dma_cyclic(
> >               return NULL;
> >
> >       for (i =3D 0; i < periods; i++) {
> > -             v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWA=
IT, &p_lli);
> > +             v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >               if (!v_lli) {
> >                       dev_err(sdev->slave.dev, "Failed to alloc lli mem=
ory\n");
> >                       goto err_lli_free;
> > @@ -1345,6 +1345,11 @@ static int sun6i_dma_probe(struct platform_devic=
e *pdev)
> >               return PTR_ERR(sdc->rstc);
> >       }
> >
> > +     /* This driver uses unextended 32-bit addresses for descriptor li=
nks. */
> > +     ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> > +     if (ret)
> > +             return ret;
> > +
> >       sdc->pool =3D dmam_pool_create(dev_name(&pdev->dev), &pdev->dev,
> >                                    sizeof(struct sun6i_dma_lli), 4, 0);
> >       if (!sdc->pool) {
> >
> > ---
> > base-commit: 93f51579e7df248780214094418f205253383cc5
> > change-id: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a
> >
> > Best regards,
> > --
> > James Hilliard <james.hilliard1@gmail.com>
> >
