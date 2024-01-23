Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D812C81214
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032368; cv=none; b=sETysWTo+69EHlqQmq2zqzasfTaX9DzxVZg22+grooEHKPKXgye7ZIvdDcYBazHhKf3xPc53c8K5+ezaPYWFjXJpaLZgsW1sNNht5U33F3ebCiHMX3jV8FUjhzjyMJ3TZ90XA5aj7IZ+8OfJMC9eAO1z9C/HcuLgPrUR/eOvMho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032368; c=relaxed/simple;
	bh=ODSh1qtbG1bbM6CR7/IPiC9+vleF+a/NSYhW27DI1Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PkPaEyv4UlxQxy/iGlIwGhNmTuXSz2yYjG/pwjLChEmrfMd0wjbfNO67iHYP0g1s8CZkPCsxsmYIKgM8x5wgOf0fzIRvEiLJ3se10RyCR3OGHBAMDBP70m1V1HRYCoSQWgoBtoi+bB6hAM7aAmWKQRmka2DpaIuTTjLF7+5VEG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZG7d31o; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZG7d31o"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40ec048e0c1so6129175e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 09:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706032364; x=1706637164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCFDtyr7qd7xHPm6qu+8wvTk3uDcROtuqsSzfcIUekg=;
        b=ZZG7d31oMi2xKt0YXA1Znr+HWP08h4jQWPyzqoBduh/vGzb5gjsMBu1LpOpuTr/Ia7
         fY/baOfBmxjBTnf/TgjLafY353iCg8b+8q95u6+nfNi11/2d04J+dXGLbhD+42XJet/f
         8MeyMscaAkUTqLyC9bU9tu87PI85g2H12eCT/IqPEBQ1o5aeDpcHuzIGeAX0Cqi9ej2p
         vcQWpXdmv6bSeyi/IEAiXJ7RqR5XqB4ozwD5rT7EKFoVLNtg+vhjSDZWXcwMBKlQo+b6
         7k7uf256s0NYXm3C46FZa1cTn2y0fSWHhpqfQxQ9ZXM9K5Lkh3UNlMZtv4JTB2MT/Q+b
         I4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032364; x=1706637164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCFDtyr7qd7xHPm6qu+8wvTk3uDcROtuqsSzfcIUekg=;
        b=b8nYaCdaozUc0j8C32yWzdNcBbE+e0RCYYtXCuItx7DCkZ+HgDpmkF2vBg7xat8HID
         zJqLjfxee5hKA+hTFvawTIB1k0nvWBraCPNiqsNyCzjsne19glN2sPnPe2n/Z/CZhArR
         tQyjYN+UzOu/AmM8mLYYDW1HI77YzkNOopii2EWeYazmFrWUhebplqrnqIRwD/5PQtR3
         ByiMVVIHH9p/PfqQv9o2D+5HukFW6tqHd3eb1RVGY/k052An83+0qU02EKQuYyLqnBha
         7+JKm2yPuVWLM7cZiBjJ2xMNK65T0KzEiJW2RGg4Wt2aPUEkghya7My+RaYQ/eN5+IL/
         Q4/Q==
X-Gm-Message-State: AOJu0Yyj8NQro7+fFeQziyoyXkuTnZRCLkZXZNH+RpiTno2gLoaJmsmo
	UQug2OJ/B4rnyPEBhEMxZ8Eb2XWlM4dpy/q0+pso9UCjWrsNX57f
X-Google-Smtp-Source: AGHT+IFLLxpjWeVimFPeA0MfQxF3KfPqSXqkgvuKucKNZCdN75cq8KsxjdqW/L6iAutpuqHKjQj9nA==
X-Received: by 2002:a05:600c:a003:b0:40e:6227:175e with SMTP id jg3-20020a05600ca00300b0040e6227175emr856538wmb.61.1706032363904;
        Tue, 23 Jan 2024 09:52:43 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id i19-20020a05600c355300b0040e76b60235sm32151725wmq.8.2024.01.23.09.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:52:43 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 5/7] arm64: dts: allwinner: h6: Add RX DMA channel for SPDIF
Date: Tue, 23 Jan 2024 18:52:42 +0100
Message-ID: <22159747.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20240122170518.3090814-6-wens@kernel.org>
References:
 <20240122170518.3090814-1-wens@kernel.org>
 <20240122170518.3090814-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 22. januar 2024 ob 18:05:16 CET je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The SPDIF hardware found on the H6 supports both transmit and receive
> functions. However it is missing the RX DMA channel.
> 
> Add the SPDIF hardware block's RX DMA channel. Also remove the
> by-default pinmux, since the end device can choose to implement
> either or both functionalities.
> 
> Fixes: f95b598df419 ("arm64: dts: allwinner: Add SPDIF node for Allwinner H6")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


