Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A5DFBE5
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Jul 2023 14:08:34 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-977e0fbd742so774487366b.2
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Jul 2023 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689689312; x=1692281312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26kZNX589C4iel7QXWfs4d6fvzGm1fUt/wLrbSdfcEM=;
        b=hWHpHNHOn2baysENIVLRf3Put9jo2livos4yKD1QUrzec9GAQZWc4SOIr0oRVt2g5+
         KJ5iafB8yWfAsQovCftGxuIAqn3feQblOqRX/ZATiXJA4Kb6hOvg/MMcNo20SNVry1YJ
         dR64HQqqj6B9GXDq2cBb6XpBwaoCiloqqXVmPh6Eo21URVexP/vfvJ0qJuDabC/1FOVK
         37Foib7LnsnpNlG4DHBi1MH/VwoBpyJBjm3Gv2Po7d71DM1r/9sbkhpTGSn9hrjhICZB
         TE3UkNn4+hMXK1So46SkCIeSTcJoeYwGXj7bY6I5l9jfMj6tLNQ1ggkncuS0hCM1rYkW
         mPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689689312; x=1692281312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26kZNX589C4iel7QXWfs4d6fvzGm1fUt/wLrbSdfcEM=;
        b=XP5+hZ0Qx37iDdstbZb+Tjz1WMZWFooHcgFeHW5VNeuzbX2xmZBsZ/e82NlDhOgdBO
         6flWXVuWBIYHDV/znVAVTGtQNaTnhJYFHnCI6wQ6fEoOZm983nAcM+5NL67Thb1n14vP
         QQLtGG5vIThuCL5DlCigCG2BFkhBNOL9Mo/ezzWzsTayYXbWxWXoV8g4zAVjkXHNPBn4
         3reWk34HK8GD5kZ5sZXYozP0ZCJPoRSv11rzDm+bx87S7HWQFj+ygD6NHY85Ug+KSuBK
         2TmABM0z2LBab3OiuzYjJe59GIcwSqk+GpsRAn1Ypr6v9q8E77em+b9/UeqvirR6jRst
         fx3Q==
X-Gm-Message-State: ABy/qLY+8WRyTCWFtVrZK355kw1LlXCoqIIjElxzpAzbgYNTokzL0zAP
	X0XyKldxMb3Pd+iqpRTkXBdLJQ==
X-Google-Smtp-Source: APBJJlHCK3uKU2SMKbvO9GDgWvSktEqjCttFrrrr5S6vtW7MEkY/RCJ4htqbv5QoLrYAC2oCyhe2CQ==
X-Received: by 2002:a17:906:5a45:b0:977:95f4:5cca with SMTP id my5-20020a1709065a4500b0097795f45ccamr13185377ejc.54.1689689312367;
        Tue, 18 Jul 2023 07:08:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y12-20020a1709064b0c00b009929c39d5c4sm1086470eju.36.2023.07.18.07.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 07:08:31 -0700 (PDT)
Message-ID: <a85a6d11-a3de-958c-bd87-d2fffe446bca@linaro.org>
Date: Tue, 18 Jul 2023 16:08:30 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] arm64: dts: allwinner: h616: Add Mango Pi MQ-Quad DTS
Content-Language: en-US
To: Matthew Croughan <matthew.croughan@nix.how>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230718124752.1279094-1-matthew.croughan@nix.how>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718124752.1279094-1-matthew.croughan@nix.how>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/07/2023 14:47, Matthew Croughan wrote:
> Mango Pi MQ Quad is a H616 based SBC, add basic support for the board
> and its peripherals
> ---

Third email within few hours - no, wait a day. There are so many issues
here that sending immediately won't help you.

1. Missing changelog, so did you ignore entire feedback?
2. Missing Signed-off-by


>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../allwinner/sun50i-h616-mangopi-mq-quad.dts | 183 ++++++++++++++++++

Yeah, no bindings patch, so you did ignore the feedback.

Sorry, that's a no.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

