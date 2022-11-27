Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7E56ABD
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Nov 2022 20:51:57 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id j4so14612119lfk.0
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Nov 2022 12:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3tcaQbpn4RL3pvRrRbdnOz1diiaytm2EQbdYOlRKS0=;
        b=sJeMsAwH5oeFRscCpGj9RR+Do4wDjcc2UUU7Ym+FEkFnR72j1I/gN8rOxMWxCc8SG0
         h8Oir1s18M8LhW1Cl0Nlz4vKiKz3qjfu8x+sIwCz7D/9KckEU9FQjEol2DckiZPgCj5N
         4DDhZdhsR1uyLCNAgDRJ9sJeWKdFK7Cj3L7euLeMb8jqVrqSsxmNXTfvs3gIBtV5VoHs
         ApE/9oKR51y55MAduQxfE1F7Y9Qox+gfqk0YFBYjVHI607/WmrDNo8yMJs7mVxQrGAB0
         m7e2H7/c5aCSPOXq8UF8pKazuwUllgKrT83c6YBG6ALLd16GZqQhDgeivz/5haYzB6ij
         c19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3tcaQbpn4RL3pvRrRbdnOz1diiaytm2EQbdYOlRKS0=;
        b=hGDrZLCX3jeCeVjNHFCF2ostyKC1Ag9bl028YDuC5fmy1fQ714TN9UreeA7MOlSMNE
         2iT5UpafBsyWiKNEBFMfKtZNMuzE3cW3GYV9HLCQ3TYaAUO9IU+dloWETwdHfa/BXL3t
         UQOyFukkC7dNtO4EEq7oPPPCjN3zHJhwtW3FY16Cf6KQKw0Kf2wViLf4/9Y/ZBihFWi5
         eVKtVUqwlJ6KXSuAgOOlMuUOhkV5anheI+GE32RhNS+OhHTc4D+EfFRxUsVanoOnin/B
         Th0ZVUobgCcHcAbB/+BelZuCmgFfElB4nGlvRM0+U5QqX6xYpQ3EWY2WixRAm/yWIZ5H
         o8oQ==
X-Gm-Message-State: ANoB5pnSTWVK1LFAfIdFh+SiQYCJoQ6WdTxgZchUGDDpV80PKTeXx6uI
	Ed/HdMJW/U34bs40RcktzPV+7w==
X-Google-Smtp-Source: AA0mqf7Jzuiy0nCiIZmAjTMrowDbThivuRVRnEln0SfrfK4SRS6soivNU26oGPhpGm8+NFSXI39VUg==
X-Received: by 2002:a19:ca0b:0:b0:4b1:7972:627a with SMTP id a11-20020a19ca0b000000b004b17972627amr9330545lfg.101.1669582315907;
        Sun, 27 Nov 2022 12:51:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s14-20020a056512202e00b004b501497b6fsm1046703lfs.148.2022.11.27.12.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 12:51:55 -0800 (PST)
Message-ID: <aa4da52a-c07c-2f3e-24b2-8a45b4c4cc77@linaro.org>
Date: Sun, 27 Nov 2022 21:51:54 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/5] clk: sunxi-ng: d1: Add CAN bus gates and resets
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Fabien Poussin <fabien.poussin@gmail.com>
References: <20221126191319.6404-1-samuel@sholland.org>
 <20221126191319.6404-6-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221126191319.6404-6-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/11/2022 20:13, Samuel Holland wrote:
> From: Fabien Poussin <fabien.poussin@gmail.com>
> 
> The D1 CCU contains gates and resets for two CAN buses. While the CAN
> bus controllers are only documented for the T113 SoC, the CCU is the
> same across all SoC variants.
> 
> Signed-off-by: Fabien Poussin <fabien.poussin@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  drivers/clk/sunxi-ng/ccu-sun20i-d1.c      | 11 +++++++++++
>  drivers/clk/sunxi-ng/ccu-sun20i-d1.h      |  2 +-
>  include/dt-bindings/clock/sun20i-d1-ccu.h |  2 ++
>  include/dt-bindings/reset/sun20i-d1-ccu.h |  2 ++

Don't mix bindings with driver changes. Checkpatch should complain here...

Best regards,
Krzysztof

