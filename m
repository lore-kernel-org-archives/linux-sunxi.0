Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4FAD536
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 16:25:18 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id vm8so84310952ejc.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Jan 2023 08:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGcjNWkYyFV7KGtDmAPcnHFpakjpf87o3mWY6B3jNYE=;
        b=kkvPJ+0gP56qm8Gm9tFVNHPLid+GH4Znb+lcoJ5awmOUBN26bnPtyYc4yVt36VwAHh
         lU4Rs3J9dvunQghJMYZCjdo57bRhKlksSOfqGM5GMI8Zkv0PUx+5Dj3un9lXQpGx9yEk
         8udoJGOAwp02/sHn4NXWtnHHwRWArLEdwGpTT61nY3aAEFtG/WrFQPbjWsH4DzeYq1tC
         oniICgQxBL/X3KszV7NLR7HvuqJZnuEjMlk6GrsuYzxT5NVB6d2OPfIhYv/i+TOXQg1w
         mWIKs0O858viOkrDkhik5wt1iiEkCxc0vSj+cY8OFpMKWaSOBEewncXLf+mwBpughF8n
         cTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGcjNWkYyFV7KGtDmAPcnHFpakjpf87o3mWY6B3jNYE=;
        b=ytpU/HpUsqjgExdUQge8Ugo3uxaxrzWBgKa0ywv/lQWdcqbwhAuhQBLa4BNXwBOR08
         cnno5RG9h87QLTaUvpSokbJfHPl0rRuTc+3GPR5stRzrRy9Z60JN7U6PjoSou2A2I++Z
         1C7PtXiJKZd8Ba9vCewi9NeuESt+3gaviS7RZmRcYkW1rcgcQwgYO//Jx0lTLpTjNIeC
         ayYR1A/AyjgtxNVBTiIzqSiPM9uyPoFFd63JcqaBfoZ6+nqDca7c7k1RyV2slwanecW1
         wJ2RecQUbnswUKrEJR0VfhDQrOI490OjRaNeHjGpzfbD+/U6aZHqdcSdfM81m8KKtZej
         4VXw==
X-Gm-Message-State: AFqh2kr0NmghKlbgvOwNcyvgUscCWPseL+BrPFQmbBJXH1ewFy8EojdS
	NX0bHP8Bry/y41jAMEAHzAQ=
X-Google-Smtp-Source: AMrXdXud+NA0Suedx7vVT0q3+kaXBXllkZ9GjEa6ydtq6LSRAxonQbvR+e2OR6Avz1mD7lO5OS0w8Q==
X-Received: by 2002:a17:906:910:b0:7ad:aed7:a5da with SMTP id i16-20020a170906091000b007adaed7a5damr57431170ejd.28.1672935916846;
        Thu, 05 Jan 2023 08:25:16 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906211100b0084cb4d37b8csm6504278ejt.141.2023.01.05.08.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:25:16 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] clk: sunxi-ng: Avoid computing the rate twice
Date: Thu, 05 Jan 2023 17:25:15 +0100
Message-ID: <2860887.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20221231173055.42384-1-samuel@sholland.org>
References: <20221231173055.42384-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 31. december 2022 ob 18:30:55 CET je Samuel Holland napisal(a):
> The ccu_*_find_best() functions already compute a best_rate at the same
> time as the other factors. Return this value so the caller does not need
> to duplicate the computation.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


