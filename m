Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F2267AEA
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741873783; cv=none; b=hLwPmfs5Za1PdZ3nesUJBxslAnMct6a5ICirQ7jgxXh3ncOyTpkSmSwcWEg+vQrCaj4BjswoGGyl9jsfDNgKGt5cnUy11bFHL3TL8gKU++IGOgndsccuiXNiyO7VB6Mj3whk+L1SMMYPlJ30sJgIj0lM5hTDhMm17UC2XSk+nhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741873783; c=relaxed/simple;
	bh=s72E+WiRW3VjWXLF2oTp3RR6w8yjtvEkUxbaH/xY8NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLg6kgWlkeoirw3+DWqvbfPjo9m0G780vVKohB+ajPRbBkwAfQHOKvVrxzZFwvPHSx0sPKM3+6VW8BiyfIzYyNaSYDjuQixfeFPjEKzwMXCPepHujuLlHxWmUt7QDR9qIvFX2comQydf695UQqpFzozp6olhodM/4/tJBBsZp+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wWy0RLqa; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wWy0RLqa"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499659e669so1093952e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741873778; x=1742478578; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s72E+WiRW3VjWXLF2oTp3RR6w8yjtvEkUxbaH/xY8NM=;
        b=wWy0RLqac7zdUjsKjw/U/P+XX6pKjeMwuZclqC2iIqAxBuZAYw+qxKJfRtOjw2BJhE
         TGdH6FDmCFniVMxM7x7Bf/OpER06pmTFMprk0BslVFqtO4IqazRt8OKOeno1MiV5Gfnf
         qOmOhWyeZcyKshgYpN0xCCJXH29SfpifXv8tUcLYYiSWraJBgohAN1ffJD2a/kGIpLtH
         jiXaABNNUaRVd7GHFcUlg5eL6hkteky7Zxim1oHTKPbdIgn5VKEiTpASXm0j3Esx8JXQ
         WiJjFKNA7aaJesspewKaT7U1gxzLxjxPJuRHdPRhJHCsmCiOmkOClXH0rYwG6iKYVpJr
         m3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873778; x=1742478578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s72E+WiRW3VjWXLF2oTp3RR6w8yjtvEkUxbaH/xY8NM=;
        b=BIKQX73nqFhP1vSeS37Hg+m28Ig+Bg3YzDWNohMsNjxSMaL/WDYHL6flnBvGwu8Tju
         Fzuc2E6rEkttgJALfQJSp2ErPRfO14EeJGg0Mz93Y2ElGk0FB5+BPSD77UF2LgSe8CB7
         znnatvYeq4BoCvFzptrKMlpl0FD+zmOB+ZBlwOg5YrV4/o8bRoEUrl3AIcz/bo99RNh8
         Qh2UksmF9dktl2ZRqX0HAT+1fAVxwIbQBRw2Xor7pdf9NNHO5NJmUlxOf9tgSlCYAHDX
         8uYuvvKCzO4bAeyzDz+5YAJaYAx2Z/2OJ8v6n+h3IF9XjTR5wQ97/lgIoEgiEvKOb8Dw
         4kyA==
X-Forwarded-Encrypted: i=1; AJvYcCVer6MjyeBQBtYAFguEHxVbqqT3YtSuavAhhJbqjhdijk1ZJ5vKRusWpvrhse0QbJwbSOjd0bpS56MB3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXyCJg+J2Yy3wB5t+ZxWUqe9bpmbh98oYCsmeGpT+aByUASCY9
	l+CSYTRVV4WuIQY3FWO8Zccu5yHW8cZhph1rBuFjQsa97WjreHaOOiUlxEeNZQPEmbEz2/EtFN1
	iUQuSeWuGyrkQ4oi1BybF/s6Nb8IVuVkF8O0Gog==
X-Gm-Gg: ASbGncvtQ1ftBhmOZdG7m8CUISsqPSgIpxyzJ5eonJvTZ4uBMNah4WvMWSPwQx1F3ws
	3YKkBFTseQ18OTc/yxyQLAsaZq+iSJ03zvzR4fGxzfyqGN7y6bTPmsud8hOqKli42E8rSCIohlT
	N6kVHJwfW1fWoHHuNcmklX0vhYiw==
X-Google-Smtp-Source: AGHT+IEccZO3i5+lVUwnSS/WaACh7JJj5Xo6UXfk6dLNaFoPEkEoI3mENp7/zCsA/uhLA0RMiNFyQBBG0+AbjlILsis=
X-Received: by 2002:a05:6512:304a:b0:545:6ee:8396 with SMTP id
 2adb3069b0e04-549ababc849mr4033095e87.13.1741873778434; Thu, 13 Mar 2025
 06:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306235827.4895-1-andre.przywara@arm.com>
In-Reply-To: <20250306235827.4895-1-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Mar 2025 14:49:27 +0100
X-Gm-Features: AQ5f1JrLPVPuCTomUP4jXqnxl_0p1ehI2pivoJIVPNCchweDQ93p9WO-dULZ7nM
Message-ID: <CACRpkdaVH8GAx_K0a01FbRKe8CQ=jh7jwfVrs_PgS9og4vnWmQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] pinctrl: sunxi: Add Allwinner A523 support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 12:58=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:

> this is the fourth drop of the series introducing pinctrl support for the
> Allwinner A523 family of SoCs (comprising A523, A527, T527, H728). [1]
> This time only a small fix, spotted by Jernej, thanks for that. Also
> adding the new tags. Changelog below.

Patches applied!

Yours,
Linus Walleij
