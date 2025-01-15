Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CC41FECBD
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jan 2025 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940140; cv=none; b=jf5c1wrq+rniy2JBKNnf2GTyi9Vk8uEdhGhf3IImNcL8OyieLDh8Q7wyM2ViQPk8DCkesquxu3bnLxbZxFNsgE8fzm81Ao6zK1v7YAV+SSk77zpSCqYk2oIlVlDi4BHDr4gMhSYmqh5NjmkFxOunUaJ8N79j/geaSQrrfCGRhfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940140; c=relaxed/simple;
	bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PldNzthCgOKP0HHTCwYwlSbMAI+MJ7n072B7RS5fe4XbPDHHshZyV6QacVOClqD8JNvucgyr97/K+p3hqmzm6LMP7pBIA4ym/K9BqstBF1LQOJ8FYvUDevk0Lu8kgaIV9d2zkHaZRjJFsVNYaIFmZUWc6fH58iNwKQwlxdH0Q18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFAdQOzc; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFAdQOzc"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3061513d353so37716411fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jan 2025 03:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736940135; x=1737544935; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=;
        b=IFAdQOzcFw/Cdu2j+ZTKp55nu+JJbwEwsNRHwcMwkJcS10sH4bwBdC8Zi8mYlCZMGB
         7CHYxO57QHgsTBX+GGDiHX5Vo2Z8T7gjKDUn+M/qIL1IAGql14C4q8xtS1Tf7wDIdxKs
         0oQnCHenKbPA972NuIYcNFlttgpSIddJjxl/MjeHAgK3OJvqPP1pOesWgowswbUKVGYA
         naPh9V+qlxlND7cPC6+XrTyzhg94/mHPMZu4u54LM3VSVIM1Cfu+UVtM9tlaBxRhwYEb
         It1oaFyl+/2QQX1uCmusKQJWmB6/jKPch2fV1pREujPdg8HiIVHQ1gnQILEA2lsZ8lqx
         AlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940135; x=1737544935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=;
        b=fqBf/QcW0jiX6qPcel+chxgSl630LClz1w0ClH0MWIkW4Cd8N5UwoY1BuHxVbN8q7A
         XWLpChQV7rW78SoofthKROdSnkFtJzk+5b10LUVQnFSFL9luDncqJuJ5BAkO73ggggQp
         HmY67yNDuH1L0DKjplZUZGM68eqyzpCDalbqCyL3E9AJj7LQYy38/fASYfhYXxQTgVZ4
         BguebcP+z+ghfnsQpmELci50xS9MtqSwuZJlvkHrc5feph1+LF3tN2ndEydUxRRrEzvc
         TXM9+tjCgdR1DOsc569HHezSUguQJX2xWKknQQ0znyc3MkH/Vxrj1ZQke21JCj2tVi2t
         JMFw==
X-Forwarded-Encrypted: i=1; AJvYcCXBss6afCe5J29TVzSeXajDUy32ui+LURFUOsVn8gaJXjZg8NxaPtO9gjsGWGla7JUNVLce2v6WUvfQ+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPsvBC2W2PYSpkpNNYF2Zgr+uYodg7DLbFEeHmVMXhlcENGb3f
	7w15KsPGzotDSOyqjt2+VCRaEp91y4gCfpdrpl2FugkGjUW7bi37o1pD7Syvv8B6SfQ9R1ipj2w
	ZUxcN4HEFNsCwOSQI2FcZE6A2/50WsxnKpTAi6A==
X-Gm-Gg: ASbGncuR/o/nILANDpfFeybJ16F2yOAQ85WNTE8LtlF8hCxmhAivpyVzY9vz9w+/HxL
	Z9zD+fpyW//pv3dbwsBajrgayKySjnLtpLoV+bg==
X-Google-Smtp-Source: AGHT+IFi9OUFsDG/HwAOWZDy5wxB1IFMes6uWrSDrSs8fqZfUq6g94ydbqgtsgXawPRPPFqiHwnnVYJjpekX/j3mPrc=
X-Received: by 2002:a05:651c:2124:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-305f45cccbfmr89843831fa.17.1736940135230; Wed, 15 Jan 2025
 03:22:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-10-abad35b3579c@linumiz.com> <20250114160045.2baacdaa@donnerap.manchester.arm.com>
In-Reply-To: <20250114160045.2baacdaa@donnerap.manchester.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:22:03 +0100
X-Gm-Features: AbW1kvZR9tBuaRtZ7bNclb8qOifwSWdiMNHG0XPYW6GVaemjAImZEkZB8O3eBOg
Message-ID: <CACRpkdbZYFaTHoOAy7DYpaV77Tf31H4bF179OrperU6UGys2ew@mail.gmail.com>
Subject: Re: [PATCH RESEND 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
To: Andre Przywara <andre.przywara@arm.com>
Cc: Parthiban Nallathambi <parthiban@linumiz.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 5:00=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:

> Linus, in contrast to what I originally thought, this patch *is* fine, so
> feel free to keep it in your tree.
> Sorry for the noise!

Phew thanks Andre, I would have pulled it out otherwise so it's no
big deal, I'm just happy about active maintainers!

Yours,
Linus Walleij
