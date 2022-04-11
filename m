Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8FE10EC
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 06:37:44 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id v4so3553783edl.7
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Apr 2022 23:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vzNjZUXGyvh4gu1a5eskzN2ZgAinNkq/VfowbMZKkRY=;
        b=n9tsVChRT1PVIqDW/MqDK2AAvs1Dzp1foGwlobVRiFihFy4lvDQG/DlNcqT7KZoBCw
         /b0cTlbdft9bB57n7QmxErwXwdW+oCBAIceQdsZl1SynUBR2d2DXQNpiSfUpWL2gCTlM
         fEnbLQP3oAeReSQqM8w8+/1LIrkSqlPl6XswAialCagtaqmTvdnjBRXvZt999cniBbYb
         wEPBtVWY0mWdCo4YIFofSwnP/9RtCGySUqGg5iQC8PKIhQCaoLUdc4bz/3ZoDPrZrE/W
         XCKJcdVDAII9iJRM45lmMEExa3pTLJOklS953Ygoc/KbNDSItyZ5i4FkcPwI3lOEQepa
         JTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vzNjZUXGyvh4gu1a5eskzN2ZgAinNkq/VfowbMZKkRY=;
        b=yXFqDyl0+ATW5ujSxFX07X2YADhE10SVa7phJ4Ym/uvdVT3xmf8r0vg4UDhpTu+BaM
         NqSl8cQnFgQBwzuHL1d2rGvJjQUFkuI4DjoACHQRdOR5GJY0XobxPf7JaTGS+kYVXbYV
         xGlXyS/iarSyzZTDoYiCvmN4HJVuTdWvyNKf+5cNWY4u3nyx7CcX8WHNZ+E2SJBO51dF
         90lSo450w47daj2VBMIUjsjMXbonpNULYq/hQA2IFNT6NFvMrsnVEpDx3zxpx2bRbiSv
         PoBd6ZZKXecrJ/pnUeymzVco6Cpg4vFIAgMYnbKBKlLOcVVDU9N0go/C5NFMjrwwvyt9
         ZKUA==
X-Gm-Message-State: AOAM530bRA+e7vN/tKLedp4qxtpqeadRiAYFjKYtv2j1zKSM7LujkxiL
	NW3IOdG1+FIWglvo5ILspQn3nQ==
X-Google-Smtp-Source: ABdhPJyxeX5ahiPnIwsYZpijDZ2+BJKM+oobLR5YazSI/pEHlQhHy62TVXuI5C0rQe+zdN6vXT8dmQ==
X-Received: by 2002:a05:6402:1c1e:b0:416:5b93:eacf with SMTP id ck30-20020a0564021c1e00b004165b93eacfmr32015436edb.302.1649659063100;
        Sun, 10 Apr 2022 23:37:43 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id z11-20020a50e68b000000b00412ec8b2180sm14586743edm.90.2022.04.10.23.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 23:37:42 -0700 (PDT)
Message-ID: <ba417ad0-a263-77c4-a7bd-a1e7c43fe6b7@linaro.org>
Date: Mon, 11 Apr 2022 08:37:41 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 01/10] dt-bindings: display: Separate clock item lists by
 compatible
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20220411043423.37333-1-samuel@sholland.org>
 <20220411043423.37333-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411043423.37333-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2022 06:34, Samuel Holland wrote:
> So far, the binding and driver have relied on the fact that the H6
> clocks are both a prefix and a subset of the R40 clocks. This allows
> them to share the clocks/clock-names items and the clock-output-names
> order between the hardware variants.
> 
> However, the D1 hardware has TCON TV0 and DSI, but no TCON TV1. This
> cannot be supported by the existing scheme because it puts a gap in the
> middle of the item lists. To prepare for adding D1 support, use separate
> lists for variants with different combinations of clocks.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
