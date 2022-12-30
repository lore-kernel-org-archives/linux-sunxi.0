Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29691FA8
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Dec 2022 07:53:53 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id v23so11326267ljj.9
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Dec 2022 23:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wteaOjqUStv05kTX2dIgFUVrbZUO7TezK4q3XUbgysk=;
        b=XuKRrftvoCemAypeWsYZ0OiXxkS4hQi2gBTIyPGNI4lGIBuK5bqaVk9Y1ZICA9cnD+
         WDBtvLfP6rxHilBzLcL38FZ/JACauxH/Itw8LSMISVqT3P+Yt9Olu6F1CmrVKK3vwbol
         PHxE6YrkEM1mAdMa2uIX9GBnTTSSbiyjMB1hp9d6zQPiJcpOybIap24zZMNDPA3X/LIw
         0MqfMgbF7t+zTB9Nyg3XNhJWiNeBYH4eKuFpZEk5TAf0eOLlXpb1Q09TIwXRkXeQgaWS
         UjFllRndYjHNRATCRRia/QKbVsp8Era6Vba3xgx/bdoMnZg+4E9Naq3q9Eh7r1FtecfN
         UYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wteaOjqUStv05kTX2dIgFUVrbZUO7TezK4q3XUbgysk=;
        b=xfCelzn6gODEwlaF7z5njGmkU21Ggv8iDh/XqPdUrnR6XEZmqr7tuUs9eoujSNo47d
         MfRLgYCccrs94l/Sz2ZUY26ctzpqDMzZXhHWEu34GXMnrbtEr5XZSnG9ns68tkeTwYxM
         sgdM/z8qQlUY2F8zVGpnpeW0dn90krCaswTSrRMIwbZ4geydpCXIpAzQjTA2DjtETAd5
         i/Ua4OUcqHHjqXMC/a/VMUZvgcapbyHyL9z2ZCOPNoRHGaS0VegLTZd5H//ydwTbc0BH
         zAwP44ZeLbAq9Y46Fxyal3WwZswyIOOAtAGAJa+t9/mm3bFhF2/7SJ9YGOB1w7tOX9QI
         g0CA==
X-Gm-Message-State: AFqh2kqOVFlu+6mFJNd2PLhPrJ3608P+6b5vzMPIIqH/dgCsveVPpmtP
	SDhfrCLqVBkHSAn6sEtrpWrp4g==
X-Google-Smtp-Source: AMrXdXtbev16q7ONLYZzOU/zdhnSOOqAY/gknViUZlAxu6zfISXg8REkGb6Rdz8hBco08PPeeVSieQ==
X-Received: by 2002:a2e:b904:0:b0:26f:db35:6173 with SMTP id b4-20020a2eb904000000b0026fdb356173mr8628548ljb.17.1672386832058;
        Thu, 29 Dec 2022 23:53:52 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r18-20020a2e8e32000000b0027cf0ecab3fsm2570075ljk.138.2022.12.29.23.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 23:53:51 -0800 (PST)
Message-ID: <c2932014-57f9-f80e-3c86-2aa7e5bd422d@linaro.org>
Date: Fri, 30 Dec 2022 08:53:50 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add iNet U70B Rev 01 Tablet
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20221229224547.25225-1-samuel@sholland.org>
 <20221229224547.25225-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221229224547.25225-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/12/2022 23:45, Samuel Holland wrote:
> This is a white-label 7" tablet board based on the A33 SoC. It is found
> in products such as the "Nimbus 17 V1" tablet.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

