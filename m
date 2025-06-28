Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A712A13BAE3
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Jun 2025 04:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751085577; cv=none; b=NtGrDXRag50yyJ7+HdYgQtal825Epnqeoqe3sFrJYBKRrXvneVYqnb7/otmKjBKJnqRjmJWxhVwVmZwabbnIv6n3z6wH1WAs1aEChIVp0F3wwQmb57Fz9w4jPZW+Y1xDj106qGue4GDKDMPYamPMARQuhXlsMzIJjFYJYwcz0eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751085577; c=relaxed/simple;
	bh=XjehE0byLT6LFQc5LPjjr+h2YCj0kTxyUsbUd1G/6bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTtCZBSqMqsfXDZPoErj7GB2sSK6tPlFA+0aKUvlW1ms1HWHej82uHQ19Ofu54gdCMOkE3o4+kClLPspIpQVzQHfuZdmy573OAnKDA6Ze08XqZyYFQTUGlgXptRpK0S384MBRMmQd8UADBv9ZGOMC2NJSmzXVyJv4m5EdvUDa90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32ae3e94e57so4161681fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Jun 2025 21:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751085572; x=1751690372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjehE0byLT6LFQc5LPjjr+h2YCj0kTxyUsbUd1G/6bU=;
        b=FeltxtUuRQMPwM96l2tTcMCObV1PT2yXPJlrHo2oe2qrDVvLGvEIU3r+36OWDzH7FZ
         sSX1allZ/+djhfA0E4YWl7RnHTDmvTsmSAiYw7alTd9Cswjhanyjn+yGgDbmhkE2JD1X
         cZBaSAg5u18ygaCAv8tn25TAenoHqTP3Y+AyGK0KWZVTdj9WddOXI4a1+R9WnI2NyhF9
         78HQ/5vwrsw15ZEoJSf7Shqas+XVXFHe61a3B0KTf8ff/eLwpgKNmD3vMXswIShQ+vEc
         lvHVIyzAhE7hjBwFpIwBr/9ftJA82kUt0uD9rF6W+JPoPQwAMG2f7x2UTDhQyRPAT8iV
         w1sw==
X-Forwarded-Encrypted: i=1; AJvYcCXXH80d3BWaO1KxDfuJkwVSGsqex3wDTVdP6amkIGcg85tnqzJnSJKdvKvAcaA0aoOV4lnUI5naAll0YQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrvYOk9p9Q83R/5MvBVyS9jxBxhuAChpr7uUiNfcjqHR8vuQsr
	84WTUxlJaf1d6J0c6csUUWe3I90gjaCiMJwHedSOlYU4diRa4YE/SmfljTZvloTD
X-Gm-Gg: ASbGncuDktf+SBN8XDM2k0WnkxoBMvGBA2GQKMMuTmHbkhqk6To4VdbyLwFRVZQt0Sr
	C4NgQtn1G7yAnjAychFtfQd1IPzW93rdecg4sMaF8rxHRZykbZO1kP+cFbHPZGje54VNy+lCCR0
	pSzU5m/qbQxUci0FLXOWGeTM0TA2JH0GLwIX1WEwLLgg3lgmsxOR8OXAYSwHE1M69MEsN3AWQkV
	A54+YjlK0rh0xfjjd0Q7jqdCVlT0w5EF7MrvCUP4+mUA0mfooUUslz3nQt9cUEBYXUroxH+KQCe
	Qolm40rMB2pG0ffM5dAPWzYCS0aLopwRNh4fLMoI+MtYzBRT8q2cc0tb6reLQaRBgnhjo+aBLh6
	BCuVZpi1GXDx1NKmifHA=
X-Google-Smtp-Source: AGHT+IFsrmhrvhXBOcjeg9dXgy9h2LF2DcSxUIMPLQxNP8lYYIcbe7DXrV+YgV2UnI9rpd1gagMvyQ==
X-Received: by 2002:a05:651c:1606:b0:32c:abf4:d486 with SMTP id 38308e7fff4ca-32cdc46419emr17168521fa.14.1751085571970;
        Fri, 27 Jun 2025 21:39:31 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ee7be0sm6886721fa.78.2025.06.27.21.39.30
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 21:39:31 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b31afa781so3794331fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Jun 2025 21:39:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsIo2SCozDRpfJ85k5aTfcglmO/66K7D4Rc/OUW+UlDOMWqZaiFas1iF7ApMy9ofZxGeriTGyp8LIwEg==@lists.linux.dev
X-Received: by 2002:a05:651c:304f:b0:32a:6c63:935 with SMTP id
 38308e7fff4ca-32cdc4480afmr15261101fa.4.1751085570044; Fri, 27 Jun 2025
 21:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
In-Reply-To: <20250626080923.632789-2-paulk@sys-base.io>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 28 Jun 2025 12:39:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v67VVc4ckvzy+w++wcEUPSvV9Uxju2H4qTRNhjwAgYpzXg@mail.gmail.com>
X-Gm-Features: Ac12FXwd7he7qKrnxN9KLQmU6bishZKuh8vNiwYMugN6VxIMRflq-7o7dltAy1M
Message-ID: <CAGb2v67VVc4ckvzy+w++wcEUPSvV9Uxju2H4qTRNhjwAgYpzXg@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 4:10=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> The Allwinner A100/A133 only has a single emac instance, which is
> referred to as "emac" everywhere. Fix the pin names to drop the
> trailing "0" that has no reason to be.
>
> Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A100 =
pin controller")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Acked-by: Chen-Yu Tsai <wens@csie.org>
