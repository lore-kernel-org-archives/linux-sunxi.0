Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766B21FCE
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Jul 2022 08:58:59 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id e69so7685300ybh.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Jul 2022 01:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3YbR695TAkYYv9ibYrseADeKNiAp29rpTVuxO2dXGuQ=;
        b=jWghaS/DFgsiSnUJHftdqdnrg2WIrICSKOBwr4Fg3a+wWb3TpflG1i2PZAiMlU/4E6
         D74gSkN/HeXD6YCpd6mWX+fZtMleIcZLyxQ40Y+L2baaDX13Ukt0/3+1buEnW0M5qfQn
         TMyb1hibKJOaSwl8eKQX/bn7yFsHcz87p/M6WMHdIjptcrEfJ9fOc9BkRFxQhOF7TDW/
         dAqTBn28uc/ogvDdtvHmyGk9rLz54ZUeIrmHS0btk5UKzVpZXGKhqxwiFslxuHjAVQjj
         oIw8mcKkXz5RyC5yHSMNetMLT85DRirHzIHz86+OySeuRJ/PO9Bgvqk1QcTF1VZmci7U
         3TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3YbR695TAkYYv9ibYrseADeKNiAp29rpTVuxO2dXGuQ=;
        b=MCdtR1/FSdbGgczWKFl0WyfO1MuZN0QEsZvJQGuPBjqH4BN4xAtvy7WCgHmST8zWDS
         /J1C0ZUN4jzdi282gBLsw47ciZaFR1WMI7t1HR9UL42Vi4fqAqLM5AIi4y9nCmi0cSC5
         8mq988hIDe20uSZK9dtNi1CKvBJqVjPdNUZ+3cF04T2udx27yG3Nmnb2rLROa9cJhx2C
         rSualLVjUCOBv/UNan1Ss9Hv4fuqzfKUR0tnetspApznI1UePAS3qgco/b0xgu5DUF28
         wgmQJWuD8osz2N2uWgyTewhlEeUoxhDvjbnTrBjokV1jtEFQ9XUkOXpLHGg5YdA4X++k
         +OsQ==
X-Gm-Message-State: AJIora+/i5iSSWDJO2dZyRxkMr6wLIjDeZMXFz6enfV+UAfduDhMgC1E
	uKBP2h6gW5XVOS5+4Q1youoR9gP7ymPgl24sLrpyrQ==
X-Google-Smtp-Source: AGRyM1vOozNp4mqN9zKhfAC9fc+51TZ/hNdBOP7sE0QplBqhONxtHw1MITMLtXnUVjs+zSTcRrksncX3k/+I0ztVTOo=
X-Received: by 2002:a25:fe04:0:b0:66e:1f8a:8e89 with SMTP id
 k4-20020a25fe04000000b0066e1f8a8e89mr16564699ybe.514.1657529938451; Mon, 11
 Jul 2022 01:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220626021148.56740-1-samuel@sholland.org> <20220626021148.56740-2-samuel@sholland.org>
In-Reply-To: <20220626021148.56740-2-samuel@sholland.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2022 10:58:47 +0200
Message-ID: <CACRpkdY65q12sjDwH0UOOAa8GkBO--EDTsKrnEwn8NoTYTgtPQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: Add compatibles for Allwinner D1/D1s
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
	Ondrej Jirman <x@xff.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 26, 2022 at 4:11 AM Samuel Holland <samuel@sholland.org> wrote:

> D1 contains a pin controller similar to previous SoCs, but with some
> register layout changes. It includes 6 interrupt-capable pin banks.
>
> D1s is a low pin count version of the D1 SoC, with some pins omitted.
> The remaining pins have the same function assignments as D1.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

All 6 patches applied to the pinctrl tree, the last patch 6/6
required some fuzzing so please check the result!

Yours,
Linus Walleij
