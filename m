Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C7196444
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717686612; cv=none; b=nBmRVTRgtU9OKcnRzQ6XaMZrmDtsIK+wsqohn/VnY/fZ+mexgrFxUePp6bj6MpZzUKjRDzncT847yP5v9qkdd1lEdsLLdn9QeFoA0LNcS34sdfjyVjz6/HYnfomUuI1qnKSjW4MQYb9fgJkw0Qnli1EbJ2qBzWFy5eqDxSPCgtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717686612; c=relaxed/simple;
	bh=ThYfWkVZq+xxHPZzWBX0JDqaDQnqCEqItdLxeyZzmFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCvOKWB2rAWBjpPn9PwoZVPnWB4TaHRaojhskulFSBWqjD7zEeZl8PRKm6HPGJw3VHJGpXklPBLHPuhx1pqpmrpznB+hrmuhpM8MoTBCopJtmo+OObJPZHMdLGQJNVvdvxpt7m8HS8jKe/HWAY4mdAV+8+lNoeE0DsNn81aksIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5295e488248so1320634e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Jun 2024 08:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717686607; x=1718291407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jOGBua+p9M0Sd6v07XuabYs/DUuTufTW2i+aDQNa+M=;
        b=xQo8KnNh6tcsLLa23R5sIJwnn2FYwuWOaHqQVAp/U2C164pjL2wvKIc8RG2RJpEq+e
         U62g4NZPOsa8GypECFgKYQi2VkZaGKuZm+qgWQcNjcLkZzQpIgG/U0ezzPQ0BtcGaV54
         j6Sh6w3T8/AM6Ipq+OXjo8ZuUuripF85sx42PsKrLm6AITaEaQhfuZIad8wslvLe6e7w
         +VxcTTC+rT6MbgSNli75VlCo2yPCXFlW9WOix9OSBCtOksqbFAtAgTOuuX3XVEsH7hgR
         lLfxZlM3VVu4UOHk6uavvkJ4SujPoB/38Z/7b1tbgZ9tTJcPgq885HxPeoONxKkHgbEj
         YZZg==
X-Gm-Message-State: AOJu0Yw5jJFBZc4xm8X85TJDPO/nu0cp33+xCfhgKp/02P5W0JVGLTvx
	F//gFXKUEgZXj62lYmhg1RnKyB8KBGeNXBTx/f2olDeyCk6GmVGOyR6ZDWOF
X-Google-Smtp-Source: AGHT+IG8PS0KuEuwR3zXe+oe9WNI/q+w94QFolrU9g9EqOS/NySeEpjItrzsiEVYqar59wUOI8tzsg==
X-Received: by 2002:a2e:b046:0:b0:2ea:d836:758e with SMTP id 38308e7fff4ca-2ead83676eemr9822441fa.3.1717686606458;
        Thu, 06 Jun 2024 08:10:06 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ead40f1255sm2288011fa.3.2024.06.06.08.10.06
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 08:10:06 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ead2c6b50bso9030601fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Jun 2024 08:10:06 -0700 (PDT)
X-Received: by 2002:a2e:854f:0:b0:2ea:b956:db16 with SMTP id
 38308e7fff4ca-2eac79ba896mr33235911fa.8.1717686606111; Thu, 06 Jun 2024
 08:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240605172049.231108-1-macroalpha82@gmail.com>
In-Reply-To: <20240605172049.231108-1-macroalpha82@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 6 Jun 2024 23:09:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RpyESyzVp18EDCqkBQ-A4j9LYhXQe+bJOP+MGbUsC+Q@mail.gmail.com>
Message-ID: <CAGb2v65RpyESyzVp18EDCqkBQ-A4j9LYhXQe+bJOP+MGbUsC+Q@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] Add GPADC for Allwinner H616
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, p.zabel@pengutronix.de, 
	sboyd@kernel.org, mturquette@baylibre.com, samuel@sholland.org, 
	jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 1:20=E2=80=AFAM Chris Morgan <macroalpha82@gmail.com=
> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add support for the general purpose analog-to-digital converter (GPADC)
> for the Allwinner H616 SoC to support the ADC joysticks as found on the
> Anbernic RG35XX-H.
>
> Changes since V1:
>  - Split dt-binding include additions to a separate patch.
>  - Removed patch adding compatible string as it was already upstreamed.
>  - Added patch to add the adc-joystick function to the RG35XX-H.

Please carry relevant Reviewed-by and other tags forward.

ChenYu

> Chris Morgan (4):
>   dt-bindings: clock: sun50i-h616-ccu: Add GPADC clocks
>   clk: sunxi-ng: h616: Add clock/reset for GPADC
>   arm64: dts: allwinner: h616: Add GPADC device node
>   arm64: dts: allwinner: anbernic-rg35xx-h: Add ADC joysticks
>
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 11 +++
>  .../sun50i-h700-anbernic-rg35xx-h.dts         | 79 +++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |  5 ++
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.h        |  2 +-
>  include/dt-bindings/clock/sun50i-h616-ccu.h   |  1 +
>  include/dt-bindings/reset/sun50i-h616-ccu.h   |  1 +
>  6 files changed, 98 insertions(+), 1 deletion(-)
>
> --
> 2.34.1
>
