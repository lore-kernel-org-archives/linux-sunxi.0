Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218009479
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 09:39:23 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99bcfe28909so255180266b.3
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Aug 2023 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691141962; x=1691746762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SqFgyxgqKy35egMtAQEDXFAX67wWyryg2XIdy5uYFb0=;
        b=klneINchgp12vI4XsOnGJdC/i6io2p0bGAbVYSLuLGGSKaI4DCgPyT6EXqHyJlj5f6
         oVoR5gVtEn8dcNnZrKI2TKFQn9BvurZMt9sTQgURH0ED6AhIQLb2eyDWX4NRCnHTxhGI
         Y6HBt+IeM/iPvkVk5jc6MeACweiXFf0loc6kzYrIGt/4kHGiWnSMxt7O4aLAMWACa8tB
         pRhnbJjU1Rr+HzlfPTvsJRgTiVU3ENTVM06HalwlATMrKjy7kf1fkN/KVd2RTAJLb4IV
         a8ee3uHaX90n4uKJHM+oc3pg1yKqSOr8FSfvAdnqq+IU9hW2g+ay7mTrz3xg2IqO2JWN
         CC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691141962; x=1691746762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqFgyxgqKy35egMtAQEDXFAX67wWyryg2XIdy5uYFb0=;
        b=RlfdjVZYBFpxwcxFsFcLzPQU2pv/mnaUoP1FW7SvIMV87E4UTxsaYN9exGHNUmK/4v
         6rblx+gRtHAUFdBrRmWArPC/sZQGFzLrsqr6vk6q/nq/eBwAbni4fC2xTOr0aYU/DGDN
         rFjW3NUhzYfFnzzPSzmayNGyCwOj4HRxqBUBkDvMBCZjHrOAHGD81k+QZKzJ5SdB6zPj
         +aOXFQZ7OXcXDXzL5FtlAzxj4R92cRjF8kFic6OmkdaZGFKW1jFSoCvr0Suw7RfSjY3w
         nu6MlGonEBJ071r8HjNDD5AK7tEoBfsi6jecT4tr151AgQqeZExfdqNtCLBaockbOjly
         i+bw==
X-Gm-Message-State: AOJu0YwlXQaPjfSUTNZ3O7Gt258FBry3UC7rYJNVKxZjGNqkju5MvtUd
	L9z4b8Y+kTBY8F0NKYF/UMGRbw==
X-Google-Smtp-Source: AGHT+IHYGRFd8aUGz4ZpQSn8X692eIjgbM4iTHu71H0jGFofVuKtYwFdPegnaRkxfeBlJ+vOWRygLw==
X-Received: by 2002:a17:907:75c8:b0:993:d75b:63ea with SMTP id jl8-20020a17090775c800b00993d75b63eamr1114333ejc.16.1691141962066;
        Fri, 04 Aug 2023 02:39:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id bn10-20020a170906c0ca00b00992b0745548sm1047976ejb.152.2023.08.04.02.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 02:39:21 -0700 (PDT)
Message-ID: <f17d22ad-97c4-3e9c-7e98-6251be4be58e@linaro.org>
Date: Fri, 4 Aug 2023 11:39:19 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: sunxi: Add BigTreeTech boards
Content-Language: en-US
To: Martin Botka <martin@biqu3d.com>, martin.botka1@gmail.com
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Icenowy Zheng <uwu@icenowy.me>, Ludwig Kormann <ludwig.kormann@ict42.de>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230804090102.273029-1-martin@biqu3d.com>
 <7029E91796EC6A20+20230804090102.273029-3-martin@biqu3d.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7029E91796EC6A20+20230804090102.273029-3-martin@biqu3d.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/08/2023 11:00, Martin Botka wrote:
> From: Martin Botka <martin.botka@somainline.org>
> 
> Add name & compatible for BigTreeTech Manta boards and
> BigTreeTech Pi
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
>     - Remove CB1 SoM as its own entry


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

