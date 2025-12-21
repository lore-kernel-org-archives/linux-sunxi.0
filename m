Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC50E24677A
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766332315; cv=none; b=u/UX56Taju/SfP8welO2ZsYJA1ugInCSOeYaam2vU5kcZ/Br3V784MqYt/SroQWQFdV/3ymoIs84aWSySV2UtZqwOcpRmQV80DIH6E5mm3pUJsLeIfqbsT9zLx35MkPm+qcWgANwvM1zATQCPcpA3oYiv9RNQRmCl26etUwZ/f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766332315; c=relaxed/simple;
	bh=+wGpSjoV+I/C1HHA1GCDrk5eEUiIYLCQUe47VJqqo2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GqGsk8NGZe4L/38hTmXnCU2tX7g5+RKU5EhglaZRy3jayFnUIEvpOmAZ+J5LwCkWp912jZPPeJ8xv0IBmBKk4eRBKAtGg513lQA5sAYVrVvHU2CBZ/kRACR3WZ73nlK8UzGNGPbA0aJ0oT7y4xG9D0BbBP34/F1vct8HFiIeEhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSsR6TtJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSsR6TtJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso21361475e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766332312; x=1766937112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wGpSjoV+I/C1HHA1GCDrk5eEUiIYLCQUe47VJqqo2Y=;
        b=hSsR6TtJaY9uAP4DWcQt+D6IfHZZWvKNYCLgPJh5z4vyiY452K9S3ehwdpnfDzAfsa
         BqFgnH7F8xf7oPUXKhq0VFdinwR3WBcYn9XJYTq8qs9oCcbhBAg/Nv8HNlXEmBD8wQPW
         +q7wJR/dxXdVHtPudJP9HtOXzIiM8G+ZDjid0mEcP8Q8cB4QtbwKzRFs4Omvd5FDpxzr
         d0WpIqN+GuFbBMJ63PGogEnYCkSqEyRBgXKESWCXMJnrHZhsKHz8IMy1W58juyIhvHEH
         B2n8mwPDtaz/S51ZL2ylsJGcfylTLi5T1nzPR/mCTJ/5xvkY9l/ama9cCmoK4M100cJ+
         VhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766332312; x=1766937112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wGpSjoV+I/C1HHA1GCDrk5eEUiIYLCQUe47VJqqo2Y=;
        b=mlOCAo5u2qJS872Z8DlaFjw9HylWvz0aJd6L0TbrOBdhIdfzSWn0w3ggc2g4VsH+UK
         vVvCaRfkif9YReRHwDUCMdcGwwgxVi36xOyz8eV5+eZnzUohWGp3/9VyMZTQQOoyRZ/P
         fKnSZE6vS4CxgqAFuqavhBPjj4GfeP7U1Xtp9np7Ug2qevK4yDM+S0bVkRWfmp7dZPjF
         9ts1+NrKT1eciZYSAv6bNGsNqAaks6udKLO0Xh+8yXIuhr3Kk0mgCZ5oMxnK9z1uWQq9
         bmvi3FWES+5ZkHJbRRD69zczV9vM/lALSm7cGCc+vbEaG9JAaMG+KtBcO7hF/6bqzYnx
         bt9A==
X-Forwarded-Encrypted: i=1; AJvYcCV2Rm1/sXu1qVnQdqogkGXMvbpVFhEVWQ4DqGByBVeddu4qeLgv/X1nNI9lNFYQ3IHCB3CaP39C8sfvrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7Gj1DSRWJCFuqIs0H9nbhI6C1ntDdQENykz9F0N0ZJ7BbLZM8
	iK8NdL7XH4Okb2POLbtrIUOVGfD3selLtSnc9nigq+99TJPAd0isc10Z
X-Gm-Gg: AY/fxX6xip0hD2Kwx3dqVZWhu4DcVAAYu2wO2D3qZU6M1fiS7iXGRbGFzmpjAA6QCvq
	PzuMMCFVuyyKEhaQIneSwMbweNCSkJ7O/uoOaAETYTu6tFmyHDsss2nR+zJr0xpnZ0X4QYcVmig
	ocWS9JYWyqMuKjWBZJFgFD+xGu7JruT0dUhO/U2ylGQiiO2nij0GteVsTcBS4xY/iQ/5g6l9xxf
	f8iBUFw34E45VZIbrGaOZKmARQKx+fy9Eh+N514TIJllcd2UxdAp3r9c9nfgBaQl2ZcPk/OHelQ
	3ST1JslM0M0BY5Mt6CQD7AHW7yeUW2W6N3tfTSJFeyyQB9cfDgDw+lvsPnQb6VwmoquEGoxM7CL
	ig8/0WXszzyh8s6E9QUXUeb3Sv5who/pvgK54V+dWnhbw7PBeNErON8S77tZMWVnWDZ3Ep7cdN9
	AXM6zEq9ONwKtD792ZAu+w5M4xnJcjrJwWoQ3i9AHDgnZ6aJ1YRZO/S6qBbuiJW0kdD5qD
X-Google-Smtp-Source: AGHT+IFL0JinH915To7UZbWNxmW3rxApkR6Mgi6PhRVUaC2JRu/YiTvBxUG9ri+ZhDZkaKBLH64B+w==
X-Received: by 2002:a05:600c:3148:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-47d1958e459mr83426535e9.36.1766332312266;
        Sun, 21 Dec 2025 07:51:52 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm17292809f8f.1.2025.12.21.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:51:51 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: sun55i: Add SPI controllers
Date: Sun, 21 Dec 2025 16:51:50 +0100
Message-ID: <1940379.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20251221110513.1850535-4-wens@kernel.org>
References:
 <20251221110513.1850535-1-wens@kernel.org>
 <20251221110513.1850535-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 21. december 2025 ob 12:05:10 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The A523 family SoCs have four SPI controllers. One of them also
> supports DBI mode.
>=20
> Add device nodes for all of them. Also add pinmux nodes for spi0 on the
> PC pins, which is commonly used for SPI-NOR boot flash.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


