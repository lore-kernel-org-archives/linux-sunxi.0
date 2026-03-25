Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619EA43147
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 00:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398648; cv=none; b=b8Ig9T1O78LjyHThIVhME/ERehmIuAxj8Rd43YbRF+3VVAXwjkhUxr/myOXip2DFTLTL5l5ZL3Vc7m3m8oSl+WdTEp+OtWmSpCs+/2ys6F0AcRYlhGF2rRuUbaLnU6ZuLxyiOclxqB+Gs7VDK6y58YhanoINoeLNSqL3b0Z8DEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398648; c=relaxed/simple;
	bh=8PHUma79lPPWs01+csdL38haO6ydJT1fINYoHxqE/dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mde6uhGtO2PZukDiCE7z1OS8588///euRy5uTR8gF+i0gAR/WA9g33ubKASGF3Q3WHPsGWQEBWBJNSFBQJQ9fuQhjWoxU+fORk24mFWKzs+GTg2OTgwvmbohZFSkwfsTgBLtaHGQHXOI1/zvYsYyA7Gp6dQu4qXxqIHhL3bIxgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3+f6cjm; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3+f6cjm"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89a07f66f4eso67372896d6.1
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 17:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398646; x=1775003446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PHUma79lPPWs01+csdL38haO6ydJT1fINYoHxqE/dQ=;
        b=b3+f6cjmpR5GA3bij1RUpUEXjYvA8AASHftq856vdY3427CcBWv6r6U1YxQVLknaEK
         RC4/JPGYbTp7cNrplRNBdRUgCZJMnef4TTlHxctWzMO6rI6gqIsglEIsTv0E0yoxHRHY
         FGhE9fBNkkK6IWBxxK5v+7rUMf0alkKcLs74SMRMFT+kZaL1vWtVa3JFlgbm8szX0Hyj
         o984Z5mp9kIpWgXJZ/x9KGd/Vagz/HEu8H6EMZ7nNPHhyEJacok9VTjb09cNa3THUx/o
         8ylmo09VYoG3krjM3oznSQo98CliazKAlUBB3aijZH16p7APC9PrOfTyUVW2sbvqRf6/
         OH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398646; x=1775003446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8PHUma79lPPWs01+csdL38haO6ydJT1fINYoHxqE/dQ=;
        b=QahjCcLVpRIgka3MqPwJxnr2sf5QtyTFOoVdFZEOPFgNjL8gmnbnaNDk3Zg1DJnPez
         glKVf8eD0kq9a3rXvMW76hqp64LvpQ7O+2D+ZWtrEtXGNdt/C0JUyywy4fcuhxtOhE/0
         kndzfU3FF24NX6aVwIwIiPUhnGOaLuK5diaDthkYdWicMVIemOj8AxgA0J807YbAPGZs
         HjzyuZ8sCo3GFmP6q0+1NPrskQrxeOxJxXdto80cQDFoAU/BfxyrcpEvrMjNuqUDF7E6
         oxv8MwA8T7UCUWfUE4V13Ljk30ovAurs+NuUsOeNj3G+Oz/oYTZkyP1fBJUK+UtYOCFP
         +jBg==
X-Forwarded-Encrypted: i=1; AJvYcCUvy65/uPHOgfxCip+MvzLiehnQtyNnPNLbF0yM+evf5p9FwAqqiqOBRm2+FcrmqK+zZUHXZ/usJP/3tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzFrlDG6xjGP0fTLZ/hIUd4mMTVQsYurtkRVY8jx2P+VxonQqx
	2JQPIRvByLfg6HKcYeEHa36W9LswkLA4CYumhAArnUTmwsOTm6+s87h+
X-Gm-Gg: ATEYQzzqFgNy2QchjpF+835Al+qTi6pvFIDh7yTRgXK/CIJVTbAoQ7UtYBftMPMh5HS
	Z6keR0xVpZ8WL9OgQ11neBv2RiG1iPyzdQ8fSVdJNRHAAKgeV8LP5Lwn1jNphD0tlt0X7JOonoQ
	uDzgZv9baTWU0I9xpZIstLABpsBF6LmMOL3ub3jcvcyazxtEq0LEG0DNi0kkRF62dUPfNviznTC
	KQpIqfKGuDoOH49j4upuoXsT47qoHHES4f6IGvjo2LlST9XUItDYMisH6+zvQ0Gj3XhLwVxyGPa
	7hFEWOwd+IDXeS5YgWY/SIVdWQ8HohhzW4rlCujj1k6/K5o40AwRDESmBHN94rq1ohX9QrfK5NL
	KP+D0Kv040/sVsxqMjNyAFWVYOe/mpxIAzd1hnjiujRmZl2gzvwt6zXltoaCWemdkd3JpHrKbC/
	V0ab6iYjnUttbsJRkw+MGmCGq4ddQw0nY9eGs1UyA9EclbePTKULQMNhTkrzYDXQOWC4f0vnwQR
	tWpsFDkJjV9hg==
X-Received: by 2002:a05:6214:4a04:b0:89c:c772:f439 with SMTP id 6a1803df08f44-89cc772f90fmr9663266d6.63.1774398646058;
        Tue, 24 Mar 2026 17:30:46 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85215210sm127316876d6.2.2026.03.24.17.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:30:45 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: allwinner: sun50i-h616: Add SRAM nodes
Date: Wed, 25 Mar 2026 01:30:43 +0100
Message-ID: <3330670.5fSG56mABF@jernej-laptop>
In-Reply-To: <20260324164357.1607247-8-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-8-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:55 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The H616 SoC has a video engine, and two SRAM regions needed by it.
>=20
> Add the SRAM regions to the dtsi file. The video engine will be added
> in a separate change.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> [wens@kernel.org: Add VE SRAM region, commit message, and split into two]
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


