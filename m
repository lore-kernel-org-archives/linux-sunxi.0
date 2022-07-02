Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EF31FA8
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 19:41:49 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id k20so6735431edj.13
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 12:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9eJyVdQ75UuSyrcb+kBiYjzcIzQ1vy3xUCOP9RbRlaI=;
        b=HXHFFIcaF1yjAuE0nLejioKWHb0s4yjkGonYkF4PC1P8B/mO3HIkXVI4zifz+XXpcA
         B9ohvtqCZPic3oA7vjxMM3OR7y17hyUADFqeas8+MKwpM4czc9hc5zfBTq/GX8ISGxlk
         IOYFIcDqSrExHv8F//dF/kLEUxRHEgqQ2SgMJ6v0Ux4CWpGoVN+Sxc7GXxvi8Peb++f8
         Msae8VoF0iMN6iggQ3Ocu+j1vv/CaLZ9hvwyj9UTDS2LF0IxYMpX7LtFlDdqvdg20BAU
         ykaTqRmsIs0+ZL2mlTnoz/HCvy9dxawe4RmnbpsTehq+jR52WOBEEAa3bTLK/voYyZwx
         geyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9eJyVdQ75UuSyrcb+kBiYjzcIzQ1vy3xUCOP9RbRlaI=;
        b=3u44IbD/ykdob0Ti8dsAwBvJiVFhEEQWTYdUbjA0YVMaUKw4Igockwl/hrHDetqtZO
         b/HMdS0l7QahWCU+LmvzcmrFATmmGDRqlJbbdGNCpyVz0/ZNxCoZCaG59LFMyshlQsl5
         SHkFkDB7TaoYnFlPYfPmoo0GQZKhwebqSF/iGchpFoJDTeGA3awNLBDzNBZd8YRYS3CA
         lGFGoxEtv+qIHiUx2KrA7U3xRAVFLKR8iolIziIMRW197+EucnxSFt9JGRphOz23AFrd
         0nyMhn/5jeEQQhjB9BPgDH7yGr/f8CXJlZMrsW/Qgo012RtJ2bnK/fMz/ULvv5e9b2QN
         m8Kw==
X-Gm-Message-State: AJIora8wsAZrJe5Os/jsZuu3UMsPWE6mnslLnrPG6rsZcPqb8rj2NHu4
	c2+KciuIAGlvtckR3bkLU5g=
X-Google-Smtp-Source: AGRyM1uB9edGY7x0ZwaipiwmVWzoA+aCM9tfI2GpMYREv65LtjFJqq/yRHMBOYOz4oE2dA5LduOghQ==
X-Received: by 2002:a05:6402:104a:b0:435:c7cd:11dc with SMTP id e10-20020a056402104a00b00435c7cd11dcmr27382503edu.335.1656790907483;
        Sat, 02 Jul 2022 12:41:47 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709063fd400b00722f66fb36csm11959562ejj.112.2022.07.02.12.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 12:41:47 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Default to the full MBUS binding
Date: Sat, 02 Jul 2022 21:41:45 +0200
Message-ID: <2114031.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <20220702042447.26734-1-samuel@sholland.org>
References: <20220702042447.26734-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 06:24:46 CEST je Samuel Holland napisal(a):
> Some older SoCs use a deprecated MBUS binding with some clocks missing.
> Currently, new SoCs must opt in to the complete binding. This should be
> the default, so new SoCs do not accidentally use the deprecated version.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


