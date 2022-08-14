Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756202573
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 18:29:47 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a7so10268822ejp.2
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 11:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=YM/EzX/v/N7HQ8RLOhFApRZ0Ncx8MJgn8JX0fsX1BSc=;
        b=XqgHhVJ45K7Y4IMlRanR9Rj1I/nKidTWQMTwmxgFrwhqcwDzDWEqBh3Ol6wFV7lmHT
         U24NzDZdZn0QR4pCUuo2wByLM+iWQ33IUKbhEHXwXHaDIALlwZ14sg1RjadOCq5heKmt
         I9N/hCj/yDGqf4gR9i7eavO+5nwsyTeGuLYQwPCyYZ+2oX43a2/pCCqhnRtrZWPBFx2/
         BWZjLBKlSXiT4HI6w5ei8h/yaoEfgOH9g59C+8Ss3K/uvtMEFgpSBWQXqtKDXdzS3Pra
         Vqnb80z1uWtGJ4UTpLn6DeREI4ATZolS+GXbwGCZ3klH8pJGU83bvT4rINrlgFtsJCWd
         rKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=YM/EzX/v/N7HQ8RLOhFApRZ0Ncx8MJgn8JX0fsX1BSc=;
        b=HUeLjJm/LucuTycHby/H+v/e21d9VQITbqx0c6q9JMcB4ayCLlbT0QZ4hghQMk2oKZ
         6cAunOeG+q1UBndt0adj28QjlV2p+uQUm8uU3Ws4SeSfDFTEFxIn77cEOJbHgr4cUiaJ
         owc8l3zX/Eg8RTKmOxeDOfU17Hh8PuyVQaIBm7gcl0aloQPOCDudTHlTnoprOOU3A4/v
         metA04i5yEwclkoDh/U6HhkV98Z+j2ljlJN+Sc4lbJfz4UOrNR/GlSOJXsXAbwiey0qz
         RuwN1BtR4sz2DnLWyRyS9AOFaeOqKZ3oGzTyUn9qD/WnSW89n60A2xLT3EWbtQ5yfQC0
         ZQnw==
X-Gm-Message-State: ACgBeo3Kzco6vqFy55g19MTBgbZOtNDexiXLqfitXAM7SUJPdLe61dn0
	N27q+9dBBOZt6EdnbjtLTwc=
X-Google-Smtp-Source: AA6agR5aEUqDD55iAOGa2vGjq+YEYaXPiLBsN3zLIyyxT3OmPIMg9OLUoUoN39a/AJR7nSa6Ft0qLw==
X-Received: by 2002:a17:907:3e93:b0:730:a92b:e7e1 with SMTP id hs19-20020a1709073e9300b00730a92be7e1mr8562025ejc.621.1660501785749;
        Sun, 14 Aug 2022 11:29:45 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id bv18-20020a170906b1d200b007315e57ba0asm3211222ejb.114.2022.08.14.11.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 11:29:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 7/9] soc: sunxi: sram: Save a pointer to the OF match data
Date: Sun, 14 Aug 2022 20:29:44 +0200
Message-ID: <44879236.fMDQidcC6G@jernej-laptop>
In-Reply-To: <20220801030509.21966-8-samuel@sholland.org>
References: <20220801030509.21966-1-samuel@sholland.org> <20220801030509.21966-8-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 01. avgust 2022 ob 05:05:07 CEST je Samuel Holland napisal(a):
> It is inefficient to match the compatible string every time the regmap
> is accessed.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


