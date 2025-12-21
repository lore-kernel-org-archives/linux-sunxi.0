Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735302417E0
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766332632; cv=none; b=fr4h+oZkne7fTYPnZrPKFmwfFhITZCPbvkZrBv1yVCNTUhJU1F0EtJJfIoi/PqqwKUaqa1QMwJtAhlj3sMTMmDSxluUiom69SmoQKC9pAPsBTE5y+sQC5HQeIOaXXF79yUL60gkHayPTOxtIXcz8Tytb4Lt1qyCuBhDDu1TPF5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766332632; c=relaxed/simple;
	bh=mrMOQdDsAyBJL5Fgn/G2OhbffuTYYry72mzdpWhvbCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vFqmTcR5mSgZN3IyxhdAl4fvOZl9rdoudb7lRgFnTFTFs4UfgIitaDmHnG2pcFtY88gr/OJzrz+4rrOgSJ1DYhJoJAtmjpoBesRHGTdMoUlo86dt0+f4g7kqoA3/O2yigdJTWuwwueeGy+ewxg+7QNXjY6XnXVh9pMXwoEGXjzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBovfpid; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBovfpid"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so23960335e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766332629; x=1766937429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrMOQdDsAyBJL5Fgn/G2OhbffuTYYry72mzdpWhvbCI=;
        b=RBovfpida9D+dM8I+Hh14DuKGNapHoCXM3K6C9lqR9KUlnisVR0L9rfMF40LZCqHFB
         NS4LmoT+UkCycD8D1T+Z5E594Nag9XgKUORnAXZFgS0AN01siVpGxAKBgEPPwfnSDol4
         cbQqaemIMikokhJLUmSLjOcu5OmnPRgWhdSD+YpR1HG7gc7LaoGJr6DXBPDEE25alwop
         YH57kQtntvcEX+SWld42JmJ/CZvVzdUtmF9fLcWNQxM+uYpQZQKQJX04h+YG/9Sy4xor
         75NTISuDf4ysgDtn7Q0/0S3JsDrqBkAvlmiP2ONrMNIB9T66vGkA6ltgM+RkM7Ye+0pw
         d3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766332629; x=1766937429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrMOQdDsAyBJL5Fgn/G2OhbffuTYYry72mzdpWhvbCI=;
        b=LVvA1tg3tiRxgcTjZc0qfrdqITvW8kNSMcwmx0ZVfumYm8c1vgbRNw9FnQVIanOrWK
         nNC0MjwbFHRfjbklXFBhEHRAagcK6bb3uyk/yuuec2Kih3qLCdXgA9ZxmLp+hgu9R7jK
         oO11VgsR3cxzbZJUmZOyT0PkZ1eRqSsy+LlCGk5BuJ2r9EIIGmFe2hwQoUsjatZlbF/4
         2VUVAZQBXI886fHQD+RhQzmr/L/9AGcrWyiJmnCu5qvJFl2Z2sQ+DDTWtr1xaB7laQNA
         oAVUTmwvl/hnVxF5ku2VfiGqcNuw48M+ls03Eo2eJR8TESFsnBdxC2y5VJhT/1QMc5wy
         a5TA==
X-Forwarded-Encrypted: i=1; AJvYcCXDTjcSgmZJIpddMYbsZXzDaWN1XTMosPmmkLnQoK0pQAgscJTFPje40L2Zq6elLLyvMqG/gPE99ePWPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCa79lvNBEerrQG2Tau/oc5OJR6B1xbj0VWlqrg2QAEXZ0syTC
	tPo1ZJN6sCwPj7APtQv4tEXjqzrU+nAn+Z4tI+wD5oxID0J5sfG3vQyR
X-Gm-Gg: AY/fxX6TQCV5+88uyrisGgJ9ZKDziRu/3maPev94lZ6wWSp0tg7ISHbtwIydzQHuVGr
	WgzWdys7QkyURxU9qSAPOW2D6LkgMAwCqACqhedNhy5tRmNzJmI2zADrOcJ4gjYVcoiDhYfp8iT
	30Xb+CLtRsauxPTTMo0uAVt48hfVmxEE45yu/mn6MZtHqlZOAx2DovOKhBWDHVW23TH91TfUCHB
	q2gDaCz/omCI4ie9VE/V6CcmkpYUxoydavjX9kUf4v/xAgtoAxIlWhq2sBog2J7KBXE8ZbwjEbU
	ut7SPljXyTaTruWaDec8J6CQJW91cfjux4iVzjtLjGKOPZJe7TsnbG2BmJqMbcjvdp1Puy0m/oT
	a2BQc/A8MPE99yCs/tLGd9ooHe/BLhMsep0Meuv50YneWnd2xEDMf822MrKxcD7nIW7VqVCvmrF
	hzJoZHCuaCtmg7YyRvFtHwuQPuWLveYsEbh37kLqIz6z7rkFLdOevFU4XU4oDSuzR8Sktj
X-Google-Smtp-Source: AGHT+IExEA0mdDUqUtqXOeUL++O53ldVOc/C42cZHo7ZCg0+/iRgPqjs3JCL6tqxJgQuhZDXsn6nRw==
X-Received: by 2002:a05:600c:6388:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-47d19557cd2mr82943635e9.16.1766332628749;
        Sun, 21 Dec 2025 07:57:08 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm75866275e9.15.2025.12.21.07.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:57:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, dmaengine@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] dmaengine: sun6i: Choose appropriate burst length under maxburst
Date: Sun, 21 Dec 2025 16:57:07 +0100
Message-ID: <3385264.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20251221080450.1813479-1-wens@kernel.org>
References: <20251221080450.1813479-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 21. december 2025 ob 09:04:48 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> maxburst, as provided by the client, specifies the largest amount of
> data that is allowed to be transferred in one burst. This limit is
> normally provided to avoid a data burst overflowing the target FIFO.
> It does not mean that the DMA engine can only do bursts in that size.
>=20
> Let the driver pick the largest supported burst length within the
> given limit. This lets the driver work correctly with some clients that
> give a large maxburst value. In particular, the 8250_dw driver will give
> a quarter of the UART's FIFO size as maxburst. On some systems the FIFO
> size is 256 bytes, giving a maxburst of 64 bytes, while the hardware
> only supports bursts of up to 16 bytes.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


