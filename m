Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A027C21CE1
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 18:22:47 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51492ae66a4so6633069a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686594165; x=1689186165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKqLQJH1mqzuRzsiJTvJ04rfDSsqHrrA3iBCbUsSHOI=;
        b=T/UJRDl9pOyQ3VKr8bq+HySE8u53jPaikn0peb1zVwX9CuhAUw4k3534zSzLozIQ9N
         HjwDar/76Lpgu9u93/0q1djWVtidybQ842u0ZOQ9wcRR1SVPweBamtp4hVueu7CmckxZ
         oFa/h95Nui+af9J+pwpmVGOq9kdaUrtHzqakK7OELmRk537vkUhpgvueF71cMHQQWdDB
         8rB7mwoKQgDvY4M5lkbqqbAV4239QPN+025gzlzz8M4R6Tcd4y8ZyFzcVC+wgEiXrum7
         z7U0coETkDZnD64r54ssnqfMLxX9lNsY2Lvpeyfh5XB4Ao71wKaevaCNFCV/jWe2rpDg
         XZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594165; x=1689186165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKqLQJH1mqzuRzsiJTvJ04rfDSsqHrrA3iBCbUsSHOI=;
        b=jTbqS5CUptY7PdPQYJo/nzHgH9uKKb8H+9JR+oP6AP5GAQHmBfpqCrPTLySYlfPP4x
         xe8EpOnGRHQx9UQtWYyePp+X/SZQZJJ5+Bwf/W+OQTGJtgbGsigYEZnShKGT2wb6gG3I
         OJwNnbrdaa09+fsVjN6TIKeTBh4lnFtfcVkXP4UJrOj6QQxwBFHJfEjizYnBK1zXDEEi
         ISK4zazLU9Imp09k8153SMEp+Gxh+PuNIEd3OuHBKOPR07Avkt1MHQhL1/LMxxr9SDqe
         0eLdliyJUV/zZmJhZBAdh7r1Kj0BisMvojoi338LeAF1w7BUGE37YgVRGFCCqwwSNBwf
         +G9g==
X-Gm-Message-State: AC+VfDxICbvzsz4X16cdd9VzUis6zE3BUDe+Xgd4x7SZAPtwXlUPFHog
	r9PRDcqQsrByfH4/iaoq+KU=
X-Google-Smtp-Source: ACHHUZ7SIa1EObO/QHbeisX6ifIqewTz5w73pxUAYksizGq0x9vX6Bwlibfza1dl8IakcSAsMmJE1g==
X-Received: by 2002:a17:906:fe43:b0:978:9235:d428 with SMTP id wz3-20020a170906fe4300b009789235d428mr9303920ejb.36.1686594165554;
        Mon, 12 Jun 2023 11:22:45 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id c19-20020a170906925300b0096f67b55b0csm5575839ejx.115.2023.06.12.11.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:22:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add D1/T113s thermal sensor controller support
Date: Mon, 12 Jun 2023 20:22:43 +0200
Message-ID: <13282074.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20230610203549.1127334-1-bigunclemax@gmail.com>
References: <20230610203549.1127334-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 10. junij 2023 ob 22:35:41 CEST je Maksim Kiselev napisal(a):
> This series adds support for Allwinner D1/T113s thermal sensor controller.
> THIS controller is similar to the one on H6, but with only one sensor and
> uses a different scale and offset values.
> 
> v2:
> - Fixed SoB tag

It doesn't seems you fixed that.

Best regards,
Jernej

> - Moved binding patch before driver changes
> 
> v1:
> - Initial version
> 
> Maxim Kiselev (3):
>   dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
>   thermal: sun8i: Add D1/T113s THS controller support
>   riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
> 
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 +++++++++++++-
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
>  drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
>  3 files changed, 58 insertions(+), 1 deletion(-)
> 
> 




