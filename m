Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A6329E53
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Feb 2026 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258924; cv=none; b=TgNuf+0K6GYs1UITr3H3K73HOmuxfGdWSiEyMnlq6rfkSxz/Mp8+sVUAiFTbfYdnNXijmUQIcP4/FUnD0LrxJw+spt9VJBsyHNev1YNsQZbJZi4fRiLfgzoJzR9Ee3gfqAehrVeh2qYqY/TKBa/Z18ehtJDL6DizI+RhUKsmo4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258924; c=relaxed/simple;
	bh=yrplvzHimehwQbv7UzsT11ysVk7MnWkqJpylB70YYDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7M2FjATVygJD1m6G43OmvsKuTD7MExFtKz6rmvZGCPNdBLJ0FSZvg16CyMvqFmo+9tvrGX1Ds4L2l2doQxJg+O9KB9kIFxd/qXAy9xDcAbJL2DX2Ea2y96wJuWJgyzYKAHuVvgFcwB2yGg3ixfdlUfucPZqhosBjdOMTAUZcgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aa9F+rYL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aa9F+rYL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48375f1defeso26047565e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Feb 2026 08:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771258921; x=1771863721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrplvzHimehwQbv7UzsT11ysVk7MnWkqJpylB70YYDI=;
        b=Aa9F+rYLLfV6cNQei+hw1FPriIJ0YJtz6ahYy8Zpz1kKrWPtatB4QD2udnpGnHGgcE
         eh96IySHsKdDFB+kTYFoD3lu84tiGR0M7dfUEJVA+8ZonqYVBjSKV6EOFK6P1VVeilMC
         t3VnUxlJiOhUPBaNuMrirhbL9vz+NThceVrbry+2Za3i1fSVk7fBgnWCqmJyetedyUs8
         OLlmK3t7yyDW480Y0PcJ4LQWYjQzlr7Svj4nlgkzZ5DwJUGRZ5K0lQYHQDlp4aenMvRz
         ENHI9dPmpVaU8zH5nvCNswoQ9KHZbjqeGRGIfKuvsCHm+iiOSPGsncovmeLlAXj7dOWN
         9tBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258921; x=1771863721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrplvzHimehwQbv7UzsT11ysVk7MnWkqJpylB70YYDI=;
        b=bDX8Tjor3bAmy0ObonZiBdk8PMNVFkIk8iBNmehKhw+pQv22Y9eineuzpoDHUCwBJD
         cJyKYSPE0cUEyTyYvTdFp4UogJ8Ge9MApIg2kJzTCdfZUaa2jIa5I5m5OrdK1XIi4t8b
         oBv4UoG0U+57Wbx0Stk+r0Mu+9tirCIi2t05qpdC4sIVUq12zejMfbFcMYKJ3gVZ31Fr
         6zc/15FI2qZfEDCE4z8qh5f0mgnhOFJr5pqI6G+mad7c5iRZ2jivPtM7a3wYj51FDrdA
         GZjoVsfbhEWd2OdOyE5Oak0bnxUH8CJDiDRD4A+BQnxFpnhm0qL2K+qJhGUampd81DlD
         X0+g==
X-Forwarded-Encrypted: i=1; AJvYcCWkBCn0bo/wlrR2cmzjCD54gnaju0qcHqmiFbdKMNn8C1dqhuD5+LLfOuz43fK2ElLoWtYOoiy0l9K1eA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNAdzWRMIdoeHCtPavPPYTvHuRkS/F88bFZYaKNK6IED7tiqJC
	5lFh7hkOiUghyUB7MaWEJt4GANL9DCZ+m1OA1yExCR1VNwAjsGWVC6ZW
X-Gm-Gg: AZuq6aI5ZO5HsV4S+OJrRJA/MznmweKRqAqCO7HzNH4zLRtboTi1DTYrmolRInCM4kl
	4gvFTzYPc4a+uSsosM6yRKug0q/X93+cJHryNDKS0K2m6i13CdGyvCCKAg07mtG1HuL+8eiYNv0
	QOnUt2ouE+CvCcqfswI7a3uKQnfJaYakLlz8KC3sdWr2xcGD3DI8soyvwylqoa+FT4+WYctreWn
	NQ1bNHolAuPk9YhxtNWYlh46cBXj0U8gEUt6R1ni2s9lwI4BIbT8tesDb61BluR5ZrHPrkDR65G
	MkQhWIdX+tkqZuYcfCe5JQs0yTPSozqvl/Ud2bmjSSQSD40baUhEsBYJ5p5O1G3klr8NFp3bRNy
	s52VQ3h0MwYc4gHLXUEUxXV7sp5gDrn6viuHqVHP2RbXfGTVeVIcS/z9mNbReiOB65WfnM4o84b
	n8gIQ4k0S3odSVilRnqUMhviGhBfod9FI1gZulv9Jqh9kc3xXYNjLFQRXoN6mVf06wx8P8miYh1
	2o7rm/owNaBBCVcAw==
X-Received: by 2002:a05:600c:8b61:b0:480:6b76:dfb4 with SMTP id 5b1f17b1804b1-48373a083d7mr183030205e9.8.1771258921040;
        Mon, 16 Feb 2026 08:22:01 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-79-213.dynamic.telemach.net. [178.79.79.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74918sm27901928f8f.17.2026.02.16.08.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:22:00 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
Date: Mon, 16 Feb 2026 17:21:58 +0100
Message-ID: <12836817.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20260216160946.2977985-1-wens@kernel.org>
References: <20260216160946.2977985-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 16. februar 2026 ob 17:09:45 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()"), a warning will be printed if the
> gpio driver does not implement this callback.
>=20
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


