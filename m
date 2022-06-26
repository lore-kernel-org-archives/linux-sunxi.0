Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC977A
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Jun 2022 10:37:23 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id g26so13330757ejb.5
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Jun 2022 03:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=v5MWZtaUVFOqtoxtacN9tsMmQ+YFWE4QkhWitNXkbM8=;
        b=FgKQolRyfAt9w6xD99Ino2epPCiqr+aD2KNrO2/A5NTVNZIkxOjp1iaG//izy3NqmN
         sMO73MAUM1s3gh6CLH2Eonf0Gp7oWerOORUx+iBQ9rOfkNmu5w71fL/OZFZnD1A98y4N
         vdmpHvxMcltr8PAZVc4SriR4ie0S4mZXudhhW0Z9ooglfND2eX3UaRWyBIp/TZGiWBLW
         ILC3j3EvOlda4FuzpOHjjxlMEwti5UM30ll25Bu8uX5wPrLoFV6OcZr6tmLLEwzXNz6O
         JbKhswqenlfJ4XZIVCCmu/lSlYS/qG3aKPLLMte+cptIkucen8FgbPZZTkuvoTB93C9l
         whqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v5MWZtaUVFOqtoxtacN9tsMmQ+YFWE4QkhWitNXkbM8=;
        b=g6TiEVvfTvwgvR2GYUq5eTncV/4Q0Km9R6ZPhH+Jm7nnndpjAnsbOw4rAf2u/nNVYC
         UErPG6lHmvHzoP0ujuH3S3YrJn/02bhPYnzwZUc7Hzc0fOt7HM0W0ABASXDYXCQDnTBN
         GPChXXDP74YjaaLXfbmyj0Vv4Vfb4wtdt8wgLuylzntLBLVDaL36/LSvLYzGqwGpg+SX
         yOEvsdyrj8nmzKqXa6D8MtPS3bdhTA8BkncZQyh19GtkCbeBn3p1DQtJTbYoXRmdbSLx
         2Pb9aNCE1RiQgD5N90YlOvPw00B8jTY5CPcYeKw4Lif8AsTsB7xe1cbN6MukE4VdkKNF
         DYBg==
X-Gm-Message-State: AJIora9ju0CsbCAQYrxlrBV24vDvb7J1sF4dlo8ZpwK+sTSX1FBZ2/hX
	owesUqOOFjlYU7VF/rCiDyNeLg==
X-Google-Smtp-Source: AGRyM1uWyS24JWs5XjcLmOW4sPUId65Hj2vcLLUX54VtWo/YEmnh8xQ//lOm8qCxYI8AVf++vBA9bg==
X-Received: by 2002:a17:906:2252:b0:711:d2e6:9e7e with SMTP id 18-20020a170906225200b00711d2e69e7emr7421799ejr.161.1656239841978;
        Sun, 26 Jun 2022 03:37:21 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz18-20020a17090775f200b0070fd7da3e47sm3624539ejc.127.2022.06.26.03.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 03:37:21 -0700 (PDT)
Message-ID: <4d50b9ae-fad4-346d-8e98-8e10786ec8f1@linaro.org>
Date: Sun, 26 Jun 2022 12:37:20 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: Add compatibles for Allwinner
 D1/D1s
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <x@xff.cz>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220626021148.56740-1-samuel@sholland.org>
 <20220626021148.56740-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220626021148.56740-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2022 04:11, Samuel Holland wrote:
> D1 contains a pin controller similar to previous SoCs, but with some
> register layout changes. It includes 6 interrupt-capable pin banks.
> 
> D1s is a low pin count version of the D1 SoC, with some pins omitted.
> The remaining pins have the same function assignments as D1.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
