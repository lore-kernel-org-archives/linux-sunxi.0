Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5450298242
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Jun 2025 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558980; cv=none; b=jXgHVEPgZ5bOKbeEd9xpqdocFjJ/0sfMgcXveunpui4M4kAG7u4JjwMfuvvvUV0Kc5V7rAqk6C3RKXgOFxdMizfVv1OJqCxiwvUOmaazfA8gcXpCucHelnt/0zyZI841Vnl+tcM9SvDjDy3h3UNXezlou+XKRTsBoel+QJhS1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558980; c=relaxed/simple;
	bh=lJ2EibwYrHKuwkGgy7UaDo0dDOz7bGTb8OT6K/FalDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUhr1m2yFU40EkdzkTrAH68KcRSSicUAWeOIImCc5YG0G1IX8Kqfn/lqvEe5IWB/yotkkbY09Nfxdse+XUV2rWD+4/rttriu6QAb5s1XntJjUhssmL9z7SAKQm6Wh0VwcF2OLXai6X0Nqa56JZvMeBcpvYXmmlB4+y1B6a9zQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ig1oHtSH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ig1oHtSH"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54998f865b8so5087819e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Jun 2025 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749558977; x=1750163777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ2EibwYrHKuwkGgy7UaDo0dDOz7bGTb8OT6K/FalDM=;
        b=Ig1oHtSHCdHsDEFtcuE4goeYPBpJcJ0CkM1QfuZLkywQG5TVis7ie1UTlD81K+eR9X
         QlCXCUFhW0LQCrjB7vmUm6eJS2f/fSNtYerJsOwvcplpxylCX+swAiCXmvy7w9KnghIv
         KsnNXWDfCJmQ5+HpTvBSjaRr/lzid7VmrHUEHQy2ZZcwV3NkRhbv19gROCGx5JxyrGR5
         rLtPIupVeCUc6gJUN7wAb7sqLogckWsdHnuDoepCgGaCCyyvSOM/9ci8TeBkI9GbXtw0
         hujXPX3SL3/inCEcc/Ys6APJbGCLYRR5dsT3zo+LcscMtirlT//TmThrD6wcFwG/XY9e
         TxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558977; x=1750163777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ2EibwYrHKuwkGgy7UaDo0dDOz7bGTb8OT6K/FalDM=;
        b=AvoREf2A/DCOPLV2cyJUh+/kTbJkoL9z7FRJjkW4svZuXLfykjVcOrmzRo1sZmEU/v
         9XbuKh01HxkPwYS1olGHN4IYpxx/dtlbcALlk7u3nfGYrOkS3ufBqTRFhpLeAep/X5WY
         QCuV1T//wRNpcAwwyRxp5M9FL+5VlT3i+AHcc+t0pdNliB9haxwfJjWfOvHAKTIvJPUS
         alWKWVocsnbJeQLoHgSbuQtPw4JKjDzSqebAj4UzmokHQYjiIrbNILfO5KxoJa/3TsPx
         9DQO7a6DeB2dzEyBrExz8SIbnfm3gMNwlypXXI9U83lHzjCIKoyc4O60t2c0tVdco4tQ
         2hAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpy8ArSE6V+lBTpkjGcjigMHn8AteM5a/I6jCerqUV53fhQDRgH+aADcR353BtGwmO07pDAbO4AVPbVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZDEnv4OOpky2G6XHmhRsKZpy/zhypz6h8+2xeJJbPfnQeMv9e
	CjPRySCp/d0jMqBjeK8i0ugCps9Zulnbq9oH4oc4RgzZHxvWOAwgPaoz0h3OFh//ZZ3ArgW/VVT
	B/IyXgmlPQN4mw/vmMXDUheWJUlHFJGRA8cXePsyMBA==
X-Gm-Gg: ASbGncvjW1MULyxtGibPkZVbvoH77YEPC1pFfj4n+SGIQM5TeTG54NTAVZVK8rcfZ9L
	CLPggu/t0gqGdamQ+fvurkGmIoH72MgFIEOQarIF5PowX3PY4GygBd2G+zN1WfPRrF5uoKV15DJ
	efttVCkqEaV0SF1PilU3eikVPbv51RBWnYoncfGTuncLeg3cpcc+TGvA==
X-Google-Smtp-Source: AGHT+IELdA+tq9VR5udoo0SjBqgjtXdlCnUFk1ZiTiteFNoU/sAmnTRRf2Lggd+JrBptHGv6llHTchs9v9E5K8zOTw0=
X-Received: by 2002:a05:6512:3091:b0:553:37e7:867a with SMTP id
 2adb3069b0e04-553947dd220mr757785e87.49.1749558976880; Tue, 10 Jun 2025
 05:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250607135203.2085226-1-wens@kernel.org>
In-Reply-To: <20250607135203.2085226-1-wens@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:36:05 +0200
X-Gm-Features: AX0GCFvyRHimADR81nq1Y9XLD3rNjaMG2YYHVtzY0J60cBE6h0su1u4nLP7Bn_w
Message-ID: <CACRpkdZRROZHK2nr5nx0UzwYZaoTrLLt8CzOtYWOsJg=hKoDwA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: Consider pin base when calculating
 bank number from pin
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 3:52=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrote=
:

> From: Chen-Yu Tsai <wens@csie.org>
>
> In prepare_function_table() when the pinctrl function table IRQ entries
> are generated, the pin bank is calculated from the absolute pin number;
> however the IRQ bank mux array is indexed from the first pin bank of the
> controller. For R_PIO controllers, this means the absolute pin bank is
> way off from the relative pin bank used for array indexing.
>
> Correct this by taking into account the pin base of the controller.
>
> Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Patch applied for fixes!

Yours,
Linus Walleij
