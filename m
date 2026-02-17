Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E280031076A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771339696; cv=none; b=DR3It1/SEDvFqAFcSWvZoYe2njch6tn1rJsV8RH3Ki9JsffC/jA/0DVqnyxS4LYV7qSj573qPkmY5OlEjXJnE6g+dCcAxgxSEY5DxCwistW8MpbfHmoa5yQhNgAlECsFXlhZ4q1StZC5JBKlHWmZ6tuDV8q+RyKv9bu/h6NtCBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771339696; c=relaxed/simple;
	bh=XWrOUlc6WmN3rEw2oGS4C02DYkL+sibKsPW3R80wFhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xns4fNJCPVtzpPyRRQPslRmbxaeFKV17ipgj5BR0Z246M5Wj3Tb2dlKoaXvl1UHg+MAdGbyoVtGOuIrfibxhM+uksrc5EXR6de/6Uyc+UFCQPWaj0omJiLpVtMZ5oA5wc6chkhe9m0ZC0ziZxjoKRhVOfJgiuhNQ35GxiDnle6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuKFbq2W; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuKFbq2W"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so42817445e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 06:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771339693; x=1771944493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWrOUlc6WmN3rEw2oGS4C02DYkL+sibKsPW3R80wFhQ=;
        b=ZuKFbq2WVnlZInQ4b7yNIhhM7SpoDwQr1H/9s02mQV9cRJqmlSO00ecjILkNh+sEev
         9qN7emizSXOYEhayYsN89dvTHO6sRThwUS+A51OEkdLBB2KfxwwPWhMd4hdNa7mi/8eq
         dDYQuNtumhofc5FwiYLRQc4PUZOg465go+sl8NArcrsR/MQytudV3J55p8lIxnUjN/0W
         JrF2/LGy4/+DWi8l7WpYabfq6M6xBdDdPHBqAciOXU5+KcjwOPystA+NW0MBzmDBu6ts
         YvTl4RXj3M4QABTPLgqB3X0i3M0Ba1ZmHN98eIsOVE9gn9nWxolhA0NA31o5cqzDY6gH
         3bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771339693; x=1771944493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWrOUlc6WmN3rEw2oGS4C02DYkL+sibKsPW3R80wFhQ=;
        b=pyY5dGB16pkTzhSC3ZtK3YucdGeIn0d6BUbVtTkfnSqXsli239fOmRgrq0QI95k7w4
         MCCT41rgBDpHv1sKEJqxM7zy0EuoZqm5fv2FmlJE4KDXBFPJr/SbEQPRrz5XB2bIadWJ
         7BlFTWyOwdFeISMYRw5bg8Rfg3YREPhaY3QcZpzRO78h0LZ/v9HKmOaTANNrwThbum+b
         wGoQ5mbeCsQTyIBXZdfHnjZwYJFwazfOupJnkjHh/bs1im3Qgagqpae+nmgJ96ehoVmF
         W1c7WwFK695GIOl3zpZqu3+9MOi+C8MJ7cIXKS92/ufnBzGvWvvJU8NUajIi+mh9qsc4
         My7w==
X-Gm-Message-State: AOJu0YyEE0qXUWmugZ16goIRSEmve1xeYP2DeO6N6JcBvx9YNMrTzUhw
	zFB1fcKZOvbbEzfAkrXSfADoZHiW/2Sl2RNBwJz+5pYpxyo60v8S2fkH
X-Gm-Gg: AZuq6aKVedXaObiVP9eHRITrC1Fh4V83cDwSnIOeR9KPT9E652ktHVtLZWj8w7ckVdL
	Mv3z8W+IJUymDEWhIa4H4DilGVM3f1YvD0oOv+ZgTy/2zPJT72tvhjLOhyWBkcYAXlQX33OG8bx
	zOK0mwurk/kjdYHiNz6F/kATaauABTHWUcrT0XNHzt9uv2jBqhPDh7mMGj9OAguqzgltShUduPZ
	/gXdt7jQWYnamvwdioT22Yvy/qiRedkL6GxadMIenVUBtY19l7tuwse9ZaQ4NsXFwUdt563MYS5
	q67w57pnCPBOPNPvfCaqip+lKLt/28PbBGRtI4yuAl6L9+Wjs4nzrp8bcFcbv0MmBPQn2MoHlhd
	Zts1b9+Yo0MJ3F2+uOEaf8e3LhU/8RfzmPFyit/xstTVytq6CRvnHLm7AX1/z3gdzqffqGEwNb2
	OZFbDFcbIj8tggmsZ0owaKZVt4fXkGLnK0MIvjx1OGeknRaPLi4M8Ak0We0yoYGjx0OnOifA5nY
	eZ90wXYD7fwFzEXskY=
X-Received: by 2002:a05:600c:1e1d:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-48373a15f31mr228213415e9.1.1771339693045;
        Tue, 17 Feb 2026 06:48:13 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a4e149sm164687075e9.2.2026.02.17.06.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:48:11 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock
Date: Tue, 17 Feb 2026 15:48:10 +0100
Message-ID: <6238719.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20260217093004.3239051-1-wens@kernel.org>
References: <20260217093004.3239051-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 17. februar 2026 ob 10:30:03 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> When the PRCM clk driver was added, somehow the r-spi module clock
> was skipped over.
>=20
> Add it so that r-spi can actually work.
>=20
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM C=
CU")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


