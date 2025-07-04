Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71CC328AE2
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Jul 2025 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616081; cv=none; b=Bl5cg043007SscUKiN4Tdsk4ksxyb+KtNGCHjAXTs9RHxsz4W+3MSZVrsIF9ypJDTOuoft/3u9iHzReyp9UGyoksWdafd6jOmcLzU0h0YXYwJpNkuiXGMy+H6XW9i5uiHXownd+fE/E4XB/e1/jl/FjTXnTyM3iJyDD8rmbuHzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616081; c=relaxed/simple;
	bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7A5xaD7xLgOLC3SO6vk3lmJPao2va0le2/xn+w1lLG8zvlAlKde2ceCHyTPtnYfLLVZKgxVLlGxuyJAZ9QrOPvNLLzdPSgVVC62mmFXEi5uOD60KLFFztJzyvBilBXXoly8uLU9B1B9rDbGnCYjR/iXdB4jV8K63yEOeoo5aMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n/+g4tLu; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n/+g4tLu"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-556373661aaso668424e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Jul 2025 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616077; x=1752220877; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
        b=n/+g4tLuScMv9cRS/c96UbAl2oXhiwzwVuNhWASMgbivpYtrWZ+77gspRBvVjUAE+5
         vgxpW+ClBJ9VcCaLDsFW6PVlSGnNyYdV1ZKnBmNpLMXybAbhHsnb7s7f4IN1nHb/XtwR
         f0oaqVekHEtAUkF2YaesgS0UgY2ABxRXm4rB2d3dngi+7CcnbeAhqxsRiNcEKELomhhe
         PDt2o6bYbE3WtOlg6YT1N+Habg44ByfPiowgQHQ44gOxpI33rplkslpmNNP07Q5kM6z1
         wy4MDbihYWL4BNpR6DoE65rYh83D3v9VYCDdrWXeD3xUCFWvikmrR0W4Y41o7JwU5xHq
         +56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616077; x=1752220877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
        b=d4ljLDLZPVpqfZNBysqI8ZSv0GpCdQAQePPgnIVOxL2KsupIzUmq4rU6cvzpOnNGVM
         2kAFlWdfzBRi++7+MsxUOl2VWuHqN/y5vFgKkQXB3lGJU7i693iuIcWYMgqbtMtHO/Km
         FjnWPMfMZZtCxuZcco2LY/oamMXB4LYSVcSz+kQbfQGkKuEMOt6VM9mPxrFaQwarYYXN
         mAoCu3paIwZ8hk6Am3hKlWmPeFMhxuIApMxZK/inRdYSUQDy7yeeESjZQbzYUa5uVamz
         HVmJmkQ74s9CdYPK6PLg1g4z/HbM/2AFZJDyAyPc1SfAT0yEauvMmt9HhXmoIaxm50Rm
         xcyw==
X-Forwarded-Encrypted: i=1; AJvYcCWD1d84UpTk4xVW3CtoROTvIx9hrcB3x7+RTKnZh7R8T5YUYLw0n6Z2KfubBg51pQhTuNTXeJ3ESqOKew==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvJxkKSDZ9MdpvkzeC0qogYXaqEfpAwrvQXOxgF7pzqVZTAKtS
	1IolK38PG12og1umN1WXhXHOBiZgyeqJ4RR1a3tyTowlJlWWyjP/C2WT8lJHCcYK2dd25N1NgKQ
	P3pbnJC8tupAbVO7/NMl3xGDPm1z5fCx9vIqAD25dHw==
X-Gm-Gg: ASbGncvAEaUnENO37dlfbfn7sPM9WYLeR287CxJtS7gnfUxFkjCfwdrm678xNE8BVvW
	Ge2saGTonRFcVENHoLvTsxqhno650MHPWb0yWeSScW7aH/EZ4xQ9st5Q+leZ+PTniv+Npz8pJGM
	cOdcOOIMZvwVYfnWJLLEQ1NguGnVk0d6YvXIBcofkAAcc=
X-Google-Smtp-Source: AGHT+IE/4XahMx0H5K8e3G6kGLPvEJmDNT+z5yGiSFu4fWzVouleMPU8+EMqNIa7ZAvHuQVSQceFfXnXHQe0peqw8UY=
X-Received: by 2002:a05:6512:b26:b0:553:36b7:7b14 with SMTP id
 2adb3069b0e04-556f1f62c4amr441161e87.37.1751616076829; Fri, 04 Jul 2025
 01:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701201124.812882-1-paulk@sys-base.io> <20250701201124.812882-2-paulk@sys-base.io>
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:01:04 +0200
X-Gm-Features: Ac12FXztT7uc15QsZMvB3fPDcO72_tN7xc565ddgY25DgxMR-aqghVzmCalro_g
Message-ID: <CACRpkdanKtZBkH90yAOjm2+7+dcNri+j7wV5AFL7NHSXHi+bSQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 10:13=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:

> The original comment doesn't match the pin attribution, probably due
> to a hasty copy/paste.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

This patch 1/5 applied to the pin control tree.

Yours,
Linus Walleij
