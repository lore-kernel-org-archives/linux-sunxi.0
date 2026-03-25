Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E98519DFAB
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 00:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398681; cv=none; b=jywRI3oEGiB2dfwAUfbtUwxh8gjOYfHNl9rF2xspvKBjMNYE9oXKfbvLDko96CEw2XguXqxakb2M/5x0D2KUBDROuZvrzhDuuazXF/AfYQ+FA+/uh6ZxtT0BAqfZn+MWmJUKmkzl7KCY3t4ptmPRNAUn4LJoDFBQL441+vkF8nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398681; c=relaxed/simple;
	bh=NwzPpDmwj9hCttbRfYAfKIIUGe5wCoRiVoOHsvFK2y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1CgkSwoDnzJF/LnbK8e99o4J1wBcRFuMu5eNlAbjKg187AEykcOgYDAXMkqdvKJkGvhfWpPW+xXsZnZST/U8S38bsKLHDgII9mYQL8zD7yQmGfOawufvyD4LKI4sCJALzUw3QB1kd/OFreBOSsh9/DjBETRbktRT/Ggi3WbyQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dzux1bgR; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dzux1bgR"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5094ba0af1aso49475361cf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 17:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398679; x=1775003479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwzPpDmwj9hCttbRfYAfKIIUGe5wCoRiVoOHsvFK2y0=;
        b=Dzux1bgRjfhvDH2mLouNgwCUbnL5zgpTn6NBErxnc4tc3MegfvQRTBOYpNgb37xjgZ
         2i43Z7uCytqiZRGDKppL2U0dThzreo/Hg19xH0nOVxIPbC9CuYZSSWOfG6xIgCnf4KK0
         qxxjm3n6ief2nj991Smwu8EwcQkizNpinbmGE511bV5LQ2q9pzVNLpOw3TXJ1lB96rk6
         GsLCQRA+njnAIWV6MyJD48OOh4cyD34zoseNbFXrBOC1kpkmCm38cIWdJj7Eek/wVvM+
         FPfRra6NrFQ0XwNoH0xEsDeQ4FKDpS8hhrQ1cNj9NtV/1iJ4cfEfc7f0TxOu2YZD7J1K
         Hsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398679; x=1775003479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwzPpDmwj9hCttbRfYAfKIIUGe5wCoRiVoOHsvFK2y0=;
        b=hPRbyUOmSkT2FhrYMV1UDoOXMX+xDka2sdRauySOzquMAVQ8d3tkv/XD+M/fTOJ1AZ
         GFmudWRHUu9Hk6X+eY8zD9FUlyAvFN1PeotZcJoPz1Vq53e0kh2cTgOftisCpejmjwNf
         KS72yJiKYvNTZaAISoBiau127YJ7JKjgcr31UZn7PA42HPjCja7ImW0UOuo3hyKTxooc
         3tyUY0+NX07HZr68VguD6NkrIc9RHrE1vjV+QvAL1Do1S2x+CiGw1GsaSiQuE7k1vxPt
         qXRJBvQ5qimiV/Jw3duy8X8GpSjALTSN8POoGAReApa5coRyuad8mVnqty9n2en7hbHB
         TEIA==
X-Gm-Message-State: AOJu0Yw12w24pGmtHqcud1UZxnPzKUFedshB8FrHhN2Qi76gpuy+6Veg
	v4tq13REkm2EEZ5nDmJwEz2B7yVdk9Ol/a3lIVGHN4iEvc0REnOssqJa
X-Gm-Gg: ATEYQzw/PzyNbEHL2Uv/a92bGrf8vcOA4JROxKoFaBkMW/rHEe5Q7Mf3l1Jnqiwhi/i
	4+CRLj/nqvBtNPX5SrZNSNe+D8u9/1Ibm21VAHTXK/uzd1SXTQAn4J4AlxUpga1eSb3mmZH2PgN
	9BAnwAUMolOjjctrsJFnXuCF3wQlpH4B1kDyBazn/DBSspkJIj0dPD3oyIUlfTuxbFGHb8oivy5
	cY3qqpVscs14LAr2n7nZ1oBfB0r58fFoiYJLuQFVVUXl6rHwixgVo6S5tPOu/5hmfDspB6cJ9aj
	q5rc77AqolkVIf7SRsHRthvEdfK4LYIQAV2VjrJAvYIr27lS9qaE9JRIl79QIgxpa7tG8p/t7Oj
	iEgyfvANGxYJMn1n6YqKL37xrPYcVaXWTReg5PVjXFB2xH5GzZ9P0mYYmlWlFzjA08NS3yBYoRo
	T3mI/SA+byy8xtbJHGGcXsRGjkJBSYFLwVf6dTDqNwj98j089H1Hhp5pkZtronTIfGovH+l3edU
	gXITgU5on3ZcNOsyE2ShV73
X-Received: by 2002:ac8:4a0d:0:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50b80de1f5emr18883851cf.40.1774398678791;
        Tue, 24 Mar 2026 17:31:18 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cbda0f584sm20056816d6.14.2026.03.24.17.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:31:18 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/2] arm64: dts: allwinner: sun50i-a64: add UART DMA channels
Date: Wed, 25 Mar 2026 01:31:16 +0100
Message-ID: <1851851.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20260324161930.1602083-1-wens@kernel.org>
References: <20260324161930.1602083-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:19:28 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> All the UARTs support DMA and are hooked up to the DMA controller.
>=20
> Add the DMA channels for the UARTs
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


