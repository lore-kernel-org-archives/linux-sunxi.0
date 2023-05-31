Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E60D1640F
	for <linux-sunxi@lists.linux.dev>; Wed, 31 May 2023 21:23:47 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f3a9ad31dbso1215e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 31 May 2023 14:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568225; x=1688160225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o7KHBWZ+J55ZTx2wkCBeVpg6ewT4ab9Dk0YMh5VnVQ=;
        b=FLvgGKO/oMijXf1KYnSriKRqcF0Khz4UsHfadWLafI//gSZwBgh9OxypJBiBWgBA+l
         /gquV9B3z8AW0P35EYtkBK6LSBDgJRm3oH5zSsypekY4x0+a51FVxXSireeZE2kFZ/ym
         1tCMBT6WZG2i5WptFxX5yfTAiiR4CeV/oABWLsMbqu8wb2JWUs1WzndLDdjk0oIYhIjT
         MGA3J7kH9nUeAmM3pBT6w68gWIbr6Arq3TdCesdyAlTiwr7YuvVW40DpM4b4s9AsPsR6
         5ZiTRyg5Mc/mLF7m1i8aY6Miaa5PKp/FPb4YfoPJzWk4XBQ1wA8GbDiFjxaOAbXzAwNi
         z2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568225; x=1688160225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/o7KHBWZ+J55ZTx2wkCBeVpg6ewT4ab9Dk0YMh5VnVQ=;
        b=jK/ibbaLX3rBLm0nDSdX8Zyvw8EdSSF/qMGLVTLG4tRkq1vEj6A6UQEfjjQ3PEE/5o
         /1xzwV4Tu/UPxQXFRIt91ipRSzL2JxhWdBXLrzjET0l9iIIXhfDH0X9DsSbAkUbWuGNb
         61NiDZTqUx7jd+I4IGBo5uY+SSjp1iiUiUPlHn5Mip5P4HI7tYijxR2P1DvR+KGiFjcO
         yxwODmGu+K2R0zWE6dt2O804Cwkb8N+XCsnOl2TGsoV9LI3sighDJ2R25aaP8lPDksH7
         O/Lqj5dYTS0R27cvXPM39+8ms8X+FRwaIfDvSl2x6j1EVhFS7qpTZJon6eH/Pmpdqgyj
         bQ/Q==
X-Gm-Message-State: AC+VfDySIjAQ/RWwsq0oOx4A1r5jt60TsGsi8uz6xMBS+AeVJL2wzA9f
	NOEhT+Ts+5UG0+1jS1vYDCE=
X-Google-Smtp-Source: ACHHUZ4HSrzAKwWcEGlLlqcZKTHdB6wwjM/xqNb72tZZsHT76BgqQkER9rkEj+np4PSBiBEzo6O0Kg==
X-Received: by 2002:a19:a413:0:b0:4ef:ec94:9674 with SMTP id q19-20020a19a413000000b004efec949674mr188296lfc.32.1685568224666;
        Wed, 31 May 2023 14:23:44 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id f25-20020aa7d859000000b00514b3dd8638sm2015646eds.67.2023.05.31.14.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:23:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-input@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject:
 Re: [PATCH v2 6/7] docs: update some straggling Documentation/arm references
Date: Wed, 31 May 2023 23:23:43 +0200
Message-ID: <1852730.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230529144856.102755-7-corbet@lwn.net>
References:
 <20230529144856.102755-1-corbet@lwn.net>
 <20230529144856.102755-7-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne ponedeljek, 29. maj 2023 ob 16:48:55 CEST je Jonathan Corbet napisal(a):
> The Arm documentation has moved to Documentation/arch/arm; update the
> last remaining references to match.
>=20
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: "Uwe Kleine-K=F6nig" <u.kleine-koenig@pengutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-input@vger.kernel.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-pwm@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  MAINTAINERS                          | 4 ++--
>  drivers/input/touchscreen/sun4i-ts.c | 2 +-

=46or sun4i-ts.c:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/pwm/pwm-atmel.c              | 2 +-
>  drivers/pwm/pwm-pxa.c                | 2 +-
>  drivers/tty/serial/Kconfig           | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)



