Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F91B15C8B
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 20:20:01 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id gh17so1244091ejb.6
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 12:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TV3EVJDFpv4jOhLs+2U0Y+CL7NCFB0EHmk1Lgv928eY=;
        b=BSQJhsS3OA+Ovo0B4IA5Je8a9KnMZOgilgB96Hqy83RmfZIu8I/3bF8NuJD4Bees1s
         LZ56j4nj5Z3SUuvqOJ+MuopONKJCBSwTalZH2rU8+JNhYeJ5QoyCTotj47BN/86AIyny
         mK69ky+rSmdHF5AWDgv12DToeZ+qqiDOEilVD3ULnKBahQzA8VfmEnEo4SMAGS25VIR9
         S/KW6AExvmAGyNWusrzTVOsdaviAT2WIG7SidYuCvZDCPuEVfqIw7ZjtB2JTvsfqWgOm
         6yh6cZ5ewu4GraN+COcaZVrYgTsdfedbiPMdz7yXok3Ood+meGLxZle6rUNQBwdooxmV
         1PjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TV3EVJDFpv4jOhLs+2U0Y+CL7NCFB0EHmk1Lgv928eY=;
        b=c8EypMBbdzXcyrTXkK/3e4KDWnBQlJ6A1SNSdYu2LBzymB5+yKR2bDgRzG117++klA
         jfazONYWVIe2vCRsA6MSAasYT7YQl5by2U5mFXVATur4TmeYzJQQfAPnKg3QiYU7AUZC
         ukpLuxa0DFYeG875xC2qX0KI4Vw3kn5WBfMnfH9j7t839dRguynX7pHbWAM50R7bE35o
         zUFmKRpTyHfJscftI8XdQGHBvdmMEX/fSZwqXtbKzAOKET8Q8OiBNrbTSjzWRszpOdzY
         IYH6Rtj2XzRreGVTL5J8APJdYohqn0w2dAd5aqwEjQ6wBIoYi5DWduoLKETkl6dGbCZC
         SiMg==
X-Gm-Message-State: ANoB5plwGGkLum4Ly2kcRUasg5Y8zn9UVK97uQTBtWkT2n2aQ6ti9k/K
	IF32VJQjQsIuhovXg5V52oA=
X-Google-Smtp-Source: AA0mqf4ItSWy6T3/K9bcouoUMH6PqWFkMCl6j7AE3eINXvaqYbYe9sBm4iEB2h+5BCwvs63xemtfOQ==
X-Received: by 2002:a17:906:99cb:b0:7bb:7dda:7d3c with SMTP id s11-20020a17090699cb00b007bb7dda7d3cmr22532235ejn.182.1670271600173;
        Mon, 05 Dec 2022 12:20:00 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906768300b007c099174a12sm6718941ejm.178.2022.12.05.12.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:19:59 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/5] clk: sunxi-ng: Remove duplicate ARCH_SUNXI dependencies
Date: Mon, 05 Dec 2022 21:19:58 +0100
Message-ID: <13153056.uLZWGnKmhe@kista>
In-Reply-To: <20221126191319.6404-2-samuel@sholland.org>
References: <20221126191319.6404-1-samuel@sholland.org> <20221126191319.6404-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 26. november 2022 ob 20:13:15 CET je Samuel Holland napisal(a):
> SUNXI_CCU already depends on ARCH_SUNXI, so adding the dependency to
> individual SoC drivers is redundant.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


