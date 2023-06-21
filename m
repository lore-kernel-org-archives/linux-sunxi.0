Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8DF8834
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Jun 2023 06:15:38 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-988a2715b8cso568715866b.0
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Jun 2023 23:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687328136; x=1689920136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbtGhElTvOpjXQ1PbP4ONsm4koLaAwCX99dsAxX25z0=;
        b=DmSVbuuq3lmKTBCNDZg1fw5Y1X4WBep6Slmlf9zHlCBXPVvB9TTjuJLRgHyciVhxxj
         Gn908uGfc9XjyLjJOrr69ZK7tC2exNiR9tGJ2X3ckX2qJJYHN/6QbW7jJcnxGBggH2oe
         bn4AiS4WUQobmxN07o8xzkfLZDlO8v99KAY+MlVA/+WteKh2VUImDIi43sgH8ceXo/8t
         mup54oYi8mTLZ/T0Qxp6kr3yndrJfsO9E6e0Jg5Q9BQwvJoKkB7CpWBr+H/wRvezQc0P
         jpvhfNr2H9lMroM1rTzHupXToPrNzvQh+9On5VnpdZL+SbUifiRX9cIl5+ZwGnXFMTRZ
         caQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687328136; x=1689920136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbtGhElTvOpjXQ1PbP4ONsm4koLaAwCX99dsAxX25z0=;
        b=VmIKfK3TZkV9TcQsnbaosMVjrI7dUQAagUAhm2lz0Z82XweSVlXXjTydFHkw2PvODJ
         OLSgU1cA5p1qBmvEmtuMWyzBbEhrFvbh8J7fUMxTTNTsGPBEtoQhBj9/5baVUy1hhyq/
         +KMXpQCY4MePd9x4F6B/4f2b01G81nyOS/MrY8kezW/rcRV8eJ+hUFQowYCBOnDtecL4
         wtUjecZJQpEqrrpSLpwnek+8QwYgJvxuKOqsXMG40DSn2BaFi5NBAb5hSWOjfoIPmUNV
         U5S4Xev1R9Y9+gAmz3CqdhEa2dTOZmZiZIDQuWTU/ARyVNgKoVGPk/5sN4tz7EEHPVVW
         gk6g==
X-Gm-Message-State: AC+VfDy7YAI/FKjdhiEjcJW//u/dNVD4IohIU/9XvSd/u2Wrq8vBD51i
	8IaRo26OaYPPUdHuwYyAQjzxUQ==
X-Google-Smtp-Source: ACHHUZ6Ay7DaA8eK/uOIY07YXp+XeTSZSH8JR9rKtbZCCN9Bd5knXjYMts1bB/QldKNrr7DJctQ+hw==
X-Received: by 2002:a17:907:9449:b0:988:71c8:9f3a with SMTP id dl9-20020a170907944900b0098871c89f3amr6659006ejc.16.1687328136571;
        Tue, 20 Jun 2023 23:15:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i10-20020a170906698a00b00988dbbd1f7esm2517044ejr.213.2023.06.20.23.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 23:15:36 -0700 (PDT)
Message-ID: <2ed7a57c-c364-4041-0410-de020e358482@linaro.org>
Date: Wed, 21 Jun 2023 08:15:34 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] dt-binding: arm: sunxi: add Anbernic RG-Nano
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
 andre.przywara@arm.com, samuel@sholland.org, jernej.skrabec@gmail.com,
 wens@csie.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
 <20230620200022.295674-3-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230620200022.295674-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/06/2023 22:00, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Anbernic RG-Nano is a portable handheld console from Anbernic which
> uses the Allwinner V3s SoC.

Subject: dt-bindings, not dt-binding


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

