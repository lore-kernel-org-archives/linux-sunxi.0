Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649874400
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 20:34:00 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id z19so6833733edb.11
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 13:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nkBKSiB1cmrK0dp6yoY74fBlTGVGjeXpWgqgNS2jLkc=;
        b=NFhQvdWYVDJHI9jVYMmqiDzGQIMGFCe93+qW6Pazsb60DDU4FijSwNzNETGsJH9wJn
         dlkxRjbLlkt9oSMg+d6uz4GfH7xZpJJgUhbx5aVZfJ6+V5yDBZHeD6DtH8JIwah4F+3z
         XsIlzofqIqEWl6Jylef3WefiCVn2g/n8Kv8zU4jvwfwxNGYbQnPjR43qyl8vNxiAN1lp
         pIxMuBqE4FSbAzb6rvkrGobqjR+TH2QWqk1PCB4RaVFsMZuaBRr5kSqskD+yw96QoXC0
         rtOx+xg75OtI6RLFEyQVabUxDGkWS/7VP0XW2Q/fqbNLUaJShgMdI5Dm9ggeWQwvGW6/
         LdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nkBKSiB1cmrK0dp6yoY74fBlTGVGjeXpWgqgNS2jLkc=;
        b=GsnGrwLGidNnoS3SSFxgXMtBAgoQEN8G3JWqMaADL/8HXwwxZwhNVzI8oDsbOWL9Zx
         yod+eBOvd8pCKGFT0GWpwBL3hl9WJOAY306uqXKUhY1UuCJzG8oFdQ0Ow82CXtyg94/j
         eULIGmd6bFRypT9YyvLepQJtbYWQNwEqGpOIctn+0lIiB0YyxKL9/I5Z8XxhWBYCXjjx
         WOTtiB1aUgYw1ou1oCowJx83bdhTnpTNx9KcR/xvaI5/hmDNDMruK2oAPijmWZjd9tsG
         99KZ3MOtdCsMyheii0fw6jklWvDYFSFY0rVV4lpAIdaz3fpxgI4kg5/8zXkoS39bUu8a
         yxjA==
X-Gm-Message-State: AJIora/hSfx9piLbFIjz7o6bWQBBl2SvnnKOmQ2NJdFqbDOJLEOaT3jB
	34CoOAiLpa3s73K2pkoe04U=
X-Google-Smtp-Source: AGRyM1uO09rJfj6zA5CERLvL9YWItOXJzXV3reZAHFT/3pjvAo0aqvyleVzqviSjSVT/E70PwBnxMA==
X-Received: by 2002:a05:6402:520c:b0:435:af40:8dc6 with SMTP id s12-20020a056402520c00b00435af408dc6mr28255778edd.343.1656794038762;
        Sat, 02 Jul 2022 13:33:58 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id u6-20020aa7d0c6000000b0043572ffafe0sm17235948edo.92.2022.07.02.13.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 13:33:58 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <x@xff.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/6] pinctrl: sunxi: Make some layout parameters dynamic
Date: Sat, 02 Jul 2022 22:33:57 +0200
Message-ID: <2374408.jE0xQCEvom@jernej-laptop>
In-Reply-To: <20220626021148.56740-6-samuel@sholland.org>
References: <20220626021148.56740-1-samuel@sholland.org> <20220626021148.56740-6-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 26. junij 2022 ob 04:11:46 CEST je Samuel Holland napisal(a):
> Starting with the D1/D1s/T113 SoC, Allwinner changed the layout of the
> pinctrl registers. This new layout widens the drive level field, which
> affects the pull register offset and the overall bank size.
> 
> In order to support multiple register layouts, some of the layout
> parameters need to be set based on the pinctrl variant. This requires
> passing the pinctrl struct pointer to the register/offset calculation
> functions.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


