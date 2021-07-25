Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44AE173
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Jul 2021 05:44:08 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id e19so10079955ejs.9
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 22:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QY+0BMkWlbBZLf8NjCu4UdB1W7Kp1V1Npts+uGib5k0=;
        b=OfKZvg5r05dTZaCPK0J/uk+0iq15RC9aVhh+9wIn3Do1byv+UFxgsOcGbtaLwKOvpj
         shkfpu7yLasiWRO875xuBO62BFWrWFuO12hDAb9oIitKl6xaeQ2eOIcnOq3kKyn5OHi6
         NHqT/DyjCwv/DuaZedahmVWF5bXGePbfEs5ECMtoLG9jQsAdWnhwhk3mAr5jYPVBx72H
         WpK5Oszt+rWg/JjqOyMhNNsDj2XrcVlb8ChRzP/klbouEavFxiQpqBaNg+aOgDnBHf40
         5/f6yhT4HkfaqkTHQltP/s7TgsLx+J/WyNWFnLlSzJssNNFZ6eLwsgpnEnHG4G2tG+t6
         CWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QY+0BMkWlbBZLf8NjCu4UdB1W7Kp1V1Npts+uGib5k0=;
        b=oNLn67WmaTtE5voL4ejsIZolEPQXXBMXHnrbQkO95OyEpbQdwodhKKJe8g2OfrbqxO
         vy5GicKVb/wjqjt+GIEZYsbTvt8W9AoHd2GnIZtveyFXhFFxrjf5sBlh6uG87/drVfOf
         wPSsBeWLKFceVty8Jit721se6OsTpcjShJVn95TKJNezYL6gABxi96LZ//MlUTsqDicy
         /MATl8QJ1trPKdIeJ18C109XiRHihDszJDRDaRi82rd3uR3AiVKxINQst2xMwebfC57N
         6X84IlAZjp6Ee/Z4xJ6MsoYc0wnx37obr9LWj2yxEwEDcYHu1Z8YAX8uDFdtuXbdq1dt
         a2jA==
X-Gm-Message-State: AOAM5336Vb1b9fPT4gzTuYKVdmrsXM4zNO1UYkCml01PnJ/XXbpYpG/r
	5rIcKoGvxB8bHKK1C5maABI=
X-Google-Smtp-Source: ABdhPJznzroxcAGpmNL3owvGqD5iDjbHdakw9PGzF8T5rjlETybHcPm7OqrxGEby6yJN4NtOxlbqsA==
X-Received: by 2002:a17:906:24d3:: with SMTP id f19mr654767ejb.391.1627191847250;
        Sat, 24 Jul 2021 22:44:07 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id op23sm13069188ejb.7.2021.07.24.22.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 22:44:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 03/11] rtc: sun6i: Fix time overflow handling
Date: Sun, 25 Jul 2021 07:44:05 +0200
Message-ID: <2672991.hCPy0aSqvS@kista>
In-Reply-To: <20210723153838.6785-4-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com> <20210723153838.6785-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre!

Dne petek, 23. julij 2021 ob 17:38:30 CEST je Andre Przywara napisal(a):
> Using "unsigned long" for UNIX timestamps is never a good idea, and
> comparing the value of such a variable against U32_MAX does not do
> anything useful on 32-bit systems.
> 
> Use the proper time64_t type when dealing with timestamps, and avoid
> cutting down the time range unnecessarily. This also fixes the flawed
> check for the alarm time being too far into the future.
> 
> The check for this condition is actually somewhat theoretical, as the
> RTC counts till 2033 only anyways, and 2^32 seconds from now is not
> before the year 2157 - at which point I hope nobody will be using this
> hardware anymore.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


