Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3DE17CF
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 13:11:04 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id w3so2340844qtv.9
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqyKv0XYLPEVdA5JJtsH2C4lrk87Khcgzczr+S4ad18=;
        b=MqaobulmgicuadCCH89dsRp8x/x4N6tzQugx5DMzikid18PoYnadVJtRbEBLfCHQiI
         5q+YNh97Jl0AMjtR+qF+0/0MmDwIbxcx1S/6I+1GpsBeZHziTyVpa+jCosnto1B/ZzaW
         RFoGKMS96CNXAwFQiCMez3Qpfy54SL88JGWTHka3+pwu31uXlsyZazC3JBVQduXYWny0
         +cd8wdxYySw2thR0pRlI0Q01XqY6a11wR9NiLT56MULAkxoPjvwS+RvdVsNEjWC2z9cp
         VmOyZQ40hL7RToidel5+andZTNlrzWXP4ayK/4922wBQN8SABAYOAx9RC8Kw/lf0vHd3
         DyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqyKv0XYLPEVdA5JJtsH2C4lrk87Khcgzczr+S4ad18=;
        b=wgqOKJbb3qFd4maeFBQs519yxii8FQP2mzvK6zdx7g7vQMN6z7av+bxy7mGijwWeM/
         DotoCz7TsJxPU/H5DGErZVC3+Ye9ZbhEnSx/rl4ZrEggeutedT7oT4sVkVMNWE2CwuPq
         f7qUx4Ym9n7SfoX4JFKLVM6ZwYmKlfsMPdsnLltVX4KyCSflxTGZr/uHgqo0J6HXcyfb
         o7Jx3dxSNGGKBE/jQ9Xjqbie3I7geHNcDBonVZpx3Hl1KEbkGjvt+SOk2FYFjCGg4hgq
         GV37915Y6Ak+QK0a2947Z9uvrST2zDH+ePs9sTfwok1hdp18T1bt/+FRwcYcCUwvunSc
         tn3A==
X-Gm-Message-State: ACrzQf3HRk4ZdHuRdZVEvU3ZfKNmXQ2V0qlBQPbLKD0UvNVX30uKTb7q
	V+yvp6JlhGy4EoZZ1ZtMt2CbOw==
X-Google-Smtp-Source: AMsMyM4tx+xcp7HZkRDiMRLGc4Qh39k6W10pp8XbW0JoxyTNqsJPbm86beuyuM1vWEooI9gyiiMTZw==
X-Received: by 2002:a05:622a:2d0:b0:395:e96a:8eeb with SMTP id a16-20020a05622a02d000b00395e96a8eebmr21894460qtx.176.1665580263754;
        Wed, 12 Oct 2022 06:11:03 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id m8-20020ac84448000000b0039a1146e0e1sm6826054qtn.33.2022.10.12.06.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:11:02 -0700 (PDT)
Message-ID: <cdbcf5a3-3bb0-4270-1211-a45a0596224f@linaro.org>
Date: Wed, 12 Oct 2022 09:08:49 -0400
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 08/10] dt-bindings: vendor-prefixes: add Source Parts
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
References: <20221012055602.1544944-1-uwu@icenowy.me>
 <20221012055602.1544944-9-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012055602.1544944-9-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2022 01:56, Icenowy Zheng wrote:
> Source Parts Inc. [1] is a company that makes a series of SBCs, SoMs,
> etc under a brand called Popcorn Computer [2].
> 
> Add it to the vendor prefixes list.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

