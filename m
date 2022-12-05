Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFA57C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 21:03:07 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id d20so17633178edn.0
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 13:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCQoc7/NxGqKBDfT+WfjkpUJQ/xoL2wQ4YZBUAZFWuU=;
        b=RDP4U2hGWGIherQLPcDCfBZG/x0iCUDVVWDn88Xro1j88fh7rYsKfpjVwdcT9byep0
         5XkzMzPTCPJiuGgO0OcjXlSLG93YzivyaTCszaTH8HLk0qZgVVGNN/NC5qHYJw8Fn6MX
         ekhtndYjON+iSqUjdY0WGEUulNPDtPPTBB3IQH/b3v1aSktNRFi7z1GvrpEWBvvD7MIL
         vB/t2YtbtOnNfTBGfjYe0L5rTAxtt2ziGlfsjZhI0yrI4fCwIaaMGkhNDyLYqpj+WI6B
         LECl9UgywBF4yT+5S1iML4JC9wiB8egDIjP94FZx6y2xHzbyZabsY622GufsE1O+l5/V
         yjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCQoc7/NxGqKBDfT+WfjkpUJQ/xoL2wQ4YZBUAZFWuU=;
        b=0BoHDnmXoUJ/Ahhu/cwIwLYbObZ+KbK/o2NJ8vdZQI5bgj9NbxnExQ8KNvp1Gbin/z
         ++Pmt/QCkuElpWeQzVMN667bfcMkdAP4MizsSiVsrUPAt8cTRxqls0r+KsjzNJfCdsJy
         dc8p7MtllVfQ/KeZ2y9vusof4F2DebebFX8oi8ReZ4HX4rm6BfGwjFGoUldPsMfEeXQB
         VdY/LNvUjwsKl08V2dmxlGXASZPhuYMzK+p7NQNl/nZHllMsAmkNgLMotWqnFCbSNyfB
         SM17/U64TlmJB65N+NWW9ZDoOYT3EgiJUeDqswcbnsFRScYr2vrUZ83qXwFst14w6ea1
         frwA==
X-Gm-Message-State: ANoB5pkiuq6txlXRitY5qUbS5LcKc6tX4u3zSwJIMhTQ1hm62No1EU7S
	AXMYAdQQngl+KG+nfvDrhYs=
X-Google-Smtp-Source: AA0mqf5yVPJ21S6Vev4b+Aug4s525FY1CRRcm+sACWW63sZiP2EXM+F//2ZkwE35V6dGcnlQqsZ56Q==
X-Received: by 2002:aa7:d314:0:b0:46c:fc3f:cf8a with SMTP id p20-20020aa7d314000000b0046cfc3fcf8amr1810061edq.386.1670274185672;
        Mon, 05 Dec 2022 13:03:05 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b007add1c4dadbsm6499020ejb.153.2022.12.05.13.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:03:05 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Karl Palsson <karlp@tweak.net.au>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: nanopi-duo2: Fix regulator GPIO reference
Date: Mon, 05 Dec 2022 22:03:04 +0100
Message-ID: <111352924.nniJfEyVGO@kista>
In-Reply-To: <20221125195401.61642-2-samuel@sholland.org>
References: <20221125195401.61642-1-samuel@sholland.org> <20221125195401.61642-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 25. november 2022 ob 20:54:01 CET je Samuel Holland napisal(a):
> The property named in the schema is 'enable-gpios', not 'enable-gpio'.
> This makes no difference at runtime, because the regulator is marked as
> always-on, but it breaks validation.
> 
> Fixes: 4701fc6e5dd9 ("ARM: dts: sun8i: add FriendlyARM NanoPi Duo2")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


