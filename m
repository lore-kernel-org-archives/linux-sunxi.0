Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356A27C
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 21:16:20 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id e194so10894289ybf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
        b=CPgf7pIk/Lnkd8dmhIq8WFWJ6BLyq6+kGzIfKmtwXfzlt6kxOq+vyAL8X4bCK1iR3Q
         iI3bTgb55U+aMHk1J0DgzxXKaavtjILeOujbhHokL2gZ/DGhvklPkLQorKzCM8cKXNSX
         mH8IdtmZzoE0UjJlfkmvQ5ZzynMQW3xYlqNCjEGJbb5nfq6GYkbuiRcPcc3AutwclR21
         FSxDUsCtHWw9ulreB79I49s9OO/yykd220i5H/7eLfkuJeFqCB78ZslFFxwGWUtQIAMu
         7ttFNZM+NUfJoUwRduR6Iu0sohA7gqSwv+/dkMrlBLqqPMcaBKKmLc3GgvjMI3QRK3fD
         JC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
        b=S5DA4KMJBIOS+ERAD+oCtMQmqtfSo+kT47BrP1D2i7dYbohVdXnG9N9/ndLrP4zrI8
         BJMwuIzPJ2vQ3rvt1n/hZ/dpdvp+knZ2IQAMeG5sbmTfYtsSi96dNooHogOPTliRmHo/
         3afvTGfLUemUxE6ofpYMYJNeg53rR0QUmqX0lwrZIZnTNCsgB72iDC2WH8vXredo3shz
         L+Nf7poRrqMtSo6FWzY+AHpkOi3/+cE+8MmJjpCUALD2pUL9gIVwmORmgooK+0rKVfGZ
         3sNneYeUnVWNFacF465qEZMONS7ZzKUlObE9iIAyn18SqMQGaM0Usos9xLpnnH7K7rvR
         bSpA==
X-Gm-Message-State: AO0yUKVZkgaP9R3kPrzYR8enjf+U91JsQ+nkGrDMSUQlywPGhhUAUTGf
	Aav8kPFt4NTBUJLmEcKX54W49rOU4X1Z36Pox51w4w==
X-Google-Smtp-Source: AK7set/LQSqDHQohlcpzt0xizcE65fZwUUP3xQclwBlvRoXqfTwlv5UpIYbuGW13MOMcV9w5zxaHwatEJucTRxSnE5c=
X-Received: by 2002:a25:9786:0:b0:b61:14c8:90fd with SMTP id
 i6-20020a259786000000b00b6114c890fdmr4033253ybo.4.1679260579212; Sun, 19 Mar
 2023 14:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230317233634.3968656-1-robh@kernel.org>
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 22:16:07 +0100
Message-ID: <CACRpkdbn=B1O2AyOq9DhgQ4Kw-mSytkj0rpJCKVGC51_rTeAHA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 12:36=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
