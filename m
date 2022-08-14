Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D7AEB8
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 10:03:03 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id y3so6334521eda.6
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=WHxiaSb1rJIu9R+4l2gEHdhyltoYWvxM1ZRzquRwQl0=;
        b=X+wo0w8MzLU4kGs4TRnTw5kEzw9LrwS55YxQc7qJBNKDvaE2yU6WqBS1aBImY6GmmS
         OXvGAU+iNQ2Rcl0gLG2gvtAiG+ea+no9zXcHIK5Iu34j5bhdo3dnTJqBsK1Cpm3ZkloI
         3hj7bYmF+2gTBYwmPzRzqS6vthsZ2U8ibVD1j59cS36s/tYtobth7b2TWjeVcE2Tp34R
         fvCAWIGkFSGNk2mF0uJ9qL5/Od6EvxtzGR4wLaqjsl5X84t0MNZ/Mw2RVWQJnScNCE2V
         uYCjvdxPAHXvR8KL00yj3o15N38ReHuYU5B6hPZEjbefoow6vvw1PWqagUF5nFbKcrV6
         huxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=WHxiaSb1rJIu9R+4l2gEHdhyltoYWvxM1ZRzquRwQl0=;
        b=wpQ9m5FEhP3ipcGk1hPx1maR74/ocySvxxtoDQf3NrV3hVDwuYF2Q1U+lEi4wK56wB
         JWk5lfron9uLp+0NGjqJ5QoqZ9RzCXkhT0iOyIVeGJnhuklkH7pOruPfYNkBnKPJ3J5o
         z+Tw7EWHhzx8pT8D2MAJD9TF0gXtSr4t/vZI2oPO4kOX+dFW7VktktY++/1YRO5Vod7j
         agBV7/NF1pHPNfDO7PeKtFpzcfvM/5B9Z3m1TFTLuv1P1Kt+JApnQVqbDv7fL4xd9/mn
         dK3xN5XHmJj1JO0cD135Q+7nQ9hNdvzIVf0u0tZA+wAp7prJbY24sFYdqz9MOkNGUXU2
         /JMw==
X-Gm-Message-State: ACgBeo30QEB5pmrQEEmXXfOv1jR9auyp2BhWwGCow2Y/5l+bhjzs0fA6
	yVaN5WEttb+ifQ/btLJd2Qw=
X-Google-Smtp-Source: AA6agR6pfODl4z8g5+0i3U/G2F8naB8pinZvLP9XUoURWyhHcN67EGwaG5aUxFgsihalBkIBjoqSCw==
X-Received: by 2002:a05:6402:2549:b0:440:5af7:f117 with SMTP id l9-20020a056402254900b004405af7f117mr10576010edb.259.1660471381510;
        Sun, 14 Aug 2022 03:03:01 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id n9-20020a05640206c900b0043cc7a3ff7fsm4450601edy.33.2022.08.14.03.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 03:03:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi-ng: mp: Avoid computing the rate twice
Date: Sun, 14 Aug 2022 12:02:59 +0200
Message-ID: <3682564.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20220810014024.27568-1-samuel@sholland.org>
References: <20220810014024.27568-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. avgust 2022 ob 03:40:24 CEST je Samuel Holland napisal(a):
> ccu_mp_find_best() already computes a best_rate at the same time as the
> best m and p factors. Return it so the caller does not need to duplicate
> the division.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Other ccu_*_find_best() functions would also benefit with similar change.

Best regards,
Jernej


