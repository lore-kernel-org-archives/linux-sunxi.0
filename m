Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22633370AE5
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Jul 2026 05:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884866; cv=none; b=jp+uFE+SW/qM7ZQWvrzZyX9eEABWT/pIZfWnezo6lqgweH+jSXczPY7rQh4xUA2D78IF3WOILk17NL7Mzh1Uu1efqj3jnDKZ1/OzoJqV9lbXxcQDpGEDsxh8ruR7M6QPe37SF9XQs68ZG3M2aw/B8hJNhUIb9EEHCCg/ZDkGuqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884866; c=relaxed/simple;
	bh=7C10BvrXP330gVepTXYy6sfoFfKbPAmHgg+xOWMPMtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AN5/w5ZQF2p/V2vQW0yq2Ru2C7DpV7tXA+oQrZCxS2EuBDrYEWg+D+RTn7e+98E/7Ij+k21Rx43jF3WjcpOfGwXhEV+ctSI53LuN6ebocfG624iQp3a7yaNcsdKeBmeruGYbyol4vsn8Vqo4JnrI0CEFEMQ8NtO3GVTi8rq4afI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeJ0uC2a; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeJ0uC2a"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664eb8cb631so188994d50.3
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782884864; x=1783489664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2dYl0OUyzZ06MfTi9YwzB+RT+fpto3AMtLt5rd0qn0=;
        b=VeJ0uC2ahxXR+d0Zbkd7AAk2DgQLRujGGDHsjGvGh7SyI+Vyy1+yMtp4STCedI/Xfw
         vCf8aabrBy7dDJpglOaN9Q8tV7ePdY/i2z+j0QIcrw2bcgrwH497Qb29NKASPN5UMyJ6
         fL3H/PmSILT0b1ptKIYsRNoPEmIlNoHGp57XUzVdH8iEwtQtSeL7AvZtx3d1A5c7XHpe
         urvEBHhHevSQhFB/q4J62D03H9negWM8x5JeGQYkE1ZDlkq1SQXth0+Y3HxwljRZNteZ
         IATaTWi1WfCfr2L6sziWb5rh9JJnqlTeSa5SdbQsWqclqB0zDC0sy8Wvom4RClU+Q2uv
         IeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782884864; x=1783489664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A2dYl0OUyzZ06MfTi9YwzB+RT+fpto3AMtLt5rd0qn0=;
        b=JZpeYtMiyjSsZ59Lp6FqFeefpC6zHwtLDosqZwGvC1Th5zTeB0LoNqlTflmopqUlEv
         VVNOEeCwPd+hzlXHVCsHikBXN4Y0aUAGbyFxH2eokNNTGiVR2g7ihdGs8udIZmaUbfjC
         ghhRgloKfrD3hif0EKL4Dw2NJAabLkuyOmTNeRiKcwZ/OICKsJpDLInI6yuMQyt8Uckv
         SUsLxw7kYs/CF4R6sNOPvQsGlju8NkR0i+MMsExI9Kf7GJaJ+4PhCQoqrl44odrJpLXf
         KBfiu0dxes/1xEzUkwqsbsAvyHN22ftU+750jzf1jmNOJKPstSn+dIi4iF6N1wy6B5rq
         RIQA==
X-Forwarded-Encrypted: i=1; AHgh+RoasYM2xCTWdPW78utCefjFEtutJCkM8DTSgftxGZ+tI93MlO8rFSGmrd1r49TYDNQLgUaT2R2dw7PZxA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm9rkeTuA4VXtctPWFvG9yo/gvowT3tg6U6lPm0dxLnXiWaV0q
	9hkhO92s1R+2DI1+Ibuw9I3q5JRzLvC8P0ZgrRGM5sUSvQTrlcDlZt5o
X-Gm-Gg: AfdE7ckIH3C4YhO6CSLFKzwiss9rJIaYfDha2Xz/OpXQh6+3UZGZIil8PFwiLfHB+OB
	yiTPzuHiXuoYbyMHeYQqSHFwuuq7T+pFNt2j13094+hbtfZdPqH+pHf4Pn//QmZyYnPKJgHfK8L
	3t70aP8TFf41dKfP0uolt4dQQjEFk20Gc1zGFe3zTTdOql+dK1EYv0b+FhLwkGTW2njrmbAy7FP
	V1kDGyA3TdlsIzfruBTgC3hhTTu+yoYy5VsqnqPQfb9oDEZCQaflOOhW45dzVPNYnX/v1laUMlq
	3lduwuS5RMwZB2o1B9jilrhjIRKRT+YFOc5aJD5rsm6JqNnDKPJUjExKbut/pdLgEK5eqb5N7kF
	0EVyWWmxDO1iyACANITwsJ0HH2Zejc4pieuIpzah4YLIie1Q/05x5GMADt30GHS35boAMKZG9uT
	ilDKT5rFISVem+ouWKJOP+9ETlOu+jXusZbcG+HRAcsSCSTxveYASy4TwoIrXa
X-Received: by 2002:a05:690e:bcd:b0:664:d899:e3a9 with SMTP id 956f58d0204a3-665219a787dmr223821d50.20.1782884864130;
        Tue, 30 Jun 2026 22:47:44 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6650163752bsm1836441d50.16.2026.06.30.22.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:47:43 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Yuanshen Cao <alex.caoys@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: conor+dt@kernel.org,
	mripard@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	Frank.Li@kernel.org,
	vkoul@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/5] dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
Date: Wed,  1 Jul 2026 01:47:01 -0400
Message-ID: <20260701054701.3961908-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akQuefaUpt6OPNSo@b82beb281c41>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com> <20260622-sun60i-a733-dma-v3-1-f697ef296cbc@gmail.com> <20260629003505.18f0053d@ryzen.lan> <akQuefaUpt6OPNSo@b82beb281c41>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Yuanshen, Andre,

I applied the v3 series locally on top of dc59e4fea9d8. The
series applied cleanly, the focused DMA binding check passed, and
a focused drivers/dma/sun6i-dma.o build passed. I have not done a
hardware DMA runtime test, so this is only static review plus
build/schema validation.

On the IRQ accessor shape, I think Andre's data-driven direction is
a good fit for the enable/status register differences. The
A733-specific values look like data: enable offset 0x134, status
offset 0x138, stride 0x40. A small helper using cfg offsets/stride
would keep the call sites readable without needing per-compatible
read/write accessors. I would keep dump_com_regs separate unless
there is a clean table-driven way to express the genuinely different
dump layout.

While comparing this with the public Sun60iw2 BSP, I think the same
respin should also fix the interrupt channel decode path that Sashiko
pointed out. The series encodes the interrupt register as:

  irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
  irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;

but the interrupt handler still decodes with:

  pchan = sdev->pchans + j;

For A733, num_channels_per_reg is 1, so j is always 0 and each IRQ
status register would map back to pchans[0]. The public Sun60iw2 BSP
uses the inverse mapping:

  pchan = sdev->pchans + (i * sdev->cfg->channum_per_reg + j);

That matches the encode path and looks like the shape needed here as
well. The register-loop bounds probably want the same treatment:
derive the number of IRQ status registers from the real channel count,
not from an implicitly exact division.
