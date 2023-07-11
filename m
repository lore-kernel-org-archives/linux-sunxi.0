Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E3417FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 19:07:08 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fc03aa6e04so40857535e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 12:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689102427; x=1691694427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiKY+2beK0kCEqS1A96DIZRMWb4AnLYgZxNxXLWwG2U=;
        b=h6FXsEQbXFMh20Wn49GsVSXv+r5kcFSzASidZcZQogdQPOpB1rPdM5OAZdd5jrVB6O
         cw5j5Gb4np8LzchdYpHbJTxMERdOlAr8il5qwMeWUCZjYdF+RhAAReLyZHDEu2FMCkBe
         jcZzIZYptqifgF5fzmqHUspsQf/p9xMPo9+YB7az5qtrmzTRYMLl56XIYNGPpPKaRMBa
         JpFGLFttsZOg29QAKsGgrzFoDRd8GfT5m/pHY4qzmk6HHpAc/3oIwFeN+vPwGFZ3FbsK
         vZQS8YsKzwiS1o7CFwsV0YaISQ0aDnmf35eJvzxUgm7ErSeuI5KU0Le+7u+1HBMHiYfM
         Gjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689102427; x=1691694427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiKY+2beK0kCEqS1A96DIZRMWb4AnLYgZxNxXLWwG2U=;
        b=hW1vEUAvpN6HXqaTTKRcERk89HZsE3ANYgXxYgujoty/Kri+pztktYQXtBLgBWz0ac
         wDeSo2IGMbdKo3fbeBFIpNYSAjjvGghEdEs6C/9tqiEm5F+Z0fXxLV1tUXGEVWNBuxLI
         Ff+DChiZ8vv49ygwxBN8+neNWLMZXOxLN05hEs++3plc7PIE8xjjbft+fIOG8SqZvcxA
         27lML6dFQZVAvwsvgA6arJ8UlbDzSgqD2uD/4ibaJbVfRhxsmm+2ttiQELWKtTi/hnvU
         7fhjb9fVhS47gWVJch8SHF6M5DLpLfHkIh0nRUY2+ZhqQU+BfblxaF1T/RXiErW43m7b
         OsmQ==
X-Gm-Message-State: ABy/qLZVvOR5FOUUDbvSwuyPzp76kIFf5FyNmSiEUFJUJbg1WNUQ1viL
	a27v+waxrgIsUMOShBa5+X0=
X-Google-Smtp-Source: APBJJlHurYatwNkDp+xpUDw2/YvhcTA4et54sMfIUl1FP7F7759BgOtkXz1fc2PtqxYMmdfKLVQV3A==
X-Received: by 2002:a5d:6607:0:b0:311:3fdc:109d with SMTP id n7-20020a5d6607000000b003113fdc109dmr14483727wru.1.1689102426786;
        Tue, 11 Jul 2023 12:07:06 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id c3-20020adffb03000000b0031432f1528csm2940339wrr.45.2023.07.11.12.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 12:07:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Mans Rullgard <mans@mansr.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] clocksource: sun5i: convert to platform device driver
Date: Tue, 11 Jul 2023 21:07:05 +0200
Message-ID: <23140733.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20230630201800.16501-4-mans@mansr.com>
References:
 <20230630201800.16501-1-mans@mansr.com>
 <20230630201800.16501-4-mans@mansr.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 30. junij 2023 ob 22:01:28 CEST je Mans Rullgard napisal(a):
> Convert the sun5i hstimer driver to a platform device driver.
> This makes it work again on A20 and other systems where the
> clock is provided by a platform device driver.
> 
> Fixes: 7ec03b588d22 ("clk: sunxi-ng: Convert early providers to platform
> drivers") Signed-off-by: Mans Rullgard <mans@mansr.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


