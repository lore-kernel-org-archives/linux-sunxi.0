Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8016A1110
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 20:50:02 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id i21so19075890edj.10
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 12:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbXFOKeTUlYXn2Mg9KmKqBvEsVbH8a0lnnF+t/CHaYg=;
        b=My3IJzngB/YmGua1bnDr4KRu/psqtSBrjcP49Gz4NDfNxNbefC/yBb47pIj8h7ry+d
         VcFJX5+pYd3EpAtPYndWLxoXJDJaexmUGaosAK5p/GlJ4yQx1UeiTy/YMnFKS1UJuyC+
         0/M4iZ1nNABU8xtIkYFKEmtSMHwEov1KmDNEMd9xQnRmPod+cI9oBGtONSfsdN7WNU/7
         8EWNotEOdHHEMk48RzK2XJUJ1CKWhLs+Mh9x+ChVOo8xnON1Rh0/5RCHEqCIyOvDS2rD
         S93dH2Fi0lNvMHUne65iYpnZkIsXaePGmIgAraHs2vi1qzrqZUnCemkTrNb9rRQdfri0
         WjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbXFOKeTUlYXn2Mg9KmKqBvEsVbH8a0lnnF+t/CHaYg=;
        b=7kSX7siwP6mbVG53EokQDq2aMI76MAH+Sr472sP0T5zxt8/gINtTOC+xcohQ+MnbQ1
         nTs7m6Lfvtwy5hzUHUR3t7x/usFxF5v2RxbaVQEGXUctYtxbTtsFBEFivh4ES1UPxeTl
         20AYc4UH5dmDWsh9wJkGygYUTKN06fivG8UD9u7xxiUi3CU0I9elDVt32aAofkiqRpu0
         A4rtHSnxGIh5d+mjNq+2xTBmBu3ePHxHNhx46tx6e/0qAgkf9jiZVZB/AI49hSzj2U6X
         oGvEyAT0YLU8y/zW/wW+DIsfXJXjdIwr2xO91byPV8hkqk0FwH6r8KXwInuoeYV6FqOM
         k+sA==
X-Gm-Message-State: ANoB5pncpIplAd3PDRnk9RugGcfRKAw8XuGdedtODP1PqwW9FfOQ63H+
	S0HcH64sQEZy+OSBdqXkoFY=
X-Google-Smtp-Source: AA0mqf7JKyTLxwyn9ebdI2jJKDOugaX3DChyW0LE9ULhC7qV0de1AoKqcbD5HjYp/rHBaR/CC5pqlw==
X-Received: by 2002:aa7:c446:0:b0:468:74:9820 with SMTP id n6-20020aa7c446000000b0046800749820mr3304216edr.288.1668459000719;
        Mon, 14 Nov 2022 12:50:00 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id v2-20020a170906292200b007aacfce2a91sm4605452ejd.27.2022.11.14.12.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 12:50:00 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 2/3] bus: sunxi-rsb: Support atomic transfers
Date: Mon, 14 Nov 2022 21:49:58 +0100
Message-ID: <3506150.LM0AJKV5NW@jernej-laptop>
In-Reply-To: <20221114015749.28490-3-samuel@sholland.org>
References: <20221114015749.28490-1-samuel@sholland.org> <20221114015749.28490-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 14. november 2022 ob 02:57:48 CET je Samuel Holland 
napisal(a):
> When communicating with a PMIC during system poweroff (pm_power_off()),
> IRQs are disabled and we are in a RCU read-side critical section, so we
> cannot use wait_for_completion_io_timeout(). Instead, poll the status
> register for transfer completion.
> 
> Fixes: d787dcdb9c8f ("bus: sunxi-rsb: Add driver for Allwinner Reduced
> Serial Bus") Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


