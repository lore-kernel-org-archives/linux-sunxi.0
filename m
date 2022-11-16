Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE82D51B
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 18:29:35 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id z14so31167514wrn.7
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 10:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERYyKyRjwjlGO/N6ix60VXwlsLrg64yLVcy7mpteO90=;
        b=hqPr7d/V3fZKLMeVbutYZ0JtcE7oK+judWUHu7EAXUO33J8x+TOr/PUNxRipOtTso4
         F2rCXw0i26gd8r+25CAvMKuBjYFjhl3CgWoz95kuftIAs0xqMZSfYPO64SvuGkgmePU7
         6fKMCvTkNPGWf8iZK32rKZDTMLr2LwS7b4w909q+2QOb2wxbiv25z2kYlo5OsIsZm8id
         bDzPJtNdu/WpfuccOio6k2CrwCDyfsKgWwWmwq1aK5gwQN4gUJO9wandBFHKDpp05IOD
         +dgtjZGb/s8K1DM9zsT06gEXghL883cViavEMLLi301W7PLES17yxgM8OAT8Krf7g0Ow
         vm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERYyKyRjwjlGO/N6ix60VXwlsLrg64yLVcy7mpteO90=;
        b=UncoaJW+eMPnF9y28BFtjBIkE58rmGKBnGONxiFPtDuQVOG3dTg1ChHpi+25DBx+UM
         tbBOL2h/0X0GLm3Slum1nxUqKdE+zLpOQcHgeYEq9reW+qbOXuxJtnuxejYR7TI8pzht
         aNbq3w75C92f8cKBbI7fC8Xu+J5OpuFPPpMRWzcizFjOHut/WBh9LPNQd+eaBn6EfHvA
         gRD4rUGLxxJPFqZpn4yKAOwfwDq4PNKKkWSswICVswXnsLZVavdts7PpcLk+hRtEQHjZ
         APfxhyPFz/8bOa6mis8pHgxMmbyS7VsIKQmgZtJRzxtEFJSZkL7hWSiZR9hTfcaMV5Vv
         3K0A==
X-Gm-Message-State: ANoB5pmN6PSHfS72HQHtxbiQf3VMOfpCHLwe0I9JSiewvFzzxADtY+7y
	7Sv3VGKoev6UsZzcGgLNlCg=
X-Google-Smtp-Source: AA0mqf5cEs0Y3RtVt9snW109hI+LcRC0mRYfN9+j0PcJpB67W+6JFrMr4YfiTFsC7TYDDbq30EmHQg==
X-Received: by 2002:a5d:4562:0:b0:241:8103:769e with SMTP id a2-20020a5d4562000000b002418103769emr11599566wrc.240.1668623373384;
        Wed, 16 Nov 2022 10:29:33 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id co19-20020a0560000a1300b0022e66749437sm15843182wrb.93.2022.11.16.10.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 10:29:33 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/3] bus: sunxi-rsb: Fix poweroff issues
Date: Wed, 16 Nov 2022 19:29:32 +0100
Message-ID: <2654128.mvXUDI8C0e@kista>
In-Reply-To: <20221114015749.28490-1-samuel@sholland.org>
References: <20221114015749.28490-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 14. november 2022 ob 02:57:46 CET je Samuel Holland 
napisal(a):
> This series fixes a couple of issues that occur when powering off a
> board using a PMIC attached to the RSB bus.
> 
> These issues only affected 32-bit platforms, because 64-bit platforms
> use PSCI for pm_power_off(), and the PSCI firmware reinitializes the
> RSB controller.
> 
> Changes in v3:
>  - Adjust patch 1 commit message
>  - Clear the interrupt status register after polling
>  - Add a patch refactoring how the status bits are cleared
> 
> Changes in v2:
>  - Add Fixes tag to patch 2
>  - Only check for specific status bits when polling
> 
> Samuel Holland (3):
>   bus: sunxi-rsb: Remove the shutdown callback
>   bus: sunxi-rsb: Support atomic transfers
>   bus: sunxi-rsb: Clear interrupt status before each transfer

Applied patches 1 and 2.

Best regards,
Jernej

> 
>  drivers/bus/sunxi-rsb.c | 56 ++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 31 deletions(-)
> 
> --
> 2.37.3


