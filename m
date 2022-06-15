Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB457A
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jun 2022 13:26:48 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id v22so20513139ybd.5
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jun 2022 06:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2uJBdNrvWnRJEqnKZPpIHQmnT1CIlbB2x7GUHZk371o=;
        b=svkVmIzhK2OAHpVq1j7D5Y0BMlGsbs/r5txjoPVTRQ3mxbX2q+KeDYS5dFr9SedA1U
         G+CX/SEC2YDtM171HS1vYVFypF4406i/Gp4cjq9VGt2NKyJlaxFACzAjfml3uTZ3ABTT
         Bpawy4OLBnfnplZabQ57yj1fBScfFeEBlM3hbYQJ1dXlZHVmZbcgjKyDREq5hVzRnN+b
         IB5WjZRUVCHQXSGfEW/U8kRnKjCVfywJVT3+PMNySB+DKE/v2s/UUYLBD+K0l8Krw2UF
         0xuRAJLoVyxOH6swQ4Jjbke53RsOiIGZp5lG8ZzAG07mAFtniFJIWDPlglXPq7A4itVN
         wRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2uJBdNrvWnRJEqnKZPpIHQmnT1CIlbB2x7GUHZk371o=;
        b=XAGxliO3BkxkhdS23C1QnOKlzFa10kZ9oSMdFfF2ZsV74osDoabEvN/BNGoyJaiN4F
         vS5+aEJdKTFitRanzMXOGuoL3vJuSGUbqLIqZJWXhDSVgvT2ubRzO9GHrdYEJn8tQuv3
         Mbkq5er8QC13GxiMBUItwmb/dXpslOO77NSRlreG4NqYltadzfJpk1KNjwg1mWdZMKda
         n6A5IyPRxAXiwsL6I1ZollMH71TXXEInq9RZTxANzCm3mkSJJegV03Z5SQM/LZv80sRx
         lkgH7hbwdosNC5p4LqToNdY6jnpIeJivDSZyiLqWT3jVzVFcFn0BPjX66yQpswJSwAsN
         wMLg==
X-Gm-Message-State: AJIora9c0icKqQaHyXbOHf86LsrxdnfsRWxofOyCZHQwppz1VQFxAdAV
	zBQZ66wMWafUFrOhzRlW/eb8nd6iULLqOUmuoh5GgA==
X-Google-Smtp-Source: AGRyM1uXbFdzJy6wHZ8d8kshG4hHCgicMvgdaZy4F6zLHljayPXpaH/KNqKvp55V9OEMRLWm5czLWFtEK5L8lLi/+pU=
X-Received: by 2002:a25:dc0b:0:b0:65d:e5d:a87a with SMTP id
 y11-20020a25dc0b000000b0065d0e5da87amr10584832ybe.295.1655299607356; Wed, 15
 Jun 2022 06:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220531053623.43851-1-samuel@sholland.org>
In-Reply-To: <20220531053623.43851-1-samuel@sholland.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jun 2022 15:26:36 +0200
Message-ID: <CACRpkdas0MEu5ShkdJr-5rrM2i5LkrwARmC6J=X_UQGkRrc7EA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: sunxi: Remove non-existent reset line references
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, May 31, 2022 at 7:36 AM Samuel Holland <samuel@sholland.org> wrote:

> I assume these properties came from a lack of documentation, and the
> very reasonable assumption that where there's a clock gate bit in the
> CCU, there's a reset bit. But the pin controllers are special and don't
> have a module reset line. The only way to reset the pin controller is to
> reset the whole VDD_SYS power domain.
>
> This series is preparation for converting the PRCM MFD and legacy clock
> drivers to a CCU clock/reset driver like all of the other Allwinner
> SoCs. I don't plan to add reset lines that don't actually exist to the
> new CCU driver. So we might as well get rid of the references now.
> Technically this breaks devicetree compatibility, since the old drivers
> expect the reset. But the CCU conversion will be a compatibility break
> anyway, so it's a bit of a moot point.
>
>
> Samuel Holland (3):
>   pinctrl: sunxi: Remove reset controller consumers
>   ARM: dts: sunxi: Drop resets from r_pio nodes
>   dt-bindings: pinctrl: sunxi: Disallow the resets property

Patches applied for v5.20!

Yours,
Linus Walleij
