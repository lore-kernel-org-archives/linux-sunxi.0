Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A940319D8A3
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Sep 2025 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679698; cv=none; b=dN0ZbpXFmeimfnP4acIB+cIwLljJepakzq66RDJw9SC33egjllKna6UpNVoR16IG828ItW6rIm4cG72va5/FPCI91lC9xox+4ebTKX45OU9gfC3fbf4srHdk5P6RIw/R4+tRUYkG/yklj5stH/I0XiqK2Lq3rkfp8Ovirls/I+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679698; c=relaxed/simple;
	bh=yht0MzjKwXPqfzMkTMQkKpkg4jWPJryjUJrJkqlBlvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iK1fTStdjEchB66n0FR0knz9un7nIGbBAepHOed+vMehvYYJcWWAh2/UgEYMBjT4QFZEkG1fvWGGRtS3iCdVVuF4EO0yeCUOOn+SUdfJU5jaPNwlKjwHf2dAR5y7I430/LQZsYJ1m6uHSsu/ebuJMQk8mJFNY5h4MXE7qJ5dk5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EhWGqdJj; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EhWGqdJj"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-337e714b3b4so14727961fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Sep 2025 05:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757679695; x=1758284495; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yht0MzjKwXPqfzMkTMQkKpkg4jWPJryjUJrJkqlBlvA=;
        b=EhWGqdJjOOzF1vdYdJR+kAfdteJ13844xy6qbathujbk3YysxkFWvKoHb6E7a2Wf6Z
         ZqJNp/xRj3JuqzRgDbcCU+bErRWUDqyxwjhoOLrbm7lmYmvLJA40G8oTWPBvAQYWpYFH
         9/OzpHxpbNQVg6U7DKN9QvhHL3dP0v4u6VbuTdlPR6EMoFN7VvaWWY0ZP94oGzQTzg3b
         ygxP+r/5Xo1KvvPqiDXdXSXLN4sO8Gkl6lkJ02w5A6e8qYWMb0nDKNVx2l9M/V1DtOjm
         /IGJIRrdat8oU7VGxvbc4pgho88qqtKI50T54zyErBFa0W5PtxwyH6LssiPp7RZmVhIK
         H4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679695; x=1758284495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yht0MzjKwXPqfzMkTMQkKpkg4jWPJryjUJrJkqlBlvA=;
        b=GUk09cgfFjn1sdeGBsldZqmhA5+rodbDUt8HoS0SDLCkqcztrvk3HiTrQ8QOFNd0ky
         pFnsXRe+SaupMvK/t9K/unjQoa7/hfLAhKSvPswb3E5K7F+wZpNiQX/IHWHG7ixacCZ2
         WIJUPzscaP3Fhhr29ebi6/Ctztd7qFMh5b2kc0lD0IvAbYAQ1Hpsf2htpGADQfoanFa7
         wsSqliStinZ3PefI5nWbWDOckbY51yyUxDzIzrPphSUHOnk1j1qy8fKT/q1Gb0e18U3o
         nUFGeuLyiqVT+D3zO//2GvwhF8mqFL4VDzW2zLHYiMUQ1h5AlrSB8nBrXJR0xd84qwBM
         msiA==
X-Forwarded-Encrypted: i=1; AJvYcCWozKseFNFvq88xt0v7UI18Tu7Xsvi3Xt6K3Hzc0ryg4BG6dYnIvLv005kGVIpR+2Nzwz32TES99haOtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAEttW132bdOC9Uz9gv1vyVGe6PZUeSjqvpQR/c+0eBddnjonC
	uXe28aQsGf3oYqJpmcHVChiRf62zwN3G/k4S+xCr+hdyIKjg0jWGdUV/HNPyvvr9mfLOtdh+Aqs
	VHSMjx9SqwLfh+kMm5ILIifRhDKypaSYybojZPpc1ig==
X-Gm-Gg: ASbGnct3fBQ0Pcedg94ks8PwOgOclyHQZg9zsETtrtQRsaETnKYjA67x3BeSCB51eS5
	Mt/3jVrPWItF/GSne92btpOI7/jz4xJyhEuv4lZO/2AERBDth/iJesssJBPSkBubOLDhiITtDkd
	rWZ/iCwuW2tG+eZjnQwV1X6gEhWNh1198uYcw1IspmChFxDy8iUNZcJZuJuGnRHI42HCDgT57Ng
	I0CBhI=
X-Google-Smtp-Source: AGHT+IGIryVwwWle5BuCNtAg9SWHOa9Fynk/RUJtYWpT4Bd8pqtmMPa6Br277pH3nUbppV/EZnHRiOtwLb2ws10wbU8=
X-Received: by 2002:a2e:a9a4:0:b0:336:cce2:fa5d with SMTP id
 38308e7fff4ca-3513a8ee15dmr9949001fa.11.1757679694596; Fri, 12 Sep 2025
 05:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:21:23 +0200
X-Gm-Features: Ac12FXyVfQQZrEJmw9O1A4dKUe7GIFb_xvJhZW4e_4RrQjwp91fxqMFdqNnM--Q
Message-ID: <CACRpkdY8-j0aCoz+akWHOX6WQ7nNLMbN50A=_7cgNPSUBuQb-Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Simplify printks with pOF format
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 11:24=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Print full device node name with %pOF format, so the code will be a bit
> simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

For the follow-up remark, I think it's an improvement with the
full path, this is better.

Yours,
Linus Walleij
