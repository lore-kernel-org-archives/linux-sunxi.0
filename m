Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF618C15
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 15:42:03 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id xi5so7224301ejb.13
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682005322; x=1684597322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnJpp8n/D0kUuMw5srBtiHxWnY5agaKj5jAEcqN8M30=;
        b=d7l1XYePBoWBNgg+K9TiUXnEeE1sNHrY5RlzHQid8iJYdL41erTXfy7aPeIm4TeOFX
         9RkBJBANWPmKeZXEJLBg22JkFYJPaK2qH+GnUQ9KUKjHJ2TJ1IkVkIZ21Tn6lb7Hz0vB
         HhtpVKng1rKja4iFnwW7odp1E5EHbCV47OLlPiTmNLHMRrbLzepCvMgM1ETRgmvqdZpU
         fNV/PuLVsgBerGE6ikKNNXeCBrxwuu+MLin13ualf7pm82WlE5pJWO9ggd850PQohLcg
         wZI9SAHcXop2U2VXX5C9CDNsquagEwYH+zZ5yrNyh2nVC0XTnut3uvHr2sGgkwNL/+a9
         bNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682005322; x=1684597322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnJpp8n/D0kUuMw5srBtiHxWnY5agaKj5jAEcqN8M30=;
        b=Cal9wBfxZhQWTtKsKfoQPNTuzveg9mIFAuJXWEYMQ2e4ngzjtMz5X8ksb2uudw2vRP
         TmrBYclWAKKt9DXlkKGC8e09+5HRPX+0H7hu8JB3tyw3DTunhQaU5GZ8/Oy+9VXHH4kQ
         P3NDjYQTzKgimQZUa2t5KRrb7cHhGtpxWD+auUt+L5SPgAi4Aj4jX2QgyIp0tYZB1yCc
         EZwmr9C4z+y+7eaKrgMa26xZ9zR87+ZdVMYE6TreCgYbfNd0XUL0g7X18MY5Ob3GwiCz
         fgkarIOgMV+iwBtu1MeeoDq+4XAVY4BOqvJAp6brl+ePCN6V5T5mOe5Tpz504xZmDvwa
         IlbA==
X-Gm-Message-State: AAQBX9egRPYorm0Ru/XZtDbRCZTHjQy+Rn/R4gc8wb2ec37h0OsQjT61
	R5ORX92yOq89119ZHT3iorurbw==
X-Google-Smtp-Source: AKy350aUUUuiHPcRVrmXlKjxRMAKQP2h9+Dfv/GAZvKgaHmZyTTXiJnohkiGrcI/uqV5UoEmIm3qzQ==
X-Received: by 2002:a17:906:5281:b0:956:f636:cc93 with SMTP id c1-20020a170906528100b00956f636cc93mr878092ejm.15.1682005322054;
        Thu, 20 Apr 2023 08:42:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771? ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906805000b00953285b937asm842463ejw.189.2023.04.20.08.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:42:01 -0700 (PDT)
Message-ID: <0d096ba8-1bb2-249e-153f-eb430a9f5e8e@linaro.org>
Date: Thu, 20 Apr 2023 17:42:00 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: sunxi: add ICnova A20 ADB4006
 binding
Content-Language: en-US
To: Ludwig Kormann <ludwig.kormann@in-circuit.de>, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andre.przywara@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230420102409.1394618-1-ludwig.kormann@in-circuit.de>
 <20230420102409.1394618-2-ludwig.kormann@in-circuit.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230420102409.1394618-2-ludwig.kormann@in-circuit.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/04/2023 12:24, Ludwig Kormann wrote:
> Document board compatible names for In-Circuit ICnova A20 ADB4006
> development board.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Ludwig Kormann <ludwig.kormann@in-circuit.de>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

