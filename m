Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1668A33E9
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 21:24:19 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id u15so26089916ejf.11
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h+T3blva0+11RoqIrydPcJ4eFJjGut1/Jrt7tVg7N+0=;
        b=ieIaUBdjjumm1tt9nZ7RwmVYSKUOyskQiT/Zo2MH/BHJXDWBFHWOw4Ex9uBep3qLOn
         /4NkzjFLiRfd8VX+0TBI08caL8KESKFhzrop6LRekviFDBbIDXovKmyKzNxqHsdhWlG8
         6LWozquA93d8zv9wcjJD8XrVMEBLz6qSZTnDOdtpqPCwSIUQdTZ8DZ/wJW2crfOcfR/5
         cyf2nDxpN2/JxFu1/nL5B/+mz3io18LWNeyuhF2WlGpRjMTnua9RejpdiI+V6RVSvDSj
         EgjS7XgDJmR5mXe64H38kq87ccwR6VMKGocKJIbEdc1ppUs3J9Na23jEHIcZcHXGvYUM
         TnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h+T3blva0+11RoqIrydPcJ4eFJjGut1/Jrt7tVg7N+0=;
        b=45mdbHDM+l5KvowoFIbqc1DbagJ5Ft9Iy46QzP4OVAZf1wilfaFzH2/Re4JG4sN68B
         1YZi7Lp9JNhx/YtoAAv0F/MvNZ83Nqkfbo9qPfokkXQfR2eCDTEB408XAacem8H+7CCf
         hQbH9VVfrNcfs2BAaG6k2pkJebquitUdgsbwwgD0bN/X9lCAvYma0hvYnB2oimVLMLLu
         Vl9Wdpr8OhvQeTLYp1hd99tpiMPFdNV7CHrGW9Mv4iYi7crQgGG7kd5q0DzD5aZGYiow
         QeXv+a7bVFcMHXyheQhoc7LxTk0phGEy7OboCjzvBMEH1seZSEaKVNxRwRM8z7B+BH4u
         hxtA==
X-Gm-Message-State: AOAM530Kpkj2JnFO7cQliqkCOWgWfDkFk48IQsAzZeFV4RdAsd2CUI5Q
	LnG++dK6TAVYkF32I0vJYrM=
X-Google-Smtp-Source: ABdhPJyzpIDmLRKrpcal2QQTXhVK62etz5I70moUWqToVxvT7R471LddteKcEYb4KZGQw+rF8f6bsA==
X-Received: by 2002:a17:907:7f8d:b0:6da:b3d6:a427 with SMTP id qk13-20020a1709077f8d00b006dab3d6a427mr13075143ejc.509.1650835458308;
        Sun, 24 Apr 2022 14:24:18 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id b8-20020a056402084800b004207931a9cbsm3865243edz.36.2022.04.24.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 14:24:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical
Date: Sun, 24 Apr 2022 23:24:16 +0200
Message-ID: <1891070.PYKUYFuaPT@kista>
In-Reply-To: <20220411050100.40964-1-samuel@sholland.org>
References: <20220411050100.40964-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. april 2022 ob 07:00:59 CEST je Samuel Holland napisal(a):
> Because some newer hardware variants have multiple possible parents for
> the RTC's timekeeping clock, this driver models it as a "rtc-32k" clock.
> However, it does not add any consumer for this clock. This causes the
> common clock framework to disable it, preventing RTC time access.
> 
> Since the RTC's timekeeping clock should always be enabled, regardless
> of which drivers are loaded, let's mark this clock as critical instead
> of adding a consumer in the RTC driver.
> 
> Fixes: d91612d7f01a ("clk: sunxi-ng: Add support for the sun6i RTC clocks")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to sunxi/fixes-for-5.18, thanks!

Best regards,
Jernej


