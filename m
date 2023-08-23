Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70226156E6
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 19:11:16 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so93531761fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 12:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692817874; x=1693422674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/z++L67LsgS5CeBHRbV3vQihN14HaxRSYn9ahWfvaI=;
        b=j5NWQxKgKxiyKasFqwOGDRncYcWX5tb0apAk/rligFF/9nY20cTHqm7QfzSbRog0Iv
         0zbr1xpLQEWG8tXsZL9ShwNI1thvgYstvYrUA3N0ykI4dn9niP6hJEqHDPaior3M107f
         da4TUZIyTOvU6BPFriAjPDBO72Q6UOnYo5ewB4aba1BgpTPSFm2HU7jvv7v1dfSb03DJ
         OXfluvr5aF8yRJOTsdTm/PR65j/oe851GBxxk6YleLdenxTv7EmHcj5qY6ADMzNQc7f3
         zeG86A0qlUwhgdbKVfM7B0SvA7rueFk3uffJeE/i/mxGUK8SDkOCy7I4sNO+GbH8xdhr
         grGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692817874; x=1693422674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/z++L67LsgS5CeBHRbV3vQihN14HaxRSYn9ahWfvaI=;
        b=NxetlOSpvekDzXu7tEWqaE90Xe6jzF3TiBZyIAKnCEqIcH1wX//Iw62Tkduhgul2MB
         iG/LR9Tl/UdYvm526c5txVmuqgd87cqjXUNLHQH7arhc42IwXQIzfFp/j1xokS4qMTr+
         a6qR6VCpszcEIXRip9Ogqa1LxWtgscn9n72TzKJ5ZOg33wJosIE/CFLMJbFddKadv8DO
         rqZ+c744Fe3mlHVfiljkfXslMyB2pVQYS6lAG7g/MD1O8FviDUr7O+3vYZtgfC+bGkQl
         AAJQRi4YGr9N88DUU2RQVdr5gIL3R9PaM07GGD5l8J+zG6rAHNhj6WO00Gu5uKP/MxW2
         aMVA==
X-Gm-Message-State: AOJu0Yypa8Ju4Ls7BnZNm1bad0VBOsMd5cBkfK9rTToOn0dmzbxYPRpM
	6sYlh0ascgWt33oKQLgKtSU=
X-Google-Smtp-Source: AGHT+IFTKofw15kfmJaES5wnAO8K/GJ/mqB+Un+40kpOipUOrSBoQbYDlcpIRBkEZyL3pswrSrTZ0Q==
X-Received: by 2002:a2e:9104:0:b0:2ba:5ca7:2311 with SMTP id m4-20020a2e9104000000b002ba5ca72311mr10376164ljg.41.1692817873870;
        Wed, 23 Aug 2023 12:11:13 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id rv6-20020a17090710c600b0099cc3c7ace2sm10189735ejb.140.2023.08.23.12.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 12:11:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] genpd: Explicitly include correct DT includes
Date: Wed, 23 Aug 2023 21:11:10 +0200
Message-ID: <12268735.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20230823170438.2489746-1-robh@kernel.org>
References: <20230823170438.2489746-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 23. avgust 2023 ob 19:04:37 CEST je Rob Herring napisal(a):
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2: Previously sent for drivers/soc/. Gathered up files which got moved
>     to genpd to new patch.
> ---
>  drivers/genpd/mediatek/mtk-pm-domains.c | 2 +-
>  drivers/genpd/mediatek/mtk-scpsys.c     | 2 +-
>  drivers/genpd/sunxi/sun20i-ppu.c        | 2 +-

for sun20i-ppu:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


