Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78B91859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:33:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ss4so8196707ejb.11
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxqpBxInus76UY+mNqRVLlOQOHf/+MnvHAEydqm6xJw=;
        b=WocRiw/Xz+Oj42QiFtpqh/UWGt/5rvqllQOF+T7b86NPRYH9pmNp8T9u5uzHG65Ybp
         rgn7av58yQB7GZhrmX9BG995Gag6M+xpg18y7o2+fwyLShFw2IlDVv+ACTNZ6Zvyj9ic
         QXyC6cfuiQVKE+CzxdgjN6zBERUEFUdowzakowZUZwic9uBJDyNTQSCk9LgCafEQ2q6x
         WeIs5mp86VtHNIj9to/lPbU3K/GWpS0YHxhCh2R43J5wAqRrXbYgRlYcbgR2+swmK3t6
         IENAbF8YQFNSo2RdTzoAHdFsPqhHK3pt6rjheG0TdVV+E8hI0bSTtV+X0qxu0TbFYXQm
         OGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxqpBxInus76UY+mNqRVLlOQOHf/+MnvHAEydqm6xJw=;
        b=4TB1tMex8h+Z/nNYeoY6tBscTIqLo6n8erXvgT6KlGeyKoWJ5fUaXCvdZxlT+ljR1Y
         z22dHoPJex6w6RJ3TM27CN4/q9LOGImw8ORQejhsAocutYLID+g4PZhgjqmRdTLHn/gt
         99nVGoHtjK654ySBMM4J3JQrd7qzZ7DDDh7FMKUoZJCCAGJD4ogtf6LaSLMG4AsBCf8y
         64RW1PjghXo8VKT5AVDZOVsoGr0JA8wDKWXLtq9rTZK79G87ndqOzeQwy5jtfCqB2vEK
         PcT6XEPZ+ZTnR79FXs24eoqaCRnjcuYKwRw/iaLsYGfZirb3OsfBTds8LzxDHQgz363f
         JssA==
X-Gm-Message-State: AFqh2kp5ih1ZrdZaynqFnrf0FJOtiC9JQleLLMcfqJZSh6+Be2uPEZAE
	injKsEFElh1IpE0PG98xNOw=
X-Google-Smtp-Source: AMrXdXv4KLJRE9AtoPFiR0UiEn1SjFROcCuGWnf7Jm/2HQca8i2D91GCYeOHICAhjLm5cFdPObKJ6w==
X-Received: by 2002:a17:907:b9d5:b0:81e:8dd4:51c3 with SMTP id xa21-20020a170907b9d500b0081e8dd451c3mr53420692ejc.76.1673209989197;
        Sun, 08 Jan 2023 12:33:09 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id w13-20020a170906184d00b00838e7e0354asm2815937eje.85.2023.01.08.12.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 12:33:08 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Yang Li <yang.lee@linux.alibaba.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: fix ccu_mmc_timing.c kernel-doc issues
Date: Sun, 08 Jan 2023 21:33:07 +0100
Message-ID: <8201791.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20221122184844.6794-1-rdunlap@infradead.org>
References: <20221122184844.6794-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 22. november 2022 ob 19:48:44 CET je Randy Dunlap napisal(a):
> Use '-' to separate the function name and its description.
> Use '%' on constants in kernel-doc notation.
> Use the kernel-doc Return: format for function return values.
> 
> Fixes this warning:
> ccu_mmc_timing.c:21: warning: No description found for return value of
> 'sunxi_ccu_set_mmc_timing_mode'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Yang Li <yang.lee@linux.alibaba.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org

Applied, thanks!

Best regards,
Jernej


