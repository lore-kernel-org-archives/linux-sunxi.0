Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE89D20C00C
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766687844; cv=none; b=IKGAR/8b1dHO5WOz0CEpvHWZuz74qDHztbkU4M7HYso14ZQv7IBAwftTzGsn6F2xmoKha9GnRWxnlf3FHCHV0EU0U4DffSJRJr5xxQuPW3c4/g6+FhTvmQIOvIcs16q9HVgG4UUQ6x43joHTnLYvlOTtfgR5o5Qgg26NLmPZ7sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766687844; c=relaxed/simple;
	bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VrTbS+lDZmlUst6DybaFeu09MwnOc46bvCJLXOsL+P6XfTM6t61owHBj7h5vFIJl9durxM2mOOo2cMdaswDvUwb9stqxZim4j2mowjiD1uzquxaOXmy9w68tkLIkFRs8WPsfBFdC1ycfngAdn8hMm/uSqGCEsHFgAeJp1CbFD4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGasKRVb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGasKRVb"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b79e7112398so1177575166b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 10:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687841; x=1767292641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
        b=RGasKRVbCbFqC3nTWexdHHSMEpEU4UwUz9nfTi9HWRsZ5n+uNBYxhlwqm8eviqsQA1
         jFZgD4AX4PkEe1L2yDWznlgK7zwFW6Unco8Wk3QsL2rsQTlV7ldr0sfmqgCV3S+4cxbR
         5N/s1K5qcPFP7QFMgCAoM0hCjWgpCXV9LHQ3LqvMhWtLxQKmTz+F/otq0h+ha2tCmFUr
         d4ODMklTOkS1XTBQMv9GP2v26sqwWpbP0abJOjZSvFHBi7HYR6+1SxMuxeNKjHopCBSs
         Vfg/ykE/KvtL55/LmJuCLxYLcJjGGS1rwJbViWMJB2zQQmq7uXR6/FQ2qPKJZwHJbDa1
         oQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687841; x=1767292641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
        b=Ey0lGkWqdx44ESxQvni2E4bxmdUTBzBWJeaxRLSlAR9I/fW1qe4JI2ZeBWvgJNwcRD
         XsZGPv17rs7UpK3UJHpvtuHz5GdO3ix/r8WGsHDL8SiOw0YwswbDXr4EPZ+pG6QmhIjj
         PILRKeaYtrAO/6Gu35oo4nvUqqSjxL++H9L0ALe0vduLJJ+Srr3vdRJmKf3PPB7mK+kb
         4sh3e2lLH/CTsW+CQgnbPuQsXTEZAyyVRUhAQXVYZ4dm9G3YlAoXTLqi+yq5f9+7m/8s
         XH1NrSGZUTqvKDivYpl3ruMZ2E/R3Yz/cnUfmpK3MLRJY1mqlbbgd9qVm4CgYZG5MACd
         DECQ==
X-Forwarded-Encrypted: i=1; AJvYcCV71/iyT/MZqSMs64V2SUMQ5cwsCQWsHJsl5eTw9ZvHlbfuKVbiZ45LNd2zzNUAbPpdpdHqVFwUlXNY0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhMhDUK9Cy3XloDBgH1HmQhLsyJA5v1NHGaR9RKcvxgeOAJ58z
	gzeEtzl6wOpeKDqHSfYY52vNCOh+S6nYzWlLM5yvqUNrQtMaYfiThs0G
X-Gm-Gg: AY/fxX43FiCHYFCv0hf2WQ17i4kXAh2i2fu4N1Q8swwnznP4eHBr5NqZ5wgFS/C/wim
	h+q5nAozdeHuzpM79riq00IQFAN8AY00HmxN7uSr/uMSmMM/3X8hpKixQlsEI1BxInruqafUxWa
	iexnQzHKoKIoxwzjqlHGzfLE8POodruDViOkY5LtMoLLXtpEY60H/NiSmvYrIXib3Jx/oa0y6Qf
	DC58HZ1MoDCi9WlAxqWXJxAJ5RPLEacnbyypdLuwXF4wSbMS7YsiG/YaVh4UWqeCPK2s0lquBUr
	zOd2d7KJD2v4DSCQBlxpe27rpAzj7uDxOb5S32NNmje5wTKTzq3h3zTY0zkKwy6lPXA/IgIaBUe
	xtfeyY/tDt9sfyjm2AVuHo7MJkoZEBeWXFfvwkcZvvlo3eqhjKGuSBtFRuxYoR1B7nC5WOFWJfk
	E9hqkIQNOU6OqZp8o9ezhQhxIn15fQMM17
X-Google-Smtp-Source: AGHT+IH4B3XzX8QXujzZunFfKEc/cY4W3MiVUX7/1rzA6qLulDTYIhj8orR5H1uD8QCD+qBxL3d2xw==
X-Received: by 2002:a17:907:1c27:b0:b7c:eb19:6a3f with SMTP id a640c23a62f3a-b803705e31cmr2146669666b.35.1766687841205;
        Thu, 25 Dec 2025 10:37:21 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b803d3cea32sm2033127866b.34.2025.12.25.10.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:37:20 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
Subject:
 Re: [PATCH 3/4] ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios"
 property
Date: Thu, 25 Dec 2025 19:37:18 +0100
Message-ID: <2409366.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20251225103616.3203473-4-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:14 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The P66's device tree includes the reference design dtsi files, which
> defines a node and properties for the touchpanel in the common design.
> The P66 dts file then overrides all the properties to match its own
> design, but as the touchpanel model is different, a different schema
> is matched. This other schema uses a different name for the GPIO.
>=20
> The original submission added the correct GPIO property, but did not
> delete the one inherited from the reference design, causing validation
> errors.
>=20
> Explicitly delete the incorrect GPIO property.
>=20
> Fixes: 2a53aff27236 ("ARM: dts: sun5i: Enable touchscreen on Utoo P66")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>=20

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


