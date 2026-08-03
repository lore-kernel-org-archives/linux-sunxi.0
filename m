Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B168322B9F
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743670; cv=pass; b=AYznlcXPwX9V/1XAMU/E6DxCtFX1xYsEZFlFuO06i1/i9bPjln21Fk7yJCI53BWhGfBShHItlgP8qnUaRous2U3fSzHa4uvwH3sZhFeWRzwNXvLq3/FQC41Gf9TOhcT7O1mXoCraJphJQ8LqY+FLZfCIndOtAdmLkthWiYdAZbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743670; c=relaxed/simple;
	bh=BfoGLnxKqkGHS3lXZmpg5V4S04rgmYKSRo//J2O5u7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGwIk/ad1M0EV2jI0i3noHP+F7qdpyTh4fIU0v/JzOTzS/vPDhr7+CJYTUrkokRE558byMmNUogAX4yQyC3rB+Wr+t0JfpzsAd9fgjdQysTrE6AjLMYIcJ21KVI70Kv4k1w0wVE+2h4LlBJD880w3WAPoTEGmwUInWW6rL9qP5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hH2HwnlR; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hH2HwnlR"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-738bcf9a573so996885137.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 00:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785743667; cv=none;
        d=google.com; s=arc-20260327;
        b=J3bamYpJYKrC8rEssKIquQBrIO36eL/Wnik4NqPTp9RXSGMUqNozo/NPfVbRWBGA84
         OyCugeqi4t6CzAfPkhjEtTQj6vqbH9qDFp75roDIKlEPUWn+nDNkc96odArvySkDzIVg
         FCAjpttV66n0LSNgZMsjvEeli0YWFpJkiB4F3l9rBkcV0M2zBcuZ3cJ4goMdm80dAxIg
         fdMLqPiF42keYjUj6FrWemLfRxoKH0WwZMxoFW1yBAsmnPd4D7NlTRNVcmZJI3Ppq1px
         GHwJv4ZYGKaZiZDjTOFFhVkCj6IGbxPzlCgIiX8Iwxuf4dy0ZkmWHfrFUMAIpVTZDJkN
         dNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=psfVqHSrgaZTUpwYinIDfYYI61bABe7ffXMHd3MgwJ8=;
        fh=UtcylNpBCUkTQRNkAdIR33/ArnR4oOZoibuiEsYanvQ=;
        b=rskFwgWb3/JXx9tPKBWjTtK/kNPpNLZs443VLZRNT7CjpQOuZOguPpDgH4cqFdRE5H
         D6Soyg/XH+UFVSZ3w9Cmn2dqrKipRy12r31rQAQ6MF3knFIbwHQU5ElJxWsbrAu5POZ1
         a+kUgymw5w3VTdYYkj3r4js42NEN2kO+WSH+pca375VMQ60LDZPwR698H3BE+3pn+veJ
         ClDk2hiw0t9S/C577c50w/V53yy7xmttVfR5kGTSp/q9G/x1p5wVx5UbXI99pP5tHIDY
         wQWtJPPRLF2UFE6vLm9wawqpel+qujxD4PcOopKLGjSO5lZypuWV4mucugUjxUvHhYRp
         xT/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785743667; x=1786348467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psfVqHSrgaZTUpwYinIDfYYI61bABe7ffXMHd3MgwJ8=;
        b=hH2HwnlRX302M2qQrbcA47m++8CaDDEZ2IlpgDI+Ds0MtwdGFlb88iMo79mBEzrkK0
         ytcgfE9MNvrham6BQ9AZ/q4RjOeA+pkkmKIrKP+ZVffyRHg7IpbzGhdWGWBHEMgb5GHs
         7u57Qvhh+e0cqV7gn4KLOEeuwEbCKu7k94ZAdJBBS2pTq1vu1htljV0IZv7z8eWBIFqF
         ciLcwWcQtyHioufFQkGXMr8VIR5lB9hEZVCqpx19jSAWlXcrFxmfh/jitVHhjYiioKF7
         qoGO7xm5Af73JR1LW+AKLD75dTIEbVAvDdh4lV05cIiLST5SMCB2K/9BeMXM/romLfH2
         exyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743667; x=1786348467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psfVqHSrgaZTUpwYinIDfYYI61bABe7ffXMHd3MgwJ8=;
        b=pRMgL71KzKecPBJDKQGOg9VTZuPqt+8IImau6WBWotP9XVPsKK7Qoaz8Yh0eYvYN66
         hjJEFpQ4kBXx45ND7gRil8LHw/WFGZUDOIVwvydLpnbfWvULfD2XXvB9U9TowFq3Nw/9
         gRyindt9H4fMZFlN1QtVs0vNP2uSLo6DhHHBTlLNEgwoF9Oi3Xw0NPmFTuNmeqbJAEvq
         RXps0XFyq4iF+jxg5BY8QqAJ1LP01UvyPnlmLavz7EwfzVTIRbQFv9/SkaCNGLufV4a7
         yIKD1HhUUzSaH39D1LBKM2hKiYXTrdmjEJ5SvaiPksv35yaDYV5uXUIwp9MDyZjVxnzp
         nnCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEh5H3m4QFALQFUQrU3wAmhY4k7udvr214W+pZ4+HyHgDCdZtnDRaHw3nxUqJxsxMtO8K0bvoCSaD5iQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCyOSpcp6vseeAPbUZ6zrQe4hqmCEEhGDrMeAf6p5bKXEShjHp
	B0UunNh5LdRiwGbCgtcdcIZlC/R/GmC3fEtuSn0oH3eBy9ueaLMQ2NcKnwO2VC88v9sH2gQV/iO
	EBrhdG8GuWAt3fBWucJjdh8QkMcQ43hc=
X-Gm-Gg: AR+sD12s3D1sR9RqHz1+h1IvY6D0rwCE/+e6XjTzDyIootPs0Tv1Dw6Fd920NQZjQ8S
	bZFpGmajq8AKRnLCvYIluXQpAz3zDZgniG0TQljBgliVU5cx1bsIaB00lmgEayHrPkhCPa/dzo8
	FhTEpezqLm54ncGwGi1dWqbokxbkrFlbXNEEpblDHpq4SaF419c6fQ3m7XvaowUfurWDhGSp3Mb
	LJE6BMUB3L4m8nqkQL8VsRq5PdJcyIEjbtzP80rTbJ+Pt59So1rQE9IRvZP4OhzqyucFnUrPW0G
	0rspjnnFSGc58cBnjNjI3GcjaQwodxg6GvLOtXiipvapaF1c8YPR8D1SiNUp5SeqTTUpm/wRk4b
	fna2mL99vPj4zPWBrDt/zY0QECw5BYRE2TgiaGv1VKDgh6vBHPlkqTpxu5cWTeI5BywH70mo5ub
	L+DxS27UuvzzDY6b8RvJeO/QGrMCTWfe6huIPjsCaQrCPMpm4=
X-Received: by 2002:a05:6102:160e:b0:65a:fcea:5a8 with SMTP id
 ada2fe7eead31-75b21860c9dmr6557280137.3.1785743667347; Mon, 03 Aug 2026
 00:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com> <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org>
In-Reply-To: <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 01:54:16 -0600
X-Gm-Features: AUfX_mzypJX8cJAuXN5et4vt4pytYhwgZWhNFqSZnDYLwz1Lp-gZapkTkGPrkCE
Message-ID: <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 07:14, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
>
> This fails when applied, because you did not explain the
> dependencies/merging of this patchset.
>
> This is THE MOST important information of cover letter. The first thing
> to explain.

I did mention in the cover letter that the pwm series is a dependency:
https://lore.kernel.org/all/20260703152215.192859-1-richard.genoud@bootlin.=
com/

With the pwm series first this should apply on top of master. Should
I just mention that it applies on master or should I reference a specific
commit hash or something?

> >
> > Describe the parent device, its input clock, required function supplies=
,
> > the optional SID bandgap calibration cell used by the vendor initializa=
tion
> > sequence, and its optional Ethernet PHY control child. Document the 24 =
and
> > 27 MHz rates encoded by the public EPHY clock selector.
> >
>
> ...
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - ac-ldoin-supply
> > +  - ephy-vcc-supply
> > +  - rtc-vcc-supply
> > +  - tv-vcc-supply
> > +
> > +dependencies:
> > +  interrupts: [ interrupt-controller ]
> > +  interrupt-controller: [ '#interrupt-cells', interrupts ]
> > +  '#interrupt-cells': [ interrupt-controller ]
> > +  nvmem-cells: [ nvmem-cell-names ]
> > +  nvmem-cell-names: [ nvmem-cells ]
>
> Why do you need all these dependencies? What are you trying to express?

Looks like we probably can get rid of all except these:
interrupt-controller: [ interrupts ]
nvmem-cells: [ nvmem-cell-names ]

I was just trying to express the MFD controller dependencies.

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        mixed-signal@10 {
>
> ...
>
> > +...
> > diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bind=
ings/mfd/x-powers,ac200.h
> > new file mode 100644
> > index 000000000000..cc59e2ab4912
> > --- /dev/null
> > +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +
> > +#define AC200_IRQ_TVE                        0
> > +#define AC200_IRQ_EPHY                       1
> > +#define AC200_IRQ_RTC                        2
>
> Hardware constants are not really bindings, even though you use them in
> the driver.

Should I do something different for this?

>
> > +
> > +#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */
> >
>
>
> Best regards,
> Krzysztof
