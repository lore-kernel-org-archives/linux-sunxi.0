Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E82408C9
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 20:40:33 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f730c1253fso17092305e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Jun 2023 13:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686343231; x=1688935231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPgnQLqXTt4YB25bp209lVVpHHoRaGnNRD+oFENCD9g=;
        b=AyOGx/o8hlXIfHiH21oqAt8lj9yIstJzhy1Qzw08KWaH21dsM/Y499oUjCjqJ0s3HI
         zhSxa2OUQsZUb5X4cwQHGLYNGO/IAtZ5DcnaoK9CcZrQKx4kQwlnhj6bBzQ+0F+W9oBu
         3cmDtFl777AlOhLRRi3+2j23IH3gzEUFcJ+giCaq3qMpVcClsvwlxVFzHgMv3fRVCwTm
         vRvOlNLHXOYTsi4Cuk6s9wTMrfrdk9Z/Vn/Jii/1Q4IngS4wSm7wc2jtLP+52QaPGD5g
         MN/W1QfzF3h4Bo7gBqYvo9AQ0CU7fZMbuC8h1MTr6Boq3EJ1jfiSd9x7PPWJ2Bt/4TyG
         ljSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686343231; x=1688935231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPgnQLqXTt4YB25bp209lVVpHHoRaGnNRD+oFENCD9g=;
        b=NUVohP5/jBDjgrcJa3mzZ1dmsakx9X5Imy2aMjT5y1Z/t4huSAPl/wgw6yWn7FlpHk
         pqxW2gJ4SoifLt02KAmbl7rkEUdxf5LX3y+fM1NO596YRT+MP8BTs8YnM6XboxIgKvDK
         VN2HTdW0Pvq2TenkGWzb6gHzRpf0PizR4GpQLMwdKP88ksZ+6ss3UdFlxmp1d+bYMA6L
         MDV7KPZmOJPdK/ySDerzf3YrmerRyr20Qg1CzDgHRSZpiEaBkRRU4a25ptTt2k28Ckhl
         SfcvFB5UiWWNZHoL3x/5O1C4lvdQMUvejur0UhWj7K+snuNXWDVXAeAsgyjmcNi8hW/8
         IKvg==
X-Gm-Message-State: AC+VfDzgocRWEWZbKH1MPRxAQd8adwmZhOWrZq+vdGAB0wU7mGL2INa9
	SFDESR+XJeZ5ybnn9n65rzc=
X-Google-Smtp-Source: ACHHUZ4XZcL4vD/0U1Otj1qMyW1YQAuuJZW0d8/bzAB7mLXTxbY0zC9JreXfGy3BUwvI/tVdgTmFpw==
X-Received: by 2002:a7b:cb98:0:b0:3f7:948f:5f17 with SMTP id m24-20020a7bcb98000000b003f7948f5f17mr1636631wmi.7.1686343231375;
        Fri, 09 Jun 2023 13:40:31 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f605566610sm3617216wma.13.2023.06.09.13.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:40:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Marek Vasut <marex@denx.de>, Sam Edwards <cfsworks@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] phy: sun4i-usb: Fix of_xlate() argument check
Date: Fri, 09 Jun 2023 22:40:30 +0200
Message-ID: <1935276.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20230609105621.1410483-2-andre.przywara@arm.com>
References:
 <20230609105621.1410483-1-andre.przywara@arm.com>
 <20230609105621.1410483-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. junij 2023 ob 12:56:19 CEST je Andre Przywara napisal(a):
> In its of_xlate() function, the Allwinner USB PHY driver compares the
> args_count variable against the number of implemented USB PHYs, although
> this is the *number of arguments* to the DT phandle property. Per the DT
> binding for this PHY device, this number is always one, so this check
> will always fail if the particular SoC implements exactly one USB PHY.
> So far this affected only the V3s (which has USB support disabled), but
> the F1C100s also sports one PHY only.
> 
> Fix that check to compare args_count against exactly 1, and the args[0]
> content (requested PHY number) against the number of implemented PHYs.
> 
> This fixes USB operation on the Allwinner V3s and allows to enable USB
> on the Allwinner F1C100s SoC.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Nice catch!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


