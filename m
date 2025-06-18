Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDD22BD5AF
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Jun 2025 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246340; cv=none; b=lT0yFOPFJj9+BqZ7SoqF23mpchV8QqPGe2NzoUmg/TZOhlLHLAjmI0Z6NTLkkxJ+GJg7rBN/0SCot9GzDvE7lB3EL+09LyY7a7/gsHb9vsk07d3o3gwPk/EARntCGKX6b4SRW2hP/ID6URFYjUZdzhsOe2GjfUeyVuZ864M1Uyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246340; c=relaxed/simple;
	bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtnJTKN+DyyqR7buBn4qAfFd7XUY50t+4fMvcKeeWQEwJ8qmm8Mu/G3wWbSjbHQ6f2rKwZ37ignDMTU4+rmrqLWCkek3pH8u3awxLqgH5hlJ6XgTBDwyXwZsRWbAgxrBDB7kHFKfiav/gy0DgfHYITp0shi1g19+h9xv36XLopc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jikyk42N; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jikyk42N"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b584ac96so5260229e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Jun 2025 04:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750246334; x=1750851134; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
        b=jikyk42NN7CzME8zPyBRgBmV7WJzTQQs3a72hAYCpA62m9msO5Y3arsvQ3GnMjRcRX
         wdt0LLdwVzhgmAaIgiktMvutYF3FLgukRcHzWxXaWlpOZS4wtvgMCDXcmhqHnK59sRUp
         ZF8zfh2n+yFU7ZQH0rJKN06U66CBVIKOTQyplXhsPNssyf0Hg2ADGSlet7ysCjAS7BXg
         mGO63CPkHC73xzSUmYJDDgKAntNV402+J/O2ls+ZGg6I7fX/HBzJhyMrRXOR7bQbuLZQ
         j9gM7zmQ3QYJcOkKBh/ntvZiVLo8UHuKRAW9k+2qAAQluiQ342K7VCCkq1fD4KsFCvXY
         tukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246334; x=1750851134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
        b=Ocs3k/IFSdT8X4FdcHkgC0tlAxdLyVN7WRcuxaKN5OOVc5ORLWec/PTJkIsX1WCamh
         /6IR9lT4jKViTeSMYHheS2Z9NT4QQG5z784IB9Yi0btEhzqOvSPLXRif9uDoeSaoSzQk
         YExCYvCtjfouUGjLM+TCHh0rBNjzYyFf5KO7D42nMRcNkyJU3QTJWMT2k80KNXsBMlGV
         S2zIYXY+/5+xf5touFb2aHEisaevzngFJAFu0ltNFwkJKubrMBgEhDe5SGeWi+dfGFxE
         mtTHM3ugmTzQag6SCKbWIePmeWeXw1xb8vzrEKa0X0mhpSMdw+gjLWU9jD6jPOB9vF8v
         VveA==
X-Forwarded-Encrypted: i=1; AJvYcCXLnm18tjP2uIOAgrTHHzob/CB0zV6lYGRFUAbjWtuw0tQIShMA14LMMgUT4x+7ZEjxxTT5AHTuJzI3cw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFJba1gcph9aqsVHuC7uFdMuNGuTCBRTJfFxLbohP59Y0o/48+
	aCWYsAI+FKTjX9zBuTVbb/m74DLJBo3VpvO6LC2S4fs+BWnDnJ+9tFxc6p5vEC2aWzoBWBuKi9q
	iGwI1sBsBvBtQNBZtTJwr9vWwF0vw/yQe6EYkZsVWug==
X-Gm-Gg: ASbGncshYHbfFlRFU/uMWlKluN3YzWjlvHisHm+4OixS1zrkNEem7UPT6vF/qXAcHv6
	qmj7TlZECvWNpvkegHwmxfIHcaV0QzVwBmnZMfmCdBd7z+laRszDIvAsuf0rI9VI/lL/JzeN5Pe
	Ug3zp9J1j2otXO3fnS3iHywUPd2DApgXRX8NCLjGrTNnA=
X-Google-Smtp-Source: AGHT+IG/cXE1HQ3EEXy0cPSnaDLNTuKJgzCF0qLdhOb/5CcGOOw+a/DTjj5TWhlAS5cXMjlqM/mbx0AMV43GUJjmW2k=
X-Received: by 2002:a05:6512:31d6:b0:553:2e4a:bb58 with SMTP id
 2adb3069b0e04-553b6e7337amr4658199e87.9.1750246334530; Wed, 18 Jun 2025
 04:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-17-jirislaby@kernel.org>
In-Reply-To: <20250611104348.192092-17-jirislaby@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:32:03 +0200
X-Gm-Features: AX0GCFvVR50_3aX2UCUBcxsZuxXj9BpNTfKCs9hxZHJvTphADGhBSjR3yjyWU08
Message-ID: <CACRpkdYkgHzEnqN3VA2MqBChjtwjC+Fhem7Bo3PdnfGZQgQ99Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 12:44=E2=80=AFPM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:

> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>
> So use the dev_fwnode() helper.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Patch applied!

Yours,
Linus Walleij
