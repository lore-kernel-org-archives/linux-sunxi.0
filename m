Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DEB7C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 21:08:28 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id qk9so1542793ejc.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 13:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agcdnOZfTcz01ftPLLH5YMZ3Fbx9lBJzltNoiQrFR+s=;
        b=j6yTJsTL8qepaX8DqJDzhxPqyMFSSr9UHtJaYRq7pFTo1scVBVAoPoNO9fd+w9+mtw
         KlVZ8BQQoW6Jn+Ssdy7FYNrxyHTyRAx9Rmmjusl795QXgGtD49cmNWIi9YMjZWiCluIt
         7NMLQHB2P4TURyMU2Ynj0YtMRw2QgqGQ1NK+iU9u4+QpyYNL0nVYfqQaxb7rVBES6q5q
         Hre4+TyC0DIRhJlVzUexoqOIBMYo0AILJEeJlWtFrM4fmm++vIhISCLhkNDt9bG7d59R
         08EZnTv1BCpvgIkrva/r/54hBJGfv4wmnwrZXW03qN754GM9mxOmTa0k7hdbzEEdG1M3
         WtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agcdnOZfTcz01ftPLLH5YMZ3Fbx9lBJzltNoiQrFR+s=;
        b=WV0YCPqpK1EPzVIMRDjfihmLdd3opXJfkLz2ipLIWWMpzOx8Zu/yYm2o6XoGBUNlKe
         sbpqUGc26++BwMrrwkvDK2llaiN/CsBp+nOKaYRmIeD3CvX5NTjTw6y5CEfiqmFigGdr
         vK7u46LClARLslZA5PbAm5DK9m53nr+oTKl/eASMkbPJEmYKvZpqtlm9J53NMd6OwbUu
         mAQdwxqn6GxnyxWncW/JXVeZGOV2C3H7P3wagcGoL/7z3FAr3wDQgH3eNwUlQQZidUto
         pwJouXTww3jpeJRZiXp/ny96QqRBKYt6hzFd/On8lD5jMXD1gfMhtTgSldxgdBPywS5f
         SgEg==
X-Gm-Message-State: ANoB5pmfimA1tAiwFPZFP3hOmPjZ5rKNOwxmyKrC3EO59cnEltcUJxhT
	dMRGxPtFCMufICnz3JiZn5k=
X-Google-Smtp-Source: AA0mqf7UYHn6BfmpFxzltOtoTcchK9jnayi5HlZKBfCxXnfdPKi82ql/WWuz+zmdC/wM54/tLPE1tw==
X-Received: by 2002:a17:906:e244:b0:7c0:f9ec:1dff with SMTP id gq4-20020a170906e24400b007c0f9ec1dffmr4431123ejb.283.1670274506851;
        Mon, 05 Dec 2022 13:08:26 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7d0cf000000b0045ce419ecffsm221838edo.58.2022.12.05.13.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:08:26 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 4/4] soc: sunxi: sram: Only iterate over SRAM children
Date: Mon, 05 Dec 2022 22:08:25 +0100
Message-ID: <5320657.Sb9uPGUboI@kista>
In-Reply-To: <20221125040112.18160-5-samuel@sholland.org>
References: <20221125040112.18160-1-samuel@sholland.org> <20221125040112.18160-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 25. november 2022 ob 05:01:12 CET je Samuel Holland napisal(a):
> Now that a regulators child is accepted by the controller binding, the
> debugfs show routine must be explicitly limited to mmio-sram children.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


