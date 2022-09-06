Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0B386F0
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 21:11:05 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id lx1so26011996ejb.12
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 14:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mV26t0BGARVQ09o/2g9pvdhqThByL8uLrjECrlnebYg=;
        b=oaTIFoVT9YhvQDNTUPeXH5niGPPHyVy0Nfdk8BnqhdeOO+tmXPioDnG8ZjIMpKqFPR
         hA3LTReT9jaGa9mo+3NXXWDn+GMU9RqHCq4iZzRRS0Waln6uRDEZMXehJ+HaHpm/U+Ot
         8Eka4Ziqjbt+4+RLVH6UOP1FnoEbbMKIhOrBo/1FI6SOR0krU2AAP/uO01GzJxeM/V5/
         PzseVuJfuIKIYGmNt7dT2FfiifYUOjhpDV5pqaC1CQoyoRLW40m9lbnKv2ITbP8xSv6F
         B8s6AF0ZLl/8D3bBJ5f6SKlKW6BKfWmi3UWlhnAMphkFjp6Sef9o2ffjlh4aMbE3cfcG
         +f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mV26t0BGARVQ09o/2g9pvdhqThByL8uLrjECrlnebYg=;
        b=oOVYJzXR9Lh6uWMG7QVcLixRYsHZMzyqbJjGNntubnSvT/SRdnzrcfd59cF6A/tPR9
         xfHrCjRdpnEHCQH+OGfwpwukLrao+SVpSlL1jQgBLEePgUhWbusyORWs/wX1Zy1YSaHa
         /7xKLR56WhrlalnAl5T8pbxE9ndm8AOeKgy4vH6JLn2SUR4fDd6IylSfu0YgbGl6rGvl
         tQ23ODpFFE1hIc2zLRH/XokpJTVfsR+AtcJ8MQLjrK0+5WPohEZyjI41U3PewRYWsGqR
         D+bOgKawLnrn+7mp3BiQLq6u9vew2U9WIGnaE8Zgq6gmpGu1wgb+jNZkRPvag9tEZlMU
         TmDg==
X-Gm-Message-State: ACgBeo2UiVOL0nrI9Wy4YxzDcQ10m1bhdlRcxkxZUMdQyPQ5kgNoY2Ub
	Lc9mAwLAjwJ/KfCHJlGDBPU=
X-Google-Smtp-Source: AA6agR45P1ep+mRBlWOWh6RkBeAfA/HTJsRbDZWPX+2VVKxBFzJardUIyVLow+LchK62UyY6y/PH/Q==
X-Received: by 2002:a17:907:a057:b0:730:a2d8:d5ac with SMTP id gz23-20020a170907a05700b00730a2d8d5acmr245371ejc.764.1662498663846;
        Tue, 06 Sep 2022 14:11:03 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id ev13-20020a056402540d00b0044ea683d04csm3509339edb.14.2022.09.06.14.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 14:11:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a100: Add I2C DMA requests
Date: Tue, 06 Sep 2022 23:11:02 +0200
Message-ID: <22775214.6Emhk5qWAg@kista>
In-Reply-To: <20220830020824.62288-4-samuel@sholland.org>
References: <20220830020824.62288-1-samuel@sholland.org> <20220830020824.62288-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 30. avgust 2022 ob 04:08:24 CEST je Samuel Holland napisal(a):
> The I2C controllers in the A100 SoC are all connected to the DMA engine.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


