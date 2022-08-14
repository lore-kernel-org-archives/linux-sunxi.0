Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9182573
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 18:29:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id dc19so10221067ejb.12
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XB5MYP1ObQdhC9Im6M6kovBu00CUIfbX057+jD5STfU=;
        b=o6rnUv3Xj8cQ2rQjg18UO08EBTbc+8mKWNIv34B1Homy7Qi200vG8NkMRX5UIfl7lU
         E8mbjGgWmhHSi7Vazc3Ls/5foMmUWgVUGXjI2za7Rht5zQ4KV/OHCd2IZWeofEM45hiX
         /lYJCIXH4/hjsIzEJKaM1Va3qW3RHXhXB/Ef6aBhp2o1XyJ2fg2HYCEK9mHHfaWfn0N8
         v22lOVf4mhGVUjOMRHxBCAPfUSPv6egliXmdpjaeuZ9+kM3kq2h8Di2/Yqg3KRRrEWrs
         cZp3BHssaXD1tt79X0I1THLSeI6sXfYUUWfE88p/rKxaOHfS+PP0CM8+kkW+P9jew53w
         uVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XB5MYP1ObQdhC9Im6M6kovBu00CUIfbX057+jD5STfU=;
        b=7JWQ0OHGVIyO28OMxqyIkn35/uEXLV4/OQoncQpsJwp1EvklqxZ6KumcsRme4gwA6c
         TFjlTURgQjBCFXSocvIA0SEHdUkXJ+gIj+lDQLrVtXfrM+u3K2RXTwdKHlQfEZqp+aYK
         gKwcsf813zajKCIkFlSiXMbeEJ5a12zmMIx0WtfM3A+XQ4tq+EhhubDM26CPjFNufqwT
         wkYIyZgof0X4av4eU9wr2YFMJmXYC8HA58AwNoSBP59NschfSbFu6LSLbnhjaraIpqBm
         UnYy1Hbe053P7YLpNzwBSRDdAexeiTCTAUPz2jvnVH+XeeVzcEO26HnE0D7LdDiJ3iK1
         lJUQ==
X-Gm-Message-State: ACgBeo3IGTiZGCVub714AlvBvSPi/SiecAG2xGv4tI6VCjPMbdyQmf+t
	DvX9F80Sg0M15m+bkpK4IgY=
X-Google-Smtp-Source: AA6agR6WQOQwzUrL+8I/1eLkVEaS4OfvGTklYYUB7u3jpPbUvQNJmwIzmGjEi4DW5MynTEsu0+WmnA==
X-Received: by 2002:a17:907:7ea8:b0:731:4fa1:d034 with SMTP id qb40-20020a1709077ea800b007314fa1d034mr8444116ejc.758.1660501749019;
        Sun, 14 Aug 2022 11:29:09 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id f7-20020a056402068700b0043ce97fe4f7sm5195487edy.44.2022.08.14.11.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 11:29:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 6/9] soc: sunxi: sram: Return void from the release function
Date: Sun, 14 Aug 2022 20:29:07 +0200
Message-ID: <1868640.taCxCBeP46@jernej-laptop>
In-Reply-To: <20220801030509.21966-7-samuel@sholland.org>
References: <20220801030509.21966-1-samuel@sholland.org> <20220801030509.21966-7-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 01. avgust 2022 ob 05:05:06 CEST je Samuel Holland napisal(a):
> There is no point in returning an error here, as the caller can do
> nothing about it. In fact, all callers already ignore the return value.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


