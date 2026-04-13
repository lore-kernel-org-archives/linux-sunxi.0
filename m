Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DAA3C3BE3
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Apr 2026 12:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776083966; cv=none; b=SdIYcH5GlXvglIB0pwbKU0DaUsBs7J9cC2OqQoMvyCBWTPIZbVmGGvJL/JtDUesLmaB26StBglIis+HkP/aXEdxT7kdr3xQoClYpwfmEJ1EGRuXIKgDje+xSLLgHdWOKXxH9EYWNQ2jnmE3aSwt30WXw3fFbmxraqi+IJGwKQLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776083966; c=relaxed/simple;
	bh=Eltpam/vgsJqWDDmBNuLJKAQCg+4CI1hVv/dIvLONqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYvlUf5myuCb7hl6NSFUpwGGKEip+MnPoJOuhZIxNMmUEBPR/KjH6jfrXYUiDNmzsjqtjCrp7HxG4KsST42rKOFteoSf00YJEQUhUk1C69aRNW8K46H4xWdXgdwolEBo+JXqKDYndeSd8MSHCxFPMVwCwCvOlePso63fatKmJeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvehMKmg; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvehMKmg"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso7699151fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Apr 2026 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776083963; x=1776688763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqFxz1QFpJJAZz46pmSBmZ9ZWT6FZnXdjLeoytZTkRQ=;
        b=CvehMKmg7A6Eq69qAgvSQrzB08laFW9rKEsFqQLm9XnIJ5rax+qgdYI25+pzPlmpY5
         UwCOXZchTNALLInYrS0a+ZQsdseLWZUbbQJX1izxYZbr3hmNIfRllqiXCbMPLz7p1U5O
         8OyxfpfWRmWl5UwC7LUQZtvTa8y9PLdca+g016g/KIyXxOiegNfu4/01ZFYM9hJ3NAEN
         8+DMbiEaap6h3x24GrJjYklH3PslasuR4EwAEXH7RaB7dQlefFPqLLPIg58ENx6BrO5h
         SYOuY38TqrpJISPWHkGY7PpraLFRSWz4OuyBTbGYI40SmmKv+lT0Rj43KW9TdrwHPhl8
         ac+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776083963; x=1776688763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqFxz1QFpJJAZz46pmSBmZ9ZWT6FZnXdjLeoytZTkRQ=;
        b=HYrQtG2jL/rcvYq7+nKbJaXbiNHqVYuAq7sABkML1ZM7v7Cz3HcuPyMiV1RNCwdvFQ
         1IVdZLbwg+QSUCPQTBNwCcQqqbnG5JlqUhuOm4MRJx5qC55QtccnaW8ChWi8F2cX+6bi
         XJQN1kVJ6J9B5aKy7XX0C30mT+cY8+sdbozc0N4ydom67seXmnm++Y+rCrqhH9h5eD/V
         e9igNGURaeDF2g0uTAw6Tgvg/XuEoMxM+Kh+wgpiEYkVQMwyjSOLpB8UwTGk/ete0ud7
         7xQ17dU8+zu+YqLFGownZp7rWGteRik5QdK/g9QVuyMlfwyUkZ7mA69ChWHkOjkWT1sK
         BOCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eWpJ03ZFgWCiHzPVrmmXpcuL4/dtHEEpvu1HIzGw+XLJnoFztsFx6Q1m6N1lIrZCCnEbZx6SxOcMxLA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6+yidiUpgzlw3aQCCWelCtr5cOP9s9q6uB8z+evRGc2JrhjIS
	lMkPpK8PMhXDYVIqEFgtLHRXCHcFf6q5RTB4MZjsN16dVCvQHTFFZddu
X-Gm-Gg: AeBDietMnSIxqqIzbMf16zZO0eDKSn07wlOkl+BiyVyPfP2WXiIrYFr68q5MIIZTVuY
	HAYC1//h8hu4rsYFUkhP3FDGHp4CV7t9y7qz7Mc1jzewSGZ+mYnkAfBrj2KfddUu+37IMPWgBDI
	t0jbcyFYcumHlhO3ZgRIHYp1b1BjQ2QgDi/dQy+/nm6idDvNUwzu/JVlU46IqD7hwVMAfjqgaYC
	FGLSQLDaP3g+TP+OR7nFeJf88DXrv8EUGz+/T3RRuLxMtA2Xe2jL2ZV7moZDeGBzm0IdiaVLfKS
	WBIK6e6tWAQQrcS/AafswGDtWpdK4Yyl1zpdbwSP+8KAwiv7yR7Nw/BzLoXi973KtiDPh6Zkggs
	+bUEsvjFEFPbZPoGIVqordbDMiPSUVcsUVrJY7PJwOoj60YJH1U6T4+5Co2RTP1YJ3j7GH7mIGo
	d+5nwIUYmbfC6U5lFIBO8pIWcG+okr7mSzC5BxyNNmSwDhJA==
X-Received: by 2002:a05:6512:3503:b0:5a1:1496:922 with SMTP id 2adb3069b0e04-5a3efd8b5c4mr4514818e87.33.1776083962516;
        Mon, 13 Apr 2026 05:39:22 -0700 (PDT)
Received: from wpc (host-95-152-45-178.dsl.sura.ru. [95.152.45.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef00327sm2532549e87.73.2026.04.13.05.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:39:22 -0700 (PDT)
From: bigunclemax@gmail.com
To: richard.genoud@bootlin.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	joao@schimsalabim.eu,
	jstultz@google.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	p.zabel@pengutronix.de,
	paulk@sys-base.io,
	robh@kernel.org,
	samuel@sholland.org,
	thomas.petazzoni@bootlin.com,
	u.kleine-koenig@baylibre.com,
	wens@csie.org
Subject: [PATCH v4 2/4] pwm: sun50i: Add H616 PWM support
Date: Mon, 13 Apr 2026 15:39:20 +0300
Message-ID: <20260413123920.2459916-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305091959.2530374-3-richard.genoud@bootlin.com>
References: <20260305091959.2530374-3-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Richard,

> +
> +/* PWM Capture Fall Lock Register */
> +#define H616_PWM_CFLR(x)		(0x74 + (x) * 0x20)
> +
> +#define H616_PWM_PAIR_IDX(chan)		((chan) >> 2)
> +

It looks like there's a typo or a mistake in the PAIR_IDX calculation.
It should be like ((chan) >> 1).
For example, for the 5th channel the result will be 1, but it should be 2.

Best regards
Maksim
