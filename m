Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9D381AF7
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Mar 2026 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611833; cv=none; b=NYBccnBkOAv+0nSHjiIPOyNtKrig8XG3HFdOOsUT8I11MmmGnSu/2CjhAcHEx4CWnhxgBVsjHJ8ieJA7Xwi7+cYwPuho5+JrGHNpP83FmM/UMpw2iemQmlrQqcFgoBx11OcyVmYTiT/6Vb1Recv5E+kAPlU71SskqI7QtKvpLgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611833; c=relaxed/simple;
	bh=FEc9lT0BW2KeKXQ3ChIovGLpCHr9pq972Nq5Th8ooKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G+mjqZBfthfCg2YNcSi/Or/HYM47GmxgFIkA0CqmNB/nNcA3Vbsmwj51tvXEDHHlq3wkmsy55EyGoaAQmWVOio59Xw8ibLEOPZChFHyS1/bYhY0SLgdLHLOtgIVxV2lyvsQPGv22xdBdq93nNi/Q59sIn4Z6UNvM4827pcCrfNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiXflrfB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiXflrfB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fd27754bso18819085e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Mar 2026 04:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774611830; x=1775216630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEc9lT0BW2KeKXQ3ChIovGLpCHr9pq972Nq5Th8ooKA=;
        b=EiXflrfB8ZRJOqGQlBtGml4cQlIdXKE+8kKu9/iGLg3xIFiyetAqbmXPjnA4dcl1B8
         FQKgKt3iAKNGYZqBxY6fnbBu7+uZafmhOMiiEr4lZcFpj7etMn1QrkAQGBjUfvb2fT8Q
         tcLv0gWElcTc9hpdPsEgga+5rvvGlpQ9OTOIyFTHQbJvjd7TbIE+VFjW7FReWb1ildHs
         R61G520a/ymX/9pB8WlxYoJu4RSJ3kqAHZ8vr+bt4hr/Q/KuiGM7b/V5Uez11Vu61mQ4
         SLqxQcrnN5jaemQNDzII0Xj+urfRxiDfZecEfq6VlRBK5kprVGDj/h7BF50gfj54l/EY
         5HGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611830; x=1775216630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEc9lT0BW2KeKXQ3ChIovGLpCHr9pq972Nq5Th8ooKA=;
        b=ZhMLLOqkl+qQ0BP6NsBYFz8iroftFAHq6gdu7hHf7Hpy25CqkoCFED00ojHDcaA4U6
         ttRj+IfrAN1zWC2E+n9wf7bMPZBNRkQhJN9OWWkpAzkmuKuZ7MHHP0YWUHKskgrzlK0x
         CFCP3jZpuX4hmqHTBOsdKb8btFS8UyjGaIAqMJsfWXgKpXQGifiwbTB68SaVljzwTL7O
         GCV/861Mjl4DcylR3ipBq8skzwLtlK786ONUfrIMs9qcunnLairvHG5sBfPyj5YpJjqK
         iiaGBFCNBS8HQUeDXML9lO/Xo/pGvKcwW93JL1q1YIxgE6ukGTl88d0KGuIammSaWVkc
         xygA==
X-Forwarded-Encrypted: i=1; AJvYcCXOdlSMiY7FdAPtBhRVtVTxjrIi5QYiS04hezMHl92vfEcuUDaPidllr+K4DMeNjfDVd1eEU1ckMB4ImA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxveAboDzJPZ272k7Ykgf13/ZSNPkrL/se6X+ayW6k5sqy6E4RA
	C90GcbVhvFiVXL2j95+rled2oXS3I6v94OntztlKqCLgnYAZmjD0s6A4
X-Gm-Gg: ATEYQzyIlzqOhpCP30g3w77kWNXToSu7JisDtQOAkRwC5J5m8pOLo4VfG3CR8AM0Xcs
	ShplS5PXDVE4VbEaaeXt+JdiY1s+6b1MzEYh7DzWO8IgaO1JjLQEemFlC3EJT/CMn/fImN3RB4g
	d4M4QGGhCg0yiwitdyik5h/YiGs4RrEdSUrksyvxjmDoPJwz132sU8P21RhG1OPIK2nY2exr5Qk
	ZvNh1jtb4vJ5U3N11JCDSwmBB5lpKRZbU3mXt1ZDuP7E03322qXz9HuIlltxAAeElVERvV4Riwp
	iidxfGWG/SQMDpb6oC/W1UjK63jRolx7zHrdOYD188ol+jqzkKrNjaX1eDA9PLFeRNNvpZ+Nkzw
	9DPgSYtQG3bNaKAsTDuooUjZybXld9mpANmSmtO9ssXlcenZBlRcmS/gZYQEfebDI1ri4mgY0Pc
	H2d1YYXUo9yRIbvdscmiBT/lzNs2ebdxRZ1S3qI5Gf550Td8kXtI3aZ9rCPocZNY03R1AFDegUS
	fhJxJ4gvYnSn/Dvig==
X-Received: by 2002:a05:600c:a06:b0:487:1108:48af with SMTP id 5b1f17b1804b1-48727d59ce3mr37657225e9.4.1774611829936;
        Fri, 27 Mar 2026 04:43:49 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm14813099f8f.30.2026.03.27.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:43:49 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 1/3] pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
Date: Fri, 27 Mar 2026 12:39:42 +0100
Message-ID: <2822911.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260327113006.3135663-2-andre.przywara@arm.com>
References:
 <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 27. marec 2026 ob 12:30:04 Srednjeevropski standardni =C4=8Das j=
e Andre Przywara napisal(a):
> The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> that line is muxed for IRQ triggering (muxval 6), but only if it's
> explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> behaviour, so we added a optional workaround, triggered by a quirk bit,
> which triggers remuxing the pin when it's configured for IRQ, while we
> need to read its value.
>=20
> For some reasons this quirk flag was copied over to newer SoCs, even
> though they don't show this behaviour, and the GPIO data register
> reflects the true GPIO state even with a pin muxed to IRQ trigger.
>=20
> Remove the unneeded quirk from the A523 family, where it's definitely
> not needed (confirmed by experiments), and where it actually breaks,
> because the workaround is not compatible with the newer generation
> pinctrl IP used in that chip.
>=20
> Together with a DT change this fixes GPIO IRQ operation on the A523
> family of SoCs, as for instance used for the SD card detection.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 =
GPIO ports")

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


