Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13710231A23
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763293453; cv=none; b=kJGZ6h95xU+lufogBg+YYc0nUnyCSVjUoL0f9sa9Ta3t9ueS1AUgblzJIQqGTpnytjFijQrdFda+2pUeaH0WtyifATCVuabPqOP9eeGZjdsYjbsjlWhH+KgWTyOADnq8wAnB5/XKkYxmZdMI2maX1bKchO7T2+1LHXuH2p9/Kmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763293453; c=relaxed/simple;
	bh=Lt9xGL62WtrfxQ+0HgmFN0gM36WLFSIowVUaCGct32A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CjpSW4i4lJPKFIf/izbrI/jes+pNjsNWV58sOvgLXb6CvsxJJq+CMHA6WFqdgDcHzv3Mf1lpYHmyd9oPfdDHC4D4Lb4udtALCruAafkMmskNJfe0qbmKZBKNVxhTz3yW/PGJdazM4hw0gdvVGfRQ0kOPbXW9Qz2TDama3NOxswk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTnp6Csn; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTnp6Csn"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b71397df721so476389866b.1
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763293450; x=1763898250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0FdCBKLZNmvA5H65lDRryOm2kL/lm5kmNUU93njJEQ=;
        b=CTnp6Csnoma4rfLoyGIZRBJl1ws9TjeZ4uSOtBhJooYAwLoOK/UxEMbEEbqHgX/EqR
         mRmMjngfrRycdw8YvU1w9OQ+NYGTwAi0+4m5FckintAWzJXnvWmX/Gl9qiLlHy9CQw9I
         vyYPw58fiMJtdczvg8sYiExyYM1kQX6YCYwu8NTo2fy5K+4OAyLnP+Idxue93X7JS8qV
         QHFXwgRZ+deduDp52A0mK08bmSWL2neP0xV/dSlh9k1PzheSxOlv3VtOz5IDiQsO7T7/
         5z6jP9V4PNSJjtbZSX3vHuQNZIMZzJlsvg0UZS/qPHQNJrkI8WHYU6oDALKPwb4kWpOA
         QMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763293450; x=1763898250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0FdCBKLZNmvA5H65lDRryOm2kL/lm5kmNUU93njJEQ=;
        b=heE9V7NPNrOoe2bXQyTEkLGIC4iU+aEmEvoOxmbVF/I0jI0gB0FRL3YJqc8YGDRD/B
         1qBrcou+F9J1YCNdW5tXVbOEbbir400J8q4oNo/Dq20stjPGgfrt92nV6CKv0dWqMtM1
         zPdYF3PxwOkm8WaV6pv042hJJs12Y+2+5gYMV1ARMrwMtlF36QluwvMRRy9Uwq+IwsyM
         0QfPvFZnKwiue1QAgGmgniWo8/h9d+x6Vxxzgfvgk6u+DnZr0tvQG6qGTh5TaVZ0xu2d
         Kt5Ybx82aotV80TxA5KjymxpSvjtn76orMRZgGoy1zcXnvn02rH9/PFp78T6x2tULTwO
         0slA==
X-Forwarded-Encrypted: i=1; AJvYcCWrp7LrkWN3qErl0TC0fHvjWucoBJlWf65VzBbSk4uDIPuGp9vwZQTCvVd9OMulhE5UpXsM5eqlSiEWMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnB9GA8x4XA8v7nXGRpsDRUeUG0h+Kgsn1WbAOpWv5nHZqlLyY
	mJSJstb2sHapHMu/2n1QtRcmPlfngC6HBIEdjIVv2o7MQrwrZd+dy32k
X-Gm-Gg: ASbGnctPsICWN4UJttYW9u2SmhJq1zI/ECPJ6//7bswy2p45TwYb14NL6N9ZuJkCzM5
	lW7+JfvehcBP0l7p8tcmgdPJn4aqNJ44Zo2fMNn4K+XkXddfR1qSNVYlVJzreTAxTaBhpspnNT7
	qdSTj5SdDH+AxEdSieIXIlmq559Ik2IBkMsV+443/mS+mEUiqWbShaymRMsBBL+rAHKd6e5CRxL
	YuDvIUpI+RbfDyem61G+h/U3piiLIVu4iSDUbFQWTOO3cSGKHUjhK9TrhuBPnnmgqbvZ0cwxT/N
	ygoeNE8xXLs2ccBX26LxaTcbTeWdDHvdl0QEXgSep71cYjXPhr/7PfJhCDn6lgBpyorZQ2GgUTB
	6ze/+Qy7V8nc5/8A794psjFxKwk3KTqz1z1Y0SbO/Kfeb2Ua7kmRUkEneZ4vS/wDVH5no135RKJ
	RFbp1iO9UWwX1Tjzv2ocxfwYkzrhnUR9c96TFZwAGJueMh43h8auToCduOHxIc7LbtoisI
X-Google-Smtp-Source: AGHT+IF71fotOguLRbTRHhdoPXFXtZCCxjXGGJnugEk1v1pjxqWMpiA2cn4S56S/ok6Kp7QddGfEdA==
X-Received: by 2002:a17:907:fdcb:b0:b73:8757:68ad with SMTP id a640c23a62f3a-b7387577ab2mr403687966b.47.1763293450183;
        Sun, 16 Nov 2025 03:44:10 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81172sm820527166b.15.2025.11.16.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 03:44:09 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Date: Sun, 16 Nov 2025 12:44:08 +0100
Message-ID: <4691137.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-5-jernej.skrabec@gmail.com>
 <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

Dne nedelja, 16. november 2025 ob 12:29:27 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> > Allwinner Display Engine 3.3 contains planes, which are shared resources
> > between all mixers present in SoC. They can be assigned to specific
> > mixer by using registers which reside in display clocks MMIO.
> >=20
> > Add a binding for them.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/allwinner=
,sun50i-h616-de33-planes.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i=
=2Dh616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwin=
ner,sun50i-h616-de33-planes.yaml
> > new file mode 100644
> > index 000000000000..801e5068a6b5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-d=
e33-planes.yaml
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-=
planes.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner H616 Display Engine 3.3 planes
> > +
> > +maintainers:
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +description: |
>=20
> Do not need '|' unless you need to preserve formatting.
>=20
> > +  Display Engine 3.3 planes are independent of mixers, contrary to
> > +  previous generations of Display Engine. Planes can be assigned to
> > +  mixers independently and even dynamically during runtime.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun50i-h616-de33-planes
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  allwinner,plane-mapping:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Phandle of Display Engine clock node
>=20
> You description is almost duplicating property name. You need to explain
> here how this device uses them.

So I guess I can copy commit description here? It is needed to
access registers from different core, so it can assign (map)
planes between mixers at runtime.

>=20
> Esxpecially that clocks do not go via custom properties.

This has nothing to do with clocks per se, it's just that registers
that driver needs to access for mapping planes between mixers
are in IP core which takes care mostly for clocks and resets.

Best regards,
Jernej

>=20
> Best regards,
> Krzysztof
>=20
>=20




