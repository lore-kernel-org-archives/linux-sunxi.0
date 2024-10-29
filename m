Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270FE204093
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Oct 2024 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730192174; cv=none; b=r9uTeGPGsxVUsrfw9mbS5uQ24qfT1fszwbPS4AV7AgTZsD4KrZy7u5c4rZHBxvpbq669Mn016NVXepS3LUBXSfP/QoSyO5mj0vIxMYDl/glq2YyZhdaDzhJCH3hzCpJUHjBJ9XiI6qWi4DwMc0pQ9+U++oGL21ntxya+oOflh2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730192174; c=relaxed/simple;
	bh=621QT/rt7ppLCdf7pdKUgsxJWg9USCuHr9bCXeE3uYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXFGgkdvkbmW0bwLYM36TaqbHS7wNhF2Y98G8a6P16OBjSzy3iN7U3lh2Bruzrg294caGTmgTLDzDpMfBOh7cHbPG2kazeiJPTdCHNH5YGUSky2G8MQrlj0VzNEGeVeU5OY4SjxPnUNRn0yFUv+Iqm/JxUwBmQ75MrqLAlvjtvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MIZpX0u8; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MIZpX0u8"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so3386903f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 29 Oct 2024 01:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730192170; x=1730796970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+tIuf+pw7VgqaoFXTVPLLVE0V3c5Y1bGL0baofA3s8=;
        b=MIZpX0u89L/hfyNwUY/EzfpYAS8S8JLXkBWp3qKzRpM4O5C1UTiCoeqTuflKcr+0sh
         cs2As3AoPwr90X3ePxPC+JRp7vMF8ORUxwV0qG7KdWBG4EW9vARNXa+4Xwym9b37K0ZM
         jPeWQRKlZ0kjQAlJtkmrDdDLDp/f0ub34rVVYCIXovazmuvlOWuL7+y9T+aglaNFTNFG
         owtB7GloXBQyYl3KGY2mXYMINWOhwvgw23ASaImX8BEQ2BJAuZfd79/c7RN8oLWubR6g
         KNnGI9vASwG3kZBg/HWY/7AJX+xFJWnQZ8y2htfJrk5jBE1J0zolLq/XPhQa2vbhOJAG
         e5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730192170; x=1730796970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+tIuf+pw7VgqaoFXTVPLLVE0V3c5Y1bGL0baofA3s8=;
        b=M9Q1jMRrz1H8b59wW9Meve1GXnRGOKv1Ffn3Eu8HX1qJ+MiEOarQXanDAlyKE3ctFQ
         06sW55MtQyd8TeGjm7IygDoiGYBdAEaHI/+XHFBAcci5hmp4iMkpoXUQix++z6Q6mavA
         fCQ47QcfoZs7J9ZUdwniEEUSiUZo9AXLdeYcJu+9uzLyPsrxJ3Frejk9lwD9DKhK72Hc
         OtNB8YA63MbriTjYzGBTXeAXRw1i8QYzgge/PkPxfQmArCbjlyq+zbmZILmSehNETULO
         0oNTUyYnBVPE07AEHw4/41v1VkU43ZddP9dxnWy7OTGuLSt8fcDDEIhrvE8I8j668i7A
         eA0A==
X-Forwarded-Encrypted: i=1; AJvYcCXYLAWGPK4z69suzvjYZ914WkOzRlA4iwiISRJBPUJ/C8jg7uXyNjH37A1JYVw928fHtkpEA4O4+G0H4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx14zqv0jIOZGqrJ2D+OBNZpW3lHS+Fh1ONos7rAYbHzJnoant5
	fpo2eiHcrjzCHwYtebJ+XjgQ42AKzpSbthkKUTJCQxruaX4aWq1k3Pot94yC88o=
X-Google-Smtp-Source: AGHT+IEA5JJWXtQoHZ0PdS/MJdUSxxPT9oA+1aQ+m1nReUn2taETur8wxSZ4YWpYW5tyNcpUGNlwNg==
X-Received: by 2002:a05:6000:1f11:b0:37d:52d0:a59d with SMTP id ffacd0b85a97d-380610f2bd6mr7564818f8f.10.1730192170391;
        Tue, 29 Oct 2024 01:56:10 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b132fbsm11900069f8f.4.2024.10.29.01.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:56:09 -0700 (PDT)
Date: Tue, 29 Oct 2024 09:56:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Aleksandr Shubin <privatesub2@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <4ioz6f6efs2uhf5mitb4xhebqeryyz5ukple4fkn54wpqep3c4@4ktefld35c3s>
References: <20241011102751.153248-1-privatesub2@gmail.com>
 <20241011102751.153248-2-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ulmatopmaqdyrkp3"
Content-Disposition: inline
In-Reply-To: <20241011102751.153248-2-privatesub2@gmail.com>


--ulmatopmaqdyrkp3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v10 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
MIME-Version: 1.0

Hello,

On Fri, Oct 11, 2024 at 01:27:32PM +0300, Aleksandr Shubin wrote:
> +  allwinner,pwm-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of PWM channels configured for this instance
> +    enum: [6, 9]

I wonder if the number of channels is a property common enough that we
can use "num-pwm-channels" here instead of a vendor specific property.
Or would you suggest a different name? gpio-controller nodes have
"ngpios", so maybe "npwms"?

A quick grep suggests we already have:

	fsl,pwm-number in mxs-pwm.yaml
	st,pwm-num-chan in pwm-st.txt
	snps,pwm-number in snps,dw-apb-timers-pwm2.yaml

As a follow up this could then be used by pwmchip_alloc() to determine
the number of channels if the passed npwm value is 0.

Best regards
Uwe

--ulmatopmaqdyrkp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcgoyUACgkQj4D7WH0S
/k4BJwf8DvGu76czyjVYmp+JyjZGGyzYFVym3ObWj8LAQZ7pr5F6O61BxMrIC/a4
RWe9joUnrwLy+UJgxerMNtgS1TgnCgb2r8VzdheUJcDwTjPBAPvaa8eOpybmRtSq
TxJcKF0qlT8bGtWZjRsx/UYKWLZUrrhgOt7CM0LY4kubCeDEwruXHZSy/FtuPvlM
STFxNDN8fT7KuaqVY7HYvYZw6tOROAwFaxQhMWUIWQIruQyF4+WJ2bVgBQM77bxK
OgE8BcqpFcCB2NU0qnyDXMqalDPYeh9necn8LrbQ0qXtE11vn5+bOlJvOHQhet8x
DYJfsCSOcurHrnvmYo50GYpNdoJUrA==
=2jh3
-----END PGP SIGNATURE-----

--ulmatopmaqdyrkp3--
