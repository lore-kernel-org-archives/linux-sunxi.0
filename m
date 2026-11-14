Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794618820;
	b=RoEn7n+XQF5dk77JXHvTYXNQfO2K0qe4Ath+Wq86fZruoEwwPaIAOKtL10FuANXIKJdq
	 DBliKLC0jtD/jPfsuCu5dkYNG0DFZO1lT7gOLBqUFUgsOvVKJVRgGZN8wrFWzZYsSlrjD
	 JH5QAJ8+/yY0PKpKuNeneXhKtOYBIWjGboisLS88QjMImp0XhdCgVOiVqG6vlvBX0ukoE
	 uNbdoHXysdRC0BBwgh5uFfm45nseITrOLCHmBEQodZHaqDrM3FgBofVHtTiDNovEvChRn
	 bkj8plEUobffc/e6eqxC9Rqcsa5gMMfvROLKDZi6foi0fN8OcuuipycQMpIZD+FD3AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
	b=0x5Wcuzor1ovfAwoRxKk6FNOHJ+6vUDN47NgzpUrMdRHDtEzS6mwMLsVkd65ghKsgwEn
	 Xu4rcAxd9UtyFyHDKljNa2UTDxGTI5pvQNuqQyn4qucBi5HRRL01QQG9PiEKA7OPrStgy
	 dmBUj+gmYd8N5og7YPENrpgNrZdcUMA34xbe6q42ITzkc2LJSW55gO0XuFKp+zqB4qurF
	 rcDLVhQxwPPgKJp1TXXqc0ahxNO4tWTegxbXFWQh+CG0YTLCGXJ8BoDhsbN8pPfkYrutn
	 XSeCdr0kFrru2ogR2phaRvALKHIHQ+ALgAljhDrkD+1bYeyIPIj+Q7/i1Sxw8L6OwxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2yK75Ha;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B92606A339
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 01:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B92606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2yK75Ha
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso2981901fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Nov 2026 17:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794618818; cv=none;
        d=google.com; s=arc-20260327;
        b=hp9Z+GhFrX+nneg3q8tIhkwhMe2dUlLgqrPhKNjRtXfgq0wGzW2gIlFpS0d3fD5Dcy
         IhEXLJcWtWBVhcdBIDS5IqH0sLDqTtX4q+L9Xn2E62qF1JSJoDr0B1dvROXNeZwaHGg4
         NYtRwJX3dz4fRRUl7DbQkOCURH/Olhi4hwmxQ9uBoW104EisnA+sT2mHudx3GHZ06pjm
         N+rTfLl6LHu2+2zfC05G6zEIGCN2g1VkWSsXbt5ypjWNNzjxv0/HpWBZ/S+H/yYCC3fd
         qKItKiMgBDsytwlGyGLvNExPdfAU3xHVezzs7vrsvaDPP6bC+3TDKY+iAGG+NQq2j6aZ
         lfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
        fh=jdWNRivsE1sO/17i8OSoq7AFbdWVTW3f/ISPvXeuR3k=;
        b=f83eIbImSNbT3kGFufVV6OJELL+H9BFnWl8gqIsEZ66G7+HSEeDkX+IYSuUf/nj20J
         Y6+D4uz3HyN4XuN1OImocT49G9xDw1ANUoNOTdul4W2apCwvdQXcy+oEeCoJNi5tc3VG
         RGtoWJVrTiZ+KO2cma5HyWqU0wFgX6jFpfyxF3HNSOOrrL8pWu9eoilrAooN4UsJDEaC
         rLZ7aP0V7HfKLgvmJ5/bdIREVLiYltiJuJa15swl4CoErnq3LCjOJNqXSk7uyBrPH96s
         101EIFmM4YqLzUWONnaNXM37xeiCHSBbpIrbIQ/IiZnZafjO2wqcBIPO2m+f+g6jNLUl
         NrHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794618818; x=1795223618; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
        b=X2yK75HaJHRK16YlMW7r+kwz/+g4toUr9cCHvfqBNSQM4CGcpxP1RjkJeKyM4+tM7k
         n+l0bLKTevBBwXzIH84oZhc+9SgDiZPTG4GpWhTJ1gcaMC4Brwq343m3bBWanLwSdSGK
         LpskY9p/WrZpwvlTUZLJEc/5Xhe93ly+it+EeHflxxw1AGd40dNjlzxgqpPvmK/NAFgY
         2g1IGfT0IuQENNu7uz4mTCTwamhTaVVESHIKFUCO2viLVIjekBTg34O1mDQdcTU1Qmkk
         QdOgkt5qFzWpuxyJ3292WS++ouYixQhz36URF2b2h42ohbI7RWrgJ5XYi57thbdua4nO
         j2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618818; x=1795223618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
        b=hwiibJXzdip7lr5nN66nue8c75dFz/E2Mq6AMR9FbimLTgjhAfxzp9NXYsnjWINsuX
         9lUrBeSPpBXbrI5rdglmgtQWe+6+akN7JsmbHkcCwQDWf7/htI1xDQBtY9uTLAA3/y+e
         lYn32h2w6RSmWwZvEXRcjjjkIa786ThYGB/DKzcjrItD29VCqW7SzJXfThsW+QKIc8F1
         km8r4Izhz2Etbm6CpDhYLh5/4H2Ot/Q4aVc3wv4fThhAZrw/gFesbRnzASVtcvs9pu7C
         6xGBqTCnRHF62MmU4Tw/Q6+Ru8GsGhLSVq6LqBhvCL/YbUYJCCl+9pmnRzKXf1TgBCMt
         9p+g==
X-Forwarded-Encrypted: i=1; AL+hErHDz4yI0O+oVZS4b+07Lwy6pwIm0jCkr9VLzdCmyipJFt1DQkI77tLei1h5MAR/UOI7Qs9Qm8Hs35sQ5Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z899SgUTbkQnIrJVDp+Rz3IT104aqqVNjI0iGMUYdTb83rtJww/
	jqYDYxoqVFosuTxNkE3RQmI4DAjsnpqxYutRc9ABHwOBtTFNFBrtCn3QV/+Dnwpt56J+0zi4HJt
	MWXWEj9scsemfANOxhn97M93ZvMLNPZk=
X-Gm-Gg: AYBFou0Rdta4WSD3UEwPKEAKiJdjg+boWX7G3iGqzUqhq+DrUZ183k6fhvb1w7q58FA
	4Du6NW3ppLeOFkmqoY1lLejSk4l7OXDl7X4aFmVamgVZF27AEPF3/xqZzTGqYZwG2Bwvrmv+dOj
	QeO40/VSJap1WcdNSUK0pBi1BVAy75D07R88cKP3y4qUuSF2gCjZTb0DQp4EmkW0qRszKtv0OFv
	CeCgsk2R8YgLz6E6yXlDeFEiS9Qy8077JUSmPnCU8SOl/kAhwhoBlCTjVFDmSplCjWkDjlkk+2C
	Y7AAPhldX1eVFfaQdqE6mrgtlCEo4ikmdc7NxAo5Gejqtf5r2qXhHRTMJ2cDdd11GZp4z8r9zpo
	h8QN1gk/2Ff0DTp1S5WfrcB1zmZYUaE18grYCYtkWLS3qTjl62kxipRBTSehzZzpma7631L4=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr1887902e87.0.1794618818343; Fri, 13 Nov 2026
 17:13:38 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-spi-sun6i-h616-dual-read-v1-1-59bea5a897d4@gmail.com> <179461167656.590303.12402709871115244251.b4-review@b4>
In-Reply-To: <179461167656.590303.12402709871115244251.b4-review@b4>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 17:13:27 -0800
X-Gm-Features: AclHuK_CV3TuQGipcbjy18QP_8RBQLDadnLrh6ZniBLdvP-qmCmNyU7dCRkLAeM
Message-ID: <CAEy9hNUgWgO_tzV=3=X82A3kOYBxhukOvqRzaq+-YC18=RZW-A@mail.gmail.com>
Subject: Re: [PATCH] spi: sun6i: Add dual read support for the H616
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This new compatible needs a corresponding DT binding update.

The binding already has it: allwinner,sun6i-a31-spi.yaml lists
"allwinner,sun50i-h616-spi" with the "allwinner,sun8i-h3-spi" fallback,
and sun50i-h616.dtsi uses that pair. The patch only makes the driver
match the specific compatible before the fallback.

I'll say so in the commit message if a v2 is needed.

Arun
