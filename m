Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12EFEEC0
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 12:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763294452; cv=none; b=UeBYpMxufBsGkhUssWNoo0yABTbvUMtBaLlArt87bpiZzYAawF3sUy5dz6JKDsATSaAP82XPGb1hgx4XtnsDGCq/Q34FSVm/SDWjkF5T7RH/4RyP1V3DTn0pX5uvaIq6zdfFiEHmJxDVcSlonbDSnyeyY33zyDgs/XZnpoIyEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763294452; c=relaxed/simple;
	bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KY6SG0Pq5rnT0oWZn96yblSylfyaUMRScGDxb+KovSA1C9EL4Cs8VzSuvf9La7UroDmDb5j5dwhujypLmOLuVrRQALeVgAJNJ+TW5Z7OKS30DxJWmyQgWw88y13qs4CZ6E5b9K/uAeJsAPSue857F01PQ45z0/8GQwAh4ADlmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGHEXhgD; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGHEXhgD"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7291af7190so491439566b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 04:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763294449; x=1763899249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=;
        b=NGHEXhgDzN8CrjFa/32tGgOVJIPN1rIymXHYW17dCNN7KNbJUlkU0nrdmoZXNJkuq2
         mwEcGMLjPMVwrmgxC/iJy1Xpgb4zvcUuwWT7ly9rbE5wrXlG57qa2fOwvar3XJO+k9C5
         INIwVAYS0iCADqFFNcfhBsoEySOvrko+2Kf3FV32bYZoVHGNk72I4qhInAXgUZCpVEXj
         WjOyy/hFS5tKcpeWpbRanM+Uv3iPWJBrGpfq+MGZI/vLN46RUq4vKugVnIQR6AzJskvt
         KjWMhblJ/v9PdjuZvLBTCLpegC3dCQPK4xXg/MgBXco+NZisHZkbB3Y7UUpzhRdUclrM
         yJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763294449; x=1763899249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=;
        b=jQukA1q2J4+1IfilK/npk+Lvfi/f9zB6DsJHq15GyyON815WqA9NUZZ2ASMjMYNNcI
         Dw4cZSWjM5tVSWjR2KfJr3NQDE4TZZzUSPJl8QobS04e7vMzj4OZ6x9G83vy/yK48urk
         pa9C/zHK5UWK96DtbY3nCwoe8BfiGmikb2v8KIeR7PdRHkKJvh7nUNQnwcrN7wg4caRE
         T7EtW4jPmiMIBqOC7fNEiIKEHLFlNvh5gj9zmEK+e90uV2XKUio3HPWeZWP9iD2e2Dm3
         eImf8SMwayzI2S9/OgZRzpLXT1KBUhjwKVQv6z57EhBH1jJukIXnTOV8GeOBv9dDbVV0
         OqIw==
X-Forwarded-Encrypted: i=1; AJvYcCWN/C3zSJn6yDZlqr/V/RL40Us7ndA/LScjocHGlPRlIDkSPY8BvsnCNCxeoaokfaD63CFz+BO0E8vJ/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaqrBChBilDfePVw7kTOg4Xrf3SAjt0JgtcawBD/mp3bAS4aev
	PU1AnzRaEISNZIhlS9RCRgHY+ItM1krI1L7DHbT7F5k7fXq+1NV+/aog
X-Gm-Gg: ASbGnct4GTAFau68HjnTXVhbU0QpzWhmsnJcCoQKXgK7Om+yGYPK3RIoIMifawUZNfC
	AmQtabh6mSQ95GgsnAEnIv6VetL1jspQQY1m5nUV9PVZBZE+Bu0IbOI/nc4qIfUzeMeDK/eH8Qf
	QBncp+zgOSLwLV7X05FcwAps2RZW+zK69H0fNJ1sFk/2OzOaYuOYvVqxyIJ8dpZK+0LwSujAVzE
	8qa1ITHMjQsfNhwWkgNZylvOb+cFP4dZnGAiNL3FtESLMGM5d2UUMnPUhls0tr1LrYjK524ncLp
	7KgLD6iJQUYxXdeEnmgKjoKcT7mOULabh8b18Q9+Or3XfLImQB1eatLzDT9dv6SnOghuG0Oor94
	nxLQ0X8nxMQHU2dK1y3zDmCnQrOQvdYcScPs4Ei/xJSHPFS++LOhob/LYSmvbpLjpnETDnJDwxq
	SZACjgPubGSZMaJ+whDBY2omoaImT9X37XKxEWyIeSvh26tNR1C1410yThFaw5NBCS2TBxtCBTg
	OMPCk0PT2lDJPfm
X-Google-Smtp-Source: AGHT+IFWFubjCIweyb9YCoKzVFcXXsXAAvddERhRBpi3vJIG1VQ4HjCz6c3ATn4RBI8dMcQCX4ffyw==
X-Received: by 2002:a17:907:96a8:b0:b73:989d:3a86 with SMTP id a640c23a62f3a-b73989d3e2bmr79438866b.40.1763294448767;
        Sun, 16 Nov 2025 04:00:48 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad48dcsm826174066b.25.2025.11.16.04.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 04:00:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject:
 Re: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33 binding
Date: Sun, 16 Nov 2025 13:00:47 +0100
Message-ID: <10753322.nUPlyArG6x@jernej-laptop>
In-Reply-To: <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251116-pigeon-of-optimal-blizzard-2cb3b3@kuoka>
 <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

Dne nedelja, 16. november 2025 ob 12:33:55 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On 16/11/2025 12:33, Krzysztof Kozlowski wrote:
> > On Sat, Nov 15, 2025 at 03:13:46PM +0100, Jernej Skrabec wrote:
> >> As it turns out, current H616 DE33 binding was written based on
> >> incomplete understanding of DE33 design. Namely, planes are shared
> >> resource and not tied to specific mixer, which was the case for previo=
us
> >> generations of Display Engine (DE3 and earlier).
> >>
> >> This means that current DE33 binding doesn't properly reflect HW and
> >> using it would mean that second mixer (used for second display output)
> >> can't be supported.
> >>
> >> Update DE33 mixer binding so instead of referencing planes register
> >> space, it contains phandle to newly introduced DE33 planes node.
> >>
> >> There is no user of this binding yet, so changes can be made safely,
> >> without breaking any backward compatibility.
> >=20
> > And why would you configure statically - per soc - always the same plane
> > as per mixer? If you do that, it means it is really fixed and internal
> > to display engine thus should not be exposed in DT.

Not sure I understand what you mean. H616 SoC has 6 planes which are
represented with single DE33 planes node (see previous DT binding).=20
Driver has to decide initial allocation. For example, 3 planes for each
mixer. However, nothing prevents to allocate 1 plane to first mixer and
5 to other. You can even allocate all 6 planes to one mixer and none to
the other, if board has only one output enabled.

In any case, plane allocation is runtime decision and has nothing to do
with DT. Since planes are shared resource, their register space can't be
assigned to only one mixer.

See [1] for example how this would look like.

> >=20
> > Describing each IP block resource in DT is way too granular.
> >=20
>=20
> BTW, everything is update, thus subject is really non-informative.

I guess "fix" would be more descriptive.

Best regards,
Jernej

[1] https://github.com/jernejsk/linux-1/blob/d93d56d92db52c7ff228c0532a1045=
de02e0662c/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi#L181-L235



