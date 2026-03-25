Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125B189B84
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 00:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398724; cv=none; b=t2vHvK79znbzosLvxjgzEnfkGRSP6IV2cM/5zPqbUNNu6DfdDk20FrUcxrEjb0SG6yVhWow3l5MUv3NBqEGmIHaAFSyJDzMC2EO3hv+s3qgVNeO+SUoBVmr7PGOUJTibkPmbteYE7Ld2kCfwfYPIKuWg3e4r07T5pGv9pkzHz0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398724; c=relaxed/simple;
	bh=gCLRk+NAkU6fy7pdsIcUwbode2bX+R63hoRqk/fGQl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hAGXXSolUtNf+tnC9UvVsDIWOFEHFQqKtEUfO88X+DiQ4z6NFmwoS11ae6UgauDHe6mDICsounlK2g/5iq9V0PWrxcCkHUTdKKDzRsnaQw9lHbKdcfg3V12QrBOiVk8KbXdC3AxKiQI4tccD2BYs/7sPd84Isgr+6MOv9o2KVlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDe09Kc3; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDe09Kc3"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50b2b289925so49654871cf.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 17:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398722; x=1775003522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCLRk+NAkU6fy7pdsIcUwbode2bX+R63hoRqk/fGQl4=;
        b=qDe09Kc3DSQQOmQD/V3D67UCx6WQIkU75vOsjt/qCJVGZNdNZ8prItoKCYd+C07BPL
         K1kCoNq2upqZEEBNyKSFT2mjh3Ew+zKU2KMeFcHEcv6ENyCBFMAmG1+fbk1fC23cbuDn
         QFBw6XtwgBakYieJqybzyLbrN9ZZ9Jyqp//A7I1VD9DLHOUmgSmMmxoYeBGRMwQAA7GA
         oehelgmwNIRE1Uf4VVC8xalLUDa/0vcAQR6cwB7/B4FwfRGIUyrepD/MTLy1MwVwoVAB
         +nfJOntjm/fRJkGR6ba8MFzrRrzGSgtYR019lelpls0judNRkOByNoDb88dwFtLBBLq3
         HxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398722; x=1775003522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gCLRk+NAkU6fy7pdsIcUwbode2bX+R63hoRqk/fGQl4=;
        b=kdcsQLmqTCswPpycRsw8StYXO2TWDZqB25QXyc9Q86E2CeBqWMlE+ywGt1BiCFBqsk
         7/Y1Jsx5G/7zQ/vgUFDDYhAjotkoowg00wWZ5nf3yXGxBaFqYAwPCNlVyEeQq0VFH1v7
         brKfRTjCXTOYdAAyR3pvGU6flKWUFKxE14TPPfrcTxiYsbfYaPwKj3dABvloRgQVW42v
         Ul3B1eNUV7ynxSjFsPRXch6SWR/GnH7AfQRvBgYsH3ShKPsDehY/x4yy/M91Slc/efP4
         tlSTSwLVyrXantF2VBQSnvu4ehZMcFXcsFvWOACqVmBZgkyGJ41/qCPd7P8q05s7qnZf
         dGBA==
X-Gm-Message-State: AOJu0Yxb8FVRQoRzaqACcXALh7+WnEhtjTBc28GE1dFtckF5oRBIiP2G
	mEEvYlHWkqvt+f/BXh9O4HHnUEhF5+h6aSjcGeVLgUITtWuuCT4ySscO
X-Gm-Gg: ATEYQzybyHriJfBSGJ/LRttvuEGmEToK6kxT0cr4BZHKkfyVEDd1xgl77FpbQkc9l90
	/lYXlif/SPDnrms6KzMdnkP2OuM8IpD1IS83uRGAQ8/zVgqXBVU79q5ny4KAa1Uc0TsvrtSK3TW
	f6OdWPLq0I1ilgXaiPrmN/y9FPsJDCA4066FY7fU8rMJRvYejM2NuAHItluhnaMDV6JYcfJbCky
	1lR0h7w4hvc3qUgjygukE0GGuCMx2D0kSWBGG4Z6OxFxegvCBq20haqcGsfmFigsAmA7kq5lkbg
	2v/YStPuL5BdClZhIYCkwybcNbVOnLgcyHsm6p+dk/Gt8QPuZrImcabcS193p8lfGBHNrXZ1SKF
	nqQepjI8wQbQ6qw0loiYUcBUl7eSnbjHxCqYNbLmh3PcoNnLMIfWakh/VJ4q8ehPDEtLogdQycK
	Z28x//u5ezlzgCP0/tq8SgnsNbJCcdbO9hfGEz5tB0HiqZ7kumbiWYCdo3pMiQDLJgeQvefanX3
	PsMI/ts14enfY0qn2TV+a41
X-Received: by 2002:a05:622a:a291:b0:50b:4116:78dd with SMTP id d75a77b69052e-50b80ec12camr21220341cf.66.1774398721780;
        Tue, 24 Mar 2026 17:32:01 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm146375291cf.15.2026.03.24.17.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:32:01 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/2] arm64: dts: allwinner: sun50i-h6: add UART DMA channels
Date: Wed, 25 Mar 2026 01:31:57 +0100
Message-ID: <2052919.usQuhbGJ8B@jernej-laptop>
In-Reply-To: <20260324161930.1602083-2-wens@kernel.org>
References:
 <20260324161930.1602083-1-wens@kernel.org>
 <20260324161930.1602083-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:19:29 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> All the UARTs support DMA and are hooked up to the DMA controller.
>=20
> Add the DMA channels for the UARTs
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


