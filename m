Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D018515C8B
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 20:09:34 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id v8so17410052edi.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 12:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpMKLnQvRwdkwAICgisKHiIAgDK4bb7kpFoIvZc8X0Y=;
        b=eO0nr9xr/5Axiu65l0YsbhdbJtKiMGVBtsKTtMG1A2Et+o7gvvNdM3qg20UeO1vj55
         G2XMKYhZXLza4c2E+amkl3PjlRwV/BQTkTucQDJCTz0eDTMDP1k/Ph2M2B2ht/qC3K2Q
         8z9crRRVSmHGXqm4HScyfqCUoqpLVODPbZXXfrO1GIXOL6KayXG20aTZphDljX6gV5Vq
         6+pzQL38pEcHNCQnDves3hkJMSeN3kjVp09XhskyaJHjTNKLTzicZG6cKJCxweW8Et/8
         XovWi0eNiBeRb0J2gpXNMBB09dbY3U54YJwi/noqwUScKPlLDjDn0y6llCiZp4Lp1H6i
         F4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpMKLnQvRwdkwAICgisKHiIAgDK4bb7kpFoIvZc8X0Y=;
        b=RvlpChV4/8IBB13oO3knt9jwlvGgibjhy2YOJ7hDiKvhleulTF1BBlN3JwIIdALTBN
         YIVWxPwhJ+UAD+cg2bpTMWIApBLc/eUj5bingGI2A/o6o3u6HKqRuxg8+kJK6nEGA2GN
         S66Z/PnsAur7/BAkmZsuiOwl3Q7BZBEuawzfhqunAXbejScUH+avwKTj7/QL/gUNE7wX
         DgPqJx3g5KSzFhlgpSgdmIpckUtZQD5+G1soYuzocv8iGmphhIhzckW+9i9xCW8zUw3d
         NL7+VykLTpZpDGfqinfi4weJfreLryYrn1NwYa2N8hdMR6wrLC6VUFQcfYAczrHLpMII
         YeWQ==
X-Gm-Message-State: ANoB5pkuPP3azT+nlapRiYuAPtZfunVXJALzyqkIY9zAehDzRJJHB31x
	lQv9Y55xWajk1Q6lF1ucyrk=
X-Google-Smtp-Source: AA0mqf7BlEOEgsitTiXLkvk1nxBEdhQvF8zq2FdleVoqh4mVW4UshOpPANKgeusok80IzaRsR4w03w==
X-Received: by 2002:a05:6402:e9c:b0:458:d064:a8c2 with SMTP id h28-20020a0564020e9c00b00458d064a8c2mr2891532eda.346.1670270973026;
        Mon, 05 Dec 2022 12:09:33 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id v16-20020a1709061dd000b007b47749838asm6531100ejh.45.2022.12.05.12.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:09:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: sun8i: h3-beelink-x2: align HDMI CEC node names with dtschema
Date: Mon, 05 Dec 2022 21:09:31 +0100
Message-ID: <2656750.mvXUDI8C0e@kista>
In-Reply-To: <20221204183341.139946-1-krzysztof.kozlowski@linaro.org>
References: <20221204183341.139946-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 04. december 2022 ob 19:33:41 CET je Krzysztof Kozlowski 
napisal(a):
> The bindings expect "cec" for HDMI CEC node.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


