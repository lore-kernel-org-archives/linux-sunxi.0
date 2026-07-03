Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107C040855
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jul 2026 00:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037542; cv=none; b=DA2fWEiHiJ0vujkkzLanWcm5V/D/qbYyiYRNBq5aafPd06gQjgJpAlbviWXonFY8xGRTyYNq+rMZRy8lXoABrZdi3Il90DH528Eb3+vTnAKT9iKulexyaga5T8hNTiGmrX8ij9E4ZvKwstsl8Nl0ZghRiCKYS4D0ZQI2s1ldS0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037542; c=relaxed/simple;
	bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyPy5822Zq5hJCcpH3VONtdcMSFHfYKnpK1OHft502dF309cBKv6YHwr+v2zwMy6MBCCURQTiJwT9axkyTkH9Ke5aB6OQa9tA1bEypQCpTYNLwqccuNuR8KnfqQdcEYY7Hgwx+rsJwD2a1tLxVTDf10LvtVgObbbROZzPoMHIoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZBytVRD; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZBytVRD"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-516d0db9372so87661cf.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 17:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783037540; x=1783642340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
        b=UZBytVRDC88SwaEp4F7Ug983JIbTJbO44EhZ3UCTnhh3VFFhbKtUeSGBtWeYW9Rj1z
         ps3s7qGviERp6HzOYG7b6wrMpTunyYqoTmCyH5bmnBt15am6ycSPjWXdTjdG4vccxm6I
         L5GFg+e8Pkvrdg2EphS1yf033qSJrUBomMqh1Md+H4QDa+BQuEIPqS7f/khU+p3tffgO
         btn8PU5GNpf2+Bi4RjU5cEqM4EuhVNQ3DFBj5BpaPK9usA6fFdA/pTCx0EdFkv1HE90w
         MhNUKb1/obQIzxVMlt0gwsf9TYZy2Ye4jwpW5ZktZ2v7b7MfKzgbv6RROQROcHpODGIz
         N/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783037540; x=1783642340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
        b=sp6G0Zgh1s/zld9R5RVpkrq8IObPnRuRJ58dXkSNNeSDZw54evSblSJDmkQ8fTA7cL
         P6tHTK9LgzTgYi/3ikbBRMN4+XDgn+YD20TASf1hHJau/8rI+h63+HMI4G4TTLTRzK3a
         zXPcoya6wkhlq84lzGecB6xupAQM9K3T9ZdcxCOgKg7M7Gb47QKGbku5eFMc1Z4VNOPf
         msBDpaTlsynpqjbHqdinSuhXslH5/MIO6zdex+xetEk130kX2uZTxH7XVt58KdXw2QF1
         fP4cKE8IIO1w0Y8xh9wXWdFkJOF6uS7z2IjSrkJjJ1ToNK/AT2CNC4hTn9DRYQExs2Rh
         fpxg==
X-Forwarded-Encrypted: i=1; AFNElJ9Xg1KQM9Az5SwT8++7oCDMubhlXC9wGQv/Xb2QoE+hmylxFMqRpD7dFWL1LxWDPU2whb2R/dzJmNc1aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YywnM5yrq+6W3jcvDApRscvhPmoKfRarsxHpMQmNW9Gjn7vsjx3
	3GUF9dZBXP6YdXUr0NRk28RHLkxF0NxWxL8rsdyA2bNo9yjFXdIEZm20
X-Gm-Gg: AfdE7ckP9o+qVBkD5SQ8PNP57IvIj22x86K55X9RXhZlO8u/pw6UU+zbCtr6s15uuoK
	zeeRI0wEvRxWGfwG3ok6hwxY2t5IdhUezbW6J8xm4mBM9oBbNuudHMEV9JOTLDPW4DDFsIGmwR+
	qSgX8k8ax043U3KoNRz1yiFt76rWFryD3USHT9dvdNkID60clhRqflrW4lT3qyUgzDU4Pk8OZsE
	8CFfv2H4w8NcbdShmr9eYEjJmqPlsPCezcRB3g8VZojiImeGuqECa7Rs+1nJfR0iLVMERJls9Ce
	OqDYRFrsFzAE4cvOjzk+oZDYZWUVD7Ad99eBDLwTkdTTJPFq8uH1mjiL7U6SDQ6eDlrc9EFmxlj
	PqVvb5A35K0uU0++kJnRHC5+lCJFENfRYkSG8NIsAXBBRnnrC2KI9RIfZi8LwSljpo6mlSXcfQ0
	+WJxCVoy4oxcozVKK7LJbC8CTjodYblmQUS8BQTNG4rYO845iqrakGJ7oEcrDIljvlvmpptuY=
X-Received: by 2002:ac8:7f43:0:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-51c2ad4803amr90244191cf.28.1783037540068;
        Thu, 02 Jul 2026 17:12:20 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471de87e3sm40289776d6.35.2026.07.02.17.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 17:12:19 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <frank.li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/5] dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller
Date: Thu,  2 Jul 2026 20:12:18 -0400
Message-ID: <20260703001218.1243244-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Yuanshen,

Following up on my earlier note on patch 1: I have Cubie A7S hardware
on hand and boot test kernels over serial routinely. If runtime
confirmation of the DMA controller would help the next revision, say
what you would like exercised and I will run it.

(AI-assisted, as before.)

Thanks,
Enzo
