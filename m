Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0624368F
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Oct 2023 15:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMy0MSgf"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40837ebba42so2479235e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Oct 2023 08:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697555751; x=1698160551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MistYT0O+xtFeV8eUpfzBrfB9PhBrhg1XC3ts6C8zrA=;
        b=RMy0MSgfVwaIrcyS6712PxgkqONOhs51RK0MLz6UZiLXBhqsC/JDpKv+OY58DuxPkJ
         VNsNivbwaMPK9iKWpgo+TlX96Q451uMiknE4vgGLcvnClbJGSxdVxqUlcnzWJrbM2sd0
         Z5wWSy24Z1KQglDGVif1hiwoEgpd2gR0tEQMmrgVcOLY3b3TdDBCEcDls4eRSKLtYpJH
         vbErk9hOIFW4Omn4MHQ+bVc+zoRjr01X7Mr3OZ/Xs8n9DHT6oM32HlUpIfp3OQsKpb0S
         eD1t5xv5STVAbN8bUnEQTR9osq4qGt7hy6z+7vvxFKEtqObBvGUu+SCcCuipeuntCL7A
         li3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697555751; x=1698160551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MistYT0O+xtFeV8eUpfzBrfB9PhBrhg1XC3ts6C8zrA=;
        b=FrzPO9iyY8aoh0zLObJtHKroy812YVyylSc1HPhRaJQWRI7LAHo/y6CXZ1KjsaB+vv
         Nkues06svyHf8E7IDzBjdpwRXoRvzqGkt30jNZl03MjsdgZTxDhQxJqVa+AbdOBF8NYg
         sRZsFYyRGxgG+mym/Igcf3Hc2NUCyubWwCMyZYeCmA8BoJ6Vc6c4gqSZ0RW3mhbrPzCF
         R1NFmfremQkr0LHuUENvF5H2W2H1thDhHvwW2yPt/URorwPMwyeudku8o6YhLzJfoXK1
         YVJAEEgqAG4uGx4kmdo02uwGjbiTboRZpb1J3TJy1noCcQk2LisGRlJ7Kwftw4Kq2Bzi
         QCPg==
X-Gm-Message-State: AOJu0YxM7/L8QDncX+A4uWpY2lDikU9g9Y8o3z6vmwftPTK2E4nphHYe
	4+XRiv+/TaGyyL2ePRuGFRE=
X-Google-Smtp-Source: AGHT+IHKCbb3uQi1FPQV9CQjbREuImnNQIiDyC9e6aI9dmu1hJ097A01G1cubvCcq+5joxvCI0XhSw==
X-Received: by 2002:a05:600c:4585:b0:405:3e92:76db with SMTP id r5-20020a05600c458500b004053e9276dbmr1969534wmo.5.1697555750823;
        Tue, 17 Oct 2023 08:15:50 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id az15-20020a05600c600f00b004081a011c0esm1548772wmb.12.2023.10.17.08.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 08:15:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Keguang Zhang <keguang.zhang@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH] irqchip: Drop the custom fixes for the same irq_chip name
Date: Tue, 17 Oct 2023 17:15:49 +0200
Message-ID: <5737787.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20231017122718.5062-1-keguang.zhang@gmail.com>
References: <20231017122718.5062-1-keguang.zhang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 17. oktober 2023 ob 14:27:18 CEST je Keguang Zhang napisal(a):
> Since commit 021a8ca2ba23 ("genirq/generic-chip: Fix the irq_chip name
> for /proc/interrupts "), the chip name of all chip types are set to the
> same name by irq_init_generic_chip() now. Those custom fixes for
> the same irq_chip name are no longer needed.
> So drop them.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  drivers/irqchip/irq-sunxi-nmi.c | 1 -

For sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/irqchip/irq-tb10x.c     | 1 -
>  2 files changed, 2 deletions(-)



