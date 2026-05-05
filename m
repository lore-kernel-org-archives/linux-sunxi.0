Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC2B4418E2
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997917; cv=none; b=CSE1Cv7kU0xxotmG6dNWsrgSAYLHKmYyZ/QL5ALLaOSKES21cHqysO5HvwCV+HhFYC2RfK67UqCPBgy7MkPmGyXhWbM2i/N+WnBkx55OYoPsccUpzQnCrGj2/oGEKWn+mgZu+TsaWehEt7jA3fqPuZDIRvw5Qh13UD/CwJdD5XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997917; c=relaxed/simple;
	bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9dbhDEnwyuNcC/8DB9wAgtE8RHvoKeXoRYZu31XwozfF4dWcGaX/6nJ8tYzOx/2xStksxM0Skz8+mmACyV0KUEQpwHTtE01qcvr/RYCKfaZmbfxnwj4lpWThxy6sY//PTB8E2I1wn93Vb6LvKAZ6AlxyRZFYYP3OQn4v1D4xkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY3XYsrq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY3XYsrq"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44da2de25f3so1680428f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997914; x=1778602714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
        b=lY3XYsrq0mo0m2qztRySdF4IK+5VR1iMZTHMOjHk8RseBLdZI/6fj4oKzGsfbt1r9t
         awbWLYWw3zj4526s9RQGcDaPSm/Mbg8VD4mfMlfT+jOpyLGrWWB1K18//K4sUMY7/3M8
         6Wo3DLtVZBzHwQb6ozjoOfqNfcG7XQ1HFkJSpBkb7SW7x4DQkMv0EFc1QwX9bvTUnQE5
         1l5whyr+3kmMgRiS4VRm3xyJV3Y7662e4T/FNYjvgfL4ztL9RlI/fbsG6uZRH3PWFWuC
         FyCrQmMibbVj+wXeExnl4GXK5hWl88nNyQCWaOox3sMzJ5j7rrldLCmRGNcuhzJfoMt5
         zYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997914; x=1778602714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
        b=hS6wVwK7439RURHrR/an0WFLzqgOpymG4jBwEcVzsdB0Lci+epxYS9UnwRnOOcri2y
         iTTj1KJ6iqM/qILPR2qfgDWZps5J+hT9G52/zktSN0f//I/z8xicwOAG4JQnFdaoMWKX
         gNRS27TYcScu3FDqXNr/nwo4Hg047TD/6p5iggasSWNK7u/6BhPD2KkdSOss0Tw89Vvx
         t0e5019al5Hvi/Gt5jheb6r0zwX7+MkLxTp4GpovRtLIbfm4aItlsB0/8SBZ8dehcBEY
         4P/ySaBE2jjq0h8P7GzmLe5Hd7NuRVxAANxfp7mxZllBOm/T8GjP2YRtxtGFWtNfW9Lp
         GHRA==
X-Forwarded-Encrypted: i=1; AFNElJ8DGCn+KqQfRst9H0A2x34GraSuCiAicOGbsTa0O124Y9Fdnjsiou5SBMFIvXJja6aJUnl3/vc4uBetxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUbG7lmR1c0v90aDx24t9SpAVnuD3lREkHA2tLYs6DeCPYapbu
	WNbtwSOrejZ0zZCdXTVjA4+Iy/kp295/JvzGdtsiMK6APTMekvUwVhbG
X-Gm-Gg: AeBDievKkJbCy8B6i7+VsxffybCdi9ZKJl4y70dvRAhzwf8WWe99O70uwGDj0lKrdMc
	R/5EBeujYpBC4H3D0qYZI606vGF2TqcUBXMN9+X/t9kPq/CPUHhJauYmhv2bOvQeirERAraaS8b
	+iEThNB9eld+/9vD4Wt9cnDvNcTjg1LKOExOu3I8UOdsrp9KrW3JeREAmtl+vjRnwCSRPhWQ1gG
	o0mCJ9tZJLakcCG+yP3jnHg1DlMgJ8UGx702uCEIUtAq9ekJqxD+K/D5rSCDclhrEHcJQCZ8JZV
	ZLEixunGoFvTkFaEz4+XNHn4JX+0pukSfXKiWb67SklXpKXI9c15g6emrbAKsQPVgV9L0Umz6f1
	VLXbS8m8mtT3fA1Wiyf/fn2Ch/DQTA4EQ4Zi2eR4xGV7gmay8QdEKpaNiV3rKAR+5VC+4uT2q45
	I8kwsd7PavTuzbJKJqIBdBpiynI5mG+QCexbfd4mMVjU81LHSxo0zWolPhYlUs14GCXjYxnCzdC
	SdwgOk77UjTbaxJp/QsUFVf5XF7
X-Received: by 2002:a5d:50c8:0:b0:44b:cd2f:a3c8 with SMTP id ffacd0b85a97d-44bcd2fa400mr16334421f8f.4.1777997914315;
        Tue, 05 May 2026 09:18:34 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960aa2sm5411552f8f.29.2026.05.05.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:33 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for
 video engine
Date: Tue, 05 May 2026 18:18:31 +0200
Message-ID: <0QgbHBOXTsqa8Ms4s4GfYg@gmail.com>
In-Reply-To: <20260505134812.408316-6-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:09 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The SRAM C region contains a partial alias to the VE SRAM already
> referenced by the video engine. To avoid access through this alias
> window, the region should also be claimed by the video engine.
>=20
> Add a reference to the SRAM C region to the video engine node.
>=20
> Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


