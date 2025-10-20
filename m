Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50449330322
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 17:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760982746; cv=none; b=T1+m2NxNysEtFT9r8ePNqSoj7sHtRhIlBAOgbNTI9QkdmwEU3cmd6ujkEnIoh3zSyLrbNOAmBaMz3Oze3MRMALFELp+EEgPbjc1wVrBD0s9iBgw6JOmZaPv3aT5zwso79Z3Z/A3eR3lUEl8NYAanXh7xtz5+QiSPzpliquVd2wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760982746; c=relaxed/simple;
	bh=pdYHJcuACjLxyUbGtQJb6l+Qo8ulOoDOXrsmHol9Lt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSK6VxLivjgSBTczmQj+TnEP3+UDg5CUjb7WV+ozBl8etnImsIeHrQbxLwciC7+2vNfTuzfh/p0JDnES/L7QJj857vtG3rJzDmXcEim/q8MSV06D9YmBZasafrsvMnYKDebdjqETJ+E38UEQD4su2ky3TSE+an0HWBls95NvZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAbhQA9i; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAbhQA9i"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4712c6d9495so1760345e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760982743; x=1761587543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hPztYo4gHaE9LtG99gGwWjUyFltd44jOHvoR42cvBk=;
        b=LAbhQA9i9gfU78vrGPKfsvqOsxSclAwY3mx/A3z1xPVVzhHC7xwkEU+YIy2iAYLDvX
         gcxzydfpcQES7JAtt1nmnOUPzkBFjHE3dzVKDZ1V6yqO5OxBMko5NuCNGzfweC9L+o4s
         Y97oUnYXsfN6l7so4dwrptrev0bZc+SIcuNe5HPY8SMtTRIq6it5FFY+d3+bHvLnXfKA
         aIwMMYmOmKaOkDBgcVC4N4EnctwhR7tY/50jjTOTO/BF8KhqMvli/RsjHTMEcUd0ogA1
         8XOzHeys5slIcZ+PjNPn8VZLKGxvkI3926qsr7DL3T+0opohN9MMVQlAG/jRUv+5WeR8
         dCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982743; x=1761587543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hPztYo4gHaE9LtG99gGwWjUyFltd44jOHvoR42cvBk=;
        b=VDSXbVvRAdIBQkiMgZCb/cmPXXjGkwCApJrB1aIRoMsA7W2ks1LePx6kvOrrOqHRRh
         T8NWGDa/VcYQFoqafW70VVhBgZ1jA+MD26pykU/jkMT4wzILEMQPzq0lfpMOq57q/mOb
         48TIGiI5XJ4yWAF0vMh07R+UegYJHRhKfglI9xpJmMOmMLoezNJCCLQyHLlE/4JLQTuJ
         QBfyvrjJWSKkYfnrGF/D6Tkl3iNykbPE+f4R5cb7T0mi3IbqfNQFUjm1EvikTHPCK/aF
         019JMVKaRx8oUGBJZHucF2pcUYMtukQYc8CUM8gouB0SCcSquAC5RqIeIoza3mn7GZn6
         XUvA==
X-Gm-Message-State: AOJu0YygNN27gwt5f73Zh68FBbtLk96M1iJRihIBsAYhgLkoADke25w1
	sUHuiSg/5KDM07o6ELLrpOOfPI0wtDNb7wyZpZegGNHFsU8p3lxiHm0F
X-Gm-Gg: ASbGncuJEhJVWdHIFi3ucyAwXg6z/9MeG0N3Tptf/nqRcE4cXnZRetxCUUYcpjZ3QJt
	5Xtx7saM8KD8OxV8kXD+wjTkZuHO1r2QQUwcyhkGYmUI7G7x2SnhisGsY5aDAG7AY/AaSFgAHix
	ELYGl7gtMZebeZB19V4rRdqE6+e1Xvf14P9mk1Niq6+T/2hKTRV1+0+LYces1elHNwwyJuOpLAO
	q4+1K3TmRnNgOJ9il8G8telaIWSZmamW2zJgtHjBkzgz1mbDjRo1IJM3hsWsNInGVOaIe871WDI
	E2BSdFJr4upGJs0MRCuCtlAGbZJa6QMMBruOQ3zHLlzLgyRmqOck2Ysqj8icB1W1rt083V96ZRd
	3Dn3BzdWuSECZz6/bysXvoRvusesH3ibmlsVynfMXQqTQyOzKK4HZPmUcNqrIKWOIquyAlRMcAV
	rNpOpotqydFc3vwVPfby+uxxIuub5Kxn8qLa6j1YKWFt5s1dGmt64783DhiUd67c+hWGI1eJUAv
	/iRkg==
X-Google-Smtp-Source: AGHT+IGEpXcGziVc/IPeVNYdyzKmZC+YRn2Z3nf2tImqr8LtU1jXE0yH1+EHM8IBNjLdRoUankugUA==
X-Received: by 2002:a05:6000:26d2:b0:3e6:f91e:fa72 with SMTP id ffacd0b85a97d-42704d83dfdmr8290390f8f.7.1760982742464;
        Mon, 20 Oct 2025 10:52:22 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm16222568f8f.17.2025.10.20.10.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:52:22 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 06/11] clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum
 rate
Date: Mon, 20 Oct 2025 19:52:20 +0200
Message-ID: <8591609.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20251020171059.2786070-7-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-7-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:52 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> While the user manual states that the PLL's rate should be between 180
> MHz and 3 GHz in the register defninition section, it also says the
> actual operating frequency is 22.5792*4 MHz in the PLL features table.
>=20
> 22.5792*4 MHz is one of the actual clock rates that we want and is
> is available in the SDM table. Lower the minimum clock rate to 90 MHz
> so that both rates in the SDM table can be used.

So factor of 2 could be missed somewhere?

>=20
> Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CCU PL=
Ls")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index acb532f8361b..20dad06b37ca 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -300,7 +300,7 @@ static struct ccu_nm pll_audio0_4x_clk =3D {
>  	.m		=3D _SUNXI_CCU_DIV(16, 6),
>  	.sdm		=3D _SUNXI_CCU_SDM(pll_audio0_sdm_table, BIT(24),
>  					 0x178, BIT(31)),
> -	.min_rate	=3D 180000000U,
> +	.min_rate	=3D 90000000U,
>  	.max_rate	=3D 3000000000U,
>  	.common		=3D {
>  		.reg		=3D 0x078,
>=20




