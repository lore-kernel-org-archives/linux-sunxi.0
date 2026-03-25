Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F691C6FF5
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398167; cv=none; b=GizAIc2CJbG2hppGLF8+cKSd0+svtU01+qZNpb+p15DY8ok0SEcnvQXp8lGrXBgkymzRZhj4/hX6C0jn0xOyKjueEsa/ZlQcKYdOLHjVsgTKfwhG8YgukcGxo588s3LVu7DhpE42esn65Wn5C9fmq3p5sxWkdiSzm3qWzn3JWx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398167; c=relaxed/simple;
	bh=TFnnbTIC9o19/HLCf7RRUSX0316kx/uZhdRjEgeR9LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lrIyqO5o5cmKDWhHHJmKx1PMZ+ZvWV6P0lFDabI6kH1VfgECvBZXMf7kNyUKGB37QAKoR6Sz+mcxbT2dOaJ19U/M0MjjFNU8+1mAWu3teHyxVoFxKFyBsmJQXobX7t+yPVfKyK3S80rP+S4Lk7/LeuGEbXJFE1cukIwEZluo6Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvRmkb0Q; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvRmkb0Q"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-506a747448dso38331591cf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398165; x=1775002965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/L1QpJi1pkLlnS2R1iZ460CX5uyexB55OG07HYgp2s=;
        b=UvRmkb0QIClF+Vlg0AEdNdXTUCHOkMvemocF0kpnPb/RxE9o1XqsuG+y4X2Heft7Rm
         T6Vz8ned1M3cf2Bp7JtR/iQisM5RMzBT58fQApACtEkFxKEZHPNF/K21SzPC3CaI/j9w
         Nvgoq4OwEFpLoJbUFMNqzzKiCP/0mBfKrfxHF9O8ziMBEPMwZQMIWuaJqEgFg3TtvQda
         JiFYzQjeRVEHgjyuutzKvOJrKUz+m3AkiPcOCHdxfVZsnpFhnBt+hF5fpvHbMiSwTh9h
         92ykj1bOo+5lTqZT3sndHzz6wNoiPhiMCOXrBAcU/3lLkGkahUtFxR92qGswWcS2AIhW
         Chnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398165; x=1775002965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/L1QpJi1pkLlnS2R1iZ460CX5uyexB55OG07HYgp2s=;
        b=cz5ZzaUoqQxOlGv9BtrKlzgTWJs76dI4HS1z9LoPlzstRO50x0ZhUjlQx/P/ZIhFmK
         O0g+e1rSUmZRrVXw2kZN1MtHB/mX2zYBFJqXSD7vGYKsHdK3QrVtZ1pF+LbKkBfPGOsf
         +CKCjNdaLvqDm4wn1kxXz2Ekq8Qri/DxXT5YuLo/l2gsNRiZ2nahfyVfW/iGQEo6RXtM
         yfb5eFizQ9F7EF9fdJr3NVPftCoUsYcQoZpqSJ5FGSt0U52GEC2bf1v+CFDWsAv7d/wd
         XPBreNUnMl0EZ1pJFr+WveRko/Nm7xe16A17yPzCI8pK4OXuuT1GsJuDEsN+KWYE/A4Y
         ZTRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVccBRzVh6rssI2IGW8SYdCX+QwtOUKmFZhva6RzZGRYoZybIXvhX4ZSqdlGg2x45U9VNUsM0477akU8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0qB36W9fWbkKJ7LDPkWonPMkQAJKWpg06YagAwOXVZKXF9b2l
	ICHsWCd2ZTVJJSdFh7D6AJuTcY0LLMNJwlGpnFwDeS+yGz6odQhMXmj/
X-Gm-Gg: ATEYQzySG3lOgXHAfSn0mKXpcDklV3HmQlZxa9agRODUXab49Z4ubch6COLSXyICz54
	x6lTYpEMvb3s3EFb/KnaSTfFbadd/f+0wzDCM/xAG1e0kkquVTkRph3yAExqBY55l0B+1khGEpF
	1K1ottm14w8Qiy55vHqw/Ogm2w1MEz8RHmsFF3m0jnOkXlIjBPehCaKxDZkjRPtJhDqc5/NDESZ
	zdBiPa3fFmbmN8RtzMABXrL+qWnVeQQmrmQOPs1k5yuwP0ED0RyUs4dpWFB+Hz5JsYAgj4lqKy6
	pqVSdTzTzE8jla6aOdfYVJXOFRAMOWbtp8gFvpSR7zXRQ1Ovs+mTyH6Ru1jYVUbUCVCcdaAyZd0
	CDAN0B3tIsyYY4e74PID1dIXnnOGa1d2SbELQ5aDjM6MUGD9A7haUm2vjskhJcApOGH7tGYPauo
	kb6lRplEQgUCg8KivfRL1m39QLCH7kA/ft8q5WbRnJ/+sjrnrjAIBFXR4iUeMZXTganWRBoOxf+
	26RiieOT8L57Q==
X-Received: by 2002:ac8:5905:0:b0:50b:26d7:eaa0 with SMTP id d75a77b69052e-50b80e59457mr26782481cf.40.1774398165131;
        Tue, 24 Mar 2026 17:22:45 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d23237sm150693321cf.13.2026.03.24.17.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:22:44 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: sram: Document Allwinner H616 VE SRAM
Date: Wed, 25 Mar 2026 01:22:42 +0100
Message-ID: <13973231.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20260324164357.1607247-2-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:49 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The Allwinner H616 has two switchable peripheral SRAM regions:
>=20
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
>=20
>   The mux value for this region is different from previous generations,
>   and thus needs a completely new compatible.
>=20
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
>=20
>   The mux value for this region is the same as on the A64 and H6. The
>   existing compatible for the A64 already covers this.
>=20
> Add the compatible for the VE SRAM to the list of covered compatibles in
> the generic SRAM region binding.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


