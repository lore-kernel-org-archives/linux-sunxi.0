Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1193E127B68
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Feb 2024 22:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708553244; cv=none; b=Ag6gvPm6oC5iWRJuqBwrGRdDx2DuaSffh+b7zBBBpDrlzEheikQgJxxVDX4B+0CY1FH3vmuAyPQUb79x66IbKpKcex7GJipYQmzsRHyFA/3EYIISqJTof3eczjQ+yIILz0cs81l23AR/pLrSrteGd2sNIAyy9onwyyWC0rITPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708553244; c=relaxed/simple;
	bh=iNidW3f5wsCISbKAXdYoDRvGkkbi4875RfDnKAT5TGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cc6gay4F43I3x6o7y1JeAtY+fXxQ/E5BUDa31YOP3qLf0wQiWG+PAh4mlKWnfX0bn4hB+fPV9fTEj9zciSi/95+hhFMTNeOsDtkIZpmAwEVm1IrVPKiT5Skilno1VOh2pBeEjPJptk8Pji6M3bcqa8DMN3UtPvn+V+6jqwDJOaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UK1NRQuG; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UK1NRQuG"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60495209415so70376067b3.3
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Feb 2024 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708553242; x=1709158042; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
        b=UK1NRQuGB8YX3BLpgq9lCthigAc01JQlQ/oJlQu+a6aYzKzcNq2ymmbdp9kYHFo5X5
         /ZV9I6Kygzrp9SIG4haXEVzq+Ou8n7GZjyVN6sBpqve/l8cZAUMEenerPDHHnbh+tBtP
         Hx0H8/n9aipgxGBGsajAAxACuBLG6los3qzEJZH54SQXk5k4IzvStDGekupUNWBP9cnl
         ruOlNtY/x5MWUuZezh4mKiY4zihBKqFd3NAt9IzTxkqdY+cy+RnXuJo3WRb8OZvijVWu
         I7Mi1wxEixZi2D+WUWtAlRgnssfMK2FcTU5+ECaBWqUaijLRa4HhcOxFKN9gvuVI4vmG
         nVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708553242; x=1709158042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
        b=P57qcaB7lE4k5bBN4kLL2WCV3Md9Bzng9mmPy346YVahBFr228omal3BFY/q/GjBtp
         4E153AN4FiA9/4v4dmenOdFuHFi6JGjJJ9o7/Ufzp41/58GU74ybZ3YFTsq95eorINGx
         wDvvOrrJdZwICUW4YfKCoimEXuJcaRR10fxXMay+M08NNg9MSH2ak7bn1ggQ8JO4PXop
         7W5Ck+rBR/GqVoFbOH6poEt5HStFb8t6uCEbgVrSBWwDX/Qj7bkKyUZlnjCoU+4th0tB
         Aw1JVyjV9rxzutEzGqM36x8Ko84IGuh7Z5J75JbRkpMFaVJ7A2fNNEpyRM6Ac65VuASp
         nxfw==
X-Forwarded-Encrypted: i=1; AJvYcCX9jiubp041qM/pECfgVG7rQkvzyatg6OFjc0ny3FaW41PrO4A205UcMJouLCxxKhP/M/3psnsLXW0jNvwNDCVKoCqV6I4keNgBy0s=
X-Gm-Message-State: AOJu0Yxfri8J+g8jmsjwsuWf6o+/1kQQtMfE4QCkwBVGQ1Efh/M06lP+
	a2YD0aFzy+VJ/aEXVoyFG0W9cqyS3Pd0RC6DK1Ow4IBUwzhkEPwbN5knprhfh7Jjnd/E8gcrLsV
	u5NkNRQm4KGU6/JMTvPcNdCxdjlHc7nWEy1BStw==
X-Google-Smtp-Source: AGHT+IHcXCkZHHGUkDm2xvIgiK6VurrE3eAJdP/r6uC/vcQd0YLTd8DmYtHQlaiiKrj98oMZezfQEBryKYUS8JEchGY=
X-Received: by 2002:a05:690c:86:b0:607:d9f7:e884 with SMTP id
 be6-20020a05690c008600b00607d9f7e884mr20419761ywb.4.1708553242109; Wed, 21
 Feb 2024 14:07:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:07:11 +0100
Message-ID: <CACRpkdajVH4Y2K5W+o5XAoiEr57ObVbaR+9QdFV=Cp765B+dfQ@mail.gmail.com>
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 10:39=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
(...)
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  2 +-

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
