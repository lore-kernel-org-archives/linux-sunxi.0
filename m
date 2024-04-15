Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C019382D93
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713215276; cv=none; b=lna4lZNLrb0Zx9YvR8MWZgdKj3n5OkD05RsdhfzfHrq4SGizhW8KF85sfYKADN/XIOdEEYbu+pgWvzEFG9VfJ9tQG0BsAPvWk6/F7HhsSbwanraScd05vgo8zanKXY/a/H8+8Y0/WKMrDFI5jngzRGu8kC8rGhcbDkwXzM13tu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713215276; c=relaxed/simple;
	bh=dZGyHYW2YHPRCCg2XTiPDm+RfQJLoDRhsLPv4FfLvfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfcTNCE/4LKuR7GfkcTGCIt1Asc2qLncbDUM3aQvhVa3Uy38ucYXOceYCohnI4AjEOUOvK/W1ImHUHcejVu2mmrjJrsEv7YJWbkc4L2piPeUo0/IEaL1OF9F/PWLXnJGQ8P8a2Fn+gImslGOpLSs16e+Ib3D2tyDr71spaf1yj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJYtpifx; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJYtpifx"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2dac79e350cso1401261fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 14:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713215272; x=1713820072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZGyHYW2YHPRCCg2XTiPDm+RfQJLoDRhsLPv4FfLvfc=;
        b=mJYtpifxyLYbgfh/WDFXZ8tqRrWspOsFov3ouNwEawndcxlcJWRH1h0rizbmXrrBws
         i6c/GAG06jqasxXDYFuof/siGJ//drpCQ3pF9hD+ZR/nRcAdqTJUi9haFFV9wMDFztek
         CwQ+24l/kzB5b2prsLhwxiLO+SsZZ21KduGKLX4BNrMo8DPN2NG6Zk4d7l50raac7M2x
         btIOwFhjy62aCms8aPuLU94Ngx/B7eQw1PbUxk7zp0A9CCYFNEwI9VJm7xDOa1tjYmz0
         yFIPtZf19qN2Z0nZv7SOC/ahakyW9Y7FgLwwaOfvhuRi3OYHfjk+dWLKet8qHAtvbdFp
         chyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713215272; x=1713820072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZGyHYW2YHPRCCg2XTiPDm+RfQJLoDRhsLPv4FfLvfc=;
        b=VyClzFgK1PP4IY1Sv7ThMt1hSYuI4CbsWCKmLBL4Echz/PLmXIGY707D5zOMyRctiN
         r7ECGbqeHeb41qzKQId/cM8sJJ1VG2Kmib/01SEr24Lp3YmjTVyFG+NSUmQK6Pdc5VUS
         3AuuSZiV4H5JAvmUKpEA7J4AMDE0ESD3JW1VMSl2KOkYWzoi72xOZJHqiMhH2ucg73hZ
         CM/fejfy6u2zwU7vCtthoJYUA6fITZ6J4mjW21SvRRIWRwiIotLOLZ7Cjn0ZbqgBFtKv
         RVCTDLH01PyoGXTcAQSYeNU5TGxsg7u0R9ytFvJXrhVIkoMOmYDZUc23jhsULPQ9eapL
         DkWw==
X-Forwarded-Encrypted: i=1; AJvYcCXRypCYgoarO173qHXXZyOlEt4Zv6SB5B6Yvsw7cOX0VJtfUWF9W9i+S4+v3oeFxpr6zIcypOKQC58lO5Xt/9e/KGClJUnin+EQPKU=
X-Gm-Message-State: AOJu0Yyi2yHIiEVdeWzK4cMexHQoXiLTKzWIyGX7JfcErXfJhat71qEF
	vjxq8Q3Ov+tdTyGJZHY1YaKZmdbpXdWrbSZSetvJfNVnSK1U7B0w5ZeVg0de
X-Google-Smtp-Source: AGHT+IErQ/YHbW+POwBNnVs+xxSRp19T+6PTSAH/8LvETVMHLcYYh9s7DrvZ4rEKVLjZxM4vADHwAg==
X-Received: by 2002:a2e:b94e:0:b0:2d5:9703:263f with SMTP id 14-20020a2eb94e000000b002d59703263fmr5617484ljs.44.1713215271826;
        Mon, 15 Apr 2024 14:07:51 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm20796813wms.26.2024.04.15.14.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 14:07:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Aren Moynihan <aren@peacevolution.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Pavel Machek <pavel@ucw.cz>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Miles Alan <m@milesalan.com>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, Ondrej Jirman <megi@xff.cz>,
 Aren Moynihan <aren@peacevolution.org>
Subject:
 Re: [PATCH v3 2/2] arm64: dts: allwinner: pinephone: add multicolor LED node
Date: Mon, 15 Apr 2024 23:07:50 +0200
Message-ID: <3289584.44csPzL39Z@jernej-laptop>
In-Reply-To: <3796126.kQq0lBPeGt@jernej-laptop>
References:
 <20240317004116.1473967-1-aren@peacevolution.org>
 <20240317004116.1473967-2-aren@peacevolution.org>
 <3796126.kQq0lBPeGt@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 26. marec 2024 ob 23:44:39 GMT +2 je Jernej =C5=A0krabec napisal=
(a):
> Dne nedelja, 17. marec 2024 ob 01:39:29 CET je Aren Moynihan napisal(a):
> > The red, green, and blue LEDs currently in the device tree represent a
> > single RGB LED on the front of the PinePhone.
> >=20
> > Signed-off-by: Aren Moynihan <aren@peacevolution.org>
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied both, thanks!

Best regards,
Jernej




